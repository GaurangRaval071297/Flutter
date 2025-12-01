<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$artist_id = $_POST['artist_id'] ?? null;

if (!$artist_id) {
    echo json_encode(["status" => false, "message" => "Missing artist_id"]);
    exit;
}

try {

    $stmt = $con->prepare("DELETE FROM g_users WHERE user_id = ? AND role = 'artist'");
    $stmt->bind_param("i", $artist_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Artist deleted successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
