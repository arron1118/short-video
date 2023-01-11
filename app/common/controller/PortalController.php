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
    protected string $title = '易点咨询';

    /**
     * 描述
     * @var string
     */
    protected string $description = '易点咨询';

    /**
     * 关键词
     * @var string
     */
    protected string $keyword = '易点咨询';

    public function initialize(): void
    {
        parent::initialize();

        $this->module = $this->app->http->getName();
        $this->controller = strtolower($this->request->controller());
        $this->view = $this->app->view;

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
