<?php
header('Content-Type: application/json');
include 'connect.php';

$user_id = $_POST['user_id'] ?? '';
if ($user_id == '') { echo json_encode(['status'=>false,'message'=>'user_id required']); exit; }

$q = "DELETE FROM g_users WHERE user_id='$user_id'";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'User deleted']);
else echo json_encode(['status'=>false,'message'=>'Delete failed']);
?>
