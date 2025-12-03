<?php
header('Content-Type: application/json');
include 'connect.php';

// Get form data
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

// Validate input
if (empty($email) || empty($password)) {
    echo json_encode(["status" => false, "message" => "Email and password are required"]);
    exit;
}

// Fetch user by email
$result = mysqli_query($con, "SELECT * FROM g_users WHERE email='$email'");
$user = mysqli_fetch_assoc($result);

if ($user && password_verify($password, $user['password'])) {
    unset($user['password']); // remove password from response
    echo json_encode(["status" => true, "user" => $user]);
} else {
    echo json_encode(["status" => false, "message" => "Invalid email or password"]);
}

mysqli_close($con);
?>
