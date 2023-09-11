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
$idbarang_inrevisi = $_POST["idbarang_inrevisi"];

// Ambil data dari tabel baranginrevisi berdasarkan $idbarang_inrevisi
$query_baranginrevisi = "SELECT * FROM baranginrevisi WHERE idbarang_inrevisi = $idbarang_inrevisi";
$data_baranginrevisi = query($query_baranginrevisi);

if (!empty($data_baranginrevisi)) {
    // Ambil data dari tabel baranginrevisi
    $tgl_brg_masuk = $data_baranginrevisi[0]["tgl_brg_masuk"];
    $launching_date = $data_baranginrevisi[0]["launching_date"];
    $collection = $data_baranginrevisi[0]["collection"];
    $article_name = $data_baranginrevisi[0]["article_name"];
    $size = $data_baranginrevisi[0]["size"];
    $stock_hasilrevisi = $data_baranginrevisi[0]["stock_hasilrevisi"];
    $vendor_revisi = $data_baranginrevisi[0]["vendor_revisi"];

    // Masukkan data ke dalam tabel barangqc
    $query_insert_barangqc = "INSERT INTO barangqc (tgl_brg_masuk, launching_date, collection, article_name, size, stock, vendor, tgl_brg_keluar, sj_for_qc, idbarang_inrevisi) 
                              VALUES ('$tgl_brg_masuk', '$launching_date', '$collection', '$article_name', '$size', '$stock_hasilrevisi', '$vendor_revisi', NOW(), '', $idbarang_inrevisi)";
    
    if (mysqli_query($db, $query_insert_barangqc)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangqc.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangqc: " . mysqli_error($db);
    }
} else {
    // Handle jika data baranginrevisi tidak ditemukan
    $pesan = "Data baranginrevisi tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>