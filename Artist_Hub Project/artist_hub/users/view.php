<?php
include('../connect.php'); header('Content-Type: application/json');
$res=mysqli_query($con,"SELECT * FROM g_users"); $data=mysqli_fetch_all($res,MYSQLI_ASSOC);
echo json_encode(['code'=>200,'data'=>$data]);
?>