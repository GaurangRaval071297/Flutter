<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports JSON or form-data)
$data = json_decode(file_get_contents("php://input"), true);

$review_id = $data['review_id'] ?? $_POST['review_id'] ?? '';
$rating = isset($data['rating']) ? (int)$data['rating'] : (isset($_POST['rating']) ? (int)$_POST['rating'] : null);
$comment = $data['comment'] ?? $_POST['comment'] ?? null;

if(empty($review_id)){
    echo json_encode(["status"=>false,"message"=>"Missing review_id"]);
    exit;
}

if($rating !== null && ($rating < 1 || $rating > 5)){
    echo json_encode(["status"=>false,"message"=>"Rating must be between 1 and 5"]);
    exit;
}

// Prepare update statement
$stmt = mysqli_prepare($con, "UPDATE g_reviews SET rating = COALESCE(?, rating), comment = COALESCE(?, comment) WHERE review_id = ?");
mysqli_stmt_bind_param($stmt, "isi", $rating, $comment, $review_id);

if(mysqli_stmt_execute($stmt)){
    echo json_encode(["status"=>true,"message"=>"Review updated successfully"]);
} else {
    echo json_encode(["status"=>false,"message"=>mysqli_error($con)]);
}

// Close connection
mysqli_stmt_close($stmt);
mysqli_close($con);
?>
