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
    $stock_inpayet = htmlspecialchars($data['stock_inpayet']);
    $stock_hasilpayet = htmlspecialchars($data['stock_hasilpayet']);
    $vendor_payet = htmlspecialchars($data['vendor_payet']);
    $tgl_brg_masuk = htmlspecialchars($data['tgl_brg_masuk']);
    $sj_from_vendor = htmlspecialchars($data['sj_from_vendor']);
    $totalstock = htmlspecialchars($data['totalstock']);
    $status = htmlspecialchars($data['status']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));
    $launching_date = date('Y-m-d', strtotime($launching_date));
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));

    // Query tambah barang
    $query = "INSERT INTO baranginpayet (tgl_brg_keluar, sj_for_vendor, launching_date, collection, article_name, size, stock_inpayet, stock_hasilpayet, vendor_payet, tgl_brg_masuk, sj_from_vendor, totalstock, status)
    VALUES ('$tgl_brg_keluar', '$sj_for_vendor', '$launching_date', '$collection', '$article_name', '$size', '$stock_inpayet', '$stock_hasilpayet', '$vendor_payet', '$tgl_brg_masuk', '$sj_from_vendor', '$totalstock', '$status')";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengubah data barang
function ubahBarang($data, $idbarang_inpayet)
{
    global $db;

    // Ambil data dari form
    $tgl_brg_keluar = htmlspecialchars($data['tgl_brg_keluar']);
    $sj_for_vendor = htmlspecialchars($data['sj_for_vendor']);
    $launching_date = htmlspecialchars($data['launching_date']);
    $collection = htmlspecialchars($data['collection']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock_inpayet = htmlspecialchars($data['stock_inpayet']);
    $stock_hasilpayet = htmlspecialchars($data['stock_hasilpayet']);
    $vendor_payet = htmlspecialchars($data['vendor_payet']);
    $tgl_brg_masuk = htmlspecialchars($data['tgl_brg_masuk']);
    $sj_from_vendor = htmlspecialchars($data['sj_from_vendor']);
    $status = htmlspecialchars($data['status']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));
    $launching_date = date('Y-m-d', strtotime($launching_date));
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));

    // Query untuk mendapatkan total stock masuk sebelum perubahan
    $query = "SELECT totalstock, stock_inpayet FROM baranginpayet WHERE idbarang_inpayet = $idbarang_inpayet";
    $result = mysqli_query($db, $query);
    $row = mysqli_fetch_assoc($result);
    $totalstock_sebelumnya = $row['totalstock'];
    $stock_inpayet_sebelumnya = $row['stock_inpayet'];

    // Tambahkan kondisi untuk memeriksa apakah total stock baru tidak sama dengan stock in payet
    if ($totalstock_sebelumnya != $stock_inpayet) {
        // Hitung total stock masuk baru berdasarkan perubahan stock hasil payet
        $totalstock_baru = $totalstock_sebelumnya + $stock_hasilpayet;
    } else {
        // Jika total stock sama dengan stock in payet, maka total stock baru tetap sama dengan total stock sebelumnya
        $totalstock_baru = $totalstock_sebelumnya;
    }

    // Query ubah barang
    $query = "UPDATE baranginpayet SET 
        tgl_brg_keluar = '$tgl_brg_keluar',
        sj_for_vendor = '$sj_for_vendor',
        launching_date = '$launching_date',
        collection = '$collection',
        article_name = '$article_name',
        size = '$size',
        stock_inpayet = '$stock_inpayet',
        stock_hasilpayet = '$stock_hasilpayet',
        vendor_payet = '$vendor_payet',
        tgl_brg_masuk = '$tgl_brg_masuk',
        sj_from_vendor = '$sj_from_vendor',
        totalstock = '$totalstock_baru',
        status = '$status'
    WHERE idbarang_inpayet = $idbarang_inpayet";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengambil data barang berdasarkan ID
function getBarangById($idbarang_inpayet)
{
    global $db;
    $query = "SELECT * FROM baranginpayet WHERE idbarang_inpayet = $idbarang_inpayet";
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
    $query = "DELETE FROM baranginpayet WHERE idbarang_inpayet = $id";
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
    $insertQuery = "INSERT INTO baranginpayet (tgl_brg_keluar, sj_for_vendor, launching_date, collection, article_name, size, stock_inpayet, stock_hasilpayet, vendor_payet, tgl_brg_masuk, sj_from_vendor, totalstock, status)
                    VALUES (
                        '{$dataToCopy['tgl_brg_keluar']}',
                        '{$dataToCopy['sj_for_vendor']}',
                        '{$dataToCopy['launching_date']}',
                        '{$dataToCopy['collection']}',
                        '{$dataToCopy['article_name']}',
                        '{$dataToCopy['size']}',
                        '{$dataToCopy['stock_inpayet']}',
                        '{$dataToCopy['stock_hasilpayet']}',
                        '{$dataToCopy['vendor_payet']}',
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