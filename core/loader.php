<?php

/*
 *  This file loads external classes and views
 */

class Loader{

    public function __construct(){

    }

    // The view is passed as followed:
    // 'application/view'
    public function loadView( $view, $params ){

        // First split the string by forward slash
        // and include the file
        $viewArray = explode( '/', $view );
        require BASE . 'core' . SLASH . $viewArray[0] . SLASH . 'views' . SLASH . $viewArray[1] . '.php';
    }

    // The model is passed as followed:
    // 'application/model'
    public function loadModel( $model ){

        // First split the string by forward slash
        // and include the file
        $modelArray = explode( '/', $model );
        require_once BASE . 'core' . SLASH . $modelArray[0] . SLASH . 'models' . SLASH . $modelArray[1] . '.php';
        $className = $modelArray[1] . 'Model';
        return new $className;
    }
}