<?php
header('Content-Type: application/json');
include './db.php';

$database = new Database();
$conn = $database->connect();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if (!isset($data['user_id']) || (!isset($data['food_id']) && !isset($data['drink_id']))) {
        die(json_encode(['error' => 'Invalid input']));
    }

    $user_id = $data['user_id'];
    $food_id = isset($data['food_id']) ? $data['food_id'] : null;
    $drink_id = isset($data['drink_id']) ? $data['drink_id'] : null;

    $query = "INSERT INTO favorites (user_id, food_id, drink_id) VALUES (:user_id, :food_id, :drink_id)";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':food_id', $food_id);
    $stmt->bindParam(':drink_id', $drink_id);

    if ($stmt->execute()) {
        echo json_encode(['message' => 'Product added to favorites']);
    } else {
        echo json_encode(['error' => 'Failed to add to favorites']);
    }
}
?>