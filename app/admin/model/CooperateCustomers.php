<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class CooperateCustomers extends TimeModel
{

    protected $name = "cooperate_customers";

    protected $deleteTime = "delete_time";

    
    
    public function getStatusList()
    {
        return ['0'=>'禁用','1'=>'启用',];
    }


}