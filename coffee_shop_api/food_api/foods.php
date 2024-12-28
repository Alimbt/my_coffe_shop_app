<?php
header('Content-Type: application/json');
include "../db.php";

$database = new Database();
$conn = $database->connect();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $query = "SELECT * FROM foods";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    $foods = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($foods);
}
?>