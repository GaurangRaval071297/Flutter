<?php
header("Content-Type: application/json");
include "connect.php";

$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? '';

if ($name=='') {
    echo json_encode(['status'=>false,'message'=>'Category name required']);
    exit;
}

$check = mysqli_query($con,"SELECT category_id FROM g_categories WHERE name='$name'");
if (mysqli_num_rows($check) > 0){
    echo json_encode(['status'=>false,'message'=>'Category already exists']);
    exit;
}

$q = "INSERT INTO g_categories (name,description) VALUES ('$name','$description')";
if (mysqli_query($con,$q)){
    echo json_encode(['status'=>true,'message'=>'Category added']);
} else {
    echo json_encode(['status'=>false,'message'=>'Failed']);
}
?>
