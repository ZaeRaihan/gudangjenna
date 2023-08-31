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
    <link href="../css/berandamanager.css" rel="stylesheet">
    <title>Manager</title>
</head>

<body>
    <!------- NAVBAR ------->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand">MANAGER</a>
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
                        <a>
                            PRODUKSI <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="./produksi/barangqc/barangqc.php">BARANG QC</a></li>
                            <li><a href="./produksi/baranginpayet/baranginpayet.php">BARANG IN PAYET</a></li>
                            <li><a href="./produksi/baranginsewing/baranginsewing.php">BARANG IN SEWING</a></li>
                            <li><a href="./produksi/baranginrevisi/baranginrevisi.php">BARANG IN REVISI</a></li>
                        </ul>
                    </li>
                    <li>
                        <a>
                            QC <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="./qc/baranglolosqc/baranglolosqc.php">BARANG LOLOS QC</a></li>
                            <li><a href="./qc/barangreject/barangreject.php">BARANG REJECT</a></li>
                            <li><a href="./qc/barangminor/barangminor.php">BARANG MINOR</a></li>
                            <li><a href="./qc/barangrevisi/barangrevisi.php">BARANG REVISI</a></li>
                        </ul>
                    </li>
                    <li>
                        <a>
                            WAREHOUSE <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="#">STOCK GUDANG</a></li>
                            <li><a href="#">GUDANG BARANG REJECT</a></li>
                            <li><a href="#">GUDANG BARANG MINOR</a></li>
                            <li><a href="#">BARANG KELUAR</a></li>
                        </ul>
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
                        <p class="text-center">User Manager</p>
                        <p class="card-footer"><a href="./admin/admin.php">Tambah User</a>
                        </p>
                    </div>
                </div>


                <div class="column">
                    <div class="card">
                        <h3>PRODUKSI</h3>
                        <p class="text-center">Monitor Pekerjaan Produksi</p>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="dropdown text-center">
                                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                                        style="font-weight: 600;">
                                        MONITOR PEKERJAAN <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" style="font-weight: 600;">BARANG QC</a></li>
                                        <li><a href="#" style="font-weight: 600;">BARANG IN PAYET</a></li>
                                        <li><a href="#" style="font-weight: 600;">BARANG IN SEWING</a></li>
                                        <li><a href="#" style="font-weight: 600;">BARANG IN REVISI</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <h3>QUALITY CONTROL</h3>
                        <p class="text-center">Monitor Pekerjaan Quality Control</p>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="dropdown text-center">
                                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                                        style="font-weight: 600;">
                                        MONITOR PEKERJAAN <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" style="font-weight: 600;">BARANG LOLOS QC</a></li>
                                        <li><a href="#" style="font-weight: 600;">BARANG REJECT</a></li>
                                        <li><a href="#" style="font-weight: 600;">BARANG MINOR</a></li>
                                        <li><a href="#" style="font-weight: 600;">BARANG REVISI</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <!-- Cards di tengah -->
                <div class="column">
                    <div class="card">
                        <h3>WAREHOUSE</h3>
                        <p class="text-center">Monitor Pekerjaan Warehouse</p>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="dropdown text-center">
                                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                                        style="font-weight: 600;">
                                        MONITOR PEKERJAAN <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" style="font-weight: 600;">STOCK GUDANG</a></li>
                                        <li><a href="#" style="font-weight: 600;">GUDANG BARANG REJECT</a></li>
                                        <li><a href="#" style="font-weight: 600;">GUDANG BARANG MINOR</a></li>
                                        <li><a href="#" style="font-weight: 600;">DATA BARANG KELUAR</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
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

            <!--Drop Down Menu-->
            <script>
            document.addEventListener("DOMContentLoaded", function() {
                // Ambil semua elemen menu yang memiliki sub-menu
                var menuItemsWithSubmenu = document.querySelectorAll(".nav-second-level");

                // event listener untuk setiap elemen menu
                menuItemsWithSubmenu.forEach(function(menuItem) {
                    menuItem.parentElement.querySelector("a").addEventListener("click", function(
                        event) {
                        event.preventDefault();
                        // Toggle tampilan sub-menu
                        menuItem.style.display = menuItem.style.display === "block" ? "none" :
                            "block";
                    });
                });
            });
            </script>

</body>

</html>