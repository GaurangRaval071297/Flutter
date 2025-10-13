<?php
include('connect.php');
$id=$_POST['id']; $q="DELETE FROM g_artist_category WHERE id='$id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Category Deleted']):json_encode(['code'=>500,'message'=>'Delete Failed']);
?>