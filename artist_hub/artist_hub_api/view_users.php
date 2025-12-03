<?php
header('Content-Type: application/json');
include 'connect.php';

$data = [];
$q = mysqli_query($con, "SELECT user_id, name, email, phone, address, role, profile_pic, status, created_at FROM g_users");
while ($row = mysqli_fetch_assoc($q)) $data[] = $row;

echo json_encode(['status'=>true,'data'=>$data]);
?>