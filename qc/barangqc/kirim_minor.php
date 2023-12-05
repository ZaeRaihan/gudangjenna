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
$idbarang_qc = $_POST["idbarang_qc"];
$stok_dikirim = $_POST["stok_dikirim"];

// Ambil data dari tabel barangqc berdasarkan $idbarang_qc
$query_barangqc = "SELECT * FROM barangqc WHERE idbarang_qc = $idbarang_qc";
$data_barangqc = query($query_barangqc);

if (!empty($data_barangqc)) {
    $tgl_brg_keluar = $data_barangqc[0]["tgl_brg_keluar"];
    $launching_date = $data_barangqc[0]["launching_date"];
    $collection = $data_barangqc[0]["collection"];
    $article_name = $data_barangqc[0]["article_name"];
    $size = $data_barangqc[0]["size"];
    $stock = $data_barangqc[0]["stock"];

    // Memeriksa apakah stok yang akan dikirim tidak melebihi stok yang ada pada barangqc
    if ($stok_dikirim <= $stock && $stok_dikirim > 0) {
        // Jika stok yang akan dikirim tidak melebihi stok yang ada pada barangqc dan jumlah stok yang dikirim lebih dari 0, lakukan pengiriman ke tabel barang_minor
        $query_insert_barang_minor = "INSERT INTO barang_minor (tgl_brg_masuk, launching_date, collection, article_name, size, stock, tgl_brg_keluar, sj_for_wh, idbarang_qc) 
                                  VALUES ('$tgl_brg_keluar', '$launching_date', '$collection', '$article_name', '$size', '$stok_dikirim', NOW(), '', $idbarang_qc)";

        if (mysqli_query($db, $query_insert_barang_minor)) {
            // Data berhasil dikirimkan
            $pesan = "Data berhasil dikirimkan ke tabel barang_minor.";

            // Tampilkan pesan menggunakan JavaScript setelah data terkirim
            echo "<script>alert('$pesan'); window.location.href = 'barangqc.php';</script>";
            // Ganti 'nama_halaman_tujuan.php' dengan halaman tujuan setelah data terkirim
        } else {
            // Handle jika terjadi kesalahan saat memasukkan data
            $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barang_minor: " . mysqli_error($db);

            // Tampilkan pesan kesalahan menggunakan JavaScript
            echo "<script>alert('$pesan'); window.history.back();</script>";
        }
    } else {
        // Handle jika stok yang dikirim melebihi atau sama dengan stok yang ada pada barangqc, atau stok yang dikirim kurang dari 1
        $pesan = "Stok yang akan dikirim tidak valid atau melebihi stok yang ada pada barangqc.";

        // Tampilkan pesan kesalahan menggunakan JavaScript
        echo "<script>alert('$pesan'); window.history.back();</script>";
    }
} else {
    // Handle jika data barangqc tidak ditemukan
    $pesan = "Data barangqc tidak ditemukan.";

    // Tampilkan pesan menggunakan JavaScript
    echo "<script>alert('$pesan'); window.history.back();</script>";
}
