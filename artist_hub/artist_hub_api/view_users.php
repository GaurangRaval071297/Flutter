<?php
header('Content-Type: application/json');
include 'connect.php';

$data = [];
$q = mysqli_query($con, "SELECT user_id, name, email, phone, address, role, profile_pic, status, created_at FROM g_users ORDER BY created_at DESC");
while ($r = mysqli_fetch_assoc($q)) $data[] = $r;
echo json_encode(['status'=>true,'data'=>$data]);
?>
