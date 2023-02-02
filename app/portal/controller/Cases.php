<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\admin\model\CasesCate;
use app\common\controller\PortalController;

class Cases extends PortalController
{
    protected string $title = '案例';

    protected $limit = 2;

    public function initialize(): void
    {
        parent::initialize();

        $this->model = \app\admin\model\Cases::class;
    }

    public function getCasesCateList()
    {
        $cates = CasesCate::field('id, title')
            ->where([
                'status' => 1,
            ])->order('id asc, sort desc')
            ->select();

        $this->success(lang('Get successful'), $cates);
    }

    public function getCasesList()
    {
        $cate_id = $this->request->param('cate_id/d', 0);
        $page = $this->request->param('page/d', 1);
        $limit = $this->request->param('limit/d', $this->limit);
        if (!$cate_id) {
            $this->error(lang('The data does not exist'));
        }

        $total = $this->model::where([
            'cases_cate_id' => $cate_id,
            'status' => 1
        ])->count();

        $cases = $this->model::field('id, cases_cate_id, title, cover_img, description')
            ->where([
                'status' => 1,
                'cases_cate_id' => $cate_id,
            ])->order('id desc, sort desc')
            ->limit(($page - 1) * $limit, $limit)
            ->select();

        return json([
            'msg' => lang('Get successful'),
            'data' => $cases,
            'total' => $total,
            'limit' => $limit,
        ]);
    }

    public function info($id)
    {
        $info = $this->model::find($id);
        $this->view->assign([
            'info' => $info,
            'title' => $info['title'],
            'keyword' => $info['keyword'],
            'description' => $info['description'],
        ]);

        return $this->view->fetch('public/info');
    }
}
