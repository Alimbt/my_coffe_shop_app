<?php
header('Content-Type: application/json');
include "../db.php";

$database = new Database();
$conn = $database->connect();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    $query = "INSERT INTO foods (name, price, description, image_url, stock_quantity) VALUES (:name, :price, :description, :image_url, :stock_quantity)";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':name', $data['name']);
    $stmt->bindParam(':price', $data['price']);
    $stmt->bindParam(':description', $data['description']);
    $stmt->bindParam(':image_url', $data['image_url']);
    $stmt->bindParam(':stock_quantity', $data['stock_quantity']);

    if ($stmt->execute()) {
        echo json_encode(['message' => 'Food added']);
    } else {
        echo json_encode(['error' => 'Failed to add food']);
    }
}
?>