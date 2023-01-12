<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Cases extends TimeModel
{

    protected $name = "cases";

    protected $deleteTime = "delete_time";


    public function casesCate()
    {
        return $this->belongsTo('\app\admin\model\CasesCate', 'cases_cate_id', 'id')->bind(['cate_title' => 'title']);
    }


    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}
