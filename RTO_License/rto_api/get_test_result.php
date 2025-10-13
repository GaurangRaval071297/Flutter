<?php
include 'connect.php';
header('Content-Type: application/json');

$test_id = isset($_GET['test_id'])?intval($_GET['test_id']):0;
if (!$test_id) { echo json_encode(['success'=>false,'message'=>'Test ID required']); exit; }

$res = $con->query("SELECT COUNT(*) as total, SUM(is_correct) as correct FROM g_test_answers WHERE test_id=$test_id");
$row = $res->fetch_assoc();
$total = intval($row['total']);
$correct = intval($row['correct']);
$wrong = $total - $correct;
$score = $correct; // simple scoring

echo json_encode(['success'=>true,'total'=>$total,'correct'=>$correct,'wrong'=>$wrong,'score'=>$score]);
?>
