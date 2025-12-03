<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (form-data)
$customer_id = $_POST['customer_id'] ?? '';
$artist_id = $_POST['artist_id'] ?? '';
$event_date = $_POST['event_date'] ?? ''; // YYYY-MM-DD
$event_time = $_POST['event_time'] ?? null; // HH:MM:SS (optional)
$location = $_POST['location'] ?? null;

// Validate required fields
if (empty($customer_id) || empty($artist_id) || empty($event_date)) {
    echo json_encode([
        "status" => false,
        "message" => "customer_id, artist_id, and event_date are required"
    ]);
    exit;
}

// Insert booking
$stmt = mysqli_prepare($con, "INSERT INTO g_bookings (customer_id, artist_id, event_date, event_time, location) VALUES (?, ?, ?, ?, ?)");
if ($stmt === false) {
    echo json_encode(["status" => false, "message" => "Prepare failed: " . mysqli_error($con)]);
    exit;
}

mysqli_stmt_bind_param($stmt, "iisss", $customer_id, $artist_id, $event_date, $event_time, $location);

if (mysqli_stmt_execute($stmt)) {
    $booking_id = mysqli_insert_id($con);
    echo json_encode([
        "status" => true,
        "message" => "Booking created successfully",
        "booking_id" => $booking_id
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to create booking: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
