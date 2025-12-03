<?php
header('Content-Type: application/json');
include 'connect.php';

$booking_id = $_POST['booking_id'] ?? '';
$customer_id = $_POST['customer_id'] ?? '';
$artist_id = $_POST['artist_id'] ?? '';
$rating = intval($_POST['rating'] ?? 0);
$comment = $_POST['comment'] ?? '';

if (empty($booking_id) || empty($customer_id) || empty($artist_id) || $rating < 1 || $rating > 5) {
    echo json_encode(['status'=>false,'message'=>'booking_id, customer_id, artist_id and rating (1-5) are required']); exit;
}

$q = "INSERT INTO g_reviews (booking_id, customer_id, artist_id, rating, comment) VALUES ('$booking_id','$customer_id','$artist_id','$rating','$comment')";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Review added','review_id'=>mysqli_insert_id($con)]); else echo json_encode(['status'=>false,'message'=>'Failed']);
?>