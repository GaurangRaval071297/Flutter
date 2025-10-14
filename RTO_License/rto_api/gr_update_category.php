<?php
include 'connect.php';
header('Content-Type: application/json');

$id = intval($_POST['id'] ?? 0);
$name = $_POST['category_name'] ?? '';
$desc = $_POST['description'] ?? '';

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID required']);
    exit;
}

$sql = "UPDATE gr_categories SET category_name = '$name', description = '$desc' WHERE category_id = $id";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Category updated']);
} else {
    echo json_encode(['success' => false, 'message' => 'Update failed']);
}
?>
