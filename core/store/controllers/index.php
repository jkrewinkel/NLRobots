<?php

class indexController extends ControllerAbstract{
    public function index( $params = false )
    {
        $params['title'] = 'NLRobots Store';
        $this->loader->loadView('store/header', $params);
        $this->loader->loadView('store/index', $params);
    }
}