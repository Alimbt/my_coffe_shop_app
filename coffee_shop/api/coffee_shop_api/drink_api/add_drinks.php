<?php
include "../db.php";
include "./drinks.php";

if ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    $query = "INSERT INTO drinks (name, imageUrl) VALUES (:name, :imageUrl)";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':name', $data['name']);
    $stmt->bindParam(':imageUrl', $data['imageUrl']);

    if ($stmt->execute()) {
        echo json_encode(['message' => 'drink added']);
    } else {
        echo json_encode(['error' => 'Failed to add drink']);
    }
}

?>