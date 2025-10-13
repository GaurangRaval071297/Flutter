<?php
include('connect.php');
$booking_id=$_POST['booking_id'];
$q="DELETE FROM g_bookings WHERE booking_id='$booking_id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Booking Deleted']):json_encode(['code'=>500,'message'=>'Delete Failed']);
?>