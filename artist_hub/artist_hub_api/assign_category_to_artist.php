<?php
header('Content-Type: application/json');
include 'connect.php';

$artist_id   = $_POST['artist_id'] ?? '';
$category_id = $_POST['category_id'] ?? '';

// Validations
if ($artist_id == '' || $category_id == '') {
    echo json_encode(['status'=>false, 'message'=>'artist_id and category_id are required']);
    exit;
}

// Check if artist exists in g_users table
$checkArtist = mysqli_query($con, "SELECT user_id FROM g_users WHERE user_id='$artist_id' AND role='artist' LIMIT 1");

if (!$checkArtist || mysqli_num_rows($checkArtist) == 0) {
    echo json_encode(['status'=>false, 'message'=>'Invalid artist_id']);
    exit;
}

// Insert into artist-category table
$insert = mysqli_query($con, 
    "INSERT INTO g_artist_category (artist_id, category_id) 
     VALUES ('$artist_id', '$category_id')"
);

if ($insert) {
    echo json_encode(['status'=>true, 'message'=>'Category assigned to artist']);
} else {
    echo json_encode(['status'=>false, 'message'=>'Failed to assign category']);
}
?>
