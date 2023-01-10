<?php
declare (strict_types=1);

namespace app\common\controller;

use app\BaseController;
use app\common\traits\JumpTrait;
use app\portal\traits\Curd;

class PortalController extends BaseController
{
    use JumpTrait;
    use Curd;

    /**
     * 模块
     * @var string
     */
    protected string $module = '';

    /**
     * @var null
     */
    protected $view = null;

    public function initialize(): void
    {
        parent::initialize();

        $this->module = $this->app->http->getName();
        $this->view = $this->app->view;
    }

    /**
     * 获取菜单
     * @return mixed
     */
    public function getMenu(): array
    {
        return config('menu.' . $this->module);
    }
}
