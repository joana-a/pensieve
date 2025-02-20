<?php
require("../settings/db_class.php");

class Book extends db_connection {
    // Function to upload book
    public function uploadBook($user_id, $title, $author, $file_path) {
        $title = mysqli_real_escape_string($this->db_conn(), $title);
        $author = mysqli_real_escape_string($this->db_conn(), $author);
        $file_path = mysqli_real_escape_string($this->db_conn(), $file_path);

        $sql = "INSERT INTO books (user_id, title, author, file_path, uploaded_at) VALUES ('$user_id', '$title', '$author', '$file_path', NOW())";
        return $this->db_query($sql);
    }

    // Function to fetch all books
    public function getAllBooks() {
        $sql = "SELECT * FROM books";
        return $this->db_fetch_all($sql);
    }

    // Function to fetch books by user
    public function getUserBooks($user_id) {
        $sql = "SELECT * FROM books WHERE user_id = '$user_id'";
        return $this->db_fetch_all($sql);
    }

//     public function getUserProgress($user_id) {
//         $sql = "SELECT xp_points, reading_streak, last_read_date FROM user_progress WHERE user_id = ?";
//         return $this->db_fetch_one($sql, [$user_id]);
//     }

//     // Update user progress
//     public function updateUserProgress($user_id, $xp, $streak, $last_read) {
//         $sql = "UPDATE user_progress SET xp_points = ?, reading_streak = ?, last_read_date = ? WHERE user_id = ?";
//         return $this->db_query($sql, [$xp, $streak, $last_read, $user_id]);
//     }

//     // Create user progress entry if not exists
//     public function createUserProgress($user_id) {
//         $sql = "INSERT INTO user_progress (user_id) VALUES (?)";
//         return $this->db_query($sql, [$user_id]);
//     }
 }

