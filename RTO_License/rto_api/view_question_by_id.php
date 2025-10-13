<?php
include 'connect.php';
header('Content-Type: application/json');

$id = isset($_GET['id'])?intval($_GET['id']):0;
$res = $con->query("SELECT * FROM g_questions WHERE question_id=$id");
if ($res && $res->num_rows>0) echo json_encode(['success'=>true,'question'=>$res->fetch_assoc()]);
else echo json_encode(['success'=>false,'message'=>'Question not found']);
?>
