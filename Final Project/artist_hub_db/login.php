<?php
include "connect.php";

/* -------- GET DATA -------- */
$email    = trim($_POST['email'] ?? '');
$password = trim($_POST['password'] ?? '');

/* -------- VALIDATION -------- */
if($email == ''){
    response(false,"Email is required");
}

if(!preg_match('/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|in|net|org)$/',$email)){
    response(false,"Invalid email address");
}

if($password == ''){
    response(false,"Password is required");
}

/* -------- CHECK USER -------- */
$q = mysqli_query($conn,"
SELECT
id,
name,
email,
password,
phone,
address,
role,
is_approved,
is_active,
created_at
FROM g_users
WHERE email='$email'
LIMIT 1
");

if(mysqli_num_rows($q) == 0){
    response(false,"Invalid email or password");
}

$user = mysqli_fetch_assoc($q);

/* -------- ACTIVE CHECK -------- */
if($user['is_active'] == 0){
    response(false,"Account is deactivated");
}

/* -------- PASSWORD VERIFY -------- */
if(!password_verify($password, $user['password'])){
    response(false,"Invalid email or password");
}

/* -------- ARTIST APPROVAL CHECK -------- */
if($user['role'] == 'artist' && $user['is_approved'] == 0){
    response(false,"Your account is pending admin approval");
}

/* -------- REMOVE PASSWORD FROM RESPONSE -------- */
unset($user['password']);

/* -------- SUCCESS RESPONSE -------- */
response(true,"Login successful",$user);
