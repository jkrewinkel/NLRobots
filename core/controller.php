<?php

class ControllerAbstract{

    public $loader;

    public function __construct()
    {
        $this->loader = new Loader();
    }

}