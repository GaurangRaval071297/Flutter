<?php
include 'connect.php';
header('Content-Type: application/json');

$id = isset($_POST['office_id'])?intval($_POST['office_id']):0;
$state = isset($_POST['state_name'])?$conn->real_escape_string($_POST['state_name']):'';
$code = isset($_POST['office_code'])?$conn->real_escape_string($_POST['office_code']):'';
$name = isset($_POST['office_name'])?$conn->real_escape_string($_POST['office_name']):'';
$addr = isset($_POST['address'])?$conn->real_escape_string($_POST['address']):'';
$website = isset($_POST['website'])?$conn->real_escape_string($_POST['website']):'';
$contact = isset($_POST['contact_number'])?$conn->real_escape_string($_POST['contact_number']):'';

if (!$id) { echo json_encode(['success'=>false,'message'=>'ID required']); exit; }

$sql = "UPDATE g_rto_offices SET state_name='$state', office_code='$code', office_name='$name', address='$addr', website='$website', contact_number='$contact' WHERE office_id=$id";
if ($con->query($sql)) echo json_encode(['success'=>true,'message'=>'Office updated']);
else echo json_encode(['success'=>false,'message'=>'Update failed']);
?>
