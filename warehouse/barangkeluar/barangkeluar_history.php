<?php
session_start();

// Check jika user sudah login
if (!isset($_SESSION['usernamewh'])) {
    header("Location: ../login.php");
    exit();
}

// Koneksi ke database MySQL
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gudangjenna";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Periksa koneksi database
if (!$conn) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}

// Query untuk mengambil data dari tabel barangkeluar_history dengan urutan terbaru
$sql = "SELECT * FROM barangkeluar_history ORDER BY edit_timestamp DESC";
$result = mysqli_query($conn, $sql);

// Periksa apakah query berhasil dijalankan
if (!$result) {
    echo "Error: " . mysqli_error($conn);
    exit();
}

// Periksa jumlah baris dalam tabel
$rowCount = mysqli_num_rows($result);

// Jika jumlah baris lebih dari 10, hapus baris paling lama
if ($rowCount > 10) {
    $deleteSql = "DELETE FROM barangkeluar_history ORDER BY edit_timestamp ASC LIMIT " . ($rowCount - 10);
    if (mysqli_query($conn, $deleteSql)) {
        echo "Baris paling lama telah dihapus.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap -->
    <link href="../../vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../vendor/css/bootstrap/bootstrap.css" rel="stylesheet">

    <!-- Icon dan Fonts -->
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Tema CSS -->
    <link href="../../css/tabel.css" rel="stylesheet">
    <title>History Barang Keluar</title>
</head>

<body>
    <h1 style="text-align: center;">History Barang Keluar</h1>
    <table class="table table-hover">
        <tr>
            <th>Edit Timestamp</th>
            <th>Tanggal Barang Keluar</th>
            <th>Surat keluar</th>
            <th>Gudang</th>
            <th>Article Name</th>
            <th>Size</th>
            <th>Stock</th>
            <th>Status Keluar</th>
            <th>Keterangan</th>
        </tr>
        <?php
        // Loop untuk menampilkan data dari tabel
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['edit_timestamp'] . "</td>";
            echo "<td>" . $row['tgl_brg_keluar'] . "</td>";
            echo "<td>" . $row['sj_keluar'] . "</td>";
            echo "<td>" . $row['gudang'] . "</td>";
            echo "<td>" . $row['article_name'] . "</td>";
            echo "<td>" . $row['size'] . "</td>";
            echo "<td>" . $row['stock'] . "</td>";
            echo "<td>" . $row['status'] . "</td>";
            echo "<td>" . $row['keterangan'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

</html>