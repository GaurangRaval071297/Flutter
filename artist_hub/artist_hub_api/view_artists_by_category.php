<?php
header('Content-Type: application/json');
include 'connect.php';

$category_id = $_GET['category_id'] ?? '';
if ($category_id=='') { echo json_encode(['status'=>false,'message'=>'category_id required']); exit; }

$data = [];
$q = mysqli_query($con, "SELECT u.user_id, u.name, u.profile_pic, u.status FROM g_artist_category ac JOIN g_users u ON ac.artist_id=u.user_id WHERE ac.category_id='$category_id'");
while ($r = mysqli_fetch_assoc($q)) $data[] = $r;
echo json_encode(['status'=>true,'data'=>$data]);
?>
