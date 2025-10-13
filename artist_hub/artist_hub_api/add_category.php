    <?php
    include 'connect.php';
    $data = json_decode(file_get_contents("php://input"), true);

    if(!$data || !isset($data['name'])) {
        echo json_encode(["status"=>false,"message"=>"Missing category name"]);
        exit;
    }

    $name = $data['name'];
    $description = $data['description'] ?? null;

    try {
        $stmt = $con->prepare("INSERT INTO g_categories (name, description) VALUES (?, ?)");
        $stmt->execute([$name, $description]);
        echo json_encode(["status"=>true,"message"=>"Category added","category_id"=>$con->lastInsertId()]);
    } catch(PDOException $e) {
        echo json_encode(["status"=>false,"message"=>$e->getMessage()]);
    }
    ?>