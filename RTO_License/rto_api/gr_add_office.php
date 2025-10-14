<?php
include 'connect.php';
header('Content-Type: application/json');

$state = $_POST['state_name'] ?? '';
$code = $_POST['office_code'] ?? '';
$name = $_POST['office_name'] ?? '';
$addr = $_POST['address'] ?? '';
$website = $_POST['website'] ?? '';
$contact = $_POST['contact_number'] ?? '';

if (!$state || !$code || !$name || !$addr) {
    echo json_encode(['success' => false, 'message' => 'Required fields missing']);
    exit;
}

$sql = "INSERT INTO gr_rto_offices (state_name, office_code, office_name, address, website, contact_number)
        VALUES ('$state', '$code', '$name', '$addr', '$website', '$contact')";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Office added', 'id' => $con->insert_id]);
} else {
    echo json_encode(['success' => false, 'message' => 'Add failed']);
}
?>
