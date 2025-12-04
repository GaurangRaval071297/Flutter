<?php
header('Content-Type: application/json');
include 'connect.php';

$customer_id = $_POST['customer_id'] ?? '';
$artist_id = $_POST['artist_id'] ?? '';
$event_date = $_POST['event_date'] ?? '';
$event_time = $_POST['event_time'] ?? '';
$location = $_POST['location'] ?? '';

if ($customer_id=='' || $artist_id=='' || $event_date=='') {
    echo json_encode(['status'=>false,'message'=>'customer_id, artist_id, event_date required']);
    exit;
}

$q = "INSERT INTO g_bookings (customer_id, artist_id, event_date, event_time, location)
      VALUES ('$customer_id','$artist_id','$event_date','$event_time','$location')";

if (mysqli_query($con,$q)){
    echo json_encode(['status'=>true,'message'=>'Booking created']);
} else {
    echo json_encode(['status'=>false,'message'=>'Failed']);
}
?>
