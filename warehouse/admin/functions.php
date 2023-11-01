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

    // Cek apakah username sudah ada dalam database
    $result = mysqli_query($db, "SELECT * FROM admin_wh WHERE username='$username'");
    if (mysqli_fetch_assoc($result)) {
        return false; // Jika username sudah ada, hentikan proses tambahAdmin
    }

    // Query tambah admin
    $query = "INSERT INTO admin_wh(username, password, nama, telepon, foto) VALUES ('$username', '$password', '$nama', '$telepon', '$foto')";
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
    $password_lama = htmlspecialchars($data['password_lama']);
    $password_baru = htmlspecialchars($data['password_baru']);
    $konfirmasi_password = htmlspecialchars($data['konfirmasi_password']);

    // Query untuk mendapatkan password admin
    $admin = query("SELECT * FROM admin_wh WHERE id = $id")[0];
    $password_admin = $admin['password'];

    // Periksa apakah password lama cocok
    if (password_verify($password_lama, $password_admin)) {
        // Password lama cocok, lanjutkan dengan proses perubahan password
        if (!empty($password_baru) && $password_baru === $konfirmasi_password) {
            // Password baru tidak kosong dan cocok dengan konfirmasi
            $password_hash = password_hash($password_baru, PASSWORD_DEFAULT);
        } elseif (empty($password_baru)) {
            // Jika password baru kosong, gunakan password lama
            $password_hash = $password_admin;
        } else {
            // Password baru tidak cocok dengan konfirmasi
            return -1; // Kode error untuk password baru tidak cocok
        }

        // Cek apakah ada file foto diupload
        if ($files['foto']['error'] === 0) {
            $foto = uploadFoto();
        } else {
            // Jika tidak ada file diupload, gunakan foto yang sudah ada
            $foto = $admin['foto'];
        }

        // Query ubah admin
        $query = "UPDATE admin_wh SET nama = '$nama', telepon = '$telepon', password = '$password_hash', foto = '$foto' WHERE id = $id";
        mysqli_query($db, $query);

        // Hapus token atau sesi autentikasi di sini
        // Misalnya, jika menggunakan session, Anda bisa gunakan:
        session_start();
        session_unset();
        session_destroy();

        return mysqli_affected_rows($db);
    } else {
        // Password lama tidak cocok
        return -2; // Kode error untuk password lama tidak cocok
    }
}

// Fungsi untuk menghapus admin
function hapusAdmin($id)
{
    global $db;
    
    // Query hapus admin
    $query = "DELETE FROM admin_wh WHERE id = $id";
    mysqli_query($db, $query);
    return mysqli_affected_rows($db);
}

//tampil username
function getNama($username) {
    global $db;
    $query = "SELECT nama FROM admin_wh WHERE username = '$username'";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        return $user['nama'];
    } else {
        return "Nama Tidak Ditemukan";
    }
}



?>