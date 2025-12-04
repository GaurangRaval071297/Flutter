<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id = $_POST['artist_id'] ?? '';

$data=[];
$q = mysqli_query($con,"SELECT * FROM g_reviews WHERE artist_id='$artist_id' ORDER BY review_id DESC");
while($r=mysqli_fetch_assoc($q)) $data[]=$r;

echo json_encode(['status'=>true,'data'=>$data]);
?>
	