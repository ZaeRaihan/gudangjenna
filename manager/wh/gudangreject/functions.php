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
    $kode = htmlspecialchars($data['kode']);
    $collection = htmlspecialchars($data['collection']);
    $kategori = htmlspecialchars($data['kategori']);
    $kategori_input = htmlspecialchars($data['kategori_input']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock = htmlspecialchars($data['stock']);
    $harga = htmlspecialchars($data['harga']);
    $rak = htmlspecialchars($data['rak']);
    $lokasi = htmlspecialchars($data['lokasi']);
    $lokasi_input = htmlspecialchars($data['lokasi_input']);
    $umur = htmlspecialchars($data['umur']);

    // Menggunakan ternary operator untuk memilih antara nilai dropdown atau input teks
    $kategoriToUse = ($kategori === "LAINNYA") ? $kategori_input : $kategori;
    $lokasiToUse = ($lokasi === "LAINNYA") ? $lokasi_input : $lokasi;

    // Convert the date values to the correct format (YYYY-MM-DD)
    // $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));
   // $launching_date = date('Y-m-d', strtotime($launching_date));
  // $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query tambah barang
    $query = "INSERT INTO gudangreject (kode, collection, kategori, article_name, size, stock, harga, rak, lokasi, umur) VALUES 
    ('$kode', '$collection', '$kategoriToUse', '$article_name', '$size', '$stock', '$harga', '$rak', '$lokasiToUse', '$umur')";
    
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengubah data barang
function ubahBarang($data, $idstock_reject)
{
    global $db;

    // Ambil data dari form
    $kode = htmlspecialchars($data['kode']);
    $collection = htmlspecialchars($data['collection']);
    $kategori = htmlspecialchars($data['kategori']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock = htmlspecialchars($data['stock']);
    $harga = htmlspecialchars($data['harga']);
    $rak = htmlspecialchars($data['rak']);
    $lokasi = htmlspecialchars($data['lokasi']);
    $umur = htmlspecialchars($data['umur']);

    // Convert the date values to the correct format (YYYY-MM-DD)
   // $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));
   // $launching_date = date('Y-m-d', strtotime($launching_date));
   // $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query ubah barang
    $query = "UPDATE gudangreject SET kode = '$kode', collection = '$collection', kategori = '$kategori', article_name = '$article_name', size = '$size', stock = '$stock', 
    harga = '$harga', rak = '$rak', lokasi = '$lokasi', umur = '$umur' WHERE idstock_reject = $idstock_reject";
    
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengambil data barang berdasarkan ID
function getBarangById($idstock_reject) {
    global $db;
    $query = "SELECT * FROM gudangreject WHERE idstock_reject = $idstock_reject";
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
    $query = "DELETE FROM gudangreject WHERE idstock_reject = $id";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

//tampil username
function getNama($username) {
    global $db;
    $query = "SELECT nama FROM admin_manager WHERE username = '$username'";
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
    $insertQuery = "INSERT INTO gudangreject (kode, collection, kategori, article_name, size, stock, harga, rak, lokasi, umur)
                    VALUES (
                        '{$dataToCopy['kode']}',
                        '{$dataToCopy['collection']}',
                        '{$dataToCopy['kategori']}',
                        '{$dataToCopy['article_name']}',
                        '{$dataToCopy['size']}',
                        '{$dataToCopy['stock']}',
                        '{$dataToCopy['harga']}',
                        '{$dataToCopy['rak']}',
                        '{$dataToCopy['lokasi']}',
                        '{$dataToCopy['umur']}'
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