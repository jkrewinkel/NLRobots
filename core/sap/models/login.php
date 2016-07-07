<?php

class loginModel extends modelAbstract{

    // This function returns true if the username and passwords match
    // and false if they don't
    public function processLogin(){

        $username = htmlspecialchars($_POST['username']);
        $password = htmlspecialchars($_POST['password']);
        $query = 'SELECT * FROM accounts WHERE `username` = :username LIMIT 1';

        $result = $this->query( $query, array( ':username' => $username ) );
        if( !empty($result) ){
            if( password_verify($password, $result[0]['password']) ){
                return $result[0];
            } else return false;
        } else return false;

    }
    
}