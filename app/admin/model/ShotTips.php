<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class ShotTips extends TimeModel
{

    protected $name = "shot_tips";

    protected $deleteTime = "delete_time";

    
    
    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}