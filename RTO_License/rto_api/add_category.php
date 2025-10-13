<?php
include 'connect.php';
header('Content-Type: application/json');

$name = isset($_POST['category_name']) ? $con->real_escape_string($_POST['category_name']) : '';
$desc = isset($_POST['description']) ? $con->real_escape_string($_POST['description']) : '';

if (!$name) {
    echo json_encode(['success' => false, 'message' => 'Category name required']);
    exit;
}

$sql = "INSERT INTO g_categories (category_name, description) VALUES ('$name', '$desc')";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Category added', 'id' => $con->insert_id]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to add category']);
}
?>
