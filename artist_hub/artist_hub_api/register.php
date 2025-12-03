<?php
header('Content-Type: application/json');
include 'connect.php';

// Get form data
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$phone = $_POST['phone'] ?? '';
$address = $_POST['address'] ?? '';
$role = $_POST['role'] ?? 'customer';

// Validate required fields
if (empty($name) || empty($email) || empty($password)) {
    echo json_encode(["status" => false, "message" => "Name, email, and password are required"]);
    exit;
}

// Check if email already exists
$check = mysqli_query($con, "SELECT * FROM g_users WHERE email='$email'");
if (mysqli_num_rows($check) > 0) {
    echo json_encode(["status" => false, "message" => "Email already exists"]);
    exit;
}

// Hash password
$password_hashed = password_hash($password, PASSWORD_BCRYPT);

// Insert user
$insert = mysqli_query($con, "INSERT INTO g_users(name,email,password,phone,address,role) VALUES('$name','$email','$password_hashed','$phone','$address','$role')");

if ($insert) {
    echo json_encode(["status" => true, "message" => "User registered successfully"]);
} else {
    echo json_encode(["status" => false, "message" => "Failed to register user"]);
}

mysqli_close($con);
?>
