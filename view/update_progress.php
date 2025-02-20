<?php
require("../controllers/book_controller.php");
session_start();

if (isset($_SESSION['user_id'])) {
    $success = updateReadingProgress($_SESSION['user_id']);
    echo json_encode(["success" => $success]);
} else {
    echo json_encode(["error" => "User not logged in"]);
}
?>
