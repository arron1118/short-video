<?php

namespace app\admin\controller\system;


use app\admin\model\SystemAdmin;
use app\admin\service\TriggerService;
use app\common\constants\AdminConstant;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="管理员管理")
 */
class Admin extends AdminController
{

    use \app\admin\traits\Curd;

    protected $sort = [
        'sort' => 'desc',
        'id' => 'desc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new SystemAdmin();
        $this->assign('auth_list', $this->model->getAuthList());
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            [$page, $limit, $where] = $this->buildTableParams();
            $count = $this->model
                ->where($where)
                ->count();
            $list = $this->model
                ->withoutField('password')
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code' => 0,
                'msg' => '',
                'count' => $count,
                'data' => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $authIds = $this->request->post('auth_ids', []);
            $post['auth_ids'] = implode(',', array_keys($authIds));
            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error(lang('Save failed'));
            }
            $save ? $this->success(lang('Saved successfully')) : $this->error(lang('Save failed'));
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error(lang("The data does not exist"));
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $authIds = $this->request->post('auth_ids', []);
            $post['auth_ids'] = implode(',', array_keys($authIds));
            $rule = [];
            $this->validate($post, $rule);
            if (isset($row['password'])) {
                unset($row['password']);
            }
            try {
                $save = $row->save($post);
                TriggerService::updateMenu($id);
            } catch (\Exception $e) {
                $this->error(lang('Save failed'));
            }
            $save ? $this->success(lang('Saved successfully')) : $this->error(lang('Save failed'));
        }
        $row->auth_ids = explode(',', $row->auth_ids);
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function password($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error(lang('The data does not exist'));
        if ($this->request->isAjax()) {
            $this->checkPostRequest();
            $post = $this->request->post();
            $rule = [
                'password|登录密码' => 'require',
                'password_again|确认密码' => 'require',
            ];
            $this->validate($post, $rule);
            if ($post['password'] !== $post['password_again']) {
                $this->error(lang('The two password entries are inconsistent'));
            }
            try {
                $save = $row->save([
                    'password' => password($post['password']),
                ]);
            } catch (\Exception $e) {
                $this->error(lang('Save failed'));
            }
            $save ? $this->success(lang('Saved successfully')) : $this->error(lang('Save failed'));
        }
        $row->auth_ids = explode(',', $row->auth_ids);
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="删除")
     */
    public function delete($id): void
    {
        $this->checkPostRequest();
        $row = $this->model->whereIn('id', $id)->select();
        $row->isEmpty() && $this->error(lang('The data does not exist'));
        $id === AdminConstant::SUPER_ADMIN_ID && $this->error(lang('Super admins are not allowed to modify'));
        if (is_array($id) && in_array(AdminConstant::SUPER_ADMIN_ID, $id)) {
            $this->error(lang('Super admins are not allowed to modify'));
        }
        try {
            $save = $row->delete();
        } catch (\Exception $e) {
            $this->error(lang('Save failed'));
        }
        $save ? $this->success(lang('Saved successfully')) : $this->error(lang('Save failed'));
    }

    /**
     * @NodeAnotation(title="属性修改")
     */
    public function modify(): void
    {
        $this->checkPostRequest();
        $post = $this->request->post();
        $rule = [
            'id|ID' => 'require',
            'field|字段' => 'require',
            'value|值' => 'require',
        ];
        $this->validate($post, $rule);
        if (!in_array($post['field'], $this->allowModifyFields, true)) {
            $this->error(lang('This field is not allowed to be modified') . '：' . $post['field']);
        }
        if ($post['id'] === AdminConstant::SUPER_ADMIN_ID && $post['field'] === 'status') {
            $this->error(lang('Super admin status is not allowed to be modified'));
        }
        $row = $this->model->find($post['id']);
        empty($row) && $this->error(lang('The data does not exist'));
        try {
            $row->save([
                $post['field'] => $post['value'],
            ]);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        $this->success(lang('Saved successfully'));
    }


}
