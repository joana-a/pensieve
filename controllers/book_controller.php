<?php
include_once("../classes/book_class.php");
function uploadBookController($user_id, $title, $author, $file_path) {
    $book = new Book();
    return $book->uploadBook($user_id, $title, $author, $file_path);
}

function getAllBooksController() {
    $book = new Book();
    return $book->getAllBooks();
}

function getUserBooksController($user_id) {
    $book = new Book();
    return $book->getUserBooks($user_id);
}