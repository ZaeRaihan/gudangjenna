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

// Ambil data dari tabel stockgudang berdasarkan $idstock
$query_stockgudang = "SELECT * FROM stockgudang WHERE idstock = $idstock";
$data_stockgudang = query($query_stockgudang);

if (!empty($data_stockgudang)) {
    // Ambil data dari tabel stockgudang
    $article_name = $data_stockgudang[0]["article_name"];
    $size = $data_stockgudang[0]["size"];

    // Masukkan data ke dalam tabel barangpinjam
    $query_insert_barangpinjam = "INSERT INTO barangpinjam (tgl_brg_keluar, surat_retur, article_name, size, stock, dipinjam, idstock) 
                              VALUES (NOW(), '', '$article_name', '$size', '', '', $idstock)";
    
    if (mysqli_query($db, $query_insert_barangpinjam)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangpinjam.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangpinjam: " . mysqli_error($db);
    }
} else {
    // Handle jika data stockgudang tidak ditemukan
    $pesan = "Data stockgudang tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>