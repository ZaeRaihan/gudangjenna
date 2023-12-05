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
$idstock = $_POST["idstock"];
$stok_dikirim = $_POST["stok_dikirim"];

// Ambil data dari tabel stockgudang berdasarkan $idstock
$query_stockgudang = "SELECT * FROM stockgudang WHERE idstock = $idstock";
$data_stockgudang = query($query_stockgudang);

if (!empty($data_stockgudang)) {
    // Ambil data dari tabel stockgudang
    $article_name = $data_stockgudang[0]["article_name"];
    $size = $data_stockgudang[0]["size"];

    // Masukkan data ke dalam tabel barangpinjam
    $query_insert_barangpinjam = "INSERT INTO barangpinjam (tgl_brg_keluar, surat_retur, gudang, article_name, size, stock, dipinjam, idstock) 
                              VALUES (NOW(), '', 'Stock Gudang', '$article_name', '$size', '$stok_dikirim', '', $idstock)";

    if (mysqli_query($db, $query_insert_barangpinjam)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangpinjam.";

        // Tampilkan pesan menggunakan JavaScript setelah data terkirim
        echo "<script>alert('$pesan'); window.location.href = 'stockgudang.php';</script>";
        // Ganti 'nama_halaman_tujuan.php' dengan halaman tujuan setelah data terkirim
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangpinjam: " . mysqli_error($db);

        // Tampilkan pesan kesalahan menggunakan JavaScript
        echo "<script>alert('$pesan'); window.history.back();</script>";
    }
} else {
    // Handle jika data stock gudang tidak ditemukan
    $pesan = "Data stock gudang tidak ditemukan.";

    // Tampilkan pesan menggunakan JavaScript
    echo "<script>alert('$pesan'); window.history.back();</script>";
}
