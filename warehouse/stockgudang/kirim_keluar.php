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
    $current_stock = $data_stockgudang[0]["stock"]; // Mengambil stok saat ini dari database

    // Memeriksa apakah stok saat ini mencukupi untuk pengiriman
    if ($current_stock >= $stok_dikirim && $current_stock > 0) {
        // Jika stok mencukupi, lakukan pengiriman
        $query_insert_barangkeluar = "INSERT INTO barangkeluar (tgl_brg_keluar, sj_keluar, gudang, article_name, size, stock, status, keterangan, idstock) 
                                  VALUES (NOW(), '', 'Stock Gudang', '$article_name', '$size', '$stok_dikirim', '', '', $idstock)";

        if (mysqli_query($db, $query_insert_barangkeluar)) {
            // Data berhasil dikirimkan ke tabel barangkeluar

            // Update stok di stockgudang
            $query_update_stok = "UPDATE stockgudang SET stock = stock - $stok_dikirim WHERE idstock = $idstock";
            if (mysqli_query($db, $query_update_stok)) {
                // Jika stok berhasil diperbarui, tampilkan pesan sukses
                $pesan = "Data berhasil dikirimkan ke tabel barangkeluar dan stok berhasil diperbarui di stockgudang.";

                // Tampilkan pesan menggunakan JavaScript setelah data terkirim
                echo "<script>alert('$pesan'); window.location.href = 'stockgudang.php';</script>";
            } else {
                // Handle jika terjadi kesalahan saat memperbarui stok di stockgudang
                $pesan = "Terjadi kesalahan saat memperbarui stok di stockgudang: " . mysqli_error($db);

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
}
