<?php
header('Content-Type: application/json');
include 'connect.php';

$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if ($email == '' || $password == '') { echo json_encode(['status'=>false,'message'=>'Email and password required']); exit; }

$q = mysqli_query($con, "SELECT password FROM g_users WHERE email='$email' LIMIT 1");
if (!$q || mysqli_num_rows($q) == 0) {
    echo json_encode(['status'=>false,'message'=>'Invalid Email or Password']); exit;
}
$row = mysqli_fetch_assoc($q);
if (password_verify($password, $row['password'])) {
    echo json_encode(['status'=>true,'message'=>'Login successful']);
} else {
    echo json_encode(['status'=>false,'message'=>'Invalid Email or Password']);
}
?>
