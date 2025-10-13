<?php
include('connect.php');
$id=$_POST['id'];
$name=$_POST['name'];
$description=$_POST['description'];
$media_type=$_POST['media_type'];

$media_url   = '';

if (isset($_FILES['media_url']) && $_FILES['media_url'] ['error'] == 0 ) {
	$uploadDir = 'uploads/';
	if (!is_dir($uploadDir)) {
		mkdir($uploadDir, 0755, true);
	}
	$fileName = time(). '_'. basename($_FILES['media_url'] ['name']);
	$targetPath = $uploadDir . $fileName;
	if (move_uploaded_file($_FILES['media_url']['tmp_name'], $targetPath)) {
		$media_url = $fileName;
	}
	else {
		echo "Fail to upload image";
		exit;
	}
}
	else {
		echo "Image is required";
		exit;
	}


$q="UPDATE g_artist_category SET name='$name',description='$description',media_url='$media_url',media_type='$media_type' WHERE id='$id'";
echo mysqli_query($con,$q)?json_encode(['code'=>200,'message'=>'Category Updated']):json_encode(['code'=>500,'message'=>'Update Failed']);
?>