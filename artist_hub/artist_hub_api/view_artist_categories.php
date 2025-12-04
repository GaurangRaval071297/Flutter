<?php
header('Content-Type: application/json');
include 'connect.php';

// Accept artist_id from GET or POST
$artist_id = $_GET['artist_id'] ?? $_POST['artist_id'] ?? '';
$artist_id = intval($artist_id); // ensure numeric

if ($artist_id <= 0) {
    echo json_encode(['status' => false, 'message' => 'Valid artist_id required']);
    exit;
}

// Fetch artist categories with category name
$q = mysqli_query($con, "
    SELECT 
        ac.id,
        ac.category_id,
        c.name AS category_name
    FROM g_artist_category ac
    JOIN g_categories c ON ac.category_id = c.category_id
    WHERE ac.artist_id = $artist_id
");

// Check for query error
if (!$q) {
    echo json_encode(['status' => false, 'message' => mysqli_error($con)]);
    exit;
}

$data = [];
while ($row = mysqli_fetch_assoc($q)) {
    $data[] = $row;
}

echo json_encode([
    'status' => true,
    'message' => count($data) ? 'Categories found' : 'No categories found',
    'data' => $data
]);
?>
