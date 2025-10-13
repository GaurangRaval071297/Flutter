<?php
include 'connect.php';
header('Content-Type: application/json');

$res = $con->query("SELECT user_id,name,email,created_at FROM g_users ORDER BY user_id DESC");
$data = [];
while ($row = $res->fetch_assoc()) $data[] = $row;
echo json_encode(['success'=>true,'users'=>$data]);
?>
