<?php
include 'connect.php';
header('Content-Type: application/json');

$id = intval($_POST['office_id'] ?? 0);
if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID required']);
    exit;
}

$sql = "DELETE FROM gr_rto_offices WHERE office_id = $id";
if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Office deleted']);
} else {
    echo json_encode(['success' => false, 'message' => 'Delete failed']);
}
?>
