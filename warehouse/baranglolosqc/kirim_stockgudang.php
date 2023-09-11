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
$idbarang_lolosqc = $_POST["idbarang_lolosqc"];

// Ambil data dari tabel barang_lolosqc berdasarkan $idbarang_lolosqc
$query_barang_lolosqc = "SELECT * FROM barang_lolosqc WHERE idbarang_lolosqc = $idbarang_lolosqc";
$data_barang_lolosqc = query($query_barang_lolosqc);

if (!empty($data_barang_lolosqc)) {
    // Ambil data dari tabel barang_lolosqc
    $collection = $data_barang_lolosqc[0]["collection"];
    $article_name = $data_barang_lolosqc[0]["article_name"];
    $size = $data_barang_lolosqc[0]["size"];
    $stock = $data_barang_lolosqc[0]["stock"];

    // Masukkan data ke dalam tabel stockgudang
    $query_insert_stockgudang = "INSERT INTO stockgudang (kode, collection, kategori, article_name, size, stock, harga, rak, lokasi, umur, idbarang_lolosqc) 
                              VALUES ('', '$collection', '', '$article_name', '$size', '$stock', '', '', '', '0 - 3 bulan', $idbarang_lolosqc)";
    
    if (mysqli_query($db, $query_insert_stockgudang)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel stockgudang.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel stockgudang: " . mysqli_error($db);
    }
} else {
    // Handle jika data barang_lolosqc tidak ditemukan
    $pesan = "Data barang_lolosqc tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>