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
     * 控制器
     * @var string
     */
    protected string $controller = '';

    /**
     * 视图实例
     * @var null
     */
    protected $view = null;

    /**
     * 标题
     * @var string
     */
    protected string $title = '';

    /**
     * 描述
     * @var string
     */
    protected string $description = '';

    /**
     * 关键词
     * @var string
     */
    protected string $keyword = '';

    public function initialize(): void
    {
        parent::initialize();

        $this->module = $this->app->http->getName();
        $this->controller = strtolower($this->request->controller());
        $this->view = $this->app->view;
        $this->title = $this->title ?? sysconfig('site', 'site_name');
        $this->keyword = $this->keyword ?? sysconfig('site', 'site_name');
        $this->description = $this->description ?? sysconfig('site', 'site_name');

        $this->view->assign([
            'controller' => $this->controller,
            'title' => $this->title,
            'description' => $this->description,
            'keyword' => $this->keyword,
        ]);
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
