<?php
declare (strict_types=1);

namespace app\portal\controller;

use app\admin\model\Carousel;
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
        $carousel = Carousel::field('id, img, url, content')->where([
            'status' => 1,
            'cate_id' => 1,
        ])->order('sort asc, id desc')
            ->limit(5)
            ->select();
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
                'is_top' => 1,
            ])->order('is_top desc, sort desc, id desc')
            ->limit(9)
            ->select();

        // 拍摄知识
        $shotTips = \app\admin\model\Share::field('id, title, cover_img, description')
            ->where([
                'status' => 1,
                'is_top' => 1,
            ])->order('is_top desc, sort desc, id desc')
            ->limit(9)
            ->select();

        $this->view->assign([
            'cooperate_customers' => $cooperateCustomers,
            'cases' => $cases,
            'shotTips' => $shotTips,
            'carousel' => $carousel,
        ]);
        return $this->view->fetch();
    }
}
