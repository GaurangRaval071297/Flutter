Artist Hub - Full Simple PHP APIs (basic mysqli, no prepared statements)
Files included:
- connect.php
- register.php, login.php, edit_user.php, delete_user.php, view_users.php, view_user.php
- add_category.php, view_categories.php, edit_category.php, delete_category.php
- add_artist_category.php, view_artist_categories.php
- upload_media.php, view_media.php
- add_booking.php, view_customer_bookings.php, view_artist_bookings.php, update_booking_status.php, delete_booking.php
- add_review.php, view_reviews.php
- add_feedback.php, view_feedback.php
Notes:
- Use form-data for POST requests (file upload and regular fields) or x-www-form-urlencoded for simple fields.
- Passwords are hashed with password_hash().
- This package is intentionally simple; for production use, please add prepared statements, authentication, and input sanitization.
