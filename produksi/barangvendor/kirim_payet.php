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

    // Masukkan data ke dalam tabel barangpayet
    $query_insert_barangpayet = "INSERT INTO barangpayet (tgl_brg_masuk, launching_date, collection, article_name, size, stock, vendor, idbarang_vendor) 
                              VALUES ('$tgl_brg_masuk', '$launching_date', '$collection', '$article_name', '$size', '$stock', '$vendor', $idbarang_vendor)";

    if (mysqli_query($db, $query_insert_barangpayet)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangpayet.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangpayet: " . mysqli_error($db);
    }
} else {
    // Handle jika data barangvendor tidak ditemukan
    $pesan = "Data barangvendor tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>