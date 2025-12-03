<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports JSON or form-data)
$data = json_decode(file_get_contents("php://input"), true);

$user_id = $data['user_id'] ?? $_POST['user_id'] ?? '';
$name = $data['name'] ?? $_POST['name'] ?? null;
$phone = $data['phone'] ?? $_POST['phone'] ?? null;
$address = $data['address'] ?? $_POST['address'] ?? null;
$status = $data['status'] ?? $_POST['status'] ?? null;
$profile_pic = $data['profile_pic'] ?? $_POST['profile_pic'] ?? null;

if(empty($user_id)){
    echo json_encode(["status"=>false,"message"=>"Missing user_id"]);
    exit;
}

// Prepare update statement
$stmt = mysqli_prepare($con, "UPDATE g_users SET name = COALESCE(?, name), phone = COALESCE(?, phone), address = COALESCE(?, address), status = COALESCE(?, status), profile_pic = COALESCE(?, profile_pic) WHERE user_id = ?");
mysqli_stmt_bind_param($stmt, "sssssi", $name, $phone, $address, $status, $profile_pic, $user_id);

if(mysqli_stmt_execute($stmt)){
    echo json_encode(["status"=>true,"message"=>"User updated successfully"]);
} else {
    echo json_encode(["status"=>false,"message"=>mysqli_error($con)]);
}

// Close connection
mysqli_stmt_close($stmt);
mysqli_close($con);
?>
