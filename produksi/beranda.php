<?php
session_start();
require 'functions.php';

// cek apakah user belum login atau tidak memiliki peran produksi
if (!isset($_SESSION['usernamepr']) || $_SESSION['role'] !== 'produksi') {
    header("Location: login.php");
    exit();
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

    <!-- boootstrap -->
    <link href="../vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../vendor/css/bootstrap/bootstrap.css" rel="stylesheet">

    <!-- icon dan fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- tema css -->
    <link href="../css/beranda.css" rel="stylesheet">
    <title>Produksi</title>
</head>

<body>
    <!------- NAVBAR ------->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <img src="../images/Jenna-Kaia.png" alt="Logo Perusahaan" class="navbar-logo">
            <a class="navbar-brand">ADMIN PRODUKSI</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="logout.php"><?php echo getNama($_SESSION['usernamepr']); ?></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <form class="" action="logout.php" onclick="return confirm('yakin ingin logout?');" method="post">
                            <button class="btn btn-default" type="submit" name="keluar"><i class="fa fa-sign-out"></i>
                                Logout</button>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>

        <!-- menu samping -->
        <div class="navbar-default sidebar" role="navigation" style="font-size: medium;">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="active">
                        <a href="beranda.php">
                            BERANDA
                        </a>
                    </li>
                    <li>
                        <a href="./admin/admin.php">
                            ADMIN
                        </a>
                    </li>
                    <li>
                        <a href="./barangvendor/barangvendor.php">
                            BARANG VENDOR
                        </a>
                    </li>
                    <li>
                        <a href="./barangqc/barangqc.php">
                            BARANG QC
                        </a>
                    </li>
                    <li>
                        <a href="./barangpayet/barangpayet.php">
                            BARANG PAYET
                        </a>
                    </li>
                    <li>
                        <a href="./baranginpayet/baranginpayet.php">
                            BARANG IN PAYET
                        </a>
                    </li>
                    <li>
                        <a href="./barangbaku/barangbaku.php">
                            BARANG BAKU
                        </a>
                    </li>
                    <li>
                        <a href="./baranginsewing/baranginsewing.php">
                            BARANG IN SEWING
                        </a>
                    </li>
                    <li>
                        <a href="./barangrevisi/barangrevisi.php">
                            BARANG REVISI
                        </a>
                    </li>
                    <li>
                        <a href="./baranginrevisi/baranginrevisi.php">
                            BARANG IN REVISI
                        </a>
                    </li>
                    <li>
                        <a href="logout.php" onclick="return confirm('yakin ingin logout?')">
                            Logout
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>

    <!------- CONTENT ------->
    <div class="content">
        <div class="container-fluid">
            <!------- HEADER ------->
            <h1 class="page-header">Selamat Datang <?php echo getNama($_SESSION['usernamepr']); ?></h1>
            <!-- PAKE PHP -->
            <div class="row">
                <!-- Cards di atas -->
                <div class="column">
                    <div class="card">
                        <h3>Admin</h3>
                        <p class="text-center">Admin Pengelola Produksi</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./admin/admin.php">Tambah Admin</a>
                        </p>
                    </div>
                </div>


                <div class="column">
                    <div class="card">
                        <h3>Barang Vendor</h3>
                        <p class="text-center">Inventori Barang Masuk Dari Vendor</p>
                        <p class="card-footer"><a href="./barangvendor/barangvendor.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang QC</h3>
                        <p class="text-center">Inventori Barang Keluar Untuk QC</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangqc/barangqc.php">Tambah
                                Barang</a></p>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <!-- Cards di tengah -->
                <div class="column">
                    <div class="card">
                        <h3>Barang Payet</h3>
                        <p class="text-center">Inventori Barang Keluar Untuk Vendor Payet</p>
                        <p class="card-footer"><a href="./barangpayet/barangpayet.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang In Payet</h3>
                        <p class="text-center">Barang Sedang DiPayet</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./baranginpayet/baranginpayet.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Baku</h3>
                        <p class="text-center">Inventori Bahan Kain Masuk Dari Vendor</p>
                        <p class="card-footer"><a href="./barangbaku/barangbaku.php">Tambah Barang</a></p>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <!-- Cards di bawah -->
                <div class="column">
                    <div class="card">
                        <h3>Barang In Sewing</h3>
                        <p class="text-center">Barang(Kain) Sedang DiJahit</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./baranginsewing/baranginsewing.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Revisi</h3>
                        <p class="text-center">Inventori Barang Keluar Untuk Revisi</p>
                        <p class="card-footer"><a href="./barangrevisi/barangrevisi.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang In Revisi</h3>
                        <p class="text-center">Barang Sedang DiRevisi</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./baranginrevisi/baranginrevisi.php">Tambah Barang</a></p>
                    </div>
                </div>
            </div>
            <br>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>©2023 Jenna and Kaia</p>
    </footer>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!--include-->
    <script src="../vendor/css/js/bootstrap.min.js"></script>
</body>

</html>