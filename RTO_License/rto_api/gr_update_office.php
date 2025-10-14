<?php
include 'connect.php';
header('Content-Type: application/json');

$id = intval($_POST['office_id'] ?? 0);
$state = $_POST['state_name'] ?? '';
$code = $_POST['office_code'] ?? '';
$name = $_POST['office_name'] ?? '';
$addr = $_POST['address'] ?? '';
$website = $_POST['website'] ?? '';
$contact = $_POST['contact_number'] ?? '';

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID required']);
    exit;
}

$sql = "UPDATE gr_rto_offices 
        SET state_name = '$state', office_code = '$code', office_name = '$name', 
            address = '$addr', website = '$website', contact_number = '$contact' 
        WHERE office_id = $id";

if ($con->query($sql)) {
    echo json_encode(['success' => true, 'message' => 'Office updated']);
} else {
    echo json_encode(['success' => false, 'message' => 'Update failed']);
}
?>
