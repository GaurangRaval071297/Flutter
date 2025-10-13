<?php
include 'connect.php';
header('Content-Type: application/json');

$cat = isset($_GET['category_id'])?intval($_GET['category_id']):0;
if ($cat) $res = $con->query("SELECT * FROM g_questions WHERE category_id=$cat ORDER BY question_id DESC");
else $res = $con->query("SELECT * FROM g_questions ORDER BY question_id DESC");
$data=[]; while($r=$res->fetch_assoc()) $data[]=$r;
echo json_encode(['success'=>true,'questions'=>$data]);
?>
