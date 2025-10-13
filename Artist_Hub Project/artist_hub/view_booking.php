<?php
include('connect.php'); header('Content-Type: application/json');
$res=mysqli_query($con,"SELECT b.*,c.name AS customer_name,a.name AS artist_name FROM g_bookings b JOIN g_users c ON b.customer_id=c.user_id JOIN g_users a ON b.artist_id=a.user_id");
$data=mysqli_fetch_all($res,MYSQLI_ASSOC); echo json_encode(['code'=>200,'data'=>$data]);
?>