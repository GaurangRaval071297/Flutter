<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status"=>false,"message"=>"Only POST method allowed"]);
    exit;
}

$artist_id = $_POST['artist_id'] ?? null;
$media_url = $_POST['media_url'] ?? null;
$media_type = $_POST['media_type'] ?? null; // expected 'image' or 'video'

if (!$artist_id || !$media_url || !$media_type) {
    echo json_encode(["status"=>false,"message"=>"Missing required fields"]);
    exit;
}

if (!in_array($media_type, ['image', 'video'])) {
    echo json_encode(["status"=>false,"message"=>"Invalid media_type"]);
    exit;
}

try {
    $stmt = $con->prepare("INSERT INTO g_artist_media (artist_id, media_url, media_type) VALUES (?,?,?)");
    $stmt->bind_param("iss", $artist_id, $media_url, $media_type);
    $stmt->execute();

    $media_id = $stmt->insert_id;

    echo json_encode([
        "status" => true,
        "message" => "Media uploaded successfully",
        "media_id" => $media_id
    ]);

} catch (Exception $e) {
    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}

mysqli_close($con);
?>
