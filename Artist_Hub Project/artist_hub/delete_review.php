<?php
include('connect.php'); header('Content-Type: application/json');
$review_id=$_POST['review_id']; $q="DELETE FROM g_reviews WHERE review_id='$review_id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Review Deleted']):json_encode(['code'=>500,'message'=>'Delete Failed']);
?>