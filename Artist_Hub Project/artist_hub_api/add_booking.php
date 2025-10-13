<?php
include('connect.php');

$customer_id = $_POST['customer_id'] ?? '';
$artist_id   = $_POST['artist_id'] ?? '';
$event_date  = $_POST['event_date'] ?? '';
$event_time  = $_POST['event_time'] ?? '';
$location    = $_POST['location'] ?? '';
$status      = $_POST['status'] ?? '';
$created_at  = $_POST['created_at'] ?? date('Y-m-d H:i:s');

if (empty($customer_id) || empty($artist_id) || empty($event_date) || empty($event_time) || empty($location) || empty($status) || empty($created_at)) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Please Fill All The Fields.'
    ]);
    exit;
}

$q = "INSERT INTO g_bookings (customer_id, artist_id, event_date, event_time, location, status, created_at)
      VALUES ('$customer_id', '$artist_id', '$event_date', '$event_time', '$location', '$status', '$created_at')";

$result = mysqli_query($con, $q);

if ($result) {
    echo json_encode([
        'status' => 'success',
        'message' => 'Booking Successfully'
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed Booking',
        'error' => mysqli_error($con)
    ]);
}
?>
