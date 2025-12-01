<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status"=>false,"message"=>"Only POST method allowed"]);
    exit;
}

$artist_id = $_POST['artist_id'] ?? null;
$name = $_POST['name'] ?? null;
$phone = $_POST['phone'] ?? null;
$address = $_POST['address'] ?? null;
$status = $_POST['status'] ?? null;
$profile_pic = $_POST['profile_pic'] ?? null;
$categories = isset($_POST['categories']) ? $_POST['categories'] : null; // CSV or array

if (!$artist_id) {
    echo json_encode(["status"=>false,"message"=>"Missing artist_id"]);
    exit;
}

mysqli_autocommit($con, false);

try {

    $stmt = $con->prepare("
        UPDATE g_users 
        SET name = IFNULL(?, name),
            phone = IFNULL(?, phone),
            address = IFNULL(?, address),
            status = IFNULL(?, status),
            profile_pic = IFNULL(?, profile_pic)
        WHERE user_id = ? AND role = 'artist'
    ");
    $stmt->bind_param("sssssi", 
        $name, $phone, $address, $status, $profile_pic, $artist_id
    );
    $stmt->execute();

    // categories update
    if ($categories) {
        // If categories sent as CSV string, convert to array
        if (!is_array($categories)) {
            $categories = array_map('trim', explode(",", $categories));
        }

        $del = $con->prepare("DELETE FROM g_artist_category WHERE artist_id = ?");
        $del->bind_param("i", $artist_id);
        $del->execute();

        $ins = $con->prepare("INSERT INTO g_artist_category (artist_id, category_id) VALUES (?, ?)");
        foreach ($categories as $cat_id) {
            if (!empty($cat_id)) {
                $ins->bind_param("ii", $artist_id, $cat_id);
                $ins->execute();
            }
        }
    }

    mysqli_commit($con);
    echo json_encode(["status"=>true,"message"=>"Artist updated successfully"]);

} catch (Exception $e) {
    mysqli_rollback($con);
    echo json_encode(["status"=>false,"message"=>$e->getMessage()]);
}

mysqli_autocommit($con, true);
mysqli_close($con);
?>
