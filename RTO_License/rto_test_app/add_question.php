<?php
include('connect.php');
header('Content-Type: application/json');

$question_text = $_POST['question_text'] ?? '';
$option_a = $_POST['option_a'] ?? '';
$option_b = $_POST['option_b'] ?? '';
$option_c = $_POST['option_c'] ?? '';
$option_d = $_POST['option_d'] ?? '';
$correct_option = $_POST['correct_option'] ?? '';
$category = $_POST['category'] ?? '';

if(empty($question_text) || empty($option_a) || empty($option_b) || empty($option_c) || empty($option_d) || empty($correct_option)){
    echo json_encode(['code'=>400,'message'=>'All fields required']);
    exit;
}

$insert = mysqli_query($con,"INSERT INTO g_questions(question_text,option_a,option_b,option_c,option_d,correct_option,category) 
VALUES('$question_text','$option_a','$option_b','$option_c','$option_d','$correct_option','$category')");

if($insert){
    echo json_encode(['code'=>200,'message'=>'Question added successfully']);
}else{
    echo json_encode(['code'=>500,'message'=>'Failed to add question']);
}
?>