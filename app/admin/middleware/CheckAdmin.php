<?php


namespace app\admin\middleware;

use app\common\service\AuthService;
use think\Request;

/**
 * @deprecated  废弃，新版TP不支持在中间件获取控制器相关信息
 * 检测用户登录和节点权限
 * Class CheckAdmin
 * @package app\admin\middleware
 */
class CheckAdmin
{

    use \app\common\traits\JumpTrait;

    public function handle(Request $request, \Closure $next)
    {
        $adminConfig = config('admin');
        $adminId = session('admin.id');
        $expireTime = session('admin.expire_time');
        /** @var AuthService $authService */
        $authService = app(AuthService::class, ['adminId' => $adminId]);
        $currentNode = $authService->getCurrentNode();
        $currentController = parse_name($request->controller());

        // 验证登录
        if (!in_array($currentController, $adminConfig['no_login_controller'], true) &&
            !in_array($currentNode, $adminConfig['no_login_node'], true)) {
            empty($adminId) && $this->error(lang('Please login first'), [], __url('admin/login/index'));

            // 判断是否登录过期
            if ($expireTime !== true && time() > $expireTime) {
                session('admin', null);
                $this->error(lang('Login expired, please login again'), [], __url('admin/login/index'));
            }
        }

        // 验证权限
        if (!in_array($currentController, $adminConfig['no_auth_controller'], true) &&
            !in_array($currentNode, $adminConfig['no_auth_node'], true)) {
            $check = $authService->checkNode($currentNode);
            !$check && $this->error(lang('No access'));

            // 判断是否为演示环境
            if(env('easyadmin.is_demo', false) && $request->isPost()){
                $this->error(lang('Modifications are not allowed in the demo environment'));
            }

        }

        return $next($request);
    }

}
