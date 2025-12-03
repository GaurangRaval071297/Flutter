<?php
header('Content-Type: application/json');
include 'connect.php';

$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? '';

if (empty($name)) { echo json_encode(['status'=>false,'message'=>'Category name required']); exit; }

$check = mysqli_query($con, "SELECT * FROM g_categories WHERE name='$name'");
if ($check && mysqli_num_rows($check)>0) { echo json_encode(['status'=>false,'message'=>'Category exists']); exit; }

$q = "INSERT INTO g_categories (name, description) VALUES ('$name', '$description')";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Category added']); else echo json_encode(['status'=>false,'message'=>'Failed']);
?>