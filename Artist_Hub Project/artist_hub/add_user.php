<?php
include('../connect.php'); header('Content-Type: application/json');
$name=$_POST['name']; $email=$_POST['email']; $password=$_POST['password']; 
$phone=$_POST['phone']; $address=$_POST['address']; $role=$_POST['role'];
$q="INSERT INTO g_users(name,email,password,phone,address,role,status) VALUES('$name','$email','$password','$phone','$address','$role','pending')";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'User Added']):json_encode(['code'=>500,'message'=>'Insert Failed']);
?>