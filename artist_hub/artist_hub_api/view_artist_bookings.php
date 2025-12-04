<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id = $_GET['artist_id'] ?? '';
$artist_id = intval($artist_id); // ensure numeric

if ($artist_id <= 0) { 
    echo json_encode(['status'=>false,'message'=>'Valid artist_id required']); 
    exit; 
}

// Run query
$q = mysqli_query($con, "SELECT * FROM g_bookings WHERE artist_id=$artist_id ORDER BY created_at DESC");

// Check if query failed
if (!$q) {
    echo json_encode(['status'=>false, 'message'=>mysqli_error($con)]);
    exit;
}

$data = [];
while ($row = mysqli_fetch_assoc($q)) {
    $data[] = $row;
}

// Return JSON
echo json_encode([
    'status' => true,
    'message' => count($data) ? 'Bookings found' : 'No bookings found',
    'data' => $data
]);
?>
