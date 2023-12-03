<?php
session_start();
require 'functions.php';

// cek apakah user belum login atau tidak memiliki peran warehouse
if (!isset($_SESSION['usernamewh']) || $_SESSION['role'] !== 'warehouse') {
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
    <title>Warehouse</title>
</head>

<body>
    <!------- NAVBAR ------->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <img src="../images/Jenna-Kaia.png" alt="Logo Perusahaan" class="navbar-logo">
            <a class="navbar-brand">ADMIN WAREHOUSE</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="../logout.php"><?php echo getNama($_SESSION['usernamewh']); ?></i>
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
        <div class="navbar-default sidebar" role="navigation" style="font-size : 13.5px" ;>
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
                        <a href="./baranglolosqc/baranglolosqc.php">
                            BARANG LOLOS QC MASUK
                        </a>
                    </li>
                    <li>
                        <a href="./stockgudang/stockgudang.php">
                            STOCK GUDANG
                        </a>
                    </li>
                    <li>
                        <a href="./barangreject/barangreject.php">
                            BARANG REJECT MASUK
                        </a>
                    </li>
                    <li>
                        <a href="./gudangreject/gudangreject.php">
                            GUDANG BARANG REJECT
                        </a>
                    </li>
                    <li>
                        <a href="./barangminor/barangminor.php">
                            BARANG MINOR MASUK
                        </a>
                    </li>
                    <li>
                        <a href="./gudangminor/gudangminor.php">
                            GUDANG BARANG MINOR
                        </a>
                    </li>
                    <li>
                        <a href="./barangkeluar/barangkeluar.php">
                            BARANG KELUAR
                        </a>
                    </li>
                    <li>
                        <a href="./barangretur/barangretur.php">
                            BARANG RETUR
                        </a>
                    </li>
                    <li>
                        <a href="./barangpinjam/barangpinjam.php">
                            BARANG PINJAM
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
            <h1 class="page-header">Selamat Datang <?php echo getNama($_SESSION['usernamewh']); ?></h1>
            <!-- PAKE PHP -->
            <div class="row">
                <!-- Cards di atas -->
                <div class="column">
                    <div class="card">
                        <h3>Admin</h3>
                        <p class="text-center">Admin Pengelola Warehouse</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./admin/admin.php">Tambah Admin</a>
                        </p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Lolos QC Masuk</h3>
                        <p class="text-center">Barang Masuk Dari QC</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./baranglolosqc/baranglolosqc.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Stock Gudang</h3>
                        <p class="text-center">Stock Barang Pada Warehouse</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./stockgudang/stockgudang.php">Tambah
                                Barang</a></p>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <!-- Cards di tengah -->
                <div class="column">
                    <div class="card">
                        <h3>Barang Reject Masuk</h3>
                        <p class="text-center">Barang Reject Masuk Dari QC</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangreject/barangreject.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Gudang Barang Reject</h3>
                        <p class="text-center">Gudang Barang Reject</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./gudangreject/gudangreject.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Minor Masuk</h3>
                        <p class="text-center">Barang Minor Masuk Dari QC</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangminor/barangminor.php">Tambah
                                Barang</a></p>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <!-- Cards di bawah -->
                <div class="column">
                    <div class="card">
                        <h3>Gudang Barang Minor</h3>
                        <p class="text-center">Gudang Barang Minor</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./gudangminor/gudangminor.php">Tambah
                                Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Keluar</h3>
                        <p class="text-center">Data Barang Keluar Dari Gudang</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangkeluar/barangkeluar.php">Tambah Barang</a></p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>Barang Retur</h3>
                        <p class="text-center">Inventori Barang Retur</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangretur/barangretur.php">Tambah
                                Barang</a></p>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <!-- Cards Baris 4 -->
                <div class="column">
                    <div class="card">
                        <h3>Barang Pinjam</h3>
                        <p class="text-center">Inventori Barang Hasil Pinjam</p>
                        <p class="card-footer" style="margin-top: 45px;"><a href="./barangpinjam/barangpinjam.php">Tambah Barang</a></p>
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