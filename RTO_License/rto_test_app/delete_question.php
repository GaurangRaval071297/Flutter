<?php
include('connect.php');
header('Content-Type: application/json');

$question_id = $_POST['question_id'] ?? '';
$confirm = $_POST['confirm'] ?? '';

if(empty($question_id)){
    echo json_encode(['code'=>400,'message'=>'Question ID required']);
    exit;
}

if($confirm !== 'Y'){
    echo json_encode(['code'=>200,'message'=>'Deletion cancelled']);
    exit;
}

$delete = mysqli_query($con,"DELETE FROM g_questions WHERE question_id='$question_id'");

if($delete){
    echo json_encode(['code'=>200,'message'=>'Question deleted successfully']);
}else{
    echo json_encode(['code'=>500,'message'=>'Failed to delete question']);
}
?>