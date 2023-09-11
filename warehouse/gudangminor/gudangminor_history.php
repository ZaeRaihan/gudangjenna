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

// Query untuk mengambil data dari tabel gudangminor_history dengan urutan terbaru
$sql = "SELECT * FROM gudangminor_history ORDER BY edit_timestamp DESC";
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
    $deleteSql = "DELETE FROM gudangminor_history ORDER BY edit_timestamp ASC LIMIT " . ($rowCount - 10);
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
    <title>History Gudang Barang Minor</title>
</head>

<body>
    <h1 style="text-align: center;">History Gudang Barang Minor</h1>
    <table class="table table-hover">
        <tr>
            <th>Edit Timestamp</th>
            <th>Kode Barang</th>
            <th>Collection</th>
            <th>Kategori</th>
            <th>Article Name</th>
            <th>Size</th>
            <th>Stock</th>
            <th>Harga</th>
            <th>Lokasi</th>
            <th>Rak</th>
            <th>Umur</th>
        </tr>
        <?php
        // Loop untuk menampilkan data dari tabel
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['edit_timestamp'] . "</td>";
            echo "<td>" . $row['kode'] . "</td>";
            echo "<td>" . $row['collection'] . "</td>";
            echo "<td>" . $row['kategori'] . "</td>";
            echo "<td>" . $row['article_name'] . "</td>";
            echo "<td>" . $row['size'] . "</td>";
            echo "<td>" . $row['stock'] . "</td>";
            echo "<td>" . $row['harga'] . "</td>";
            echo "<td>" . $row['lokasi'] . "</td>";
            echo "<td>" . $row['rak'] . "</td>";
            echo "<td>" . $row['umur'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

</html>