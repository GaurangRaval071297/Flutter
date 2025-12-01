<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status"=>false,"message"=>"Only POST method allowed"]);
    exit;
}

$booking_id = $_POST['booking_id'] ?? null;
$event_date = $_POST['event_date'] ?? null;
$event_time = $_POST['event_time'] ?? null;
$location = $_POST['location'] ?? null;
$status = $_POST['status'] ?? null;

if (!$booking_id) {
    echo json_encode(["status"=>false,"message"=>"Missing booking_id"]);
    exit;
}

try {
    $stmt = $con->prepare("
        UPDATE g_bookings
        SET event_date = IFNULL(?, event_date),
            event_time = IFNULL(?, event_time),
            location = IFNULL(?, location),
            status = IFNULL(?, status)
        WHERE booking_id = ?
    ");
    $stmt->bind_param("ssssi", $event_date, $event_time, $location, $status, $booking_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Booking updated successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}

mysqli_close($con);
?>
