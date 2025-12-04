<?php
header('Content-Type: application/json');
include 'connect.php';

$name        = trim($_POST['name'] ?? '');
$email       = trim($_POST['email'] ?? '');
$password    = $_POST['password'] ?? '';
$phone       = trim($_POST['phone'] ?? '');
$address     = trim($_POST['address'] ?? '');
$role        = trim($_POST['role'] ?? '');
$profile_pic = $_FILES['profile_pic']['name'] ?? '';

// Basic validations
if ($name == '') { echo json_encode(['status'=>false,'message'=>'Name is required']); exit; }
if ($email == '') { echo json_encode(['status'=>false,'message'=>'Email is required']); exit; }
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['status'=>false,'message'=>'Invalid email']); exit;
}
if ($password == '') { echo json_encode(['status'=>false,'message'=>'Password is required']); exit; }
if ($phone == '') { echo json_encode(['status'=>false,'message'=>'Phone is required']); exit; }
if (!preg_match('/^[0-9]{10}$/', $phone)) {
    echo json_encode(['status'=>false,'message'=>'Phone must be 10 digits']); exit;
}
if ($address == '') { echo json_encode(['status'=>false,'message'=>'Address is required']); exit; }
if ($role == '') { echo json_encode(['status'=>false,'message'=>'Role is required']); exit; }

$valid_roles = ['artist','customer'];
if (!in_array(strtolower($role), $valid_roles)) {
    echo json_encode(['status'=>false,'message'=>'Role must be artist or customer']); exit;
}

if ($profile_pic == '') {
    echo json_encode(['status'=>false,'message'=>'Profile picture is required']); exit;
}

// Check email exists
$check = mysqli_query($con, "SELECT user_id FROM g_users WHERE email='$email' LIMIT 1");
if ($check && mysqli_num_rows($check) > 0) {
    echo json_encode(['status'=>false,'message'=>'Email already exists']); exit;
}

// Validate image extension
$ext = strtolower(pathinfo($profile_pic, PATHINFO_EXTENSION));
if (!in_array($ext, ['jpg', 'jpeg', 'png'])) {
    echo json_encode(['status'=>false,'message'=>'Only JPG/JPEG/PNG allowed']); exit;
}

// Upload directory
$uploadDir = __DIR__ . '/uploads/';
if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);

$newName = time() . '_' . rand(1000, 9999) . '.' . $ext;
$targetPath = $uploadDir . $newName;

if (!move_uploaded_file($_FILES['profile_pic']['tmp_name'], $targetPath)) {
    echo json_encode(['status'=>false,'message'=>'Image upload failed']); exit;
}

// Insert user
$hashedPassword = password_hash($password, PASSWORD_BCRYPT);

$insert = mysqli_query($con, 
    "INSERT INTO g_users (name, email, password, phone, address, role, profile_pic) 
     VALUES ('$name', '$email', '$hashedPassword', '$phone', '$address', '$role', '$newName')"
);

if ($insert) {

    // Fetch inserted user with artist_id support
    $user_id = mysqli_insert_id($con);

    echo json_encode([
        'status' => true,
        'message' => 'Registration successful',
        'user' => [
            'user_id'   => $user_id,
            'artist_id' => $role == 'artist' ? $user_id : null,
            'name'      => $name,
            'email'     => $email,
            'phone'     => $phone,
            'address'   => $address,
            'role'      => $role,
            'profile_pic' => $newName
        ]
    ]);

} else {
    echo json_encode(['status'=>false,'message'=>'Registration failed']);
}
?>
