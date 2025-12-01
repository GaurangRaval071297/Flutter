<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$feedback_id = $_POST['feedback_id'] ?? null;

if (!$feedback_id) {
    echo json_encode(["status" => false, "message" => "Missing feedback_id"]);
    exit;
}

try {

    $stmt = $con->prepare("DELETE FROM g_feedbacks WHERE feedback_id = ?");
    $stmt->bind_param("i", $feedback_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Feedback deleted successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
