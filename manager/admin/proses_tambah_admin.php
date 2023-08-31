<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Panggil fungsi tambahAdmin() untuk memproses registrasi admin baru
    $result = tambahAdmin($_POST);
    if ($result > 0) {
        echo "<script>alert('Admin berhasil ditambahkan!');</script>";
        echo "<script>window.location.href = 'admin.php';</script>"; // Redirect kembali ke halaman admin
    } else {
        echo "<script>alert('Admin gagal ditambahkan!');</script>";
        echo "<script>window.location.href = 'admin.php';</script>"; // Redirect kembali ke halaman admin
    }
}
?>