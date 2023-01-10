<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\common\controller\PortalController;

class Cases extends PortalController
{
    public function info()
    {
        return $this->view->fetch();
    }
}
