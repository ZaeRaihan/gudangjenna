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
$idbarang_reject = $_POST["idbarang_reject"];

// Ambil data dari tabel barang_reject berdasarkan $idbarang_reject
$query_barang_reject = "SELECT * FROM barang_reject WHERE idbarang_reject = $idbarang_reject";
$data_barang_reject = query($query_barang_reject);

if (!empty($data_barang_reject)) {
    // Ambil data dari tabel barang_reject
    $collection = $data_barang_reject[0]["collection"];
    $article_name = $data_barang_reject[0]["article_name"];
    $size = $data_barang_reject[0]["size"];
    $stock = $data_barang_reject[0]["stock"];

    // Masukkan data ke dalam tabel gudangreject
    $query_insert_gudangreject = "INSERT INTO gudangreject (kode, collection, kategori, article_name, size, stock, harga, rak, lokasi, umur, idbarang_reject) 
                              VALUES ('', '$collection', '', '$article_name', '$size', '$stock', '', '', '', '0 - 3 bulan', $idbarang_reject)";
    
    if (mysqli_query($db, $query_insert_gudangreject)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel gudangreject.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel gudangreject: " . mysqli_error($db);
    }
} else {
    // Handle jika data barang_reject tidak ditemukan
    $pesan = "Data barang_reject tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>