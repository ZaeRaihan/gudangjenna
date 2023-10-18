<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    // Panggil fungsi untuk mengubah data admin
    $result = ubahAdmin($_POST, $_FILES, $id);

    if ($result > 0) {
        echo "<script>alert('Data admin berhasil diubah! Silakan login kembali.');</script>";
        echo "<script>window.location.href = '../login.php';</script>"; // Redirect ke halaman login
    } else {
        echo "<script>alert('Data admin gagal diubah!');</script>";
        echo "<script>window.location.href = 'admin.php';</script>"; // Redirect kembali ke halaman admin
    }
}    
?>