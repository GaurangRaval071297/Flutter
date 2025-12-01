<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$customer_id = $_POST['customer_id'] ?? null;
$artist_id = $_POST['artist_id'] ?? null;
$event_date = $_POST['event_date'] ?? null; // YYYY-MM-DD
$event_time = $_POST['event_time'] ?? null; // optional, HH:MM:SS
$location = $_POST['location'] ?? null;

if (!$customer_id || !$artist_id || !$event_date) {
    echo json_encode(["status" => false, "message" => "Missing required fields"]);
    exit;
}

try {

    $stmt = $con->prepare("INSERT INTO g_bookings (customer_id, artist_id, event_date, event_time, location) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("iisss", $customer_id, $artist_id, $event_date, $event_time, $location);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Booking created successfully",
        "booking_id" => $stmt->insert_id
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
