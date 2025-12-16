<?php
header('Content-Type: application/json');
include 'connect.php';

$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if ($email == '' || $password == '') {
    echo json_encode(['status'=>false,'message'=>'Email and password required']);
    exit;
}

// Fetch password and role only
$q = mysqli_query($con, "SELECT password, role FROM g_users WHERE email='$email' LIMIT 1");
if (!$q || mysqli_num_rows($q) == 0) {
    echo json_encode(['status'=>false,'message'=>'Invalid Email or Password']);
    exit;
}

$row = mysqli_fetch_assoc($q);

if (password_verify($password, $row['password'])) {
    echo json_encode([
        'status'  => true,
        'message' => 'Login successful',
        'role'    => $row['role']
    ]);
} else {
    echo json_encode(['status'=>false,'message'=>'Invalid Email or Password']);
}
?>
