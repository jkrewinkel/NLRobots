<?php

require_once 'index.php';

class routerTest extends \PHPUnit_Framework_TestCase{

    // The router should
    // - Get default index when initialized with nothing
    function testDefaultRoute(){
        $router = new Router();
        $this->assertEquals('index', $router->getController());
        $this->assertEquals('index', $router->getAction());
        $this->assertEquals('indexController', get_class($router->getRoute()) );
    }

    // - Get the url and split it up into an array
    function testUrlComponents(){
        $router = new Router('http://www.nlrobots.corp/store/catalog/product/positronic-brains/50-TB');
        $this->assertEquals( 'store', $router->getApp() );
        $this->assertEquals( 'catalog', $router->getController() );
        $this->assertEquals( 'product', $router->getAction() );
        $this->assertEquals( array( 'positronic-brains', '50-TB' ), $router->getParams() );

        $router->setRoute('multivac/ask/question/are-we-alone-in-the-universe');
        $this->assertEquals( 'multivac', $router->getApp() );
        $this->assertEquals( 'ask', $router->getController() );
        $this->assertEquals( 'question', $router->getAction() );
        $this->assertEquals( array( 'are-we-alone-in-the-universe' ), $router->getParams() );
    }

}
