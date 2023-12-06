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
$idbarang_minor = $_POST["idbarang_minor"];

// Ambil data dari tabel barang_minor berdasarkan $idbarang_minor
$query_barang_minor = "SELECT * FROM barang_minor WHERE idbarang_minor = $idbarang_minor";
$data_barang_minor = query($query_barang_minor);

if (!empty($data_barang_minor)) {
    // Ambil data dari tabel barang_minor
    $collection = $data_barang_minor[0]["collection"];
    $article_name = $data_barang_minor[0]["article_name"];
    $size = $data_barang_minor[0]["size"];
    $stock = $data_barang_minor[0]["stock"];

    // Periksa apakah data dengan article_name dan size tersebut sudah ada di tabel gudangminor
    $query_check_existence = "SELECT * FROM gudangminor WHERE article_name = '$article_name' AND size = '$size'";
    $existing_data = query($query_check_existence);

    if (empty($existing_data)) {
        // Jika data belum ada, lakukan INSERT ke tabel gudangminor
        $query_insert_gudangminor = "INSERT INTO gudangminor (kode, collection, kategori, article_name, size, stock, harga, rak, lokasi, umur, idbarang_minor) 
                                  VALUES ('', '$collection', '', '$article_name', '$size', '$stock', '', '', '', '0 - 3 bulan', $idbarang_minor)";
        if (mysqli_query($db, $query_insert_gudangminor)) {
            // Data berhasil ditambahkan ke gudangminor
            $pesan = "Data berhasil ditambahkan ke tabel gudangminor.";
        } else {
            // Handle jika terjadi kesalahan saat memasukkan data
            $pesan = "Terjadi kesalahan saat menambahkan data ke tabel gudangminor: " . mysqli_error($db);
        }
    } else {
        // Jika data sudah ada, lakukan UPDATE stok di tabel gudangminor
        $existing_stock = $existing_data[0]["stock"];
        $updated_stock = $existing_stock + $stock;

        $query_update_gudangminor = "UPDATE gudangminor SET stock = $updated_stock WHERE article_name = '$article_name' AND size = '$size'";
        if (mysqli_query($db, $query_update_gudangminor)) {
            // Stok berhasil diperbarui di gudangminor
            $pesan = "Stok berhasil diperbarui di tabel gudangminor.";
        } else {
            // Handle jika terjadi kesalahan saat mengupdate stok
            $pesan = "Terjadi kesalahan saat mengupdate stok di tabel gudangminor: " . mysqli_error($db);
        }
    }
} else {
    // Handle jika data barang_minor tidak ditemukan
    $pesan = "Data barang_minor tidak ditemukan.";
}

// Tampilkan pesan menggunakan JavaScript dan tetap berada pada halaman saat ini
echo "<script>alert('$pesan'); window.history.back();</script>";
