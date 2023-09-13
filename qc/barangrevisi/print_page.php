<?php
session_start();
require 'functions.php';

// Ambil ID baris yang dipilih dari parameter GET
$selectedRows = isset($_GET['selected_rows']) ? explode(',', $_GET['selected_rows']) : [];

// Query untuk mengambil baris yang dipilih
$query = "SELECT * FROM barangrevisi WHERE idbarang_revisi IN (" . implode(',', $selectedRows) . ") ORDER BY idbarang_revisi DESC";
$selectedRowsData = query($query);
?>

<!DOCTYPE html>
<html>

<head>

    <!-- boootstrap -->
    <link href="../../vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../vendor/css/bootstrap/bootstrap.css" rel="stylesheet">

    <!-- icon dan fonts -->
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- tema css -->
    <link href="../../css/print.css" rel="stylesheet">

</head>

<body>
    <h1 class="text-center mt-3" style="margin-bottom: 30px;">Surat Jalan <br>
        Barang Reject
    </h1>

    <table class="table table-hover">
        <tr>
            <th scope="col">No</th>
            <th scope="col">Tanggal Barang Masuk</th>
            <th scope="col">Launching Date</th>
            <th scope="col">Collection</th>
            <th scope="col">Article Name</th>
            <th scope="col">Size</th>
            <th scope="col">Stock</th>
            <th scope="col">Vendor</th>
            <th scope="col">Tanggal Barang Keluar</th>
            <th scope="col">SJ For Produksi</th>
        </tr>

        <?php $i = 1; ?>
        <?php foreach ($selectedRowsData as $row) : ?>
        <tr>
            <td><?= $i; ?></td>
            <td><?= formatDate($row["tgl_brg_masuk"]); ?></td>
            <td><?= formatDate($row["launching_date"]); ?></td>
            <td><?= $row["collection"]; ?></td>
            <td><?= $row["article_name"]; ?></td>
            <td><?= $row["size"]; ?></td>
            <td><?= $row["stock"]; ?></td>
            <td><?= $row["vendor"]; ?></td>
            <td><?= formatDate($row["tgl_brg_keluar"]); ?></td>
            <td><?= $row["sj_for_produksi"]; ?></td>
        </tr>
        <?php $i++; ?>
        <?php endforeach; ?>
    </table>
    <p class="text-right mt-3" style="margin-right: 100px; margin-bottom: 75px; margin-top: 30px;">Tanda tangan:</p>
    <p class="text-right mt-3">__________________________</p>
    <p class="text-right mt-3" style="margin-right: 178px;"><?php echo getNama($_SESSION['usernameqc']); ?></p>

</body>

</html>