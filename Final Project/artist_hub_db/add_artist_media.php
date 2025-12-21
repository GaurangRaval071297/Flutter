<?php
include "connect.php";

$artist_id  = intval($_POST['artist_id'] ?? 0);
$media_type = $_POST['media_type'] ?? '';
$media_url  = trim($_POST['media_url'] ?? '');
$caption    = trim($_POST['caption'] ?? '');

if($artist_id <= 0) response(false,"Artist ID required");
if(!in_array($media_type,['image','video'])) response(false,"Invalid media type");
if($media_url == '') response(false,"Media URL required");

/* Check artist */
$chk = mysqli_query($conn,"
SELECT id FROM g_users 
WHERE id='$artist_id' AND role='artist' AND is_active=1
");
if(mysqli_num_rows($chk)==0) response(false,"Artist not found");

/* Insert media */
$q = mysqli_query($conn,"
INSERT INTO g_artist_media (artist_id, media_type, media_url, caption)
VALUES ('$artist_id','$media_type','$media_url','$caption')
");

if(!$q) response(false,"Failed to add media");

response(true,"Media added successfully",[
    "media_id" => mysqli_insert_id($conn)
]);
