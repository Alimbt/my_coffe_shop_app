<?php
class Database{
private $host = 'localhost';    
private $dbName= 'coffee_shop';
private $userName = 'root';
private $password = '';
private $conn ;


public function connect(){

$this->conn=null;
try{
    $this->conn=new PDO("mysql:host=". $this->host. ";dbname=".$this->dbName,$this->userName,$this->password);
    $this->conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    }catch(PDOException $e){
        echo "connestion error" . $e->getMessage();


    }
    return $this->conn;
}
}


?>

