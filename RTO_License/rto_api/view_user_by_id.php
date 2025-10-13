<?php
include 'connect.php';
header('Content-Type: application/json');

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$res = $con->query("SELECT user_id,name,email,created_at FROM g_users WHERE user_id=$id");
if ($res && $res->num_rows>0) {
    echo json_encode(['success'=>true,'user'=>$res->fetch_assoc()]);
} else {
    echo json_encode(['success'=>false,'message'=>'User not found']);
}
?>
