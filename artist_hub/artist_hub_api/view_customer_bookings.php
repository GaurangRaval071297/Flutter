<?php
header('Content-Type: application/json');
include 'connect.php';

$customer_id = $_GET['customer_id'] ?? '';
if ($customer_id=='') { echo json_encode(['status'=>false,'message'=>'customer_id required']); exit; }

$data = [];
$q = mysqli_query($con, "SELECT * FROM g_bookings WHERE customer_id='$customer_id' ORDER BY created_at DESC");
while ($r = mysqli_fetch_assoc($q)) $data[] = $r;
echo json_encode(['status'=>true,'data'=>$data]);
?>
