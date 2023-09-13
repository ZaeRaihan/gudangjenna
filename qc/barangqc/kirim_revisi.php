<?php
// Koneksi ke databaseminor
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
$idbarang_qc = $_POST["idbarang_qc"];

// Ambil data dari tabel barangqc berdasarkan $idbarang_qc
$query_barangqc = "SELECT * FROM barangqc WHERE idbarang_qc = $idbarang_qc";
$data_barangqc = query($query_barangqc);

if (!empty($data_barangqc)) {
    // Ambil data dari tabel barangqc
    $tgl_brg_keluar = $data_barangqc[0]["tgl_brg_keluar"];
    $launching_date = $data_barangqc[0]["launching_date"];
    $collection = $data_barangqc[0]["collection"];
    $article_name = $data_barangqc[0]["article_name"];
    $size = $data_barangqc[0]["size"];
    $stock = $data_barangqc[0]["stock"];
    $vendor = $data_barangqc[0]["vendor"];

    // Masukkan data ke dalam tabel barangrevisi
    $query_insert_barangrevisi = "INSERT INTO barangrevisi (tgl_brg_masuk, launching_date, collection, article_name, size, stock, vendor, tgl_brg_keluar, sj_for_produksi, idbarang_qc) 
                              VALUES ('$tgl_brg_keluar', '$launching_date', '$collection', '$article_name', '$size', '', '$vendor', NOW(), '', $idbarang_qc)";
    
    if (mysqli_query($db, $query_insert_barangrevisi)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangrevisi.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangrevisi: " . mysqli_error($db);
    }
} else {
    // Handle jika data barangqc tidak ditemukan
    $pesan = "Data barangqc tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>