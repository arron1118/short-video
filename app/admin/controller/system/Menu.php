<?php


namespace app\admin\controller\system;

use app\admin\model\SystemMenu;
use app\admin\model\SystemNode;
use app\admin\service\TriggerService;
use app\common\constants\MenuConstant;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use app\common\controller\AdminController;
use think\App;

/**
 * Class Menu
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="菜单管理",auth=true)
 */
class Menu extends AdminController
{

    use \app\admin\traits\Curd;

    protected $sort = [
        'sort' => 'desc',
        'id' => 'asc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new SystemMenu();
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
            $count = $this->model->count();
            $list = $this->model->order($this->sort)->select();
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
    public function add($id = null)
    {
        $homeId = $this->model
            ->where([
                'pid' => MenuConstant::HOME_PID,
            ])
            ->value('id');
        if ($id === $homeId) {
            $this->error(lang('You cannot add submenus to the home page'));
        }
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'pid|上级菜单' => 'require',
                'title|菜单名称' => 'require',
                'icon|菜单图标' => 'require',
            ];
            $this->validate($post, $rule);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error(lang('Save failed'));
            }
            if ($save) {
                TriggerService::updateMenu();
                $this->success(lang('Saved successfully'));
            } else {
                $this->error(lang('Save failed'));
            }
        }
        $pidMenuList = $this->model->getPidMenuList();
        $this->assign('id', $id);
        $this->assign('pidMenuList', $pidMenuList);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'pid|上级菜单' => 'require',
                'title|菜单名称' => 'require',
                'icon|菜单图标' => 'require',
            ];
            $this->validate($post, $rule);
            try {
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error(lang('Save failed'));
            }
            if ($save) {
                TriggerService::updateMenu();
                $this->success(lang('Saved successfully'));
            } else {
                $this->error(lang('Save failed'));
            }
        }
        $pidMenuList = $this->model->getPidMenuList();
        $this->assign([
            'id' => $id,
            'pidMenuList' => $pidMenuList,
            'row' => $row,
        ]);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="删除")
     */
    public function delete($id): void
    {
        $this->checkPostRequest();
        $row = $this->model->whereIn('id', $id)->select();
        empty($row) && $this->error(lang('The data does not exist'));
        try {
            $save = $row->delete();
        } catch (\Exception $e) {
            $this->error(lang('Delete failed'));
        }
        if ($save) {
            TriggerService::updateMenu();
            $this->success(lang('Deleted successfully'));
        } else {
            $this->error(lang('Delete failed'));
        }
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
        $row = $this->model->find($post['id']);
        if (!$row) {
            $this->error(lang('The data does not exist'));
        }
        if (!in_array($post['field'], $this->allowModifyFields, true)) {
            $this->error(lang('This field is not allowed to be modified') . '：' . $post['field']);
        }
        $homeId = $this->model
            ->where([
                'pid' => MenuConstant::HOME_PID,
            ])
            ->value('id');
        if ($post['id'] === $homeId && $post['field'] === 'status') {
            $this->error(lang('The home page status does not allow closing'));
        }
        try {
            $row->save([
                $post['field'] => $post['value'],
            ]);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        TriggerService::updateMenu();
        $this->success(lang('Saved successfully'));
    }

    /**
     * @NodeAnotation(title="添加菜单提示")
     */
    public function getMenuTips(): \think\response\Json
    {
        $node = input('get.keywords');
        $list = SystemNode::whereLike('node', "%{$node}%")
            ->field('node,title')
            ->limit(10)
            ->select();
        return json([
            'code' => 0,
            'content' => $list,
            'type' => 'success',
        ]);
    }

}
