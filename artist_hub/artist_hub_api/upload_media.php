<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports form-data)
$artist_id  = $_POST['artist_id'] ?? '';
$media_url  = $_POST['media_url'] ?? '';
$media_type = $_POST['media_type'] ?? '';

// Validate required fields
if(empty($artist_id) || empty($media_url) || empty($media_type)){
    echo json_encode(["status"=>false,"message"=>"Missing required fields"]);
    exit;
}

// Validate media_type
if(!in_array($media_type, ['image','video'])){
    echo json_encode(["status"=>false,"message"=>"Invalid media_type"]);
    exit;
}

// Insert into database
$stmt = mysqli_prepare($con, "INSERT INTO g_artist_media (artist_id, media_url, media_type) VALUES (?, ?, ?)");
mysqli_stmt_bind_param($stmt, "iss", $artist_id, $media_url, $media_type);

if(mysqli_stmt_execute($stmt)){
    $media_id = mysqli_insert_id($con);
    echo json_encode(["status"=>true,"message"=>"Media uploaded","media_id"=>$media_id]);
} else {
    echo json_encode(["status"=>false,"message"=>mysqli_error($con)]);
}

// Close connection
mysqli_stmt_close($stmt);
mysqli_close($con);
?>
