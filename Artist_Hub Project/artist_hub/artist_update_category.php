<?php
include('connect.php'); header('Content-Type: application/json');
$id=$_POST['id']; $name=$_POST['name']; $description=$_POST['description']; $media_url=$_POST['media_url']; $media_type=$_POST['media_type'];
$q="UPDATE g_artist_category SET name='$name',description='$description',media_url='$media_url',media_type='$media_type' WHERE id='$id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Category Updated']):json_encode(['code'=>500,'message'=>'Update Failed']);
?>