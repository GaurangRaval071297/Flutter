<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status"=>false,"message"=>"Only POST method allowed"]);
    exit;
}

$category_id = $_POST['category_id'] ?? null;
$name = $_POST['name'] ?? null;
$description = $_POST['description'] ?? null;

if (!$category_id) {
    echo json_encode(["status"=>false,"message"=>"Missing category_id"]);
    exit;
}

try {
    $stmt = $con->prepare("
        UPDATE g_categories
        SET name = IFNULL(?, name),
            description = IFNULL(?, description)
        WHERE category_id = ?
    ");
    $stmt->bind_param("ssi", $name, $description, $category_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Category updated successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}

mysqli_close($con);
?>
