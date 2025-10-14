<?php
include 'connect.php';
header('Content-Type: application/json');

$user_id = intval($_POST['user_id'] ?? 0);
$test_type = $_POST['test_type'] ?? 'mock';
$total_questions = intval($_POST['total_questions'] ?? 0);

if (!$user_id) {
    echo json_encode(['success' => false, 'message' => 'User ID required']);
    exit;
}

$sql = "INSERT INTO gr_tests (user_id, test_type, total_questions) VALUES ($user_id, '$test_type', $total_questions)";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Test started', 'test_id' => $con->insert_id]);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to start test']);
}
?>
