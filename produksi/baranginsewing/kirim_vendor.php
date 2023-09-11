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
$idbarang_insewing = $_POST["idbarang_insewing"];

// Ambil data dari tabel baranginsewing berdasarkan $idbarang_insewing
$query_baranginsewing = "SELECT * FROM baranginsewing WHERE idbarang_insewing = $idbarang_insewing";
$data_baranginsewing = query($query_baranginsewing);

if (!empty($data_baranginsewing)) {
    // Ambil data dari tabel baranginsewing
    $tgl_brg_masuk = $data_baranginsewing[0]["tgl_brg_masuk"];
    $sj_from_vendor = $data_baranginsewing[0]["sj_from_vendor"];
    $launching_date = $data_baranginsewing[0]["launching_date"];
    $collection = $data_baranginsewing[0]["collection"];
    $article_name = $data_baranginsewing[0]["article_name"];
    $size = $data_baranginsewing[0]["size"];
    $stock_hasilsewing = $data_baranginsewing[0]["stock_hasilsewing"];
    $vendor_sewing = $data_baranginsewing[0]["vendor_sewing"];

    // Masukkan data ke dalam tabel barangvendor
    $query_insert_barangvendor = "INSERT INTO barangvendor (tgl_brg_masuk, sj_from_vendor, launching_date, collection, article_name, size, stock, vendor, status, idbarang_insewing) 
                              VALUES ('$tgl_brg_masuk', '$sj_from_vendor', '$launching_date', '$collection', '$article_name', '$size', '$stock_hasilsewing', '$vendor_sewing', '', $idbarang_insewing)";
    
    if (mysqli_query($db, $query_insert_barangvendor)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangvendor.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangvendor: " . mysqli_error($db);
    }
} else {
    // Handle jika data baranginsewing tidak ditemukan
    $pesan = "Data baranginsewing tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>