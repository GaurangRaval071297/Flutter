<?php
header('Content-Type: application/json');
include 'connect.php';

$data=[];
$q = mysqli_query($con,"SELECT user_id AS artist_id, name, email, phone, address, profile_pic 
                        FROM g_users WHERE role='artist' ORDER BY user_id DESC");

while($r=mysqli_fetch_assoc($q)) $data[]=$r;

echo json_encode(['status'=>true,'data'=>$data]);
?>
