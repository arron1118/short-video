<?php


namespace app\admin\middleware;


use app\Request;
use CsrfVerify\drive\ThinkphpCache;
use CsrfVerify\entity\CsrfVerifyEntity;
use CsrfVerify\interfaces\CsrfVerifyInterface;
use think\facade\Session;

class CsrfMiddleware
{
    use \app\common\traits\JumpTrait;

    public function handle(Request $request, \Closure $next)
    {
        if (env('EASYADMIN.IS_CSRF', true) && !in_array($request->method(), ['GET', 'HEAD', 'OPTIONS'])) {
            // 跨域校验
            $refererUrl = $request->header('REFERER', null);
            $refererInfo = parse_url($refererUrl);
            $host = $request->host(true);
            if (!isset($refererInfo['host']) || $refererInfo['host'] !== $host) {
                $this->error(lang('Invalid request'));
            }

            // CSRF校验
            // @todo 兼容CK编辑器上传功能
//            $ckCsrfToken = $request->post('ckCsrfToken', null);
//            $data = !empty($ckCsrfToken) ? ['__token__' => $ckCsrfToken] : [];
//
//            $check = $request->checkToken('__token__', $data);
//            if (!$check) {
//                $this->error(lang('The request validation failed, please refresh the page again'));
//            }

        }

        return $next($request);
    }
}
