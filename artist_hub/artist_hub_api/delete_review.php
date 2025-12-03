<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Get review_id from POST (form-data)
$review_id = $_POST['review_id'] ?? '';

if (empty($review_id)) {
    echo json_encode([
        "status" => false,
        "message" => "Missing review_id"
    ]);
    exit;
}

// Prepare DELETE query
$stmt = mysqli_prepare($con, "DELETE FROM g_reviews WHERE review_id = ?");
if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "message" => "Prepare failed: " . mysqli_error($con)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "i", $review_id);

if (mysqli_stmt_execute($stmt)) {
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo json_encode([
            "status" => true,
            "message" => "Review deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "message" => "Review not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to delete review: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
