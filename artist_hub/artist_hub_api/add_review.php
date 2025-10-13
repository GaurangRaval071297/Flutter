<?php
include 'connect.php';
$data = json_decode(file_get_contents("php://input"), true);

if(!$data || !isset($data['booking_id'], $data['customer_id'], $data['artist_id'], $data['rating'])) {
    echo json_encode(["status"=>false,"message"=>"Missing required fields"]);
    exit;
}

$booking_id = $data['booking_id'];
$customer_id = $data['customer_id'];
$artist_id = $data['artist_id'];
$rating = (int)$data['rating'];
$comment = $data['comment'] ?? null;

if($rating < 1 || $rating > 5) {
    echo json_encode(["status"=>false,"message"=>"Rating must be between 1 and 5"]);
    exit;
}

try {
    $stmt = $con->prepare("INSERT INTO g_reviews (booking_id, customer_id, artist_id, rating, comment) VALUES (?,?,?,?,?)");
    $stmt->execute([$booking_id,$customer_id,$artist_id,$rating,$comment]);
    echo json_encode(["status"=>true,"message"=>"Review added","review_id"=>$con->lastInsertId()]);
} catch(PDOException $e) {
    echo json_encode(["status"=>false,"message"=>$e->getMessage()]);
}
?>