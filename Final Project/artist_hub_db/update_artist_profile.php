<?php
include "connect.php";

/* INPUTS */
$id          = intval($_POST['id'] ?? 0);
$category    = trim($_POST['category'] ?? '');
$experience  = trim($_POST['experience'] ?? '');
$price       = trim($_POST['price'] ?? '');
$description = trim($_POST['description'] ?? '');

/* VALIDATION */
if($id <= 0) response(false,"Profile ID is required");

/* check profile exists */
$q = mysqli_query($conn,"SELECT * FROM g_artist_profile WHERE id='$id'");
if(mysqli_num_rows($q) == 0) response(false,"Artist profile not found");

/* validate fields */
if($category == '') response(false,"Category is required");
if($experience == '') response(false,"Experience is required");
if($price == '') response(false,"Price is required");
if(!is_numeric($price) || $price < 0) response(false,"Price must be a positive number");
if($description == '') response(false,"Description is required");

/* update */
$update = mysqli_query($conn,"
UPDATE g_artist_profile SET
category='$category',
experience='$experience',
price='$price',
description='$description'
WHERE id='$id'
");

if(!$update) response(false,"Failed to update artist profile");

/* fetch updated profile */
$q2 = mysqli_query($conn,"
SELECT p.*, u.name as artist_name, u.email as artist_email
FROM g_artist_profile p
JOIN g_users u ON p.user_id = u.id
WHERE p.id='$id'
");
$profile = mysqli_fetch_assoc($q2);

response(true,"Artist profile updated successfully",$profile);
