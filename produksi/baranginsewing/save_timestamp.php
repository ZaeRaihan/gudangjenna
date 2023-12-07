<?php
// Hubungkan ke database
$servername = "localhost";
$username = "root";
$password = "";
$database = "gudangjenna";

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Set zona waktu ke WIB (Waktu Indonesia Barat)
date_default_timezone_set('Asia/Jakarta');

// Ambil data yang dikirim dari JavaScript
$data = json_decode(file_get_contents("php://input"));

if ($data) {
    // Lakukan iterasi untuk setiap baris yang dipilih
    foreach ($data->selectedRows as $idbarang_insewing) {
        // Simpan timestamp pada tabel baranginsewing untuk setiap idbarang_insewing
        $timestamp = date('Y-m-d H:i:s'); // Timestamp saat ini dalam zona waktu Indonesia Barat

        // Lakukan query untuk menyimpan timestamp pada tabel baranginsewing
        $query = "UPDATE baranginsewing SET print_timestamp = '$timestamp' WHERE idbarang_insewing = $idbarang_insewing";

        if ($conn->query($query) === TRUE) {
            // Berhasil menyimpan timestamp
        } else {
            echo "Error: " . $query . "<br>" . $conn->error;
        }
    }
    http_response_code(200); // Berhasil
} else {
    http_response_code(400); // Permintaan tidak valid
}

// Tutup koneksi ke database
$conn->close();
