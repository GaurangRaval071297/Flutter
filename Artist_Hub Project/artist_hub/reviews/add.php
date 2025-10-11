<?php
include('../connect.php'); header('Content-Type: application/json');
$booking_id=$_POST['booking_id']; $customer_id=$_POST['customer_id']; $artist_id=$_POST['artist_id']; $rating=$_POST['rating']; $message=$_POST['message'];
$q="INSERT INTO g_reviews(booking_id,customer_id,artist_id,rating,message) VALUES('$booking_id','$customer_id','$artist_id','$rating','$message')";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Review Added']):json_encode(['code'=>500,'message'=>'Insert Failed']);
?>