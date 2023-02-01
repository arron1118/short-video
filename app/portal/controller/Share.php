<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\common\controller\PortalController;

class Share extends PortalController
{
    protected string $title = '分享';

    protected $limit = 2;

    public function initialize(): void
    {
        parent::initialize();

        $this->model = \app\admin\model\Cases::class;
    }

    public function info($id)
    {
        $info = $this->model::find($id);
        $this->view->assign([
            'info' => $info,
            'title' => $info['title'],
        ]);

        return $this->view->fetch();
    }
}
