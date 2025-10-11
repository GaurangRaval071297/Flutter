<?php
include('connect.php');
header('Content-Type: application/json');

$result = mysqli_query($con,"SELECT * FROM g_questions");
$questions = [];
while($row = mysqli_fetch_assoc($result)){
    $questions[] = $row;
}

echo json_encode(['code'=>200,'questions'=>$questions]);
?>