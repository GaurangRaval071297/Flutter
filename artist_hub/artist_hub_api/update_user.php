<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status"=>false,"message"=>"Only POST method allowed"]);
    exit;
}

$user_id = $_POST['user_id'] ?? null;
$name = $_POST['name'] ?? null;
$phone = $_POST['phone'] ?? null;
$address = $_POST['address'] ?? null;
$status = $_POST['status'] ?? null;
$profile_pic = $_POST['profile_pic'] ?? null;

if (!$user_id) {
    echo json_encode(["status"=>false,"message"=>"Missing user_id"]);
    exit;
}

try {
    $stmt = $con->prepare("
        UPDATE g_users
        SET name = IFNULL(?, name),
            phone = IFNULL(?, phone),
            address = IFNULL(?, address),
            status = IFNULL(?, status),
            profile_pic = IFNULL(?, profile_pic)
        WHERE user_id = ?
    ");
    $stmt->bind_param("sssssi", $name, $phone, $address, $status, $profile_pic, $user_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "User updated successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}

mysqli_close($con);
?>
