<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Get user_id from POST (form-data)
$user_id = $_POST['user_id'] ?? '';

if (empty($user_id)) {
    echo json_encode([
        "status" => false,
        "message" => "Missing user_id"
    ]);
    exit;
}

// Prepare DELETE query
$stmt = mysqli_prepare($con, "DELETE FROM g_users WHERE user_id = ?");
if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "message" => "Prepare failed: " . mysqli_error($con)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "i", $user_id);

if (mysqli_stmt_execute($stmt)) {
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo json_encode([
            "status" => true,
            "message" => "User deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "message" => "User not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to delete user: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
