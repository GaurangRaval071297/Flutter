<?php
include 'connect.php';
header('Content-Type: application/json');

$state = $_GET['state'] ?? '';

if ($state) {
    $res = $con->query("SELECT * FROM gr_rto_offices WHERE state_name LIKE '%$state%' ORDER BY office_id DESC");
} else {
    $res = $con->query("SELECT * FROM gr_rto_offices ORDER BY office_id DESC");
}

$data = [];
while ($r = $res->fetch_assoc()) {
    $data[] = $r;
}

echo json_encode(['success' => true, 'offices' => $data]);
?>
