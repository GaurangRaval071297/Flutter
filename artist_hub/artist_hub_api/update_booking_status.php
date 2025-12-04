<?php
header('Content-Type: application/json');
include 'connect.php';

$booking_id = $_POST['booking_id'] ?? '';
$status = $_POST['status'] ?? ''; // pending, confirmed, cancelled, completed

if ($booking_id=='' || $status=='') { echo json_encode(['status'=>false,'message'=>'booking_id and status required']); exit; }

if (in_array($status, ['pending','confirmed','cancelled','completed'])) {
    if (mysqli_query($con, "UPDATE g_bookings SET status='$status' WHERE booking_id='$booking_id'")) {
        echo json_encode(['status'=>true,'message'=>'Status updated']);
    } else echo json_encode(['status'=>false,'message'=>'Update failed']);
} else {
    echo json_encode(['status'=>false,'message'=>'Invalid status value']);
}
?>
