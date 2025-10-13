<?php
include 'connect.php';

$res = $con->query("SELECT * FROM gr_categories ORDER BY category_id DESC");
$data = [];

while ($r = $res->fetch_assoc()) {
    $data[] = $r;
}

echo json_encode(['success' => true, 'categories' => $data]);
?>
