<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Konversi nilai tanggal ke format yang benar menggunakan formatDate
    // $_POST['tgl_brg_masuk'] = formatDate($_POST['tgl_brg_masuk']);
    // $_POST['launching_date'] = formatDate($_POST['launching_date']);
    // $_POST['tgl_brg_keluar'] = formatDate($_POST['tgl_brg_keluar']);

    // Panggil fungsi tambahBarang() untuk memproses tambah data barang
    $result = tambahBarang($_POST);
    if ($result > 0) {
        echo "<script>alert('Data Barang berhasil ditambahkan!');</script>";
        echo "<script>window.location.href = 'stockgudang.php';</script>"; // Redirect kembali ke halaman admin
    } else {
        echo "<script>alert('Data Barang gagal ditambahkan!');</script>";
        echo "<script>window.location.href = 'stockgudang.php';</script>"; // Redirect kembali ke halaman admin
    }
}

?>