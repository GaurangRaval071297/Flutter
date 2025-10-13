<?php
include 'connect.php';
header('Content-Type: application/json');

$id = isset($_POST['id'])?intval($_POST['id']):0;
$name = isset($_POST['category_name'])?$conn->real_escape_string($_POST['category_name']):'';
$desc = isset($_POST['description'])?$conn->real_escape_string($_POST['description']):'';
if (!$id) { echo json_encode(['success'=>false,'message'=>'ID required']); exit; }
$sql = "UPDATE g_categories SET category_name='$name', description='$desc' WHERE category_id=$id";
if ($con->query($sql)) echo json_encode(['success'=>true,'message'=>'Category updated']);
else echo json_encode(['success'=>false,'message'=>'Update failed']);
?>
