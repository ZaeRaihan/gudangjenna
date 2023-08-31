<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];

    // Panggil fungsi untuk menyalin data
    $result = proses_copy($id);

    if ($result) {
        echo json_encode(['status' => 'success', 'message' => 'Data berhasil disalin!']);
    } else {
        $error_message = 'Gagal menyalin data: ' . mysqli_error($db);
        error_log($error_message);
        echo json_encode(['status' => 'error', 'message' => $error_message]);
    }
}
