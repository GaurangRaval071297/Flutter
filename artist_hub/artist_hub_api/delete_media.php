<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$media_id = $_POST['media_id'] ?? null;

if (!$media_id) {
    echo json_encode(["status" => false, "message" => "Missing media_id"]);
    exit;
}

try {

    $stmt = $con->prepare("DELETE FROM g_artist_media WHERE media_id = ?");
    $stmt->bind_param("i", $media_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Media deleted successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
