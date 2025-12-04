<?php
header('Content-Type: application/json');
include 'connect.php';

$user_id = $_POST['user_id'] ?? '';
$name = $_POST['name'] ?? '';
$phone = $_POST['phone'] ?? '';
$address = $_POST['address'] ?? '';

if ($user_id == '') { echo json_encode(['status'=>false,'message'=>'user_id required']); exit; }
$updates = [];
if ($name !== '') $updates[] = "name='$name'";
if ($phone !== '') $updates[] = "phone='$phone'";
if ($address !== '') $updates[] = "address='$address'";

if (count($updates) == 0) { echo json_encode(['status'=>false,'message'=>'Nothing to update']); exit; }
$q = "UPDATE g_users SET ".implode(',', $updates)." WHERE user_id='$user_id'";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Updated']);
else echo json_encode(['status'=>false,'message'=>'Update failed']);
?>
