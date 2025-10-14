<?php
include 'connect.php';
header('Content-Type: application/json');

$name = $_POST['category_name'] ?? '';
$desc = $_POST['description'] ?? '';

if (!$name) {
    echo json_encode(['success' => false, 'message' => 'Category name required']);
    exit;
}

$sql = "INSERT INTO gr_categories (category_name, description) VALUES ('$name', '$desc')";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Category added', 'id' => $con->insert_id]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to add category']);
}
?>
