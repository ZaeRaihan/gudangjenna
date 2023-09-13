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
$idbarang_revisi = $_POST["idbarang_revisi"];

// Ambil data dari tabel barangrevisi berdasarkan $idbarang_revisi
$query_barangrevisi = "SELECT * FROM barangrevisi WHERE idbarang_revisi = $idbarang_revisi";
$data_barangrevisi = query($query_barangrevisi);

if (!empty($data_barangrevisi)) {
    // Ambil data dari tabel barangrevisi
    $launching_date = $data_barangrevisi[0]["launching_date"];
    $collection = $data_barangrevisi[0]["collection"];
    $article_name = $data_barangrevisi[0]["article_name"];
    $size = $data_barangrevisi[0]["size"];
    $stock = $data_barangrevisi[0]["stock"];
    $vendor = $data_barangrevisi[0]["vendor"];

    // Masukkan data ke dalam tabel baranginrevisi
    $query_insert_baranginrevisi = "INSERT INTO baranginrevisi (tgl_brg_keluar, sj_for_vendor, launching_date, collection, article_name, size, stock_inrevisi, stock_hasilrevisi, vendor_revisi,
     tgl_brg_masuk, sj_from_vendor, totalstock, status, idbarang_revisi) 
                              VALUES (NOW(), '', '$launching_date', '$collection', '$article_name', '$size', '$stock', '', '$vendor', NOW(), '', '', 'On progress', $idbarang_revisi)";

    if (mysqli_query($db, $query_insert_baranginrevisi)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel baranginrevisi.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel baranginrevisi: " . mysqli_error($db);
    }
} else {
    // Handle jika data barangrevisi tidak ditemukan
    $pesan = "Data barangrevisi tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>