<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Get feedback_id from POST (form-data)
$feedback_id = $_POST['feedback_id'] ?? '';

if (empty($feedback_id)) {
    echo json_encode([
        "status" => false,
        "message" => "Missing feedback_id"
    ]);
    exit;
}

// Prepare DELETE query
$stmt = mysqli_prepare($con, "DELETE FROM g_feedbacks WHERE feedback_id = ?");
if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "message" => "Prepare failed: " . mysqli_error($con)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "i", $feedback_id);

if (mysqli_stmt_execute($stmt)) {
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo json_encode([
            "status" => true,
            "message" => "Feedback deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "message" => "Feedback not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to delete feedback: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
