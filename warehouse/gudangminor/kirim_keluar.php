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
$stok_dikirim = $_POST["stok_dikirim"];

// Ambil data dari tabel gudangminor berdasarkan $idstock_minor
$query_gudangminor = "SELECT * FROM gudangminor WHERE idstock_minor = $idstock_minor";
$data_gudangminor = query($query_gudangminor);

if (!empty($data_gudangminor)) {
    // Ambil data dari tabel gudangminor
    $article_name = $data_gudangminor[0]["article_name"];
    $size = $data_gudangminor[0]["size"];
    $current_stock = $data_gudangminor[0]["stock"]; // Mengambil stok saat ini dari database

    // Memeriksa apakah stok saat ini mencukupi untuk pengiriman
    if ($current_stock >= $stok_dikirim && $current_stock > 0) {
        // Jika stok mencukupi, lakukan pengiriman
        $query_insert_barangkeluar = "INSERT INTO barangkeluar (tgl_brg_keluar, sj_keluar, gudang, article_name, size, stock, status, keterangan, idstock_minor) 
                                  VALUES (NOW(), '', 'Gudang Barang Minor', '$article_name', '$size', '$stok_dikirim', '', '', $idstock_minor)";

        if (mysqli_query($db, $query_insert_barangkeluar)) {
            // Data berhasil dikirimkan ke tabel barangkeluar

            // Update stok di gudangminor
            $query_update_stok = "UPDATE gudangminor SET stock = stock - $stok_dikirim WHERE idstock_minor = $idstock_minor";
            if (mysqli_query($db, $query_update_stok)) {
                // Jika stok berhasil diperbarui, tampilkan pesan sukses
                $pesan = "Data berhasil dikirimkan ke tabel barangkeluar dan stok berhasil diperbarui di gudangminor.";

                // Tampilkan pesan menggunakan JavaScript setelah data terkirim
                echo "<script>alert('$pesan'); window.location.href = 'gudangminor.php';</script>";
            } else {
                // Handle jika terjadi kesalahan saat memperbarui stok di gudangminor
                $pesan = "Terjadi kesalahan saat memperbarui stok di gudangminor: " . mysqli_error($db);

                // Tampilkan pesan kesalahan menggunakan JavaScript
                echo "<script>alert('$pesan'); window.history.back();</script>";
            }
        } else {
            // Handle jika terjadi kesalahan saat memasukkan data ke barangkeluar
            $pesan = "Terjadi kesalahan saat memasukkan data ke tabel barangkeluar: " . mysqli_error($db);

            // Tampilkan pesan kesalahan menggunakan JavaScript
            echo "<script>alert('$pesan'); window.history.back();</script>";
        }
    } else {
        // Handle jika stok tidak mencukupi untuk pengiriman
        $pesan = "Stok tidak mencukupi untuk melakukan pengiriman.";

        // Tampilkan pesan kesalahan menggunakan JavaScript
        echo "<script>alert('$pesan'); window.history.back();</script>";
    }
} else {
    // Handle jika data stock gudang tidak ditemukan
    $pesan = "Data stock gudang tidak ditemukan.";

    // Tampilkan pesan menggunakan JavaScript
    echo "<script>alert('$pesan'); window.history.back();</script>";
}
