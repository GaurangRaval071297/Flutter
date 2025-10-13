<?php
include 'connect.php';

$res = $con->query("SELECT * FROM gr_statistics ORDER BY stat_id DESC");
$data = [];

while ($r = $res->fetch_assoc()) {
    $data[] = $r;
}

echo json_encode(['success' => true, 'statistics' => $data]);
?>
