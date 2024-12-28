<?php
header('Content-Type: application/json');
include './db.php';

$database = new Database();

$conn = $database->connect();

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    // دریافت user_id از درخواست GET
    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : die(json_encode(['error' => 'User ID not provided']));

    // کوئری برای دریافت محصولات غذایی
    $food_query = "SELECT foods.FoodId as id, foods.name, foods.imageUrl FROM favorites 
                   JOIN foods ON favorites.food_id = foods.FoodId
                   WHERE favorites.user_id = :user_id AND favorites.food_id IS NOT NULL";
    $food_stmt = $conn->prepare($food_query);
    $food_stmt->bindParam(':user_id', $user_id);
    $food_stmt->execute();
    $food_favorites = $food_stmt->fetchAll(PDO::FETCH_ASSOC);

    // کوئری برای دریافت نوشیدنی‌ها
    $drink_query = "SELECT drinks.DrinkId as id, drinks.name, drinks.imageUrl FROM favorites 
                    JOIN drinks ON favorites.drink_id = drinks.DrinkId
                    WHERE favorites.user_id = :user_id AND favorites.drink_id IS NOT NULL";
    $drink_stmt = $conn->prepare($drink_query);
    $drink_stmt->bindParam(':user_id', $user_id);
    $drink_stmt->execute();
    $drink_favorites = $drink_stmt->fetchAll(PDO::FETCH_ASSOC);

    // ترکیب نتایج
    $favorites = array_merge($food_favorites, $drink_favorites);
    echo json_encode($favorites);

}  
?>