<?php

/*
 *  This is the class that all models extend, it holds some default database
 *  functionality
 */
class modelAbstract{

    public $connection;

    // Upon initialization a MYSQL connection is made
    public function __construct(){

        $this->connection = new \PDO(
            'mysql:host=localhost;dbname=nlrobots;charset=utf8mb4',
            'root',
            'milk-TWELVE-SORRY-hundred',
            array(
                \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                \PDO::ATTR_PERSISTENT => false
            )
        );

        return $this;

    }

    // Params are expected to be passed as a reference
    public function query( $query, $params = false ){

        $link = $this->connection;

        try{

            $handle = $link->prepare($query);

            // When no parameters are passed the query will be executed by itself
            // If there are parameters passed we will bind them all
            if( $params ) {
                foreach ( $params as $key => $param ) {
                    $handle->bindParam( $key, $param );
                }
            }

            $handle->execute();
            $result = $handle->fetchAll();

            $fetchedData = array();
            foreach($result as $row){
                $fetchedData[] = $row;
            }

            return $fetchedData;

        }
        catch(\PDOException $ex){
            return $ex->getMessage();
        }

    }


}