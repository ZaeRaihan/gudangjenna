<?php

// Koneksi ke database
$db = mysqli_connect("localhost", "root", "", "gudangjenna");
function query($query)
{
    global $db;
    $result = mysqli_query($db, $query);
    if (!$result) {
        die("Query failed: " . mysqli_error($db));
    }
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
    $kode = htmlspecialchars($data['kode']);
    $nama = htmlspecialchars($data['nama']);
    $warna = htmlspecialchars($data['warna']);
    $inyard = htmlspecialchars($data['inyard']);
    $stock = htmlspecialchars($data['stock']);
    $harga = htmlspecialchars($data['harga']);
    $supplier = htmlspecialchars($data['supplier']);
    $status = htmlspecialchars($data['status']);


    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));

    // Query tambah barang
    $query = "INSERT INTO barangbaku (tgl_brg_masuk, kode, nama, warna, inyard, stock, harga, supplier, status) VALUES 
    ('$tgl_brg_masuk', '$kode', '$nama', '$warna', '$inyard', '$stock', '$harga', '$supplier', '$status')";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengubah data barang
function ubahBarang($data, $idbarang_baku)
{
    global $db;

    // Ambil data dari form
    $tgl_brg_masuk = htmlspecialchars($data['tgl_brg_masuk']);
    $kode = htmlspecialchars($data['kode']);
    $nama = htmlspecialchars($data['nama']);
    $warna = htmlspecialchars($data['warna']);
    $inyard = htmlspecialchars($data['inyard']);
    $stock = htmlspecialchars($data['stock']);
    $harga = htmlspecialchars($data['harga']);
    $supplier = htmlspecialchars($data['supplier']);
    $status = htmlspecialchars($data['status']);

    // Convert the date values to the correct format (YYYY-MM-DD)
    $tgl_brg_masuk = date('Y-m-d', strtotime($tgl_brg_masuk));

    // Query ubah barang
    $query = "UPDATE barangbaku SET tgl_brg_masuk = '$tgl_brg_masuk', kode = '$kode', nama = '$nama', warna = '$warna',  inyard = '$inyard', stock = '$stock', harga = '$harga',
    supplier = '$supplier', status = '$status' WHERE idbarang_baku = $idbarang_baku";

    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk mengambil data barang berdasarkan ID
function getBarangById($idbarang_baku)
{
    global $db;
    $query = "SELECT * FROM barangbaku WHERE idbarang_baku = $idbarang_baku";
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
    $query = "DELETE FROM barangbaku WHERE idbarang_baku = $id";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

//tampil username
function getNama($username)
{
    global $db;
    $query = "SELECT nama FROM admin WHERE username = '$username' AND role = 'produksi'";
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
    $insertQuery = "INSERT INTO barangbaku (tgl_brg_masuk, kode, nama, warna, inyard, stock, harga, supplier, status)
                    VALUES (
                        '{$dataToCopy['tgl_brg_masuk']}',
                        '{$dataToCopy['kode']}',
                        '{$dataToCopy['nama']}',
                        '{$dataToCopy['warna']}',
                        '{$dataToCopy['inyard']}',
                        '{$dataToCopy['stock']}',
                        '{$dataToCopy['harga']}',
                        '{$dataToCopy['supplier']}',
                        '{$dataToCopy['status']}')
                        ";

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

function format_rupiah($angka)
{
    return 'Rp ' . number_format($angka, 0, ',', '.');
}