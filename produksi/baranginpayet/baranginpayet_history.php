<?php
session_start();

// Check apakah user belum login
if (!isset($_SESSION['usernamepr']) || $_SESSION['role'] !== 'produksi') {
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

// Query untuk mengambil data dari tabel baranginpayet_history dengan urutan terbaru
$sql = "SELECT * FROM baranginpayet_history ORDER BY edit_timestamp DESC";
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
    $deleteSql = "DELETE FROM baranginpayet_history ORDER BY edit_timestamp ASC LIMIT " . ($rowCount - 10);
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
    <title>History Barang In Payet</title>
</head>

<body>
    <h1 style="text-align: center;">History Barang In Payet</h1>
    <table class="table table-hover">
        <tr>
            <th>Edit Timestamp</th>
            <th>Tanggal Barang Keluar</th>
            <th>SJ For Payet</th>
            <th>Launching Date</th>
            <th>Collection</th>
            <th>Article Name</th>
            <th>Size</th>
            <th>Stock inpayet</th>
            <th>Stock Hasil Payet</th>
            <th>Vendor Payet</th>
            <th>Tanggal Barang Masuk</th>
            <th>SJ From Payet</th>
            <th>Total Stock</th>
            <th>Status</th>
        </tr>
        <?php
        // Loop untuk menampilkan data dari tabel
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['edit_timestamp'] . "</td>";
            echo "<td>" . $row['tgl_brg_keluar'] . "</td>";
            echo "<td>" . $row['sj_for_vendor'] . "</td>";
            echo "<td>" . $row['launching_date'] . "</td>";
            echo "<td>" . $row['collection'] . "</td>";
            echo "<td>" . $row['article_name'] . "</td>";
            echo "<td>" . $row['size'] . "</td>";
            echo "<td>" . $row['stock_inpayet'] . "</td>";
            echo "<td>" . $row['stock_hasilpayet'] . "</td>";
            echo "<td>" . $row['vendor_payet'] . "</td>";
            echo "<td>" . $row['tgl_brg_masuk'] . "</td>";
            echo "<td>" . $row['sj_from_vendor'] . "</td>";
            echo "<td>" . $row['totalstock'] . "</td>";
            echo "<td>" . $row['status'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

</html>