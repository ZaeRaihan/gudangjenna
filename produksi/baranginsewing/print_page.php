<?php
session_start();
require 'functions.php';

// Ambil ID baris yang dipilih dari parameter GET
$selectedRows = isset($_GET['selected_rows']) ? explode(',', $_GET['selected_rows']) : [];

// Query untuk mengambil baris yang dipilih
$query = "SELECT * FROM baranginsewing WHERE idbarang_insewing IN (" . implode(',', $selectedRows) . ") ORDER BY idbarang_insewing DESC";
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
                <h1 class="mt-3">Surat Jalan <br>Barang In Sewing</h1>
            </div>
        </div>
    </div>

    <table class="table table-hover">
        <tr>
            <th scope="col">No</th>
            <th scope="col">Tanggal Barang Keluar</th>
            <th scope="col">SJ For Sewing</th>
            <th scope="col">Nama Bahan</th>
            <th scope="col">Out Yard</th>
            <th scope="col">Out Roll</th>
            <th scope="col">Vendor Sewing</th>
        </tr>

        <?php $i = 1; ?>
        <?php foreach ($selectedRowsData as $row) : ?>
            <tr>
                <td><?= $i; ?></td>
                <td><?= formatDate($row["tgl_brg_keluar"]); ?></td>
                <td><?= $row["sj_for_vendor"]; ?></td>
                <td><?= $row["nama"]; ?></td>
                <td><?= $row["inyard"]; ?></td>
                <td><?= $row["stock_insewing"]; ?></td>
                <td><?= $row["vendor_sewing"]; ?></td>
            </tr>
            <?php $i++; ?>
        <?php endforeach; ?>
    </table>
    <p class="text-right mt-3" style="margin-right: 100px; margin-bottom: 75px; margin-top: 30px;">Tanda tangan:</p>
    <p class="text-right mt-3">__________________________</p>
    <p class="text-right mt-3" style="margin-right: 178px;"><?php echo getNama($_SESSION['usernamepr']); ?></p>

</body>

</html>