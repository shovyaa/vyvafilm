<?php
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['movie_id'])) {
    $movie_id = intval($_POST['movie_id']);

    // Cek apakah sudah ada
    $check = $conn->query("SELECT * FROM my_list WHERE movie_id = $movie_id");
    if ($check->num_rows === 0) {
        $conn->query("INSERT INTO my_list (movie_id, added_at) VALUES ($movie_id, NOW())");
    }
}

// Arahkan kembali ke halaman MyList
header("Location: mylist.php");
exit;
