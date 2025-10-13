<?php
include 'connect.php';

$id = intval($_POST['id'] ?? 0);
if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID required']);
    exit;
}

$sql = "DELETE FROM gr_categories WHERE category_id = $id";
if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Category deleted']);
} else {
    echo json_encode(['success' => false, 'message' => 'Delete failed']);
}
?>
