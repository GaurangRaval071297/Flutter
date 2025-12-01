<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$user_id = $_POST['user_id'] ?? null;
$message = $_POST['message'] ?? null;

if (!$user_id || !$message) {
    echo json_encode(["status" => false, "message" => "Missing required fields"]);
    exit;
}

try {
    $stmt = $con->prepare("INSERT INTO g_feedbacks (user_id, message) VALUES (?, ?)");
    $stmt->bind_param("is", $user_id, $message);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Feedback added successfully",
        "feedback_id" => $stmt->insert_id
    ]);

} catch (Exception $e) {
    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
