<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id = $_GET['artist_id'] ?? '';
if (empty($artist_id)) { echo json_encode(['status'=>false,'message'=>'artist_id required']); exit; }

$data = [];
$q = mysqli_query($con, "SELECT r.*, u.name as customer_name FROM g_reviews r JOIN g_users u ON r.customer_id=u.user_id WHERE r.artist_id='$artist_id' ORDER BY r.created_at DESC");
while ($r = mysqli_fetch_assoc($q)) $data[] = $r;
echo json_encode(['status'=>true,'data'=>$data]);
?>