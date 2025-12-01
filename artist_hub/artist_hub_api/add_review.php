<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$booking_id = $_POST['booking_id'] ?? null;
$customer_id = $_POST['customer_id'] ?? null;
$artist_id = $_POST['artist_id'] ?? null;
$rating = isset($_POST['rating']) ? (int)$_POST['rating'] : null;
$comment = $_POST['comment'] ?? null;

if (!$booking_id || !$customer_id || !$artist_id || !$rating) {
    echo json_encode(["status" => false, "message" => "Missing required fields"]);
    exit;
}

if ($rating < 1 || $rating > 5) {
    echo json_encode(["status" => false, "message" => "Rating must be between 1 and 5"]);
    exit;
}

try {

    $stmt = $con->prepare("INSERT INTO g_reviews (booking_id, customer_id, artist_id, rating, comment) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("iiiis", $booking_id, $customer_id, $artist_id, $rating, $comment);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Review added successfully",
        "review_id" => $stmt->insert_id
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
