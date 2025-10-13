<?php
include 'connect.php';

$cat = intval($_GET['category_id'] ?? 0);

if ($cat) {
    $res = $con->query("SELECT * FROM gr_questions WHERE category_id = $cat ORDER BY question_id DESC");
} else {
    $res = $con->query("SELECT * FROM gr_questions ORDER BY question_id DESC");
}

$data = [];
while ($r = $res->fetch_assoc()) {
    $data[] = $r;
}

echo json_encode(['success' => true, 'questions' => $data]);
?>
