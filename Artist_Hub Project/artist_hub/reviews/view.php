<?php
include('../connect.php'); header('Content-Type: application/json');
$res=mysqli_query($con,"SELECT r.*,u.name AS customer_name FROM g_reviews r JOIN g_users u ON r.customer_id=u.user_id");
$data=mysqli_fetch_all($res,MYSQLI_ASSOC); echo json_encode(['code'=>200,'data'=>$data]);
?>