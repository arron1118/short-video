<?php


namespace app\admin\controller;


use app\admin\model\SystemAdmin;
use app\common\controller\AdminController;
use think\captcha\facade\Captcha;
use think\facade\Env;
use think\Response;

/**
 * Class Login
 * @package app\admin\controller
 */
class Login extends AdminController
{

    /**
     * 初始化方法
     */
    public function initialize(): void
    {
        parent::initialize();
        $action = $this->request->action();
        if (!empty(session('admin')) && !in_array($action, ['out'])) {
            $adminModuleName = config('app.admin_alias_name');
            $this->success(lang("You are logged in, you don't need to sign in again"), [], __url("@{$adminModuleName}"));
        }
    }

    /**
     * 用户登录
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        $captcha = Env::get('easyadmin.captcha', true);
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'username|用户名'      => 'require',
                'password|密码'       => 'require',
                'keep_login|是否保持登录' => 'require',
            ];
            $captcha === 1 && $rule['captcha|验证码'] = 'require|captcha';
            $this->validate($post, $rule);
            $admin = SystemAdmin::where(['username' => $post['username']])->find();
            if (empty($admin)) {
                $this->error(lang('User does not exist'));
            }
            if (password($post['password']) !== $admin->password) {
                $this->error(lang('The password was wrong'));
            }
            if ($admin->status === 0) {
                $this->error(lang('The account has been disabled'));
            }
            ++$admin->login_num;
            $admin->save();
            $admin = $admin->toArray();
            unset($admin['password']);
            $admin['expire_time'] = $post['keep_login'] === 1 ? true : time() + 7200;
            session('admin', $admin);
            $this->success(lang('Login successful'));
        }
        $this->assign('captcha', $captcha);
        $this->assign('demo', $this->isDemo);
        return $this->fetch();
    }

    /**
     * 用户退出
     * @return void
     */
    public function out(): void
    {
        session('admin', null);
        $this->success(lang('logout successful'));
    }

    /**
     * 验证码
     * @return Response
     */
    public function captcha(): Response
    {
        return Captcha::create();
    }
}
