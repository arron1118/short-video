<?php

namespace app\admin\controller\shot;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="shot_tips")
 */
class Tips extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\ShotTips();
        
        $this->assign('getStatusList', $this->model->getStatusList());

    }

    
}