<?php
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_list'])) {
    $id_list = intval($_POST['id_list']);
    $conn->query("DELETE FROM my_list WHERE id_list = $id_list");
}

header("Location: mylist.php");
exit;
