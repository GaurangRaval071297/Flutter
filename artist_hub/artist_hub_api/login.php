<?php
header('Content-Type: application/json');
include 'connect.php';

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if (empty($email) || empty($password)) {
    echo json_encode(['status' => false, 'message' => 'Email and password required']);
    exit;
}

$q = mysqli_query($con, "SELECT * FROM g_users WHERE email='$email'");
if ($q && mysqli_num_rows($q) == 1) {

    $user = mysqli_fetch_assoc($q);

    if (password_verify($password, $user['password'])) {

        echo json_encode([
            'status' => true,
            'message' => 'Login successful'
        ]);

    } else {
        echo json_encode([
            'status' => false,
            'message' => 'Invalid Email or Password'
        ]);
    }

} else {
    echo json_encode([
        'status' => false,
        'message' => 'Email not found'
    ]);
}
?>
