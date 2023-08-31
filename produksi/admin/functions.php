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

// Fungsi untuk menambahkan admin baru
function tambahAdmin($data) {
    global $db;

    $username = htmlspecialchars($data['username']);
    $password = password_hash($data['password'], PASSWORD_DEFAULT); // Enkripsi password
    $nama = htmlspecialchars($data['nama']);
    $telepon = htmlspecialchars($data['telepon']);

    // Upload foto
    $foto = uploadFoto();

    if (!$foto) {
        return false; // Jika upload foto gagal, hentikan proses tambahAdmin
    }

    // Query tambah admin
    $query = "INSERT INTO admin_produksi(username, password, nama, telepon, foto) VALUES ('$username', '$password', '$nama', '$telepon', '$foto')";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk menambahkan upload foto
function uploadFoto()
{
    $namaFile = $_FILES['foto']['name'];
    $ukuranFile = $_FILES['foto']['size'];
    $error = $_FILES['foto']['error'];
    $tmpName = $_FILES['foto']['tmp_name'];

    // Cek apakah tidak ada gambar yang diupload
    if ($error === 4) {
        return 'default.jpeg'; // Gunakan gambar default jika tidak ada foto yang diupload
    }

    // Cek ukuran gambar
    if ($ukuranFile > 5000000) {
        echo "<script>alert('Ukuran gambar terlalu besar!');</script>";
        echo "<script>window.location.href = 'admin.php';</script>"; // Redirect kembali ke halaman admin
        return false;
    }

    // Cek apakah yang diupload adalah gambar
    $ekstensiGambarValid = ['jpg', 'jpeg', 'png'];
    $ekstensiGambar = explode('.', $namaFile);
    $ekstensiGambar = strtolower(end($ekstensiGambar));

    // Cek ekstensi gambar
    if (!in_array($ekstensiGambar, $ekstensiGambarValid)) {
        echo "<script>alert('Ekstensi gambar tidak valid!');</script>";
        echo "<script>window.location.href = 'admin.php';</script>"; // Redirect kembali ke halaman admin
        return false;
    }

    // Generate nama gambar baru
    $namaFileBaru = uniqid() . '.' . $ekstensiGambar;

    // Upload gambar
    move_uploaded_file($tmpName, "../../images/" . $namaFileBaru);
    return $namaFileBaru;
}




// Fungsi untuk mengubah data admin
function ubahAdmin($data, $files, $id)
{
    global $db;

    $nama = htmlspecialchars($data['nama']);
    $telepon = htmlspecialchars($data['telepon']);

    // Cek apakah ada file foto diupload
    if ($files['foto']['error'] === 0) {
        $foto = uploadFoto();
    } else {
        // Jika tidak ada file diupload, gunakan foto yang sudah ada
        $admin = query("SELECT * FROM admin_produksi WHERE id = $id")[0];
        $foto = $admin['foto'];
    }

    // Query ubah admin
    $query = "UPDATE admin_produksi SET nama = '$nama', telepon = '$telepon', foto = '$foto' WHERE id = $id";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

// Fungsi untuk menghapus admin
function hapusAdmin($id)
{
    global $db;
    
    // Query hapus admin
    $query = "DELETE FROM admin_produksi WHERE id = $id";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

//tampil username
function getNama($username) {
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



?>