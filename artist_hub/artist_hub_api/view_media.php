<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_user_id = $_GET['artist_user_id'] ?? '';
if ($artist_user_id == '') { echo json_encode(['status'=>false,'message'=>'artist_user_id required']); exit; }

$data = [];
$q = mysqli_query($con, "SELECT media_id, artist_id, media_url, media_type, uploaded_at FROM g_artist_media WHERE artist_id='$artist_user_id' ORDER BY uploaded_at DESC");
while ($r = mysqli_fetch_assoc($q)) $data[] = $r;
echo json_encode(['status'=>true,'data'=>$data]);
?>
