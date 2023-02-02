<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class ShotTips extends TimeModel
{

    protected $name = "shot_tips";

    protected $deleteTime = "delete_time";


    public function shotCate()
    {
        return $this->belongsTo('\app\admin\model\ShotCate', 'shot_cate_id', 'id')->bind(['cate_title' => 'title']);
    }

    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}
