<?php
session_start();
require 'functions.php';

// cek apakah user belum login
if (!isset($_SESSION['username'])) {
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
    <title>Quality Control</title>
</head>

<body>
    <!------- NAVBAR ------->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand">ADMIN QC</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown"
                    href="logout.php"><?php echo getNama($_SESSION['username']); ?></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <form class="" action="logout.php" onclick="return confirm('yakin ingin logout?');"
                            method="post">
                            <button class="btn btn-default" type="submit" name="keluar"><i class="fa fa-sign-out"></i>
                                Logout</button>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>

        <!-- menu samping -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
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
                        <a href="./barangqc/barangqc.php">
                            BARANG QC
                        </a>
                    </li>
                    <li>
                        <a href="./baranglolosqc/baranglolosqc.php">
                            BARANG LOLOS QC
                        </a>
                    </li>
                    <li>
                        <a href="./barangreject/barangreject.php">
                            BARANG REJECT
                        </a>
                    </li>
                    <li>
                        <a href="./barangminor/barangminor.php">
                            BARANG MINOR
                        </a>
                    </li>
                    <li>
                        <a href="./barangrevisi/barangrevisi.php">
                            BARANG REVISI
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
            <h1 class="page-header">Selamat Datang <?php echo getNama($_SESSION['username']); ?></h1> <!-- PAKE PHP -->
            <div class="row">
                <!-- Cards di atas -->
                <div class="column">
                    <div class="card">
                        <h3>Admin</h3>
                        <p class="text-center">Admin Pengelola QC</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./admin/admin.php">Tambah Admin</a>
                        </p>
                    </div>
                </div>


                <div class="column">
                    <div class="card">
                        <h3>Barang QC</h3>
                        <p class="text-center">Barang QC Masuk Dari Produksi</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangqc/barangqc.php">Tambah
                                Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Lolos QC</h3>
                        <p class="text-center">Barang Lolos QC Keluar Untuk WH</p>
                        <p class="card-footer" style="margin-top: 45px;"><a
                                href="./baranglolosqc/baranglolosqc.php">Tambah Barang</a></p>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <!-- Cards di tengah -->
                <div class="column">
                    <div class="card">
                        <h3>Barang Reject</h3>
                        <p class="text-center">Barang Reject Keluar Untuk WH</p>
                        <p class="card-footer" style="margin-top: 45px;"><a
                                href="./barangreject/barangreject.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Minor</h3>
                        <p class="text-center">Barang Minor Keluar Untuk WH</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangminor/barangminor.php">Tambah
                                Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Revisi</h3>
                        <p class="text-center">Barang Revisi Dikembalikan Ke Produksi</p>
                        <p class="card-footer"><a href="./barangrevisi/barangrevisi.php">Tambah Barang</a></p>
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