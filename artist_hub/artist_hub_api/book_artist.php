<?php
include 'connect.php';
$data = json_decode(file_get_contents("php://input"), true);

if(!$data || !isset($data['customer_id'], $data['artist_id'], $data['event_date'])) {
    echo json_encode(["status"=>false,"message"=>"Missing required fields"]);
    exit;
}

$customer_id = $data['customer_id'];
$artist_id = $data['artist_id'];
$event_date = $data['event_date']; // YYYY-MM-DD
$event_time = $data['event_time'] ?? null; // HH:MM:SS (optional)
$location = $data['location'] ?? null;

try {
    $stmt = $con->prepare("INSERT INTO g_bookings (customer_id, artist_id, event_date, event_time, location) VALUES (?,?,?,?,?)");
    $stmt->execute([$customer_id,$artist_id,$event_date,$event_time,$location]);
    echo json_encode(["status"=>true,"message"=>"Booking created","booking_id"=>$con->lastInsertId()]);
} catch(PDOException $e) {
    echo json_encode(["status"=>false,"message"=>$e->getMessage()]);
}
?>