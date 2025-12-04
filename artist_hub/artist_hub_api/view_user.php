<?php
header('Content-Type: application/json');
include 'connect.php';

$user_id = $_GET['user_id'] ?? '';
if ($user_id == '') { echo json_encode(['status'=>false,'message'=>'user_id required']); exit; }

$q = mysqli_query($con, "SELECT user_id, name, email, phone, address, role, profile_pic, status, created_at FROM g_users WHERE user_id='$user_id' LIMIT 1");
if ($q && mysqli_num_rows($q)==1) {
    echo json_encode(['status'=>true,'data'=>mysqli_fetch_assoc($q)]);
} else {
    echo json_encode(['status'=>false,'message'=>'User not found']);
}
?>
