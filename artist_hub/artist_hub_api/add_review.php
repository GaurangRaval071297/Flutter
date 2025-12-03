<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports form-data)
$booking_id = $_POST['booking_id'] ?? '';
$customer_id = $_POST['customer_id'] ?? '';
$artist_id = $_POST['artist_id'] ?? '';
$rating = $_POST['rating'] ?? '';
$comment = $_POST['comment'] ?? '';

// Validate required fields
if (empty($booking_id) || empty($customer_id) || empty($artist_id) || empty($rating)) {
    echo json_encode([
        "status" => false,
        "message" => "All fields (booking_id, customer_id, artist_id, rating) are required"
    ]);
    exit;
}

// Validate rating
$rating = (int)$rating;
if ($rating < 1 || $rating > 5) {
    echo json_encode([
        "status" => false,
        "message" => "Rating must be between 1 and 5"
    ]);
    exit;
}

// Insert review
$stmt = mysqli_prepare($con, "INSERT INTO g_reviews (booking_id, customer_id, artist_id, rating, comment) VALUES (?, ?, ?, ?, ?)");
if ($stmt === false) {
    echo json_encode(["status" => false, "message" => "Prepare failed: ".mysqli_error($con)]);
    exit;
}

mysqli_stmt_bind_param($stmt, "iiiis", $booking_id, $customer_id, $artist_id, $rating, $comment);

if (mysqli_stmt_execute($stmt)) {
    $review_id = mysqli_insert_id($con);
    echo json_encode([
        "status" => true,
        "message" => "Review added successfully",
        "review_id" => $review_id
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to add review: ".mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
