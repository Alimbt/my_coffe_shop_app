<?php
include "../db.php";

header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"), true);

$query = "DELETE FROM cart WHERE name = :name";
$stmt = $conn->prepare($query);
$stmt->bindParam(':name', $data['name']);

if ($stmt->execute()) {
    echo json_encode(['message' => 'Item removed from cart']);
} else {
    echo json_encode(['error' => 'Failed to remove item from cart']);
}
?>