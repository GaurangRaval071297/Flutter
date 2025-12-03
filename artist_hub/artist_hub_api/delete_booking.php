<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Get booking_id from POST (form-data)
$booking_id = $_POST['booking_id'] ?? '';

if (empty($booking_id)) {
    echo json_encode([
        "status" => false,
        "message" => "Missing booking_id"
    ]);
    exit;
}

// Prepare DELETE query
$stmt = mysqli_prepare($con, "DELETE FROM g_bookings WHERE booking_id = ?");
if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "message" => "Prepare failed: " . mysqli_error($con)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "i", $booking_id);

if (mysqli_stmt_execute($stmt)) {
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo json_encode([
            "status" => true,
            "message" => "Booking deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "message" => "Booking not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to delete booking: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
x