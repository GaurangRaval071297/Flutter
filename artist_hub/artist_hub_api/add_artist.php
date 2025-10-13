<?php
include 'connect.php';
$data = json_decode(file_get_contents("php://input"), true);

if(!$data || !isset($data['name'], $data['email'], $data['password'])) {
    echo json_encode(["status"=>false,"message"=>"Missing required fields"]);
    exit;
}

$name = $data['name'];
$email = $data['email'];
$password_hashed = password_hash($data['password'], PASSWORD_BCRYPT);
$phone = $data['phone'] ?? null;
$address = $data['address'] ?? null;
$role = 'artist';
$profile_pic = $data['profile_pic'] ?? null;
$categories = $data['categories'] ?? []; // array of category_ids

try {
    $con->beginTransaction();
    $stmt = $con->prepare("INSERT INTO g_users (name,email,password,phone,address,role,profile_pic) VALUES (?,?,?,?,?,?,?)");
    $stmt->execute([$name,$email,$password_hashed,$phone,$address,$role,$profile_pic]);
    $artist_id = $con->lastInsertId();

    if(!empty($categories)) {
        $stmt2 = $con->prepare("INSERT INTO g_artist_category (artist_id, category_id) VALUES (?, ?)");
        foreach($categories as $cat_id) {
            $stmt2->execute([$artist_id, $cat_id]);
        }
    }

    $con->commit();
    echo json_encode(["status"=>true,"message"=>"Artist added","artist_id"=>$artist_id]);
} catch(PDOException $e) {
    $con->rollBack();
    echo json_encode(["status"=>false,"message"=>$e->getMessage()]);
}
?>