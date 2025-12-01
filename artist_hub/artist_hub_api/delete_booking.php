<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$booking_id = $_POST['booking_id'] ?? null;

if (!$booking_id) {
    echo json_encode(["status" => false, "message" => "Missing booking_id"]);
    exit;
}

try {

    $stmt = $con->prepare("DELETE FROM g_bookings WHERE booking_id = ?");
    $stmt->bind_param("i", $booking_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Booking deleted successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
