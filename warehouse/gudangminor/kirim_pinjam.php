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
$idstock_minor = $_POST["idstock_minor"];

// Ambil data dari tabel gudangminor berdasarkan $idstock_minor
$query_gudangminor = "SELECT * FROM gudangminor WHERE idstock_minor = $idstock_minor";
$data_gudangminor = query($query_gudangminor);

if (!empty($data_gudangminor)) {
    // Ambil data dari tabel gudangminor
    $article_name = $data_gudangminor[0]["article_name"];
    $size = $data_gudangminor[0]["size"];

    // Masukkan data ke dalam tabel barangpinjam
    $query_insert_barangpinjam = "INSERT INTO barangpinjam (tgl_brg_keluar, surat_retur, gudang, article_name, size, stock, dipinjam, idstock_minor) 
                              VALUES (NOW(), '', 'Gudang Barang Minor', '$article_name', '$size', '', '', $idstock_minor)";
    
    if (mysqli_query($db, $query_insert_barangpinjam)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel barangpinjam.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangpinjam: " . mysqli_error($db);
    }
} else {
    // Handle jika data gudangminor tidak ditemukan
    $pesan = "Data gudangminor tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>