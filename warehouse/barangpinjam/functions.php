<?php

// Koneksi ke database
$db = mysqli_connect("localhost", "root", "", "gudangjenna");
function query($query)
{
    global $db;
    $result = mysqli_query($db, $query);
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

// Fungsi untuk menambahkan barang baru
function tambahBarang($data) {
    global $db;

    // Ambil data dari form
    $tgl_brg_keluar = htmlspecialchars($data['tgl_brg_keluar']);
    $surat_retur = htmlspecialchars($data['surat_retur']);
    $gudang = htmlspecialchars($data['gudang']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock = htmlspecialchars($data['stock']);
    $dipinjam = htmlspecialchars($data['dipinjam']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query tambah barang
    $query = "INSERT INTO barangpinjam (tgl_brg_keluar, surat_retur, gudang, article_name, size, stock, dipinjam) VALUES 
    ('$tgl_brg_keluar', '$surat_retur', '$gudang', '$article_name', '$size', '$stock', '$dipinjam')";
    
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengubah data barang
function ubahBarang($data, $idbarang_pinjam)
{
    global $db;

    // Ambil data dari form
    $tgl_brg_keluar = htmlspecialchars($data['tgl_brg_keluar']);
    $surat_retur = htmlspecialchars($data['surat_retur']);
    $gudang = htmlspecialchars($data['gudang']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock = htmlspecialchars($data['stock']);
    $dipinjam = htmlspecialchars($data['dipinjam']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query ubah barang
    $query = "UPDATE barangpinjam SET tgl_brg_keluar = '$tgl_brg_keluar', surat_retur = '$surat_retur', gudang = '$gudang', article_name = '$article_name', 
    size = '$size', stock = '$stock', dipinjam = '$dipinjam' WHERE idbarang_pinjam = $idbarang_pinjam";
    
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengambil data barang berdasarkan ID
function getBarangById($idbarang_pinjam) {
    global $db;
    $query = "SELECT * FROM barangpinjam WHERE idbarang_pinjam = $idbarang_pinjam";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $barang = mysqli_fetch_assoc($result);
        return $barang;
    } else {
        return false;
    }
}

// Fungsi untuk menghapus barang
function hapusBarang($id)
{
    global $db;
    
    // Query hapus barang
    $query = "DELETE FROM barangpinjam WHERE idbarang_pinjam = $id";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

//tampil username
function getNama($username) {
    global $db;
    $query = "SELECT nama FROM admin_wh WHERE username = '$username'";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        return $user['nama'];
    } else {
        return "Nama Tidak Ditemukan";
    }
}

// Fungsi untuk menyalin data sebagai data baru
function proses_copy($id) {
    global $db;

    $dataToCopy = getBarangById($id);

    if (!$dataToCopy) {
        return false; // Data tidak ditemukan
    }

    // Insert the copied data as a new entry
    $insertQuery = "INSERT INTO barangpinjam (tgl_brg_keluar, surat_retur, gudang, article_name, size, stock, dipinjam)
                    VALUES (
                        '{$dataToCopy['tgl_brg_keluar']}',
                        '{$dataToCopy['surat_retur']}',
                        '{$dataToCopy['gudang']}',
                        '{$dataToCopy['article_name']}',
                        '{$dataToCopy['size']}',
                        '{$dataToCopy['stock']}',
                        '{$dataToCopy['dipinjam']}'
                    )";

    $result = mysqli_query($db, $insertQuery);

    if ($result) {
        return true;
    } else {
        return false;
    }
    
}
// Fungsi untuk membuat format tanggal
function formatDate($dateString) {
    $timestamp = strtotime($dateString);
    return date('d F Y', $timestamp);
}

function format_rupiah($angka) {
    return 'Rp ' . number_format($angka, 0, ',', '.');
}

?>