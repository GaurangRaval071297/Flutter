<?php
header('Content-Type: application/json');
include 'connect.php';

$user_id = $_POST['user_id'] ?? '';
$message = trim($_POST['message'] ?? '');

if ($user_id=='' || $message=='') { echo json_encode(['status'=>false,'message'=>'user_id and message required']); exit; }

if (mysqli_query($con, "INSERT INTO g_feedbacks (user_id, message) VALUES ('$user_id', '$message')")) {
    echo json_encode(['status'=>true,'message'=>'Feedback submitted']);
} else {
    echo json_encode(['status'=>false,'message'=>'Failed']);
}
?>
