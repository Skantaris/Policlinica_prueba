<?php
class conexion{

    public $connection;

    public function __construct(){
        $this->connection = mysqli_connect('mysql', 'root', 'css', 'policlinica');
    }
}

