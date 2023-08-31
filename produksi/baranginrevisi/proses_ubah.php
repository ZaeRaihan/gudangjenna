<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Konversi nilai tanggal ke format yang benar menggunakan formatDate
    //$_POST['tgl_brg_masuk'] = formatDate($_POST['tgl_brg_masuk']);
    $_POST['launching_date'] = formatDate($_POST['launching_date']);
    $_POST['tgl_brg_keluar'] = formatDate($_POST['tgl_brg_keluar']);

    // Panggil fungsi ubahBarang() untuk memproses ubah data barang
    $idbarang_inrevisi = $_POST['id'];
    $page = $_POST['page'];
    $result = ubahBarang($_POST, $idbarang_inrevisi);
    if ($result > 0) {
        echo "<script>alert('Data Barang berhasil diubah!');</script>";
        echo "<script>window.location.href = 'baranginrevisi.php?page=$page';</script>"; // Redirect kembali ke halaman admin
    } else {
        echo "<script>alert('Data Barang gagal diubah!');</script>";
        echo "<script>window.location.href = 'baranginrevisi.php?page=$page';</script>"; // Redirect kembali ke halaman admin
    }
}
