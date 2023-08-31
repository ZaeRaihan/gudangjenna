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
    $tgl_brg_masuk = htmlspecialchars($data['tgl_brg_masuk']);
    $sj_from_vendor = htmlspecialchars($data['sj_from_vendor']);
    $launching_date = htmlspecialchars($data['launching_date']);
    $collection = htmlspecialchars($data['collection']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock = htmlspecialchars($data['stock']);
    $vendor = htmlspecialchars($data['vendor']);
    $status = htmlspecialchars($data['status']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));
    $launching_date = date('Y-m-d', strtotime($launching_date));
    // $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query tambah barang
    $query = "INSERT INTO barangvendor (tgl_brg_masuk, sj_from_vendor, launching_date, collection, article_name, size, stock, vendor, status) VALUES
    ('$tgl_brg_masuk',  '$sj_from_vendor' ,'$launching_date', '$collection', '$article_name', '$size', '$stock', '$vendor', '$status')";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengubah data barang
function ubahBarang($data, $idbarang_vendor)
{
    global $db;

    // Ambil data dari form
    $tgl_brg_masuk = htmlspecialchars($data['tgl_brg_masuk']);
    $sj_from_vendor = htmlspecialchars($data['sj_from_vendor']);
    $launching_date = htmlspecialchars($data['launching_date']);
    $collection = htmlspecialchars($data['collection']);
    $article_name = htmlspecialchars($data['article_name']);
    $size = htmlspecialchars($data['size']);
    $stock = htmlspecialchars($data['stock']);
    $vendor = htmlspecialchars($data['vendor']);
    $status = htmlspecialchars($data['status']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));
    $launching_date = date('Y-m-d', strtotime($launching_date));
    // $tgl_brg_keluar = date('Y-m-d', strtotime($tgl_brg_keluar));

    // Query ubah barang
    $query = "UPDATE barangvendor SET tgl_brg_masuk = '$tgl_brg_masuk', sj_from_vendor = '$sj_from_vendor ', launching_date = '$launching_date', collection = '$collection', article_name = '$article_name', size = '$size', stock = '$stock', vendor = '$vendor', status = '$status' WHERE idbarang_vendor = $idbarang_vendor";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengambil data barang berdasarkan ID
function getBarangById($idbarang_vendor)
{
    global $db;
    $query = "SELECT * FROM barangvendor WHERE idbarang_vendor = $idbarang_vendor";
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
    $query = "DELETE FROM barangvendor WHERE idbarang_vendor = $id";
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
    $insertQuery = "INSERT INTO barangvendor (tgl_brg_masuk, sj_from_vendor, launching_date, collection, article_name, size, stock, vendor, status)
                    VALUES (
                        '{$dataToCopy['tgl_brg_masuk']}',
                        '{$dataToCopy['sj_from_vendor']}',
                        '{$dataToCopy['launching_date']}',
                        '{$dataToCopy['collection']}',
                        '{$dataToCopy['article_name']}',
                        '{$dataToCopy['size']}',
                        '{$dataToCopy['stock']}',
                        '{$dataToCopy['vendor']}',
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
