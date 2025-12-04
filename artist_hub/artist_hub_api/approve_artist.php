<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_user_id = $_POST['artist_user_id'] ?? '';
$status = $_POST['status'] ?? ''; // pending / approved / rejected

if ($artist_user_id=='' || $status=='') { echo json_encode(['status'=>false,'message'=>'artist_user_id and status required']); exit; }
if (!in_array($status, ['pending','approved','rejected'])) { echo json_encode(['status'=>false,'message'=>'Invalid status']); exit; }

if (mysqli_query($con, "UPDATE g_users SET status='$status' WHERE user_id='$artist_user_id'")) {
    echo json_encode(['status'=>true,'message'=>'Artist status updated']);
} else echo json_encode(['status'=>false,'message'=>'Update failed']);
?>
