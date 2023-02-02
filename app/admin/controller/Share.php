<?php

namespace app\admin\controller;

use app\admin\model\ShareCate;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="Share")
 */
class Share extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\Share();

        $this->assign('getStatusList', $this->model->getStatusList());

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
                ->withJoin('shareCate', 'LEFT')
                ->where($where)
                ->count();
            $list = $this->model
                ->withJoin('shareCate', 'LEFT')
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
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
            $rule = [
                'share_cate_id' => 'require'
            ];
            $this->validate($post, $rule, [
                'share_cate_id' => '请选择分类',
            ]);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error(lang('Save failed') . ':'.$e->getMessage());
            }
            $save ? $this->success(lang('Saved successfully')) : $this->error(lang('Save failed'));
        }
        $pidMenuList = (new ShareCate())->getPidMenuList();
        array_shift($pidMenuList);
        $this->app->view->assign([
            'pidMenuList' => $pidMenuList,
        ]);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error(lang('The data does not exist'));
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'share_cate_id' => 'require'
            ];
            $this->validate($post, $rule, [
                'share_cate_id' => '请选择分类',
            ]);
            try {
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error(lang('Save failed'));
            }
            $save ? $this->success(lang('Saved successfully')) : $this->error(lang('Save failed'));
        }
        $pidMenuList = (new ShareCate())->getPidMenuList();
        array_shift($pidMenuList);
        $this->app->view->assign([
            'pidMenuList' => $pidMenuList,
            'row' => $row,
        ]);
        return $this->fetch();
    }
}
