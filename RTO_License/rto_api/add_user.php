<?php
include 'connect.php';

$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if (!$name || !$email || !$password) {
    echo json_encode(['success' => false, 'message' => 'All fields required']);
    exit;
}

// Check if email already exists
$check = $con->query("SELECT user_id FROM gr_users WHERE email='$email'");
if ($check->num_rows > 0) {
    echo json_encode(['success' => false, 'message' => 'Email already registered']);
    exit;
}

// Insert new user
$sql = "INSERT INTO gr_users (name, email, password) VALUES ('$name', '$email', '$password')";
if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'User added', 'user_id' => $con->insert_id]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to add user']);
}
?>
