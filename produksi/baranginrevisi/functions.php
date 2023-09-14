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

// Fungsi untuk menambahkan barang baru
function tambahBarang($data)
{
    global $db;

    // Ambil data dari form
    $tgl_brg_keluar = htmlspecialchars($data['tgl_brg_keluar']);
    $sj_for_vendor = htmlspecialchars($data['sj_for_vendor']);
    $launching_date = htmlspecialchars($data['launching_date']);
    $collection = htmlspecialchars($data['collection']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock_inrevisi = htmlspecialchars($data['stock_inrevisi']);
    $stock_hasilrevisi = htmlspecialchars($data['stock_hasilrevisi']);
    $vendor_revisi = htmlspecialchars($data['vendor_revisi']);
    $vendor_revisi_input = htmlspecialchars($data['vendor_revisi_input']);
    $tgl_brg_masuk = htmlspecialchars($data['tgl_brg_masuk']);
    $sj_from_vendor = htmlspecialchars($data['sj_from_vendor']);
    $totalstock = htmlspecialchars($data['totalstock']);
    $status = htmlspecialchars($data['status']);

    // Menggunakan ternary operator untuk memilih antara nilai dropdown atau input teks
    $vendor_revisiToUse = ($vendor_revisi === "LAINNYA") ? $vendor_revisi_input : $vendor_revisi;

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));
    $launching_date = date('Y-m-d', strtotime($launching_date));
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));

    // Query tambah barang
    $query = "INSERT INTO baranginrevisi (tgl_brg_keluar, sj_for_vendor, launching_date, collection, article_name, size, stock_inrevisi, stock_hasilrevisi, vendor_revisi, tgl_brg_masuk, sj_from_vendor, totalstock, status)
    VALUES ('$tgl_brg_keluar', '$sj_for_vendor', '$launching_date', '$collection', '$article_name', '$size', '$stock_inrevisi', '$stock_hasilrevisi', '$vendor_revisiToUse', '$tgl_brg_masuk', '$sj_from_vendor', '$totalstock', '$status')";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengubah data barang
function ubahBarang($data, $idbarang_inrevisi)
{
    global $db;

    // Ambil data dari form
    $tgl_brg_keluar = htmlspecialchars($data['tgl_brg_keluar']);
    $sj_for_vendor = htmlspecialchars($data['sj_for_vendor']);
    $launching_date = htmlspecialchars($data['launching_date']);
    $collection = htmlspecialchars($data['collection']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock_inrevisi = htmlspecialchars($data['stock_inrevisi']);
    $stock_hasilrevisi = htmlspecialchars($data['stock_hasilrevisi']);
    $vendor_revisi = htmlspecialchars($data['vendor_revisi']);
    if ($vendor_revisi === 'OTHER') {
        $otherVendor_revisi = htmlspecialchars($data['otherVendor_revisi']);
        $vendor_revisi = $otherVendor_revisi;
    }
    $tgl_brg_masuk = htmlspecialchars($data['tgl_brg_masuk']);
    $sj_from_vendor = htmlspecialchars($data['sj_from_vendor']);
    $status = htmlspecialchars($data['status']);

// Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));
    $launching_date = date('Y-m-d', strtotime($launching_date));
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));

    // Query untuk mendapatkan total stock masuk sebelum perubahan
    $query = "SELECT totalstock, stock_inrevisi FROM baranginrevisi WHERE idbarang_inrevisi = $idbarang_inrevisi";
    $result = mysqli_query($db, $query);
    $row = mysqli_fetch_assoc($result);
    $totalstock_sebelumnya = $row['totalstock'];

    // Tambahkan kondisi untuk memeriksa apakah total stock baru tidak sama dengan stock in revisi
    if ($totalstock_sebelumnya != $stock_inrevisi) {
        // Hitung total stock masuk baru berdasarkan perubahan stock hasil revisi
        $totalstock_baru = $totalstock_sebelumnya + $stock_hasilrevisi;
    } else {
        // Jika total stock sama dengan stock in revisi, maka total stock baru tetap sama dengan total stock sebelumnya
        $totalstock_baru = $totalstock_sebelumnya;
    }

    // Tambahkan kondisi untuk mengubah status menjadi 'Finished' jika total stock sudah mencapai atau melebihi stock in revisi
    $status = ($totalstock_baru >= $stock_inrevisi) ? 'Finished' : $status;

    // Query ubah barang
    $query = "UPDATE baranginrevisi SET 
        tgl_brg_keluar = '$tgl_brg_keluar',
        sj_for_vendor = '$sj_for_vendor',
        launching_date = '$launching_date',
        collection = '$collection',
        article_name = '$article_name',
        size = '$size',
        stock_inrevisi = '$stock_inrevisi',
        stock_hasilrevisi = '$stock_hasilrevisi',
        vendor_revisi = '$vendor_revisi',
        tgl_brg_masuk = '$tgl_brg_masuk',
        sj_from_vendor = '$sj_from_vendor',
        totalstock = '$totalstock_baru',
        status = '$status'
    WHERE idbarang_inrevisi = $idbarang_inrevisi";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengambil data barang berdasarkan ID
function getBarangById($idbarang_inrevisi)
{
    global $db;
    $query = "SELECT * FROM baranginrevisi WHERE idbarang_inrevisi = $idbarang_inrevisi";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $barang = mysqli_fetch_assoc($result);
        return $barang;
    } else {
        return false;
    }
}

// Fungsi untuk menghapus barang
function hapusBarang($id)
{
    global $db;

    // Query hapus barang
    $query = "DELETE FROM baranginrevisi WHERE idbarang_inrevisi = $id";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

//tampil username
function getNama($username)
{
    global $db;
    $query = "SELECT nama FROM admin_produksi WHERE username = '$username'";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        return $user['nama'];
    } else {
        return "Nama Tidak Ditemukan";
    }
}

// Fungsi untuk menyalin data sebagai data baru
function proses_copy($id)
{
    global $db;

    $dataToCopy = getBarangById($id);

    if (!$dataToCopy) {
        return false; // Data tidak ditemukan
    }

    // Insert the copied data as a new entry
    $insertQuery = "INSERT INTO baranginrevisi (tgl_brg_keluar, sj_for_vendor, launching_date, collection, article_name, size, stock_inrevisi, stock_hasilrevisi, vendor_revisi, tgl_brg_masuk, sj_from_vendor, totalstock, status)
                    VALUES (
                        '{$dataToCopy['tgl_brg_keluar']}',
                        '{$dataToCopy['sj_for_vendor']}',
                        '{$dataToCopy['launching_date']}',
                        '{$dataToCopy['collection']}',
                        '{$dataToCopy['article_name']}',
                        '{$dataToCopy['size']}',
                        '{$dataToCopy['stock_inrevisi']}',
                        '{$dataToCopy['stock_hasilrevisi']}',
                        '{$dataToCopy['vendor_revisi']}',
                        '{$dataToCopy['tgl_brg_masuk']}',
                        '{$dataToCopy['sj_from_vendor']}',
                        '{$dataToCopy['totalstock']}',
                        '{$dataToCopy['status']}'
                    )";

    $result = mysqli_query($db, $insertQuery);

    if ($result) {
        return true;
    } else {
        return false;
    }
}
// Fungsi untuk membuat format tanggal
function formatDate($dateString)
{
    $timestamp = strtotime($dateString);
    return date('d F Y', $timestamp);
}