<?php
include 'connect.php';
header('Content-Type: application/json');

$id = intval($_POST['id'] ?? 0);
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID required']);
    exit;
}

$sql = "UPDATE gr_users SET name = '$name', email = '$email', password = '$password' WHERE user_id = $id";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'User updated']);
} else {
    echo json_encode(['success' => false, 'message' => 'Update failed']);
}
?>
