<?php
header("Content-Type: application/json");
include "connect.php";

$data=[];
$q=mysqli_query($con,"SELECT * FROM g_categories ORDER BY category_id DESC");
while($r=mysqli_fetch_assoc($q)) $data[]=$r;

echo json_encode(['status'=>true,'data'=>$data]);
?>
