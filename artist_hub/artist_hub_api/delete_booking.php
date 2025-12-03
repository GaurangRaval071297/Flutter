<?php
header('Content-Type: application/json');
include 'connect.php';

$booking_id = $_POST['booking_id'] ?? '';
if (empty($booking_id)) { echo json_encode(['status'=>false,'message'=>'booking_id required']); exit; }

$q = "DELETE FROM g_bookings WHERE booking_id='$booking_id'";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Booking deleted']); else echo json_encode(['status'=>false,'message'=>'Failed']);
?>