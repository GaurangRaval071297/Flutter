<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Fetch all categories
$sql = "SELECT * FROM g_categories";
$result = mysqli_query($con, $sql);

if($result){
    $categories = mysqli_fetch_all($result, MYSQLI_ASSOC); // Fetch all rows as associative array
    echo json_encode([
        "status" => true,
        "categories" => $categories
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
