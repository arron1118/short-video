<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\common\controller\PortalController;

class Cases extends PortalController
{
    protected string $title = '案例';

    public function info()
    {
        return $this->view->fetch();
    }
}
