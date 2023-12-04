<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['id'])) {
        $idsupplier = $_POST['id'];

        // Panggil fungsi hapusBarang() untuk menghapus data barang dari database
        $result = hapusBarang($idsupplier);
        if ($result > 0) {
            echo json_encode(['status' => 'success', 'message' => 'Data berhasil dihapus!']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Gagal menghapus data!']);
        }
    }
}
