<?php
include "../db.php";
include "./drinks.php";

if ($method === 'DELETE') {
    $data = json_decode(file_get_contents("php://input"), true);

    $query = "DELETE FROM drinks WHERE id = :id LIMIT 1";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':id', $data['id']);

    if ($stmt->execute()) {
        echo json_encode(['message' => 'Product removed from drinks']);
    } else {
        echo json_encode(['error' => 'Failed to remove from drinks']);
    }
}

?>