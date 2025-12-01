<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status"=>false,"message"=>"Only POST method allowed"]);
    exit;
}

$review_id = $_POST['review_id'] ?? null;
$rating = isset($_POST['rating']) ? (int)$_POST['rating'] : null;
$comment = $_POST['comment'] ?? null;

if (!$review_id) {
    echo json_encode(["status"=>false,"message"=>"Missing review_id"]);
    exit;
}

if ($rating !== null && ($rating < 1 || $rating > 5)) {
    echo json_encode(["status"=>false,"message"=>"Rating must be between 1 and 5"]);
    exit;
}

try {
    $stmt = $con->prepare("
        UPDATE g_reviews
        SET rating = IFNULL(?, rating),
            comment = IFNULL(?, comment)
        WHERE review_id = ?
    ");
    $stmt->bind_param("isi", $rating, $comment, $review_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Review updated successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}

mysqli_close($con);
?>
