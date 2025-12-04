<?php
header('Content-Type: application/json');
include 'connect.php';

$category_id = $_POST['category_id'] ?? '';
if ($category_id == '') { echo json_encode(['status'=>false,'message'=>'category_id required']); exit; }

if (mysqli_query($con, "DELETE FROM g_categories WHERE category_id='$category_id'")) {
    echo json_encode(['status'=>true,'message'=>'Category deleted']);
} else {
    echo json_encode(['status'=>false,'message'=>'Delete failed']);
}
?>
