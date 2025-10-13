<?php
define('HOST', 'localhost');
define('USER', 'root');
define('PASSWORD', '');
define('DB_NAME', 'artist_hub');
$con = mysqli_connect(HOST, USER, PASSWORD, DB_NAME);
if(!$con){ die(json_encode(['code'=>500, 'message'=>'Database Connection Failed'])); }
?>