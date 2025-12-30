<?php
include "connect.php";

$artist_id = intval($_GET['artist_id'] ?? 0);

if ($artist_id <= 0) {
    response(false, "Artist ID required");
}

// Get all media for artist with like count
$query = mysqli_query($conn, "
SELECT 
    m.*,
    COUNT(l.id) as like_count,
    u.name as artist_name
FROM g_artist_media m
LEFT JOIN g_likes l ON m.id = l.artist_media_id
LEFT JOIN g_users u ON m.artist_id = u.id
WHERE m.artist_id = '$artist_id'
GROUP BY m.id
ORDER BY m.created_at DESC
");

$media = [];
while ($row = mysqli_fetch_assoc($query)) {
    $media[] = [
        'id' => $row['id'],
        'artist_id' => $row['artist_id'],
        'artist_name' => $row['artist_name'],
        'media_type' => $row['media_type'],
        'media_url' => $row['media_url'],
        'caption' => $row['caption'],
        'like_count' => $row['like_count'],
        'created_at' => $row['created_at']
    ];
}

response(true, "Media fetched successfully", $media);