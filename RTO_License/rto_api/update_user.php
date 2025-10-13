<?php
include 'connect.php';
header('Content-Type: application/json');

$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
$name = isset($_POST['name']) ? $con->real_escape_string($_POST['name']) : '';
$email = isset($_POST['email']) ? $con->real_escape_string($_POST['email']) : '';
$password = isset($_POST['password']) ? $con->real_escape_string($_POST['password']) : '';

if (!$id) { echo json_encode(['success'=>false,'message'=>'ID required']); exit; }

$sql = "UPDATE g_users SET name='$name', email='$email', password='$password' WHERE user_id=$id";
if ($con->query($sql)) {
    echo json_encode(['success'=>true,'message'=>'User updated']);
} else {
    echo json_encode(['success'=>false,'message'=>'Update failed']);
}
?>
