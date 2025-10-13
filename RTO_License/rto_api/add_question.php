<?php
include 'connect.php';

$cat = intval($_POST['category_id'] ?? 0);
$question = $_POST['question_text'] ?? '';
$a = $_POST['option_a'] ?? '';
$b = $_POST['option_b'] ?? '';
$c = $_POST['option_c'] ?? '';
$correct = $_POST['correct_option'] ?? '';

if (!$cat || !$question || !$a || !$b || !$c || !$correct) {
    echo json_encode(['success' => false, 'message' => 'All fields required']);
    exit;
}

$sql = "INSERT INTO gr_questions (category_id, question_text, option_a, option_b, option_c, correct_option)
        VALUES ($cat, '$question', '$a', '$b', '$c', '$correct')";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Question added', 'id' => $con->insert_id]);
} else {
    echo json_encode(['success' => false, 'message' => 'Add failed']);
}
?>
