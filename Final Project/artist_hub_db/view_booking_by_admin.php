<?php
include "connect.php";

/* OPTIONAL FILTERS */
$booking_id  = intval($_GET['booking_id'] ?? 0);
$customer_id = intval($_GET['customer_id'] ?? 0);
$artist_id   = intval($_GET['artist_id'] ?? 0);
$status      = trim($_GET['status'] ?? '');

/* BASE QUERY */
$sql = "
SELECT 
b.id as booking_id,
b.booking_date,
b.event_address,
b.status,
b.payment_status,
b.created_at,

c.id as customer_id,
c.name as customer_name,
c.email as customer_email,
c.phone as customer_phone,

a.id as artist_id,
a.name as artist_name,
a.email as artist_email,
a.phone as artist_phone

FROM g_bookings b
JOIN g_users c ON b.customer_id = c.id
JOIN g_users a ON b.artist_id = a.id
WHERE 1=1
";

/* APPLY FILTERS */
if($booking_id > 0){
    $sql .= " AND b.id='$booking_id'";
}
if($customer_id > 0){
    $sql .= " AND b.customer_id='$customer_id'";
}
if($artist_id > 0){
    $sql .= " AND b.artist_id='$artist_id'";
}
if($status != ''){
    $sql .= " AND b.status='$status'";
}

$sql .= " ORDER BY b.id DESC";

/* EXECUTE */
$q = mysqli_query($conn,$sql);
if(!$q) response(false,"Failed to fetch bookings");

/* FETCH DATA */
$data = [];
while($row = mysqli_fetch_assoc($q)){
    $data[] = $row;
}

/* RESPONSE */
if(count($data)==0){
    response(true,"No bookings found",[]);
}

response(true,"All bookings fetched successfully",$data);
