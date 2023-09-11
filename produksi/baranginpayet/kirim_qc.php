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
$idbarang_inpayet = $_POST["idbarang_inpayet"];

// Ambil data dari tabel baranginpayet berdasarkan $idbarang_inpayet
$query_baranginpayet = "SELECT * FROM baranginpayet WHERE idbarang_inpayet = $idbarang_inpayet";
$data_baranginpayet = query($query_baranginpayet);

if (!empty($data_baranginpayet)) {
    // Ambil data dari tabel baranginpayet
    $tgl_brg_masuk = $data_baranginpayet[0]["tgl_brg_masuk"];
    $launching_date = $data_baranginpayet[0]["launching_date"];
    $collection = $data_baranginpayet[0]["collection"];
    $article_name = $data_baranginpayet[0]["article_name"];
    $size = $data_baranginpayet[0]["size"];
    $stock_hasilpayet = $data_baranginpayet[0]["stock_hasilpayet"];
    $vendor_payet = $data_baranginpayet[0]["vendor_payet"];

    // Masukkan data ke dalam tabel barangqc
    $query_insert_barangqc = "INSERT INTO barangqc (tgl_brg_masuk, launching_date, collection, article_name, size, stock, vendor, tgl_brg_keluar, sj_for_qc, idbarang_inpayet) 
                              VALUES ('$tgl_brg_masuk', '$launching_date', '$collection', '$article_name', '$size', '$stock_hasilpayet', '$vendor_payet', NOW(), '', $idbarang_inpayet)";
    
    if (mysqli_query($db, $query_insert_barangqc)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangqc.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangqc: " . mysqli_error($db);
    }
} else {
    // Handle jika data baranginpayet tidak ditemukan
    $pesan = "Data baranginpayet tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>