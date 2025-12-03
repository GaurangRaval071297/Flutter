<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports form-data)
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$phone = $_POST['phone'] ?? '';
$address = $_POST['address'] ?? '';
$role = 'artist';

// Handle profile picture if uploaded
$profile_pic = null;
if (isset($_FILES['profile_pic']) && $_FILES['profile_pic']['error'] === UPLOAD_ERR_OK) {
    $uploadDir = 'uploads/';
    if (!file_exists($uploadDir)) mkdir($uploadDir, 0777, true);

    $fileName = uniqid() . '_' . basename($_FILES['profile_pic']['name']);
    $targetFile = $uploadDir . $fileName;

    if (move_uploaded_file($_FILES['profile_pic']['tmp_name'], $targetFile)) {
        $profile_pic = $targetFile;
    }
}

// Validate required fields
if (empty($name) || empty($email) || empty($password)) {
    echo json_encode([
        "status" => false,
        "message" => "Name, email, and password are required"
    ]);
    exit;
}

// Check if email already exists
$check = mysqli_query($con, "SELECT * FROM g_users WHERE email='$email'");
if (!$check) {
    echo json_encode(["status" => false, "message" => "Database error: " . mysqli_error($con)]);
    exit;
}

if (mysqli_num_rows($check) > 0) {
    echo json_encode(["status" => false, "message" => "Email is already registered"]);
    exit;
}

// Hash password
$password_hashed = password_hash($password, PASSWORD_BCRYPT);

// Insert user
$insert = mysqli_query($con, "INSERT INTO g_users (name, email, password, phone, address, role, profile_pic) 
                              VALUES ('$name', '$email', '$password_hashed', '$phone', '$address', '$role', '$profile_pic')");

if ($insert) {
    $user_id = mysqli_insert_id($con);
    echo json_encode([
        "status" => true,
        "message" => "Artist registered successfully",
        "artist_id" => $user_id
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to register artist: " . mysqli_error($con)
    ]);
}

mysqli_close($con);
?>
