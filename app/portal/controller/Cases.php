<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\admin\model\CasesCate;
use app\common\controller\PortalController;

class Cases extends PortalController
{
    protected string $title = '案例';

    public function initialize(): void
    {
        parent::initialize();

        $this->model = \app\admin\model\Cases::class;
    }

    public function index()
    {
        $cates = CasesCate::field('id, title')
            ->where([
                'status' => 1,
            ])->order('id asc, sort desc')
            ->select();

        dump($cates);
        $this->view->assign([
            'cates' => $cates,
        ]);
        return $this->view->fetch();
    }

    public function getCasesList()
    {
        $cate_id = $this->request->param('cate_id/d', 0);
        if (!$cate_id) {
            $this->error(lang('The data does not exist'));
        }

        $cases = $this->model::field('id, title, cover_img')
            ->where([
                'status' => 1,
                'cases_cate_id' => $cate_id,
            ])->order('id desc, sort desc')
            ->select();

        $this->success(lang('Get successful'), $cases);
    }

    public function info()
    {
        return $this->view->fetch();
    }
}
