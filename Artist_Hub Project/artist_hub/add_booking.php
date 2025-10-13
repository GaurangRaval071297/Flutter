<?php
include('connect.php'); header('Content-Type: application/json');
$customer_id=$_POST['customer_id']; $artist_id=$_POST['artist_id']; $event_date=$_POST['event_date']; $event_time=$_POST['event_time']; $location=$_POST['location'];
$q="INSERT INTO g_bookings(customer_id,artist_id,event_date,event_time,location,status) VALUES('$customer_id','$artist_id','$event_date','$event_time','$location','pending')";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Booking Added']):json_encode(['code'=>500,'message'=>'Insert Failed']);
?>