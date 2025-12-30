<?php
include "connect.php";

$user_id  = intval($_POST['user_id'] ?? 0);
$media_id = intval($_POST['media_id'] ?? 0);
$comment  = trim($_POST['comment'] ?? '');

if($user_id <= 0) response(false, "User ID required");
if($media_id <= 0) response(false, "Media ID required");
if($comment == '') response(false, "Comment required");

// 1. Check if user exists and is active
$user_check = mysqli_query($conn, "
SELECT id, name FROM g_users 
WHERE id = '$user_id' AND is_active = 1
");
if(mysqli_num_rows($user_check) == 0) {
    response(false, "User not found or inactive");
}
$user_data = mysqli_fetch_assoc($user_check);

// 2. Check if media exists
$media_check = mysqli_query($conn, "
SELECT id, artist_id FROM g_artist_media 
WHERE id = '$media_id'
");
if(mysqli_num_rows($media_check) == 0) {
    response(false, "Media not found");
}
$media_data = mysqli_fetch_assoc($media_check);

// 3. Prevent SQL injection for comment (જો તમે prepare statement નહીં વાપરતા હો)
$comment = mysqli_real_escape_string($conn, $comment);

// 4. Insert comment
$q = mysqli_query($conn, "
INSERT INTO g_comments (user_id, artist_media_id, comment)
VALUES ('$user_id', '$media_id', '$comment')
");

if(!$q) response(false, "Failed to add comment");

$comment_id = mysqli_insert_id($conn);

// 5. Get the inserted comment with user details
$comment_query = mysqli_query($conn, "
SELECT 
    c.*,
    u.name as user_name,
    u.email as user_email
FROM g_comments c
LEFT JOIN g_users u ON c.user_id = u.id
WHERE c.id = '$comment_id'
");
$comment_data = mysqli_fetch_assoc($comment_query);

response(true, "Comment added successfully", [
    "comment_id" => $comment_id,
    "comment" => [
        "id" => $comment_data['id'],
        "user_id" => $comment_data['user_id'],
        "user_name" => $comment_data['user_name'],
        "media_id" => $comment_data['artist_media_id'],
        "comment" => htmlspecialchars_decode($comment_data['comment']),
        "created_at" => $comment_data['created_at']
    ]
]);