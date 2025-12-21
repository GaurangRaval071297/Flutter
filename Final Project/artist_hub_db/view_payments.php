<?php
include "connect.php";

/* INPUTS (optional filters) */
$payment_id  = intval($_GET['payment_id'] ?? 0);
$booking_id  = intval($_GET['booking_id'] ?? 0);
$customer_id = intval($_GET['customer_id'] ?? 0);
$artist_id   = intval($_GET['artist_id'] ?? 0);

/* BASE QUERY */
$sql = "
SELECT 
p.id as payment_id,
p.booking_id,
p.amount,
p.payment_method,
p.payment_status,
p.transaction_id,
p.created_at,

b.booking_date,
b.event_address,
b.status as booking_status,

c.id as customer_id,
c.name as customer_name,
c.email as customer_email,

a.id as artist_id,
a.name as artist_name,
a.email as artist_email

FROM g_payments p
JOIN g_bookings b ON p.booking_id = b.id
JOIN g_users c ON p.customer_id = c.id
JOIN g_users a ON p.artist_id = a.id
WHERE 1=1
";

/* APPLY FILTERS */
if($payment_id > 0){
    $sql .= " AND p.id='$payment_id'";
}
if($booking_id > 0){
    $sql .= " AND p.booking_id='$booking_id'";
}
if($customer_id > 0){
    $sql .= " AND p.customer_id='$customer_id'";
}
if($artist_id > 0){
    $sql .= " AND p.artist_id='$artist_id'";
}

/* EXECUTE */
$q = mysqli_query($conn,$sql);
if(!$q) response(false,"Failed to fetch payments");

/* FETCH DATA */
$data = [];
while($row = mysqli_fetch_assoc($q)){
    $data[] = $row;
}

/* RESPONSE */
if(count($data)==0){
    response(true,"No payments found",[]);
}

response(true,"Payments fetched successfully",$data);
