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
$idbarang_baku = $_POST["idbarang_baku"];

// Ambil data dari tabel barangbaku berdasarkan $idbarang_baku
$query_barangbaku = "SELECT * FROM barangbaku WHERE idbarang_baku = $idbarang_baku";
$data_barangbaku = query($query_barangbaku);

if (!empty($data_barangbaku)) {
    // Ambil data dari tabel barangbaku
    $nama = $data_barangbaku[0]["nama"];
    $inyard = $data_barangbaku[0]["inyard"];
    $stock = $data_barangbaku[0]["stock"];

    // Masukkan data ke dalam tabel baranginsewing
    $query_insert_baranginsewing = "INSERT INTO baranginsewing (tgl_brg_keluar, sj_for_vendor, nama, inyard, stock_insewing, launching_date, collection, article_name, size, stock_hasilsewing, vendor_sewing,
     tgl_brg_masuk, sj_from_vendor, status, idbarang_baku) 
                              VALUES (NOW(), '', '$nama', '$inyard', '$stock', NOW(), '$collection', '$article_name', '$size', '', '', NOW(), '', 'On progress', $idbarang_baku)";

    if (mysqli_query($db, $query_insert_baranginsewing)) {
        // Data berhasil dikirimkan
        $pesan = "Data berhasil dikirimkan ke tabel baranginsewing.";
    } else {
        // Handle jika terjadi kesalahan saat memasukkan data
        $pesan = "Terjadi kesalahan saat memasukkan data ke tabel baranginsewing: " . mysqli_error($db);
    }
} else {
    // Handle jika data barangbaku tidak ditemukan
    $pesan = "Data barangbaku tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
?>