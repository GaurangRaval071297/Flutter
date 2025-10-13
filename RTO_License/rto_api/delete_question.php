<?php
include 'connect.php';
header('Content-Type: application/json');

$id = isset($_POST['id'])?intval($_POST['id']):0;
if (!$id) { echo json_encode(['success'=>false,'message'=>'ID required']); exit; }
$sql = "DELETE FROM g_questions WHERE question_id=$id";
if ($con->query($sql)) echo json_encode(['success'=>true,'message'=>'Question deleted']);
else echo json_encode(['success'=>false,'message'=>'Delete failed']);
?>

