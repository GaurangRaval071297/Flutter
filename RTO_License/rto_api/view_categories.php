
<?php
include 'connect.php';
header('Content-Type: application/json');

$res = $con->query("SELECT * FROM g_categories ORDER BY category_id DESC");
$data=[]; while($r=$res->fetch_assoc()) $data[]=$r;
echo json_encode(['success'=>true,'categories'=>$data]);
?>
