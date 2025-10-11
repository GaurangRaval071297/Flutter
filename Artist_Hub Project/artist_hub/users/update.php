<?php
include('../connect.php'); header('Content-Type: application/json');
$user_id=$_POST['user_id']; $name=$_POST['name']; $phone=$_POST['phone']; $address=$_POST['address']; $status=$_POST['status'];
$q="UPDATE g_users SET name='$name',phone='$phone',address='$address',status='$status' WHERE user_id='$user_id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'User Updated']):json_encode(['code'=>500,'message'=>'Update Failed']);
?>