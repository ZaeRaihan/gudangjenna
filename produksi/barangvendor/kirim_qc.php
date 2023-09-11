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
$idbarang_vendor = $_POST["idbarang_vendor"];

// Ambil data dari tabel barangvendor berdasarkan $idbarang_vendor
$query_barangvendor = "SELECT * FROM barangvendor WHERE idbarang_vendor = $idbarang_vendor";
$data_barangvendor = query($query_barangvendor);

if (!empty($data_barangvendor)) {
    // Ambil data dari tabel barangvendor
    $tgl_brg_masuk = $data_barangvendor[0]["tgl_brg_masuk"];
    $launching_date = $data_barangvendor[0]["launching_date"];
    $collection = $data_barangvendor[0]["collection"];
    $article_name = $data_barangvendor[0]["article_name"];
    $size = $data_barangvendor[0]["size"];
    $stock = $data_barangvendor[0]["stock"];
    $vendor = $data_barangvendor[0]["vendor"];

    // Masukkan data ke dalam tabel barangqc
    $query_insert_barangqc = "INSERT INTO barangqc (tgl_brg_masuk, launching_date, collection, article_name, size, stock, vendor, tgl_brg_keluar, sj_for_qc, idbarang_vendor) 
                              VALUES ('$tgl_brg_masuk', '$launching_date', '$collection', '$article_name', '$size', '$stock', '$vendor', NOW(), '', $idbarang_vendor)";
    
    if (mysqli_query($db, $query_insert_barangqc)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangqc.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangqc: " . mysqli_error($db);
    }
} else {
    // Handle jika data barangvendor tidak ditemukan
    $pesan = "Data barangvendor tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>