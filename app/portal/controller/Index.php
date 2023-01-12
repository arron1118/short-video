<?php
declare (strict_types=1);

namespace app\portal\controller;

use app\admin\model\CooperateCustomers;
use app\admin\model\ShotTips;
use app\admin\model\Cases;
use app\common\controller\PortalController;
use think\App;

class Index extends PortalController
{
    protected string $title = '首页';

    public function index()
    {
        // 合作客户
        $cooperateCustomers = CooperateCustomers::field('id, title, logo, url')
            ->where([
                'status' => 1,
            ])->order('sort desc, id asc')
            ->select();

        // 案例
        $cases = Cases::field('id, title, cover_img')
            ->where([
                'status' => 1,
            ])->order('id desc, sort desc')
            ->limit(9)
            ->select();

        // 案例
        $shotTips = ShotTips::field('id, title, cover_img, description')
            ->where([
                'status' => 1,
            ])->order('id desc, sort desc')
            ->limit(9)
            ->select();

        $this->view->assign([
            'cooperate_customers' => $cooperateCustomers,
            'cases' => $cases,
            'shotTips' => $shotTips,
        ]);
        return $this->view->fetch();
    }
}
