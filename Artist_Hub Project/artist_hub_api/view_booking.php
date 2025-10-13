<?php
include('connect.php');
$res=mysqli_query($con,"SELECT * FROM g_bookings");
$data=mysqli_fetch_all($res,MYSQLI_ASSOC); echo json_encode(['code'=>200,'data'=>$data]);
?>