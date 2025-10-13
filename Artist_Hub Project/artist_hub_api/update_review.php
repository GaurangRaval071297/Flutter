<?php
include('connect.php');
$review_id=$_POST['review_id']; $rating=$_POST['rating']; $message=$_POST['message'];
$q="UPDATE g_reviews SET rating='$rating',message='$message' WHERE review_id='$review_id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Review Updated']):json_encode(['code'=>500,'message'=>'Update Failed']);
?>