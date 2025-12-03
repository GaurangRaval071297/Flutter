<?php
header('Content-Type: application/json');
include 'connect.php';

$id = $_GET['user_id'] ?? '';
if (empty($id)) { echo json_encode(['status'=>false,'message'=>'user_id required']); exit; }

$q = mysqli_query($con, "SELECT user_id, name, email, phone, address, role, profile_pic, status, created_at FROM g_users WHERE user_id='$id'");
if ($q && mysqli_num_rows($q)==1) {
    $data = mysqli_fetch_assoc($q);
    echo json_encode(['status'=>true,'data'=>$data]);
} else {
    echo json_encode(['status'=>false,'message'=>'User not found']);
}
?>