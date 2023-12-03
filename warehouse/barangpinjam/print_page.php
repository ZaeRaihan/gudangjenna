<?php
session_start();
require 'functions.php';

// Ambil ID baris yang dipilih dari parameter GET
$selectedRows = isset($_GET['selected_rows']) ? explode(',', $_GET['selected_rows']) : [];

// Query untuk mengambil baris yang dipilih
$query = "SELECT * FROM barangpinjam WHERE idbarang_pinjam IN (" . implode(',', $selectedRows) . ") ORDER BY idbarang_pinjam DESC";
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
    <div class="container">
        <div class="row align-items-center">
            <div class="col-auto">
                <img src="../../images/Jenna-Kaia.png" alt="Logo Perusahaan" class="logo">
            </div>
            <div class="col text-center">
                <h1 class="mt-3">Surat Jalan <br>Barang Pinjam</h1>
            </div>
        </div>
    </div>

    <table class="table table-hover">
        <tr>
            <th scope="col">No</th>
            <th scope="col">Tanggal Barang Keluar</th>
            <th scope="col">Surat Pinjam</th>
            <th scope="col">Gudang</th>
            <th scope="col">Article Name</th>
            <th scope="col">Size</th>
            <th scope="col">Stock</th>
            <th scope="col">Dipinjam Oleh</th>
        </tr>

        <?php $i = 1; ?>
        <?php foreach ($selectedRowsData as $row) : ?>
            <tr>
                <td><?= $i; ?></td>
                <td><?= formatDate($row["tgl_brg_keluar"]); ?></td>
                <td><?= $row["surat_retur"]; ?></td>
                <td><?= $row["gudang"]; ?></td>
                <td><?= $row["article_name"]; ?></td>
                <td><?= $row["size"]; ?></td>
                <td><?= $row["stock"]; ?></td>
                <td><?= $row["dipinjam"]; ?></td>
            </tr>
            <?php $i++; ?>
        <?php endforeach; ?>
    </table>
    <p class="text-right mt-3" style="margin-right: 100px; margin-bottom: 75px; margin-top: 30px;">Tanda tangan:</p>
    <p class="text-right mt-3">__________________________</p>
    <p class="text-right mt-3" style="margin-right: 178px;"><?php echo getNama($_SESSION['usernamewh']); ?></p>

</body>

</html>