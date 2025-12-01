<?php
include 'connect.php'; // mysqli connection: $con

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "message" => "Only POST method allowed"]);
    exit;
}

$name = $_POST['name'] ?? null;
$description = $_POST['description'] ?? null;

if (!$name) {
    echo json_encode(["status" => false, "message" => "Missing category name"]);
    exit;
}

try {
    $stmt = $con->prepare("INSERT INTO g_categories (name, description) VALUES (?, ?)");
    $stmt->bind_param("ss", $name, $description);
    $stmt->execute();

    echo json_encode([
        "status" => true,
        "message" => "Category added successfully",
        "category_id" => $stmt->insert_id
    ]);

} catch (Exception $e) {
    echo json_encode([
        "status" => false,
        "message" => $e->getMessage()
    ]);
}
?>
