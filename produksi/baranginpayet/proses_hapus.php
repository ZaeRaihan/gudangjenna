<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['id'])) {
        $idbarang_inpayet = $_POST['id'];

        // Panggil fungsi hapusBarang() untuk menghapus data barang dari database
        $result = hapusBarang($idbarang_inpayet);
        if ($result > 0) {
            echo json_encode(['status' => 'success', 'message' => 'Barang berhasil dihapus!']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Gagal menghapus barang!']);
        }
    }
}
