<?php
header('Content-Type: application/json');
include 'connect.php';

$booking_id = $_POST['booking_id'] ?? '';
$status = $_POST['status'] ?? ''; // pending, confirmed, cancelled, completed

if (empty($booking_id) || empty($status)) { echo json_encode(['status'=>false,'message'=>'booking_id and status required']); exit; }

$q = "UPDATE g_bookings SET status='$status' WHERE booking_id='$booking_id'";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Status updated']); else echo json_encode(['status'=>false,'message'=>'Failed']);
?>