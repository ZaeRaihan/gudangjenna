<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Panggil fungsi ubahBarang() untuk memproses ubah data barang
    $idsupplier = $_POST['id'];
    $page = $_POST['page'];
    $result = ubahBarang($_POST, $idsupplier);
    if ($result > 0) {
        echo "<script>alert('Data berhasil diubah!');</script>";
        echo "<script>window.location.href = '" . $_POST['url'] . "';</script>";
    } else {
        echo "<script>alert('Data gagal diubah!');</script>";
        echo "<script>window.location.href = '" . $_POST['url'] . "';</script>";
    }
}
