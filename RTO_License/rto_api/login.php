<?php
include 'connect.php';
header('Content-Type: application/json');

$email = isset($_POST['email']) ? $con->real_escape_string($_POST['email']) : '';
$password = isset($_POST['password']) ? $con->real_escape_string($_POST['password']) : '';

if (!$email || !$password) {
    echo json_encode(['success'=>false,'message'=>'Email and password required']);
    exit;
}

$sql = "SELECT user_id,name,email,created_at FROM g_users WHERE email='$email' AND password='$password'";
$res = $con->query($sql);
if ($res && $res->num_rows>0) {
    $user = $res->fetch_assoc();
    echo json_encode(['success'=>true,'user'=>$user]);
} else {
    echo json_encode(['success'=>false,'message'=>'Invalid credentials']);
}
?>
