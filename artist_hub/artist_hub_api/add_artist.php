<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$name = $_POST['name'] ?? null;
$email = $_POST['email'] ?? null;
$password = $_POST['password'] ?? null;

if (!$name || !$email || !$password) {
    echo json_encode(["status" => false, "message" => "Missing required fields"]);
    exit;
}

$password_hashed = password_hash($password, PASSWORD_BCRYPT);
$phone = $_POST['phone'] ?? null;
$address = $_POST['address'] ?? null;
$role = 'artist';
$profile_pic = $_POST['profile_pic'] ?? null;

// Handle categories
$categories = [];
if (isset($_POST['categories'])) {

    if (is_array($_POST['categories'])) {
        $categories = $_POST['categories'];  
    } else {
        $categories = array_map('trim', explode(",", $_POST['categories']));
    }
}

$con->begin_transaction();

try {

    // Insert into g_users
    $stmt = $con->prepare(
        "INSERT INTO g_users (name,email,password,phone,address,role,profile_pic) 
         VALUES (?,?,?,?,?,?,?)"
    );
    $stmt->bind_param("sssssss", $name, $email, $password_hashed, $phone, $address, $role, $profile_pic);
    $stmt->execute();

    $artist_id = $stmt->insert_id;

    // Insert categories
    if (!empty($categories)) {
        $stmt2 = $con->prepare(
            "INSERT INTO g_artist_category (artist_id, category_id) VALUES (?, ?)"
        );

        foreach ($categories as $cat_id) {
            $stmt2->bind_param("ii", $artist_id, $cat_id);
            $stmt2->execute();
        }
    }

    $con->commit();

    echo json_encode([
        "status" => true,
        "message" => "Artist added successfully",
        "artist_id" => $artist_id
    ]);

} catch (Exception $e) {
    $con->rollback();
    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}

?>
