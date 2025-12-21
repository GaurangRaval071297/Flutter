<?php
include "connect.php";

/* INPUT: Required customer_id */
$customer_id = intval($_GET['customer_id'] ?? 0);
if($customer_id <= 0) response(false,"Customer ID is required");

/* Check customer exists */
$cust_q = mysqli_query($conn,"SELECT id,name FROM g_users WHERE id='$customer_id' AND role='customer' AND is_active=1");
if(mysqli_num_rows($cust_q) == 0) response(false,"Customer not found");

/* Fetch bookings only for this customer */
$q = mysqli_query($conn,"
SELECT b.*, 
a.name as artist_name, a.email as artist_email, a.phone as artist_phone
FROM g_bookings b
JOIN g_users a ON b.artist_id=a.id
WHERE b.customer_id='$customer_id'
ORDER BY b.booking_date DESC
");

$bookings = [];
while($row = mysqli_fetch_assoc($q)){
    $bookings[] = $row;
}

/* RESPONSE */
if(count($bookings) == 0){
    response(true,"No bookings found for this customer",[]);
} else {
    response(true,"Bookings fetched successfully",$bookings);
}
