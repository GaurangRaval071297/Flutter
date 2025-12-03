<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Get media_id from POST (form-data)
$media_id = $_POST['media_id'] ?? '';

if (empty($media_id)) {
    echo json_encode([
        "status" => false,
        "message" => "Missing media_id"
    ]);
    exit;
}

// Prepare DELETE query
$stmt = mysqli_prepare($con, "DELETE FROM g_artist_media WHERE media_id = ?");
if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "message" => "Prepare failed: " . mysqli_error($con)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "i", $media_id);

if (mysqli_stmt_execute($stmt)) {
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo json_encode([
            "status" => true,
            "message" => "Media deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "message" => "Media not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to delete media: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
