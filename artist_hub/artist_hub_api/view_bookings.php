<?php
header('Content-Type: application/json');
include 'connect.php';

// Simple query to fetch all bookings
$q = mysqli_query($con, "SELECT * FROM g_bookings ORDER BY booking_id DESC");

// Check if query failed
if (!$q) {
    echo json_encode([
        'status' => false,
        'error' => mysqli_error($con)
    ]);
    exit;
}

$data = [];
while ($row = mysqli_fetch_assoc($q)) {
    $data[] = $row;
}

// Return data as JSON
echo json_encode([
    'status' => true,
    'data'   => $data
]);
?>
