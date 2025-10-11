<?php
include('connect.php');
header('Content-Type: application/json');

$user_id = $_GET['user_id'] ?? '';

if(empty($user_id)){
    echo json_encode(['code'=>400,'message'=>'User ID required']);
    exit;
}

$result = mysqli_query($con,"SELECT * FROM g_results WHERE user_id='$user_id'");
$results = [];
while($row = mysqli_fetch_assoc($result)){
    $results[] = $row;
}

echo json_encode(['code'=>200,'results'=>$results]);
?>