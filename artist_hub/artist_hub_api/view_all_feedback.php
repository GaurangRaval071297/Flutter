<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Fetch all feedbacks
$sql = "SELECT * FROM g_feedbacks";
$result = mysqli_query($con, $sql);

if ($result) {
    $feedbacks = mysqli_fetch_all($result, MYSQLI_ASSOC); // Fetch all rows as associative array
    echo json_encode([
        "status" => true,
        "feedbacks" => $feedbacks
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
