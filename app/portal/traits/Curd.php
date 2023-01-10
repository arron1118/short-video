<?php

namespace app\portal\traits;

trait Curd
{
    public function index()
    {
        return $this->view->fetch();
    }
}
