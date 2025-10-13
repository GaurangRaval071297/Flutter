<?php
include 'connect.php';
header('Content-Type: application/json');

$cat = isset($_POST['category_id'])?intval($_POST['category_id']):0;
$question = isset($_POST['question_text'])?$conn->real_escape_string($_POST['question_text']):'';
$a = isset($_POST['option_a'])?$conn->real_escape_string($_POST['option_a']):'';
$b = isset($_POST['option_b'])?$conn->real_escape_string($_POST['option_b']):'';
$c = isset($_POST['option_c'])?$conn->real_escape_string($_POST['option_c']):'';
$correct = isset($_POST['correct_option'])?$con->real_escape_string($_POST['correct_option']):'';

if (!$cat || !$question || !$a || !$b || !$c || !$correct) { echo json_encode(['success'=>false,'message'=>'All fields required']); exit; }

$sql = "INSERT INTO g_questions(category_id,question_text,option_a,option_b,option_c,correct_option)
VALUES($cat,'$question','$a','$b','$c','$correct')";
if ($con->query($sql)) echo json_encode(['success'=>true,'message'=>'Question added','id'=>$con->insert_id]);
else echo json_encode(['success'=>false,'message'=>'Add failed']);
?>
