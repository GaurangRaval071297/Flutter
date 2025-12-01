<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$review_id = $_POST['review_id'] ?? null;

if (!$review_id) {
    echo json_encode(["status" => false, "message" => "Missing review_id"]);
    exit;
}

try {

    $stmt = $con->prepare("DELETE FROM g_reviews WHERE review_id = ?");
    $stmt->bind_param("i", $review_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Review deleted successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
