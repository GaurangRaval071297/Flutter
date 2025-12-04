<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_user_id = $_POST['artist_user_id'] ?? '';
if ($artist_user_id == '') { echo json_encode(['status'=>false,'message'=>'artist_user_id required']); exit; }
if (!isset($_FILES['media'])) { echo json_encode(['status'=>false,'message'=>'media file required']); exit; }

$uploadDir = __DIR__ . '/uploads/';
if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);

$file = $_FILES['media'];
$ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
$newName = time() . '_' . rand(1000,9999) . '.' . $ext;
$target = $uploadDir . $newName;

if (!move_uploaded_file($file['tmp_name'], $target)) {
    echo json_encode(['status'=>false,'message'=>'Upload failed']); exit;
}

$type = (strpos($file['type'],'video')!==false) ? 'video' : 'image';
if (mysqli_query($con, "INSERT INTO g_artist_media (artist_id, media_url, media_type) VALUES ('$artist_user_id','$newName','$type')")) {
    echo json_encode(['status'=>true,'message'=>'Media uploaded','media_url'=>$newName]);
} else {
    echo json_encode(['status'=>false,'message'=>'DB insert failed']);
}
?>
