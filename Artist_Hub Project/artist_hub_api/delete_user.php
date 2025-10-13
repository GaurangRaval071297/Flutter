<?php
include('connect.php');
$user_id=$_POST['user_id']; $q="DELETE FROM g_artist_users WHERE user_id='$user_id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'User Deleted']):json_encode(['code'=>500,'message'=>'Delete Failed']);
?>