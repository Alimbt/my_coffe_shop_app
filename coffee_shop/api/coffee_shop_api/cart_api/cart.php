<?php
include '../db.php';
$database = new Database();
$conn = $database->connect();
$method = $_SERVER ['REQUEST_METHOD'];

if ($method=='GET'){
    $query ="SELECT * FROM cart";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    $cartItems =$stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($cartItems);

}
?>