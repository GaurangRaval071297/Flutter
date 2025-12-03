<?php
header('Content-Type: application/json');
include 'connect.php';

$data = [];
$q = mysqli_query($con, "SELECT f.*, u.name as user_name FROM g_feedbacks f JOIN g_users u ON f.user_id=u.user_id ORDER BY f.created_at DESC");
while ($r = mysqli_fetch_assoc($q)) $data[] = $r;
echo json_encode(['status'=>true,'data'=>$data]);
?>