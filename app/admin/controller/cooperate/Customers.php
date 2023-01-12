<?php

namespace app\admin\controller\cooperate;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="cooperate_customers")
 */
class Customers extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\CooperateCustomers();
        
        $this->assign('getStatusList', $this->model->getStatusList());

    }

    
}