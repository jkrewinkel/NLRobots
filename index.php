<?php
/*
 *
 *  NL Robots Custom Framework
 *  ========
 *
 *  This framework serves as the codebase for all NL Robots'
 *  business logic.
 *
 *  The three main components; the MultiVAC, the SAP, and the online store
 *  are contained in the /public/ folder.
 *
 *  This software runs on PHP 7
 */
if( version_compare(PHP_VERSION, '7.0.0', '<') )
    error_log('It looks like you are using an earlier version of PHP than the one recommended to run this software. 
               For the optimal experience please use PHP 7.');

/*
 *  Define constants
 *
 *  SLASH contains the directory separator in case of a Windows based development
 *  machine.
 */
define( 'SLASH', DIRECTORY_SEPARATOR );
define( 'BASE' , __DIR__ . DIRECTORY_SEPARATOR );
define( 'BASE_URL' , 'http://www.nlrobots.corp' );
define( 'BASE_URL_SECURE', 'https://www.nlrobots.corp' );

/*
 *  Load the core classes
 */
require 'core' . SLASH . 'router.php';
require 'core' . SLASH . 'loader.php';
require 'core' . SLASH . 'controller.php';
require 'core' . SLASH . 'model.php';

// Initialize the application
// Comment these lines for testing
session_start();
$router = new Router($_SERVER['REQUEST_URI']);
$controller = $router->getRoute();