<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Get artist_id from POST (form-data)
$artist_id = $_POST['artist_id'] ?? '';

if (empty($artist_id)) {
    echo json_encode([
        "status" => false,
        "message" => "Missing artist_id"
    ]);
    exit;
}

// Prepare DELETE query
$stmt = mysqli_prepare($con, "DELETE FROM g_users WHERE user_id = ? AND role = 'artist'");
if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "message" => "Prepare failed: " . mysqli_error($con)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "i", $artist_id);

if (mysqli_stmt_execute($stmt)) {
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo json_encode([
            "status" => true,
            "message" => "Artist deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "message" => "Artist not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to delete artist: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
