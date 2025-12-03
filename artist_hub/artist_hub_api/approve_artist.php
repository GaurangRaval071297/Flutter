<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id = $_POST['artist_id'] ?? '';
$status = $_POST['status'] ?? ''; // pending, approved, rejected

if (empty($artist_id) || empty($status)) { echo json_encode(['status'=>false,'message'=>'artist_id and status required']); exit; }

$q = "UPDATE g_users SET status='$status' WHERE user_id='$artist_id'";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Artist status updated']); else echo json_encode(['status'=>false,'message'=>'Failed']);
?>