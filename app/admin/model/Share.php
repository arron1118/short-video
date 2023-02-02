<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Share extends TimeModel
{

    protected $name = "Share";

    protected $deleteTime = "delete_time";


    public function ShareCate()
    {
        return $this->belongsTo('\app\admin\model\ShareCate', 'share_cate_id', 'id')->bind(['cate_title' => 'title']);
    }


    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}
