<?php
include('connect.php');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate required fields
    if (
        isset($_POST['booking_id']) &&
        isset($_POST['customer_id']) &&
        isset($_POST['artist_id']) &&
        isset($_POST['rating']) &&
        isset($_POST['message']) &&
        isset($_POST['created_at'])
    ) {
        $booking_id  = $_POST['booking_id'];
        $customer_id = $_POST['customer_id'];
        $artist_id   = $_POST['artist_id'];
        $rating      = $_POST['rating'];
        $message     = $_POST['message'];
        $created_at  = $_POST['created_at'];

        $stmt = $con->prepare("INSERT INTO g_reviews (booking_id, customer_id, artist_id, rating, message, created_at) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("iiidss", $booking_id, $customer_id, $artist_id, $rating, $message, $created_at);

        // Execute
        if ($stmt->execute()) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Review added successfully.'
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Failed to add review.',
                'error' => $stmt->error
            ]);
        }

        $stmt->close();
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Missing required fields.'
        ]);
    }
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method.'
    ]);
}
?>
