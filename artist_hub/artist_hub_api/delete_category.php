<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$category_id = $_POST['category_id'] ?? null;

if (!$category_id) {
    echo json_encode(["status" => false, "message" => "Missing category_id"]);
    exit;
}

try {

    $stmt = $con->prepare("DELETE FROM g_categories WHERE category_id = ?");
    $stmt->bind_param("i", $category_id);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Category deleted successfully"
    ]);

} catch (Exception $e) {

    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
