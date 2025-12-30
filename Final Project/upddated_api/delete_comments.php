<?php
include "connect.php";

$user_id = intval($_POST['user_id'] ?? 0);
$comment_id = intval($_POST['comment_id'] ?? 0);

if($user_id <= 0) response(false, "User ID required");
if($comment_id <= 0) response(false, "Comment ID required");

// Check if comment exists and belongs to user
$check_query = mysqli_query($conn, "
SELECT c.*, u.role FROM g_comments c
LEFT JOIN g_users u ON c.user_id = u.id
WHERE c.id = '$comment_id'
");
if(mysqli_num_rows($check_query) == 0) {
    response(false, "Comment not found");
}

$comment_data = mysqli_fetch_assoc($check_query);

// Allow delete if: user is comment owner OR user is admin/artist owner
if($comment_data['user_id'] != $user_id) {
    // Check if user is admin or artist owner of the media
    $media_query = mysqli_query($conn, "
    SELECT m.artist_id FROM g_artist_media m
    WHERE m.id = '{$comment_data['artist_media_id']}'
    ");
    $media_data = mysqli_fetch_assoc($media_query);
    
    if($media_data['artist_id'] != $user_id) {
        response(false, "You are not authorized to delete this comment");
    }
}

// Delete comment
$delete = mysqli_query($conn, "DELETE FROM g_comments WHERE id = '$comment_id'");
if(!$delete) response(false, "Failed to delete comment");

response(true, "Comment deleted successfully");