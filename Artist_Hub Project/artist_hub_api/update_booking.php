<?php
include('connect.php');
$booking_id=$_POST['booking_id']; $status=$_POST['status'];
$q="UPDATE g_bookings SET status='$status' WHERE booking_id='$booking_id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Booking Updated']):json_encode(['code'=>500,'message'=>'Update Failed']);
?>