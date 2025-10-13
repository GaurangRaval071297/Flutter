<?php
include('connect.php');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (
        isset($_POST['name']) &&
        isset($_POST['email']) &&
        isset($_POST['password']) &&
        isset($_POST['phone']) &&
        isset($_POST['address']) &&
        isset($_POST['role']) &&
        isset($_POST['profile_pic']) &&
        isset($_POST['created_at'])
    ) {
        $name        = $_POST['name'];
        $email       = $_POST['email'];
        $password    = $_POST['password'];
        $phone       = $_POST['phone'];
        $address     = $_POST['address'];
        $role        = $_POST['role'];
        $profile_pic = $_POST['profile_pic'];
        $status      = 'pending'; // default
        $created_at  = $_POST['created_at'];

        // Hash password (important)
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $stmt = $con->prepare("INSERT INTO g_artist_users (name, email, password, phone, address, role, profile_pic, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        
        $stmt->bind_param("sssssssss", $name, $email, $hashed_password, $phone, $address, $role, $profile_pic, $status, $created_at);

        if ($stmt === false) {
            echo json_encode([
                'code' => 500,
                'message' => 'Prepare failed',
                'error' => $con->error
            ]);
            exit;
        }

        if ($stmt->execute()) {
            echo json_encode([
                'code' => 200,
                'message' => 'User Added Successfully'
            ]);
        } else {
            echo json_encode([
                'code' => 500,
                'message' => 'Insert Failed',
                'error' => $stmt->error
            ]);
        }

        $stmt->close();

    } else {
        echo json_encode([
            'code' => 400,
            'message' => 'Missing required POST fields'
        ]);
    }

} else {
    echo json_encode([
        'code' => 405,
        'message' => 'Invalid request method'
    ]);
}
?>
