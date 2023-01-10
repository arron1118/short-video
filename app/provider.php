<?php

use app\ExceptionHandle;
use app\Request;
use think\exception\Handle;

// 容器Provider定义文件
return [
    \think\Request::class => Request::class,
    Handle::class => ExceptionHandle::class,
];
