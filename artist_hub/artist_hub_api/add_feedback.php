<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports form-data)
$user_id = $_POST['user_id'] ?? '';
$message = $_POST['message'] ?? '';

// Validate required fields
if (empty($user_id) || empty($message)) {
    echo json_encode([
        "status" => false,
        "message" => "User ID and message are required"
    ]);
    exit;
}

// Insert feedback
$stmt = mysqli_prepare($con, "INSERT INTO g_feedbacks (user_id, message) VALUES (?, ?)");
if ($stmt === false) {
    echo json_encode(["status" => false, "message" => "Prepare failed: ".mysqli_error($con)]);
    exit;
}

mysqli_stmt_bind_param($stmt, "is", $user_id, $message);

if (mysqli_stmt_execute($stmt)) {
    $feedback_id = mysqli_insert_id($con);
    echo json_encode([
        "status" => true,
        "message" => "Feedback added successfully",
        "feedback_id" => $feedback_id
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to add feedback: ".mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
