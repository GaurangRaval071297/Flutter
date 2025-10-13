<?php
include 'connect.php';

$test_id = intval($_POST['test_id'] ?? 0);
$question_id = intval($_POST['question_id'] ?? 0);
$selected = $_POST['selected_option'] ?? '';

if (!$test_id || !$question_id) {
    echo json_encode(['success' => false, 'message' => 'Test ID and Question ID required']);
    exit;
}

// Get correct answer
$correct_res = $con->query("SELECT correct_option FROM gr_questions WHERE question_id = $question_id");
$correct = $correct_res && $correct_res->num_rows > 0 ? $correct_res->fetch_assoc()['correct_option'] : '';
$is_correct = ($selected === $correct) ? 1 : 0;

// Insert answer
$sql = "INSERT INTO gr_test_answers (test_id, question_id, selected_option, is_correct)
        VALUES ($test_id, $question_id, '$selected', $is_correct)";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Answer saved', 'is_correct' => $is_correct]);
} else {
    echo json_encode(['success' => false, 'message' => 'Save failed']);
}
?>
