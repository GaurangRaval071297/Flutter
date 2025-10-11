<?php
include('../connect.php');
header('Content-Type: application/json');

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if(empty($email) || empty($password)){
    echo json_encode(['code'=>400, 'message'=>'Email & Password required']);
    exit;
}

// Fetch user
$q = "SELECT * FROM g_users WHERE email='$email'";
$res = mysqli_query($con, $q);

if(mysqli_num_rows($res) == 0){
    echo json_encode(['code'=>404, 'message'=>'User not found']);
    exit;
}

$user = mysqli_fetch_assoc($res);

// Verify password
if(password_verify($password, $user['password'])){
    unset($user['password']); // hide password from output
    echo json_encode(['code'=>200, 'message'=>'Login Successful', 'user'=>$user]);
} else {
    echo json_encode(['code'=>401, 'message'=>'Invalid Password']);
}
?>
