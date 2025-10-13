<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "rto_test_app";

$con = new mysqli($servername, $username, $password, $database);
if ($con->connect_error) {
    header('Content-Type: application/json');
    echo json_encode(["success" => false, "message" => "Database connection failed: " . $con->connect_error]);
    exit;
}
?>
