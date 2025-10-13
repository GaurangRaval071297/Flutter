<?php
include('connect.php'); header('Content-Type: application/json');
$artist_id=$_POST['artist_id']; $name=$_POST['name']; $description=$_POST['description']; $media_url=$_POST['media_url']; $media_type=$_POST['media_type'];
$q="INSERT INTO g_artist_category(artist_id,name,description,media_url,media_type) VALUES('$artist_id','$name','$description','$media_url','$media_type')";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Category Added']):json_encode(['code'=>500,'message'=>'Insert Failed']);
?>