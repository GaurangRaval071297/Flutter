<?php
include "connect.php";

$media_id = intval($_GET['media_id'] ?? 0);
$limit = intval($_GET['limit'] ?? 50);
$offset = intval($_GET['offset'] ?? 0);

if($media_id <= 0) response(false, "Media ID required");

// Get comments with user details
$query = mysqli_query($conn, "
SELECT 
    c.*,
    u.name as user_name,
    u.email as user_email,
    u.role as user_role
FROM g_comments c
LEFT JOIN g_users u ON c.user_id = u.id
WHERE c.artist_media_id = '$media_id'
ORDER BY c.created_at DESC
LIMIT $limit OFFSET $offset
");

$comments = [];
while($row = mysqli_fetch_assoc($query)) {
    $comments[] = [
        "id" => $row['id'],
        "user_id" => $row['user_id'],
        "user_name" => $row['user_name'],
        "user_role" => $row['user_role'],
        "media_id" => $row['artist_media_id'],
        "comment" => htmlspecialchars_decode($row['comment']),
        "created_at" => $row['created_at'],
        "time_ago" => time_ago($row['created_at']) // optional time ago function
    ];
}

// Get total comments count
$count_query = mysqli_query($conn, "
SELECT COUNT(*) as total FROM g_comments 
WHERE artist_media_id = '$media_id'
");
$count_data = mysqli_fetch_assoc($count_query);

response(true, "Comments fetched", [
    "comments" => $comments,
    "total_comments" => $count_data['total'],
    "media_id" => $media_id
]);

// Optional: time ago function (add to connect.php or here)
function time_ago($timestamp) {
    $time_ago = strtotime($timestamp);
    $current_time = time();
    $time_difference = $current_time - $time_ago;
    
    $seconds = $time_difference;
    $minutes = round($seconds / 60);
    $hours   = round($seconds / 3600);
    $days    = round($seconds / 86400);
    $weeks   = round($seconds / 604800);
    $months  = round($seconds / 2629440);
    $years   = round($seconds / 31553280);
    
    if($seconds <= 60) {
        return "Just now";
    } else if($minutes <= 60) {
        return $minutes == 1 ? "1 minute ago" : "$minutes minutes ago";
    } else if($hours <= 24) {
        return $hours == 1 ? "1 hour ago" : "$hours hours ago";
    } else if($days <= 7) {
        return $days == 1 ? "Yesterday" : "$days days ago";
    } else if($weeks <= 4.3) {
        return $weeks == 1 ? "1 week ago" : "$weeks weeks ago";
    } else if($months <= 12) {
        return $months == 1 ? "1 month ago" : "$months months ago";
    } else {
        return $years == 1 ? "1 year ago" : "$years years ago";
    }
}