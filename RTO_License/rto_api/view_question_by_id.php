<?php
include 'connect.php';

$id = intval($_GET['id'] ?? 0);
$res = $con->query("SELECT * FROM gr_questions WHERE question_id = $id");

if ($res && $res->num_rows > 0) {
    echo json_encode(['success' => true, 'question' => $res->fetch_assoc()]);
} else {
    echo json_encode(['success' => false, 'message' => 'Question not found']);
}
?>
