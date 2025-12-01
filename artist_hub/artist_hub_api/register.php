<?php
 include('connect.php');

$name = $_POST['name'];
$email = $_POST['email'];
$password_hashed = password_hash($_POST['password'], PASSWORD_BCRYPT);
$phone = $_POST['phone'] ?? "";
$address = $_POST['address'] ?? "";
$role = $_POST['role'] ?? "customer";

// Handle profile_pic
$profile_pic_name = "";
if(isset($_FILES['profile_pic'])){
    $profile_pic_name = $_FILES['profile_pic']['name'];
    $tmp_name = $_FILES['profile_pic']['tmp_name'];
    $folder = "uploads/" . $profile_pic_name;

    move_uploaded_file($tmp_name, $folder);
}

if($name=="" || $email=="" || $password_hashed=="")
{
    echo "Please Fill All The Fields";
}
else
{
    $query = "INSERT INTO g_users (name,email,password,phone,address,role,profile_pic)
              VALUES ('$name','$email','$password_hashed','$phone','$address','$role','$profile_pic_name')";
    
    mysqli_query($con,$query);
    
    echo "User Registered Successfully";
}

?>
