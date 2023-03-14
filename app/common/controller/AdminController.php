<?php

namespace app\common\controller;

use app\admin\service\ConfigService;
use app\BaseController;
use app\common\constants\AdminConstant;
use app\common\service\AuthService;
use EasyAdmin\tool\CommonTool;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Env;
use think\facade\View;
use think\Model;
use think\response\Json;

/**
 * Class AdminController
 * @package app\common\controller
 */
class AdminController extends BaseController
{

    use \app\common\traits\JumpTrait;

    /**
     * 当前模型
     * @Model
     * @var object
     */
    protected $model;

    /**
     * 字段排序
     * @var array
     */
    protected $sort = [
        'id' => 'desc',
    ];

    /**
     * 允许修改的字段
     * @var array
     */
    protected $allowModifyFields = [
        'status',
        'sort',
        'remark',
        'is_delete',
        'is_auth',
        'title',
        'is_top',
    ];

    /**
     * 不导出的字段信息
     * @var array
     */
    protected $noExportFields = ['delete_time', 'update_time'];

    /**
     * 下拉选择条件
     * @var array
     */
    protected $selectWhere = [];

    /**
     * 是否关联查询
     * @var bool
     */
    protected $relationSearch = false;

    /**
     * 模板布局, false取消
     * @var string|bool
     */
    protected $layout = 'layout/default';

    /**
     * 是否为演示环境
     * @var bool
     */
    protected $isDemo = false;

    /**
     * 解析和获取模板内容 用于输出
     * @param string $template
     * @param array $vars
     * @return mixed
     */
    public function fetch(string $template = '', array $vars = [])
    {
        return $this->app->view->fetch($template, $vars);
    }

    /**
     * 重写验证规则
     * @param array $data
     * @param array|string $validate
     * @param array $message
     * @param bool $batch
     * @return bool|true
     */
    public function validate(array $data, $validate, array $message = [], bool $batch = false): bool
    {
        try {
            parent::validate($data, $validate, $message, $batch);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        return true;
    }

    /**
     * 下拉选择列表
     * @return Json
     */
    public function selectList(): ?Json
    {
        $fields = input('selectFields');
        $data = $this->model
            ->where($this->selectWhere)
            ->field($fields)
            ->select();
        $this->success(null, $data);
    }

    /**
     * 初始化方法
     */
    protected function initialize(): void
    {
        parent::initialize();
        $this->layout && $this->app->view->engine()->layout($this->layout);
        $this->isDemo = Env::get('easyadmin.is_demo', false);
        $this->viewInit();
        try {
            $this->checkAuth();
        } catch (DataNotFoundException|DbException|ModelNotFoundException $e) {
            $this->error($e->getMessage());
        }
    }

    /**
     * 初始化视图参数
     */
    private function viewInit(): void
    {
        $request = app()->request;
        $thisModule = app('http')->getName();
        $thisController = app()->request->controller();
        $thisAction = $request->action();
        $thisControllerArr = explode('.', $thisController);
        $jsPath = null;
        foreach ($thisControllerArr as $vo) {
            empty($jsPath) ? $jsPath = parse_name($vo) : $jsPath .= '/' . parse_name($vo);
        }

        $this->app->view->assign([
            'adminModuleName' => config('app.admin_alias_name'),
            'thisController' => parse_name($thisController),
            'thisAction' => $thisAction,
            'thisRequest' => parse_name("{$thisModule}/{$thisController}/{$thisAction}"),
            'thisControllerJsPath' => "{$thisModule}/js/{$jsPath}.js",
            'autoloadJs' => file_exists(root_path('public') . "static/{$thisModule}/js/{$jsPath}.js"),
            'isSuperAdmin' => session('admin.id') === AdminConstant::SUPER_ADMIN_ID,
            'version' => env('app_debug') ? time() : ConfigService::getVersion(),
        ]);
    }

    /**
     * 模板变量赋值
     * @param string|array $name 模板变量
     * @param mixed $value 变量值
     * @return mixed
     */
    public function assign($name, $value = null)
    {
        return $this->app->view->assign($name, $value);
    }

    /**
     * 检测权限
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    private function checkAuth(): void
    {
        $adminConfig = config('admin');
        $adminId = session('admin.id');
        $expireTime = session('admin.expire_time');
        /** @var AuthService $authService */
        $authService = app(AuthService::class, ['adminId' => $adminId]);
        $currentNode = $authService->getCurrentNode();
        $currentController = parse_name(app()->request->controller());

        // 验证登录
        if (!in_array($currentController, $adminConfig['no_login_controller'], true) &&
            !in_array($currentNode, $adminConfig['no_login_node'], true)) {
            empty($adminId) && $this->redirect(url('admin/login/index'));

            // 判断是否登录过期
            if ($expireTime !== true && time() > $expireTime) {
                session('admin', null);
                $this->error(lang('Login expired, please login again'), [], __url('admin/login/index'));
            }
        }

        // 验证权限
        if (!in_array($currentController, $adminConfig['no_auth_controller'], true) &&
            !in_array($currentNode, $adminConfig['no_auth_node'], true)) {
            !$authService->checkNode($currentNode) && $this->error(lang('No access'));

            // 判断是否为演示环境
            if (env('easyadmin.is_demo', false) && app()->request->isPost()) {
                $this->error(lang('Modifications are not allowed in the demo environment'));
            }

        }
    }

    /**
     * 构建请求参数
     * @param array $excludeFields 忽略构建搜索的字段
     * @return array
     */
    protected function buildTableParams(array $excludeFields = []): array
    {
        $get = $this->request->get('', null, null);
        $page = isset($get['page']) && !empty($get['page']) ? $get['page'] : 1;
        $limit = isset($get['limit']) && !empty($get['limit']) ? $get['limit'] : 15;
        $filters = isset($get['filter']) && !empty($get['filter']) ? $get['filter'] : '{}';
        $ops = isset($get['op']) && !empty($get['op']) ? $get['op'] : '{}';
        // json转数组
        $filters = json_decode($filters, true);
        $ops = json_decode($ops, true);
        $where = [];
        $excludes = [];

        // 判断是否关联查询
        $tableName = CommonTool::humpToLine(lcfirst($this->model->getName()));

        foreach ($filters as $key => $val) {
            if (in_array($key, $excludeFields, true)) {
                $excludes[$key] = $val;
                continue;
            }
            $op = isset($ops[$key]) && !empty($ops[$key]) ? $ops[$key] : '%*%';
            if ($this->relationSearch && count(explode('.', $key)) === 1) {
                $key = "{$tableName}.{$key}";
            }
            switch (strtolower($op)) {
                case '=':
                    $where[] = [$key, '=', $val];
                    break;
                case '%*%':
                    $where[] = [$key, 'LIKE', "%{$val}%"];
                    break;
                case '*%':
                    $where[] = [$key, 'LIKE', "{$val}%"];
                    break;
                case '%*':
                    $where[] = [$key, 'LIKE', "%{$val}"];
                    break;
                case 'range':
                    [$beginTime, $endTime] = explode(' - ', $val);
                    $where[] = [$key, '>=', strtotime($beginTime)];
                    $where[] = [$key, '<=', strtotime($endTime)];
                    break;
                default:
                    $where[] = [$key, $op, "%{$val}"];
            }
        }
        return [$page, $limit, $where, $excludes];
    }

    /**
     * 严格校验接口是否为POST请求
     */
    protected function checkPostRequest(): void
    {
        !$this->request->isPost() && $this->error(lang('The current request was not legal'));
    }

}
