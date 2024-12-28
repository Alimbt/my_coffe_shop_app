<?php
include '../db.php';
$database = new Database();
$conn = $database->connect();
$method = $_SERVER ['REQUEST_METHOD'];

if ($method=='GET'){
    $query ="SELECT * FROM drinks";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    $products =$stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($products);

}elseif ($method === 'POST') {
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