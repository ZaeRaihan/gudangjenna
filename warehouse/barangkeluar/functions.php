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
    $sj_keluar = htmlspecialchars($data['sj_keluar']);
    $gudang = htmlspecialchars($data['gudang']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock = htmlspecialchars($data['stock']);
    $status = htmlspecialchars($data['status']);
    $keterangan = htmlspecialchars($data['keterangan']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query tambah barang
    $query = "INSERT INTO barangkeluar (tgl_brg_keluar, sj_keluar, gudang, article_name, size, stock, status, keterangan) VALUES 
    ('$tgl_brg_keluar', '$sj_keluar', '$gudang', '$article_name', '$size', '$stock', '$status', '$keterangan')";
    
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengubah data barang
function ubahBarang($data, $idbarang_keluar)
{
    global $db;

   // Ambil data dari form
   $tgl_brg_keluar = htmlspecialchars($data['tgl_brg_keluar']);
   $sj_keluar = htmlspecialchars($data['sj_keluar']);
   $gudang = htmlspecialchars($data['gudang']);
   $article_name = htmlspecialchars($data['article_name']);
   $size = htmlspecialchars($data['size']);
   $stock = htmlspecialchars($data['stock']);
   $status = htmlspecialchars($data['status']);
   $keterangan = htmlspecialchars($data['keterangan']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query ubah barang
    $query = "UPDATE barangkeluar SET tgl_brg_keluar = '$tgl_brg_keluar', sj_keluar = '$sj_keluar', gudang = '$gudang', article_name = '$article_name', 
    size = '$size', stock = '$stock', status = '$status', keterangan = '$keterangan' WHERE idbarang_keluar = $idbarang_keluar";
    
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengambil data barang berdasarkan ID
function getBarangById($idbarang_keluar) {
    global $db;
    $query = "SELECT * FROM barangkeluar WHERE idbarang_keluar = $idbarang_keluar";
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
    $query = "DELETE FROM barangkeluar WHERE idbarang_keluar = $id";
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
    $insertQuery = "INSERT INTO barangkeluar (tgl_brg_keluar, sj_keluar, gudang, article_name, size, stock, status, keterangan)
                    VALUES (
                        '{$dataToCopy['tgl_brg_keluar']}',
                        '{$dataToCopy['sj_keluar']}',
                        '{$dataToCopy['gudang']}',
                        '{$dataToCopy['article_name']}',
                        '{$dataToCopy['size']}',
                        '{$dataToCopy['stock']}',
                        '{$dataToCopy['status']}',
                        '{$dataToCopy['keterangan']}'
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