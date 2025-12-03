<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports form-data or JSON)
$data = json_decode(file_get_contents("php://input"), true);

$artist_id = $data['artist_id'] ?? $_POST['artist_id'] ?? '';
$name = $data['name'] ?? $_POST['name'] ?? null;
$phone = $data['phone'] ?? $_POST['phone'] ?? null;
$address = $data['address'] ?? $_POST['address'] ?? null;
$status = $data['status'] ?? $_POST['status'] ?? null;
$profile_pic = $data['profile_pic'] ?? $_POST['profile_pic'] ?? null;
$categories = $data['categories'] ?? $_POST['categories'] ?? null; // optional array

if(empty($artist_id)){
    echo json_encode(["status"=>false,"message"=>"Missing artist_id"]);
    exit;
}

// Start transaction
mysqli_begin_transaction($con);

try {
    // Update artist details
    $stmt = mysqli_prepare($con, "UPDATE g_users SET name = COALESCE(?, name), phone = COALESCE(?, phone), address = COALESCE(?, address), status = COALESCE(?, status), profile_pic = COALESCE(?, profile_pic) WHERE user_id = ? AND role = 'artist'");
    mysqli_stmt_bind_param($stmt, "sssssi", $name, $phone, $address, $status, $profile_pic, $artist_id);
    mysqli_stmt_execute($stmt);

    // Update categories if provided
    if(!empty($categories) && is_array($categories)) {
        // Delete old categories
        $del = mysqli_prepare($con, "DELETE FROM g_artist_category WHERE artist_id = ?");
        mysqli_stmt_bind_param($del, "i", $artist_id);
        mysqli_stmt_execute($del);

        // Insert new categories
        $ins = mysqli_prepare($con, "INSERT INTO g_artist_category (artist_id, category_id) VALUES (?, ?)");
        foreach($categories as $cat_id) {
            mysqli_stmt_bind_param($ins, "ii", $artist_id, $cat_id);
            mysqli_stmt_execute($ins);
        }
    }

    mysqli_commit($con);
    echo json_encode(["status"=>true,"message"=>"Artist updated successfully"]);

} catch(Exception $e) {
    mysqli_rollback($con);
    echo json_encode(["status"=>false,"message"=>$e->getMessage()]);
}

// Close connection
mysqli_close($con);
?>
