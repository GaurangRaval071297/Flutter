<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id = $_GET['artist_id'] ?? '';
if (empty($artist_id)) { echo json_encode(['status'=>false,'message'=>'artist_id required']); exit; }

$data = [];
$q = mysqli_query($con, "SELECT ac.id, ac.category_id, c.name FROM g_artist_category ac JOIN g_categories c ON ac.category_id=c.category_id WHERE ac.artist_id='$artist_id'");
while ($r = mysqli_fetch_assoc($q)) $data[] = $r;
echo json_encode(['status'=>true,'data'=>$data]);
?>