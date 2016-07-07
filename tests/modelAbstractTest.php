<?php

require_once 'index.php';

class modelAbstractTest extends \PHPUnit_Framework_TestCase{

    // The model should
    // - Connect to the database
    function testConnection(){
        $modelAbstract = new modelAbstract();
        $this->assertEquals( 'modelAbstract', get_class($modelAbstract) );
    }
    
    // - The query and prepared statements should work
    function testQuery(){
        $selectTest = new modelAbstract();
        $query = 'SELECT * FROM accounts';
        $result= $selectTest->query($query);
        $this->assertEquals( 'alex_a', $result[0]['username'] );
    }

    // Test extra prepared parameters
    function testParameters(){
        $paramTest = new modelAbstract();
        $query = "SELECT * FROM accounts WHERE `username` = :username";
        $username = 'alex_a';
        $result = $paramTest->query($query, array(':username' => $username) );
        $this->assertEquals( 'alex_a', $result[0]['username'] );
    }

}
