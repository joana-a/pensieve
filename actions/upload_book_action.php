<?php
session_start();

require("../controllers/book_controller.php");

if (!isset($_SESSION['user_id'])) {
    die("Error: User not logged in.");
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_SESSION['user_id'];
    $title = $_POST['title'] ?? '';
    $author = $_POST['author'] ?? '';

    // Validate title and author
    if (empty($title) || empty($author)) {
        die("Error: Title and author are required.");
    }

    // File upload handling
    if (!isset($_FILES["book_file"])) {
        die("Error: No file uploaded.");
    }

    $target_dir = "../uploads/";
    $file_name = basename($_FILES["book_file"]["name"]);
    $target_file = $target_dir . $file_name;
    $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check for file upload errors
    if ($_FILES["book_file"]["error"] !== 0) {
        die("Error: File upload error. Code: " . $_FILES["book_file"]["error"]);
    }

    // Check if file is a valid format (PDF or EPUB)
    if (!in_array($fileType, ["pdf", "epub"])) {
        die("Error: Only PDF and EPUB files are allowed.");
    }

    
    if (move_uploaded_file($_FILES["book_file"]["tmp_name"], $target_file)) {
        // Debugging step: Check if uploadBookController() executes properly
        if (uploadBookController($user_id, $title, $author, $target_file)) {
            echo "Book uploaded successfully!";
            // Redirect to dashboard after successful upload
            header("Location:../view/home.php?upload=success");
        } else {
            die("Error: Database insertion failed.");
        }
    } else {
        die("Error: Failed to move uploaded file.");
    }
}
?>
