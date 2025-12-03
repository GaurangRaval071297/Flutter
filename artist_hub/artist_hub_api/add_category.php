<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data from form-data
$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? '';

// Validate required field
if (empty($name)) {
    echo json_encode([
        "status" => false,
        "message" => "Category name is required"
    ]);
    exit;
}

// Check if category already exists
$check = mysqli_query($con, "SELECT * FROM g_categories WHERE name='$name'");
if (!$check) {
    echo json_encode(["status" => false, "message" => "Database error: ".mysqli_error($con)]);
    exit;
}

if (mysqli_num_rows($check) > 0) {
    echo json_encode(["status" => false, "message" => "Category already exists"]);
    exit;
}

// Insert category
$insert = mysqli_query($con, "INSERT INTO g_categories (name, description) VALUES ('$name', '$description')");

if ($insert) {
    $category_id = mysqli_insert_id($con);
    echo json_encode([
        "status" => true,
        "message" => "Category added successfully",
        "category_id" => $category_id
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "Failed to add category: ".mysqli_error($con)
    ]);
}

// Close connection
mysqli_close($con);
?>
