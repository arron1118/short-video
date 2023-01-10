<?php



namespace app\admin\middleware;


use app\admin\service\ConfigService;
use app\common\constants\AdminConstant;
use think\App;
use think\facade\View;

/**
 * @deprecated  废弃，新版TP不支持在中间件获取控制器相关信息
 * Class ViewInit
 * @package app\admin\middleware
 */
class ViewInit
{

    public function handle(\app\Request $request, \Closure $next)
    {
        $thisModule = app('http')->getName();
        $thisController = $request->controller();
        $thisAction = $request->action();
        $thisControllerArr = explode('.', $thisController);
        $jsPath = null;
        foreach ($thisControllerArr as $vo) {
            empty($jsPath) ? $jsPath = parse_name($vo) : $jsPath .= '/' . parse_name($vo);
        }

        $adminModuleName = config('app.admin_alias_name');
        $isSuperAdmin = session('admin.id') === AdminConstant::SUPER_ADMIN_ID;
        $data = [
            'adminModuleName'      => $adminModuleName,
            'thisController'       => parse_name($thisController),
            'thisAction'           => $thisAction,
            'thisRequest'          => parse_name("{$thisModule}/{$thisController}/{$thisAction}"),
            'thisControllerJsPath' => "{$thisModule}/js/{$jsPath}.js",
            'autoloadJs'           => file_exists(root_path('public')."static/{$thisModule}/js/{$jsPath}.js"),
            'isSuperAdmin'         => $isSuperAdmin,
            'version'              => env('app_debug') ? time() : ConfigService::getVersion(),
        ];

        View::assign($data);
        $request->adminModuleName = $adminModuleName;
        return $next($request);
    }


}
