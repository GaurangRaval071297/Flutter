<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Get category_id from POST (form-data)
$category_id = $_POST['category_id'] ?? '';

if (empty($category_id)) {
    echo json_encode([
        "status" => false,
        "message" => "Missing category_id"
    ]);
    exit;
}

// Prepare DELETE query
$stmt = mysqli_prepare($con, "DELETE FROM g_categories WHERE category_id = ?");
if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "message" => "Prepare failed: " . mysqli_error($con)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "i", $category_id);

if (mysqli_stmt_execute($stmt)) {
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo json_encode([
            "status" => true,
            "message" => "Category deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "message" => "Category not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to delete category: " . mysqli_error($con)
    ]);
}

$stmt->close();
mysqli_close($con);
?>
