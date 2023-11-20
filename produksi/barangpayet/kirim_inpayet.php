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

// Ambil data yang dikirimkan dari formulir
$idbarang_payet = $_POST["idbarang_payet"];

// Ambil data dari tabel barangpayet berdasarkan $idbarang_payet
$query_barangpayet = "SELECT * FROM barangpayet WHERE idbarang_payet = $idbarang_payet";
$data_barangpayet = query($query_barangpayet);

if (!empty($data_barangpayet)) {
    // Ambil data dari tabel barangpayet
    $launching_date = $data_barangpayet[0]["launching_date"];
    $collection = $data_barangpayet[0]["collection"];
    $article_name = $data_barangpayet[0]["article_name"];
    $size = $data_barangpayet[0]["size"];
    $stock = $data_barangpayet[0]["stock"];
    $vendor = $data_barangpayet[0]["vendor"];

    // Masukkan data ke dalam tabel baranginpayet
    $query_insert_baranginpayet = "INSERT INTO baranginpayet (tgl_brg_keluar, sj_for_vendor, launching_date, collection, article_name, size, stock_inpayet, stock_hasilpayet, vendor_payet,
     tgl_brg_masuk, sj_from_vendor, totalstock, status, idbarang_payet) 
                              VALUES (NOW(), '', '$launching_date', '$collection', '$article_name', '$size', '$stock', '', '$vendor', NOW(), '', '', 'On progress', $idbarang_payet)";

    if (mysqli_query($db, $query_insert_baranginpayet)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel baranginpayet.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel baranginpayet: " . mysqli_error($db);
    }
} else {
    // Handle jika data barangpayet tidak ditemukan
    $pesan = "Data barangpayet tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
