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
$stok_dikirim = $_POST["stok_dikirim"];

// Ambil data dari tabel gudangreject berdasarkan $idstock_reject
$query_gudangreject = "SELECT * FROM gudangreject WHERE idstock_reject = $idstock_reject";
$data_gudangreject = query($query_gudangreject);

if (!empty($data_gudangreject)) {
    // Ambil data dari tabel gudangreject
    $article_name = $data_gudangreject[0]["article_name"];
    $size = $data_gudangreject[0]["size"];
    $current_stock = $data_gudangreject[0]["stock"]; // Mengambil stok saat ini dari database

    // Memeriksa apakah stok saat ini mencukupi untuk pengiriman
    if ($current_stock >= $stok_dikirim && $current_stock > 0) {
        // Jika stok mencukupi, lakukan pengiriman
        $query_insert_barangkeluar = "INSERT INTO barangkeluar (tgl_brg_keluar, sj_keluar, gudang, article_name, size, stock, status, keterangan, idstock_reject) 
                                  VALUES (NOW(), '', 'Gudang Barang Reject', '$article_name', '$size', '$stok_dikirim', '', '', $idstock_reject)";

        if (mysqli_query($db, $query_insert_barangkeluar)) {
            // Data berhasil dikirimkan ke tabel barangkeluar

            // Update stok di gudangreject
            $query_update_stok = "UPDATE gudangreject SET stock = stock - $stok_dikirim WHERE idstock_reject = $idstock_reject";
            if (mysqli_query($db, $query_update_stok)) {
                // Jika stok berhasil diperbarui, tampilkan pesan sukses
                $pesan = "Data berhasil dikirimkan ke tabel barangkeluar dan stok berhasil diperbarui di gudangreject.";

                // Tampilkan pesan menggunakan JavaScript setelah data terkirim
                echo "<script>alert('$pesan'); window.location.href = 'gudangreject.php';</script>";
            } else {
                // Handle jika terjadi kesalahan saat memperbarui stok di gudangreject
                $pesan = "Terjadi kesalahan saat memperbarui stok di gudangreject: " . mysqli_error($db);

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
