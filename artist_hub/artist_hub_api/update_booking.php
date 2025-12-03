<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports JSON or form-data)
$data = json_decode(file_get_contents("php://input"), true);

$booking_id = $data['booking_id'] ?? $_POST['booking_id'] ?? '';
$event_date = $data['event_date'] ?? $_POST['event_date'] ?? null;
$event_time = $data['event_time'] ?? $_POST['event_time'] ?? null;
$location = $data['location'] ?? $_POST['location'] ?? null;
$status = $data['status'] ?? $_POST['status'] ?? null;

if(empty($booking_id)){
    echo json_encode(["status"=>false,"message"=>"Missing booking_id"]);
    exit;
}

// Prepare update statement
$stmt = mysqli_prepare($con, "UPDATE g_bookings SET event_date = COALESCE(?, event_date), event_time = COALESCE(?, event_time), location = COALESCE(?, location), status = COALESCE(?, status) WHERE booking_id = ?");
mysqli_stmt_bind_param($stmt, "ssssi", $event_date, $event_time, $location, $status, $booking_id);

if(mysqli_stmt_execute($stmt)){
    echo json_encode(["status"=>true,"message"=>"Booking updated successfully"]);
} else {
    echo json_encode(["status"=>false,"message"=>mysqli_error($con)]);
}

// Close connection
mysqli_stmt_close($stmt);
mysqli_close($con);
?>
