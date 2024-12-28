<?php
header('Content-Type: application/json');
include "../db.php";

$database = new Database();

$conn = $database->connect();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'DELETE') {
    $data = json_decode(file_get_contents("php://input"), true);

    $query = "DELETE FROM foods WHERE FoodId = :id LIMIT 1";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':id', $data['id']);

    if ($stmt->execute()) {
        echo json_encode(['message' => 'Food deleted']);
    } else {
        echo json_encode(['error' => 'Failed to delete food']);
    }
}
?>