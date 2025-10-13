<?php
include 'connect.php';
header('Content-Type: application/json');

$id = isset($_POST['id'])?intval($_POST['id']):0;
$cat = isset($_POST['category_id'])?intval($_POST['category_id']):0;
$question = isset($_POST['question_text'])?$con->real_escape_string($_POST['question_text']):'';
$a = isset($_POST['option_a'])?$con->real_escape_string($_POST['option_a']):'';
$b = isset($_POST['option_b'])?$con->real_escape_string($_POST['option_b']):'';
$c = isset($_POST['option_c'])?$con->real_escape_string($_POST['option_c']):'';
$correct = isset($_POST['correct_option'])?$conn->real_escape_string($_POST['correct_option']):'';

if (!$id) { echo json_encode(['success'=>false,'message'=>'ID required']); exit; }

$sql = "UPDATE g_questions SET category_id=$cat, question_text='$question', option_a='$a', option_b='$b', option_c='$c', correct_option='$correct' WHERE question_id=$id";
if ($con->query($sql)) echo json_encode(['success'=>true,'message'=>'Question updated']);
else echo json_encode(['success'=>false,'message'=>'Update failed']);
?>
