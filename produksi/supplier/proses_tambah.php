<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Panggil fungsi tambahBarang() untuk memproses tambah data barang
    $result = tambahBarang($_POST);
    if ($result > 0) {
        echo "<script>alert('Data berhasil ditambahkan!');</script>";
        echo "<script>window.location.href = 'supplier.php';</script>"; // Redirect kembali ke halaman admin
    } else {
        echo "<script>alert('Data gagal ditambahkan!');</script>";
        echo "<script>window.location.href = 'supplier.php';</script>"; // Redirect kembali ke halaman admin
    }
}
