<?php
include('connect.php');
header('Content-Type: application/json');

$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if(empty($name) || empty($email) || empty($password)){
    echo json_encode(['code'=>400,'message'=>'All fields required']);
    exit;
}

$check = mysqli_query($con, "SELECT * FROM g_users WHERE email='$email'");
if(mysqli_num_rows($check) > 0){
    echo json_encode(['code'=>409,'message'=>'Email already exists']);
    exit;
}

$password_hash = password_hash($password, PASSWORD_DEFAULT);

$insert = mysqli_query($con, "INSERT INTO g_users(name,email,password) VALUES('$name','$email','$password_hash')");

if($insert){
    echo json_encode(['code'=>200,'message'=>'User registered successfully']);
}else{
    echo json_encode(['code'=>500,'message'=>'Failed to register user']);
}
?>