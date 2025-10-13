<?php
include 'connect.php';

$id = intval($_POST['id'] ?? 0);
$cat = intval($_POST['category_id'] ?? 0);
$question = $_POST['question_text'] ?? '';
$a = $_POST['option_a'] ?? '';
$b = $_POST['option_b'] ?? '';
$c = $_POST['option_c'] ?? '';
$correct = $_POST['correct_option'] ?? '';

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID required']);
    exit;
}

$sql = "UPDATE gr_questions 
        SET category_id = $cat, question_text = '$question', option_a = '$a', 
            option_b = '$b', option_c = '$c', correct_option = '$correct' 
        WHERE question_id = $id";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Question updated']);
} else {
    echo json_encode(['success' => false, 'message' => 'Update failed']);
}
?>
