<?php
include('connect.php');
header('Content-Type: application/json');

$user_id = $_POST['user_id'] ?? '';
$answers = $_POST['answers'] ?? '';

if(empty($user_id) || empty($answers)){
    echo json_encode(['code'=>400,'message'=>'User ID and answers required']);
    exit;
}

$answers = json_decode($answers, true);
$total = count($answers);
$score = 0;

foreach($answers as $question_id => $user_ans){
    $res = mysqli_query($con,"SELECT correct_option FROM g_questions WHERE question_id='$question_id'");
    $correct = mysqli_fetch_assoc($res)['correct_option'];
    if($user_ans == $correct) $score++;
}

mysqli_query($con,"INSERT INTO g_results(user_id,score,total_questions) VALUES('$user_id','$score','$total')");

echo json_encode(['code'=>200,'message'=>'Test submitted','score'=>$score,'total'=>$total]);
?>