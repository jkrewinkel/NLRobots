<?php

class userController extends ControllerAbstract{

    public function login( $params = false ){

        // First let us check if the user is logged in already
        if( isset($_SESSION['id']) ) {
            header("Location: /sap/dashboard");
            die();
        }

        // Now lets see if any POST data is present,
        // this way we know that the form has been submitted
        if( isset( $_POST['username'] ) ) {
            $model = $this->loader->loadModel('sap/login');
            if( $result = $model->processLogin() )
                $_SESSION['id'] = $result['user_id'];
            else
                $params['error'] = "Sorry, we do not know that username/password combination.";
        }

        $params['title'] = 'SAP Login';
        $this->loader->loadView('store/header', $params);
        $this->loader->loadView('sap/login', $params);

    }

}