<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

error_reporting(0);
include "connect.php";

if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if(empty($email) || empty($password)){
        echo json_encode([
            "status" => false,
            "message" => "Email or Password missing"
        ]);
        exit;
    }

    // Fetch user by email
    $stmt = $con->prepare("SELECT password FROM g_users WHERE email=?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if($result->num_rows == 0){
        echo json_encode([
            "status" => false,
            "message" => "Email not found"
        ]);
        exit;
    }

    $user = $result->fetch_assoc();

    // Verify password
    if(password_verify($password, $user['password'])){

        echo json_encode([
            "status" => true,
            "message" => "Login successful"
        ]);

    } else {
        echo json_encode([
            "status" => false,
            "message" => "Invalid password"
        ]);
    }

} else {
    echo json_encode([
        "status" => false,
        "message" => "Invalid request method"
    ]);
}
?>
