<?php

class dashboardController extends ControllerAbstract{

    public function index(){

        // The user has to be logged in in order to see this page
        if( !isset($_SESSION['id']) ) {
            header("Location: /sap/user/login");
            die();
        }

        // Load the dashboard

    }

}