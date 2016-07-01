<?php
class Router{

    public $action = 'index';
    public $controller = 'index';

    // List of routes, with the first element being the controller
    // the second the action and the consequent elements the extra parameters passed
    // to the action
    public $routes = array();

    // As an extra layer underneath the Controller we add the app layer
    // this layer decides which application to use (MultiVAC, SAP and Store)
    public $app = 'store';

    // When instantiating the object a url is passed, otherwise it will
    // default to the Index controller
    public function __construct( $url = false ){
        $this->setRoute( $url ? $url : $this->app . '/' . $this->controller );
        return $this;
    }

    // A function that can be called to set a custom route
    public function setRoute( $url ){

        // Process the passed url
        $this->splitUrl($url);

        // Set the controller and action accordingly to the routes
        // or else set them according to the default values of 'store/index/index'
        $this->app = $this->routes[0];
        $this->controller = isset( $this->routes[1] ) ? $this->routes[1] : $this->action;
        $this->action = isset( $this->routes[2] ) ? $this->routes[2] : $this->action;

        return $this;

    }

    public function splitUrl( $url ){

        // If the url contains the hostname and HTTP/s protocol
        // we will parse the url to extract the path
        if( preg_match('/(https?:\/\/)?[^\/]+\/?/', $url) > 0 ) {
            $parse = parse_url($url);
            $url = $parse['path'];
        }

        // Split the path and enter the routes into an array
        return $this->routes = explode( '/', trim( $url, '/' ) );

    }


    public function getParams(){

        // With this function we get all the extra parameters being given
        // the url from the routes array, returns false if none are present
        if( isset($this->routes[3] ) )
            return array_slice($this->routes, 3);
        else return false;

    }

    // This function processes the route and fetches the classes
    public function getRoute(){

        $file = BASE . 'core' . SLASH . $this->app .
                SLASH . 'controllers' . SLASH . $this->getController() . '.php';
        if( file_exists( $file ) ){
            require_once $file;
            $className = $this->getController() . 'Controller';
            return new $className;
        } else return '404'; // TO DO: Create the 404 controller

    }

    public function getApp(){
        return $this->app;
    }
    public function getController(){
        return $this->controller;
    }
    public function getAction(){
        return $this->action;
    }

}