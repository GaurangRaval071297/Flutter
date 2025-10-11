<?php
include('connect.php');
header('Content-Type: application/json');

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if(empty($email) || empty($password)){
    echo json_encode(['code'=>400,'message'=>'Email & password required']);
    exit;
}

$result = mysqli_query($con,"SELECT * FROM g_users WHERE email='$email'");
$user = mysqli_fetch_assoc($result);

if($user && password_verify($password, $user['password'])){
    unset($user['password']);
    echo json_encode(['code'=>200,'message'=>'Login successful','user'=>$user]);
}else{
    echo json_encode(['code'=>401,'message'=>'Invalid credentials']);
}
?>