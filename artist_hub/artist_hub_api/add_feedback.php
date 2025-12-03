<?php
header('Content-Type: application/json');
include 'connect.php';

$user_id = $_POST['user_id'] ?? '';
$message = $_POST['message'] ?? '';

if (empty($user_id) || empty($message)) { echo json_encode(['status'=>false,'message'=>'user_id and message required']); exit; }

$q = "INSERT INTO g_feedbacks (user_id, message) VALUES ('$user_id', '$message')";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Feedback submitted','feedback_id'=>mysqli_insert_id($con)]); else echo json_encode(['status'=>false,'message'=>'Failed']);
?>