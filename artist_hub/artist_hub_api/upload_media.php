<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id = $_POST['artist_id'] ?? '';

if (empty($artist_id)) { echo json_encode(['status'=>false,'message'=>'artist_id required']); exit; }

if (!isset($_FILES['media'])) {
    echo json_encode(['status'=>false,'message'=>'media file required']); exit;
}

$uploadDir = 'uploads/';
if (!file_exists($uploadDir)) mkdir($uploadDir, 0777, true);

$file = $_FILES['media'];
$ext = pathinfo($file['name'], PATHINFO_EXTENSION);
$filename = uniqid() . '.' . $ext;
$target = $uploadDir . $filename;

if (move_uploaded_file($file['tmp_name'], $target)) {
    $type = (strpos($file['type'],'video')!==false) ? 'video' : 'image';
    $q = "INSERT INTO g_artist_media (artist_id, media_url, media_type) VALUES ('$artist_id', '$target', '$type')";
    if (mysqli_query($con, $q)) {
        echo json_encode(['status'=>true,'message'=>'Uploaded','media_url'=>$target]);
    } else {
        echo json_encode(['status'=>false,'message'=>'DB insert failed']);
    }
} else {
    echo json_encode(['status'=>false,'message'=>'Upload failed']);
}
?>