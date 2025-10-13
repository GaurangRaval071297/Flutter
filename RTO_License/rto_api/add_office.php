<?php
include 'connect.php';
header('Content-Type: application/json');

$state = isset($_POST['state_name'])?$con->real_escape_string($_POST['state_name']):'';
$code = isset($_POST['office_code'])?$con->real_escape_string($_POST['office_code']):'';
$name = isset($_POST['office_name'])?$con->real_escape_string($_POST['office_name']):'';
$addr = isset($_POST['address'])?$con->real_escape_string($_POST['address']):'';
$website = isset($_POST['website'])?$con->real_escape_string($_POST['website']):'';
$contact = isset($_POST['contact_number'])?$con->real_escape_string($_POST['contact_number']):'';

if (!$state || !$code || !$name || !$addr) { echo json_encode(['success'=>false,'message'=>'Required fields missing']); exit; }

$sql = "INSERT INTO g_rto_offices(state_name,office_code,office_name,address,website,contact_number)
VALUES('$state','$code','$name','$addr','$website','$contact')";
if ($con->query($sql)) echo json_encode(['success'=>true,'message'=>'Office added','id'=>$con->insert_id]);
else echo json_encode(['success'=>false,'message'=>'Add failed']);
?>
