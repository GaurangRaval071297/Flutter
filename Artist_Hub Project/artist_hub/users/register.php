<?php
include('../connect.php');
header('Content-Type: application/json');

$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$phone = $_POST['phone'] ?? '';
$address = $_POST['address'] ?? '';
$role = $_POST['role'] ?? 'customer';

if(empty($name) || empty($email) || empty($password)){
    echo json_encode(['code'=>400, 'message'=>'Name, Email & Password are required']);
    exit;
}

// Check if email exists
$check = mysqli_query($con, "SELECT * FROM g_users WHERE email='$email'");
if(mysqli_num_rows($check) > 0){
    echo json_encode(['code'=>409, 'message'=>'Email already registered']);
    exit;
}

// Encrypt password
$hashed = password_hash($password, PASSWORD_BCRYPT);

// Insert new user
$q = "INSERT INTO g_users (name, email, password, phone, address, role, status) 
      VALUES ('$name', '$email', '$hashed', '$phone', '$address', '$role', 'pending')";

if(mysqli_query($con, $q)){
    echo json_encode(['code'=>200, 'message'=>'Registration Successful']);
} else {
    echo json_encode(['code'=>500, 'message'=>'Registration Failed']);
}
?>
