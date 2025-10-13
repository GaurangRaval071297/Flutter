<?php
include 'connect.php';
$data = json_decode(file_get_contents("php://input"), true);

if(!$data || !isset($data['user_id'], $data['message'])) {
    echo json_encode(["status"=>false,"message"=>"Missing required fields"]);
    exit;
}

$user_id = $data['user_id'];
$message = $data['message'];

try {
    $stmt = $con->prepare("INSERT INTO g_feedbacks (user_id, message) VALUES (?, ?)");
    $stmt->execute([$user_id, $message]);
    echo json_encode(["status"=>true,"message"=>"Feedback added","feedback_id"=>$con->lastInsertId()]);
} catch(PDOException $e) {
    echo json_encode(["status"=>false,"message"=>$e->getMessage()]);
}
?>