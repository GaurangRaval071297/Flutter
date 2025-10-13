<?php
include 'connect.php';
header('Content-Type: application/json');

$name = isset($_POST['name']) ? $con->real_escape_string($_POST['name']) : '';
$email = isset($_POST['email']) ? $con->real_escape_string($_POST['email']) : '';
$password = isset($_POST['password']) ? $cnn->real_escape_string($_POST['password']) : '';

if (!$name || !$email || !$password) {
    echo json_encode(['success'=>false,'message'=>'All fields required']);
    exit;
}

$check = $con->query("SELECT user_id FROM g_users WHERE email='$email'");
if ($check && $check->num_rows > 0) {
    echo json_encode(['success'=>false,'message'=>'Email already registered']);
    exit;
}

$sql = "INSERT INTO g_users(name,email,password) VALUES('$name','$email','$password')";
if ($con->query($sql)) {
    echo json_encode(['success'=>true,'message'=>'User added','user_id'=>$con->insert_id]);
} else {
    echo json_encode(['success'=>false,'message'=>'Failed to add user']);
}
?>
