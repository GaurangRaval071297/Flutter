<?php
header('Content-Type: application/json');
include 'connect.php'; // MySQLi connection

// Collect POST data (supports JSON or form-data)
$data = json_decode(file_get_contents("php://input"), true);

$category_id = $data['category_id'] ?? $_POST['category_id'] ?? '';
$name = $data['name'] ?? $_POST['name'] ?? null;
$description = $data['description'] ?? $_POST['description'] ?? null;

if(empty($category_id)){
    echo json_encode(["status"=>false,"message"=>"Missing category_id"]);
    exit;
}

// Prepare update statement
$stmt = mysqli_prepare($con, "UPDATE g_categories SET name = COALESCE(?, name), description = COALESCE(?, description) WHERE category_id = ?");
mysqli_stmt_bind_param($stmt, "ssi", $name, $description, $category_id);

if(mysqli_stmt_execute($stmt)){
    echo json_encode(["status"=>true,"message"=>"Category updated successfully"]);
} else {
    echo json_encode(["status"=>false,"message"=>mysqli_error($con)]);
}

// Close connection
mysqli_stmt_close($stmt);
mysqli_close($con);
?>
