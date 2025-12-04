<?php
header('Content-Type: application/json');
include 'connect.php';

$category_id = $_POST['category_id'] ?? '';
$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? '';

if ($category_id == '') { echo json_encode(['status'=>false,'message'=>'category_id required']); exit; }
$updates = [];
if ($name !== '') $updates[] = "name='$name'";
if ($description !== '') $updates[] = "description='$description'";
if (count($updates)==0) { echo json_encode(['status'=>false,'message'=>'Nothing to update']); exit; }

$q = "UPDATE g_categories SET ".implode(',', $updates)." WHERE category_id='$category_id'";
if (mysqli_query($con,$q)) echo json_encode(['status'=>true,'message'=>'Category updated']); else echo json_encode(['status'=>false,'message'=>'Update failed']);
?>
