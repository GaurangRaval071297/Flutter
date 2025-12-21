<?php
include "connect.php";

$booking_id = intval($_POST['booking_id'] ?? 0);
$amount     = floatval($_POST['amount'] ?? 0);
$method     = trim($_POST['payment_method'] ?? '');
$txn_id     = trim($_POST['transaction_id'] ?? '');

if($booking_id<=0) response(false,"Booking ID required");
if($amount<=0) response(false,"Invalid amount");
if(!in_array($method,['online','cash'])) response(false,"Invalid payment method");

if($method=='online' && $txn_id==''){
    response(false,"Transaction ID required");
}

/* Get booking */
$q = mysqli_query($conn,"
SELECT * FROM g_bookings WHERE id='$booking_id'
");
if(mysqli_num_rows($q)==0) response(false,"Booking not found");

$booking = mysqli_fetch_assoc($q);

/* Insert payment */
mysqli_query($conn,"
INSERT INTO g_payments 
(booking_id, customer_id, artist_id, amount, payment_method, payment_status, transaction_id)
VALUES
('$booking_id','".$booking['customer_id']."','".$booking['artist_id']."','$amount','$method',
'".($method=='cash'?'pending':'paid')."','$txn_id')
");

/* Update booking */
mysqli_query($conn,"
UPDATE g_bookings 
SET payment_status='".($method=='cash'?'pending':'paid')."',
status='booked'
WHERE id='$booking_id'
");

response(true,"Payment processed successfully");
