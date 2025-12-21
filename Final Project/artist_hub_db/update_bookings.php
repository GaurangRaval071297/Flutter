<?php
include "connect.php";

/* INPUTS */
$booking_id    = intval($_POST['booking_id'] ?? 0);
$booking_date  = trim($_POST['booking_date'] ?? '');
$event_address = trim($_POST['event_address'] ?? '');
$status        = trim($_POST['status'] ?? ''); // optional

/* VALIDATION */
if($booking_id <= 0){
    response(false,"Booking ID is required");
}

/* CHECK BOOKING */
$q = mysqli_query($conn,"
SELECT * FROM g_bookings WHERE id='$booking_id'
");
if(mysqli_num_rows($q) == 0){
    response(false,"Booking not found");
}

$booking = mysqli_fetch_assoc($q);

/* STATUS CHECK */
if($booking['status'] == 'cancelled'){
    response(false,"Cancelled booking cannot be updated");
}
if($booking['status'] == 'completed'){
    response(false,"Completed booking cannot be updated");
}

/* FIELD VALIDATIONS */
if($booking_date != ''){
    if(!preg_match('/^\d{4}-\d{2}-\d{2}$/', $booking_date)){
        response(false,"Booking date must be YYYY-MM-DD");
    }
}

if($status != ''){
    if(!in_array($status,['booked','completed'])){
        response(false,"Invalid status");
    }
}

/* BUILD UPDATE QUERY */
$updateFields = [];

if($booking_date != ''){
    $updateFields[] = "booking_date='$booking_date'";
}
if($event_address != ''){
    $updateFields[] = "event_address='$event_address'";
}
if($status != ''){
    $updateFields[] = "status='$status'";
}

if(count($updateFields) == 0){
    response(false,"Nothing to update");
}

$updateSql = "UPDATE g_bookings SET ".implode(", ",$updateFields)." WHERE id='$booking_id'";

/* UPDATE */
$update = mysqli_query($conn,$updateSql);
if(!$update){
    response(false,"Failed to update booking");
}

/* FETCH UPDATED BOOKING */
$q2 = mysqli_query($conn,"
SELECT 
b.*,
c.name as customer_name, c.email as customer_email,
a.name as artist_name, a.email as artist_email
FROM g_bookings b
JOIN g_users c ON b.customer_id=c.id
JOIN g_users a ON b.artist_id=a.id
WHERE b.id='$booking_id'
");

$data = mysqli_fetch_assoc($q2);

/* RESPONSE */
response(true,"Booking updated successfully",$data);
