<?php
require 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['id'])) { 
        $id = $_POST['id'];
        
        // Panggil fungsi hapusAdmin() untuk menghapus data admin dari database
        $result = hapusAdmin($id);
        if ($result > 0) {
            echo "<script>alert('Admin berhasil dihapus!');</script>";
        } else {
            echo "<script>alert('Gagal menghapus admin!');</script>";
        }
        
        echo "<script>window.location.href = 'admin.php';</script>"; // Redirect kembali ke halaman admin
    }
}
?>