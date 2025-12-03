<?php
header('Content-Type: application/json');
include 'connect.php';

// Get form data
$name        = $_POST['name'] ?? '';
$email       = $_POST['email'] ?? '';
$password    = $_POST['password'] ?? '';
$phone       = $_POST['phone'] ?? '';
$address     = $_POST['address'] ?? '';
$role        = $_POST['role'] ?? '';
$profile_pic = $_FILES['profile_pic']['name'] ?? '';


// ---------------------- VALIDATION -------------------------

if ($name == "") {
    echo json_encode(["status" => false, "message" => "Name is required"]);
    exit;
}

if ($email == "") {
    echo json_encode(["status" => false, "message" => "Email is required"]);
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(["status" => false, "message" => "Invalid email format"]);
    exit;
}

if ($password == "") {
    echo json_encode(["status" => false, "message" => "Password is required"]);
    exit;
}

if ($phone == "") {
    echo json_encode(["status" => false, "message" => "Phone is required"]);
    exit;
}

if (!preg_match('/^[0-9]{10}$/', $phone)) {
    echo json_encode(["status" => false, "message" => "Phone must be 10 digits"]);
    exit;
}

if ($address == "") {
    echo json_encode(["status" => false, "message" => "Address is required"]);
    exit;
}

if ($role == "") {
    echo json_encode(["status" => false, "message" => "Role is required"]);
    exit;
}

// Only Artist or Customer allowed
$valid_roles = ['artist', 'customer'];
if (!in_array(strtolower($role), $valid_roles)) {
    echo json_encode(["status" => false, "message" => "Role must be Artist or Customer only"]);
    exit;
}

// Profile picture required
if ($profile_pic == "") {
    echo json_encode(["status" => false, "message" => "Profile picture is required"]);
    exit;
}

// Validate image extension
$allowed_ext = ['jpg','jpeg','png'];
$ext = strtolower(pathinfo($profile_pic, PATHINFO_EXTENSION));

if (!in_array($ext, $allowed_ext)) {
    echo json_encode(["status" => false, "message" => "Only JPG, JPEG, PNG files allowed"]);
    exit;
}


// ---------- CREATE UPLOAD FOLDER IF NOT EXISTS ----------
if (!file_exists("uploads")) {
    mkdir("uploads", 0777, true);
}


// ---------- Upload image ----------
$img_name = time() . "." . $ext;

if (!move_uploaded_file($_FILES['profile_pic']['tmp_name'], "uploads/" . $img_name)) {
    echo json_encode(["status" => false, "message" => "Image upload failed"]);
    exit;
}


// ---------- Check email exists ----------
$check = mysqli_query($con, "SELECT * FROM g_users WHERE email='$email'");
if (mysqli_num_rows($check) > 0) {
    echo json_encode([
        "status" => false,
        "message" => "Email already exists"
    ]);
    exit;
}


// ---------- Insert new user ----------
$password_hashed = password_hash($password, PASSWORD_BCRYPT);

$insert = mysqli_query($con,
    "INSERT INTO g_users (name, email, password, phone, address, role, profile_pic)
     VALUES ('$name', '$email', '$password_hashed', '$phone', '$address', '$role', '$img_name')"
);


// ---------- Response ----------
if ($insert) {
    echo json_encode([
        "status" => true,
        "message" => "Registration successful"
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "Registration failed"
    ]);
}

?>
