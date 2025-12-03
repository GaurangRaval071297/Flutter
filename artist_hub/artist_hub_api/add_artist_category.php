<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id = $_POST['artist_id'] ?? '';
$category_id = $_POST['category_id'] ?? '';

if (empty($artist_id) || empty($category_id)) { echo json_encode(['status'=>false,'message'=>'artist_id and category_id required']); exit; }

$q = "INSERT INTO g_artist_category (artist_id, category_id) VALUES ('$artist_id', '$category_id')";
if (mysqli_query($con, $q)) echo json_encode(['status'=>true,'message'=>'Assigned']); else echo json_encode(['status'=>false,'message'=>'Failed']);
?>