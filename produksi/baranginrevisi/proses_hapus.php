<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['id'])) {
        $idbarang_inrevisi = $_POST['id'];

        // Panggil fungsi hapusBarang() untuk menghapus data barang dari database
        $result = hapusBarang($idbarang_inrevisi);
        if ($result > 0) {
            echo json_encode(['status' => 'success', 'message' => 'Barang berhasil dihapus!']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Gagal menghapus barang!']);
        }
    }
}
