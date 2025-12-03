<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'artist_hub';

$con = mysqli_connect($host, $user, $pass, $db);

if (!$con) {
    die(json_encode(['status'=>false,'message'=>'Database connection failed']));
}
?>