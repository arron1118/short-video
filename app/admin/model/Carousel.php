<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Carousel extends TimeModel
{

    protected $name = "carousel";

    protected $deleteTime = "delete_time";



    public function getCateIdList()
    {
        return ['1'=>'首页','2'=>'服务','3'=>'案例','4'=>'分享','5'=>'联系我们', '6' => '详情页'];
    }

    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}
