<?php
include('connect.php');

$input = $_POST;
if (empty($input)) {
    $json = file_get_contents("php://input");
    $input = json_decode($json, true) ?? [];
}

// Extract values safely
$artist_id   = $input['artist_id']   ?? '';
$name        = $input['name']        ?? '';
$description = $input['description'] ?? '';

$media_type  = $input['media_type']  ?? '';
$uploaded_at = $input['uploaded_at']  ?? '';





if (empty($artist_id)) {
    echo json_encode(['code' => 400, 'message' => 'artist_id is required']);
    exit;
} 
if (empty($name)){
    echo json_encode(['code' => 400, 'message' => 'Name is required']);
    exit;
} 
if (empty($description) ){
    echo json_encode(['code' => 400, 'message' => 'description is required']);
    exit;
} 

if (empty($media_url)) {
    echo json_encode(['code' => 400, 'message' => 'media_url is required']);
    exit;
} 
if (empty($media_type)) {
    echo json_encode(['code' => 400, 'message' => 'media_type is required']);
    exit;
} 
if (empty($uploaded_at)) {
	  echo json_encode(['code' => 400, 'message' => 'uploaded_at is required']);
	  exit;
}
 

$q = "INSERT INTO g_artist_category (artist_id, name, description, media_type, media_url, uploaded_at)
      VALUES ('$artist_id', '$name', '$description', '$media_url', '$media_type', '$uploaded_at')";

if (mysqli_query($con, $q)) {
    echo json_encode(['code' => 200, 'message' => 'Category Added']);
} else {
    echo json_encode(['code' => 500, 'message' => 'Insert Failed', 'error' => mysqli_error($con)]);
}
?>
