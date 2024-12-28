<?php
header('Content-Type: application/json');
include "../db.php";

$database = new Database();
$conn = $database->connect();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    $query = "INSERT INTO cart (name, image_url) VALUES (:name,  :image_url)";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':name', $data['name']);
    
    
    $stmt->bindParam(':image_url', $data['image_url']);
    
    if ($stmt->execute()) {
        echo json_encode(['message' => 'added']);
    } else {
        echo json_encode(['error' => 'Failed to add ']);
    }
}
?>