<?php
declare (strict_types=1);

namespace app\common\controller;

use app\BaseController;
use app\common\traits\JumpTrait;
use app\portal\traits\Curd;
use EasyAdmin\upload\Uploadfile;

class PortalController extends BaseController
{
    use JumpTrait;
    use Curd;

    /**
     * 模块
     * @var string
     */
    protected string $module = '';

    /**
     * 控制器
     * @var string
     */
    protected string $controller = '';

    /**
     * 视图实例
     * @var null
     */
    protected $view = null;

    /**
     * 标题
     * @var string
     */
    protected string $title = '';

    /**
     * 描述
     * @var string
     */
    protected string $description = '';

    /**
     * 关键词
     * @var string
     */
    protected string $keyword = '';

    public $result = [
        'code' => 1,
        'msg' => '未知错误',
        'data' => [],
        'url' => '',
        'wait' => 3,
    ];

    public function initialize(): void
    {
        parent::initialize();

        $this->module = $this->app->http->getName();
        $this->controller = strtolower($this->request->controller());
        $this->view = $this->app->view;
        $this->title = $this->title ?? sysconfig('site', 'site_name');
        $this->keyword = $this->keyword ?? sysconfig('site', 'site_name');
        $this->description = $this->description ?? sysconfig('site', 'site_name');

        $this->view->assign([
            'controller' => $this->controller,
            'title' => $this->title,
            'description' => $this->description,
            'keyword' => $this->keyword,
        ]);
    }

    /**
     * 获取菜单
     * @return mixed
     */
    public function getMenu(): array
    {
        return config('menu.' . $this->module);
    }

    /**
     * 上传文件
     */
    public function upload()
    {
        $this->checkPostRequest();
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file' => $this->request->file('file'),
        ];
        $uploadConfig = sysconfig('upload');
        empty($data['upload_type']) && $data['upload_type'] = $uploadConfig['upload_type'];
        $rule = [
            'upload_type|指定上传类型有误' => "in:{$uploadConfig['upload_allow_type']}",
            'file|文件' => "require|file|fileExt:{$uploadConfig['upload_allow_ext']}|fileSize:{$uploadConfig['upload_allow_size']}",
        ];
        $this->validate($data, $rule);
        try {
            $upload = Uploadfile::instance()
                ->setUploadType($data['upload_type'])
                ->setUploadConfig($uploadConfig)
                ->setFile($data['file'])
                ->save();

            $this->result['msg'] = $upload['msg'];
            if ($upload['save']) {
                $this->result['url'] = $upload['url'];
            }
        } catch (\Exception $e) {
            $this->result['msg'] = $e->getMessage();
        }

        return json($this->result);
    }

    /**
     * 严格校验接口是否为POST请求
     */
    protected function checkPostRequest(): void
    {
        !$this->request->isPost() && $this->error(lang('The current request was not legal'));
    }
}
