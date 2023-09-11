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
$idstock_reject = $_POST["idstock_reject"];

// Ambil data dari tabel gudangreject berdasarkan $idstock_reject
$query_gudangreject = "SELECT * FROM gudangreject WHERE idstock_reject = $idstock_reject";
$data_gudangreject = query($query_gudangreject);

if (!empty($data_gudangreject)) {
    // Ambil data dari tabel gudangreject
    $article_name = $data_gudangreject[0]["article_name"];
    $size = $data_gudangreject[0]["size"];

    // Masukkan data ke dalam tabel barangkeluar
    $query_insert_barangkeluar = "INSERT INTO barangkeluar (tgl_brg_keluar, sj_keluar, gudang, article_name, size, stock, status, keterangan, idstock_reject) 
                              VALUES (NOW(), '', 'Gudang Barang Reject', '$article_name', '$size', '', '', '', $idstock_reject)";
    
    if (mysqli_query($db, $query_insert_barangkeluar)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangkeluar.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangkeluar: " . mysqli_error($db);
    }
} else {
    // Handle jika data gudangreject tidak ditemukan
    $pesan = "Data gudangreject tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>