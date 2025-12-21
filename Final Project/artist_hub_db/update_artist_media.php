<?php
include "connect.php";

$media_id  = intval($_POST['media_id'] ?? 0);
$artist_id = intval($_POST['artist_id'] ?? 0);
$caption   = trim($_POST['caption'] ?? '');

if($media_id <= 0) response(false,"Media ID required");
if($artist_id <= 0) response(false,"Artist ID required");

/* Ownership check */
$q = mysqli_query($conn,"
SELECT id FROM g_artist_media 
WHERE id='$media_id' AND artist_id='$artist_id'
");
if(mysqli_num_rows($q)==0) response(false,"Media not found or unauthorized");

/* Update caption */
$up = mysqli_query($conn,"
UPDATE g_artist_media 
SET caption='$caption'
WHERE id='$media_id'
");

if(!$up) response(false,"Failed to update media");

response(true,"Media updated successfully");
