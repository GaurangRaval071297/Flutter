<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Fetch all bookings
$sql = "SELECT * FROM g_bookings";
$result = mysqli_query($con, $sql);

if($result){
    $bookings = mysqli_fetch_all($result, MYSQLI_ASSOC); // Fetch all as associative array
    echo json_encode([
        "status" => true,
        "bookings" => $bookings
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => mysqli_error($con)
    ]);
}

// Close the connection
mysqli_close($con);
?>
