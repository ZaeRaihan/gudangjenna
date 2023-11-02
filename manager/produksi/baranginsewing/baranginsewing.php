<?php
session_start();
require 'functions.php';

// Check jika user sudah login
if (!isset($_SESSION['usernamemg'])) {
    header("Location: ../login.php");
    exit();
}

$baranginsewing = query("SELECT * FROM baranginsewing");

// Pagination
$limit = 20;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$totalRecords = count(query("SELECT * FROM baranginsewing"));
$totalPages = ceil($totalRecords / $limit);
// Hitung posisi awal pagination
$start = ($page - 1) * $limit;

// Periksa apakah start_date dan end_date diatur dalam parameter GET
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : '';
$end_date = isset($_GET['end_date']) ? $_GET['end_date'] : '';

// Inisialisasi variabel date_filter
$date_filter = '';

// Bangun klausa WHERE untuk filter tanggal
if (!empty($start_date) && !empty($end_date)) {
    $date_filter = "WHERE tgl_brg_keluar BETWEEN '$start_date' AND '$end_date'";
}

// Periksa apakah query pencarian diatur dalam parameter GET
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Inisialisasi variabel search_filter
$search_filter = '';

// Bangun klausa WHERE untuk filter pencarian
if (!empty($search)) {
    $search = strtolower($search); // Ubah istilah penelusuran menjadi huruf kecil

    $search_filter = "WHERE 
    LOWER(tgl_brg_keluar) LIKE '%$search%' OR
    LOWER(sj_for_vendor) LIKE '%$search%' OR
    LOWER(nama) LIKE '%$search%' OR
    LOWER(launching_date) LIKE '%$search%' OR
    LOWER(collection) LIKE '%$search%' OR
    LOWER(article_name) LIKE '%$search%' OR
    LOWER(size) LIKE '%$search%' OR
    LOWER(inyard) LIKE '%$search%' OR
    LOWER(stock_insewing) LIKE '%$search%' OR
    LOWER(vendor_sewing) LIKE '%$search%' OR
    LOWER(tgl_brg_masuk) LIKE '%$search%' OR
    LOWER(sj_from_vendor) LIKE '%$search%' OR
    LOWER(stock_hasilsewing) LIKE '%$search%' OR
    LOWER(status) LIKE '%$search%' OR
    DATE_FORMAT(launching_date, '%d-%m-%Y') LIKE '%$search%' OR
    DATE_FORMAT(tgl_brg_keluar, '%d-%m-%Y') LIKE '%$search%' OR
    DATE_FORMAT(tgl_brg_masuk, '%d-%m-%Y') LIKE '%$search%' OR
    DATE_FORMAT(launching_date, '%Y-%m-%d') LIKE '%$search%' OR
    DATE_FORMAT(tgl_brg_keluar, '%Y-%m-%d') LIKE '%$search%' OR
    DATE_FORMAT(tgl_brg_masuk, '%Y-%m-%d') LIKE '%$search%' OR
    LOWER(MONTHNAME(launching_date)) LIKE '%$search%' OR
    LOWER(MONTHNAME(tgl_brg_keluar)) LIKE '%$search%' OR
    LOWER(MONTHNAME(tgl_brg_masuk)) LIKE '%$search%' OR
    LOWER(YEAR(launching_date)) LIKE '%$search%' OR
    LOWER(YEAR(tgl_brg_keluar)) LIKE '%$search%' OR
    LOWER(YEAR(tgl_brg_masuk)) LIKE '%$search%'";
}

// Query dengan search filter and date filter
$query = "SELECT * FROM baranginsewing $date_filter $search_filter ORDER BY idbarang_insewing DESC LIMIT $start, $limit";
$baranginsewing = query($query);

// Hitung jumlah total records untuk pencarian yang difilter dan rentang tanggal
$totalRecordsSearchDateFilter = count(query("SELECT * FROM baranginsewing $date_filter $search_filter"));
$totalPagesSearchDateFilter = ceil($totalRecordsSearchDateFilter / $limit);

// Hitung jumlah total catatan untuk filtered date range
$totalRecordsDateFilter = count(query("SELECT * FROM baranginsewing $date_filter"));
$totalPagesDateFilter = ceil($totalRecordsDateFilter / $limit);
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
    <link href="../../../vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../../vendor/css/bootstrap/bootstrap.css" rel="stylesheet">

    <!-- icon dan fonts -->
    <link href="../../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- tema css -->
    <link href="../../../css/tabelmanager.css" rel="stylesheet">
    <title>Barang In Sewing</title>
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
                    href="../../logout.php"><?php echo getNama($_SESSION['usernamemg']); ?></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <form class="" action="../../logout.php" onclick="return confirm('yakin ingin logout?');"
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
                        <a href="../../beranda.php">
                            BERANDA
                        </a>
                    </li>
                    <li>
                        <a href="../../admin/admin.php">
                            ADMIN
                        </a>
                    </li>
                    <li class="active">
                        <a>
                            PRODUKSI <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="../barangqc/barangqc.php">BARANG QC</a></li>
                            <li><a href="../baranginpayet/baranginpayet.php">BARANG IN PAYET</a></li>
                            <li class="active"><a href="baranginsewing.php">BARANG IN SEWING</a></li>
                            <li><a href="../baranginrevisi/baranginrevisi.php">BARANG IN REVISI</a></li>
                        </ul>
                    </li>
                    <li>
                        <a>
                            QC <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="../../qc/baranglolosqc/baranglolosqc.php">BARANG LOLOS QC</a></li>
                            <li><a href="../../qc/barangreject/barangreject.php">BARANG REJECT</a></li>
                            <li><a href="../../qc/barangminor/barangminor.php">BARANG MINOR</a></li>
                            <li><a href="../../qc/barangrevisi/barangrevisi.php">BARANG REVISI</a></li>
                        </ul>
                    </li>
                    <li>
                        <a>
                            WAREHOUSE <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="../../wh/stockgudang/stockgudang.php">STOCK GUDANG</a></li>
                            <li><a href="../../wh/gudangreject/gudangreject.php">GUDANG BARANG REJECT</a></li>
                            <li><a href="../../wh/gudangminor/gudangminor.php">GUDANG BARANG MINOR</a></li>
                            <li><a href="../../wh/barangkeluar/barangkeluar.php">BARANG KELUAR</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../../logout.php" onclick="return confirm('yakin ingin logout?')">
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
            <h1 class="page-header">PRODUKSI : Inventori Barang In Sewing
                <br><br><br>

                <!-- TAMBAH DATA DENGAN MODAL -->
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-6">
                        <!-- Search Form -->
                        <form action="" method="GET" class="form-inline">
                            <label for="search"></label>
                            <input type="text" class="form-control mx-2" id="search" name="search"
                                value="<?php echo $_GET['search'] ?? ''; ?>" placeholder="cari data barang">
                            <button type="submit" class="btn btn-success">Search</button>
                            <a href="baranginsewing.php" class="btn btn-warning mx-2">Clear</a>
                        </form>

                    </div>
                </div>


                <div class="row" style="margin-top: 5px;">
                    <div class="col-md-6">
                        <div class="button-group" style="display: flex; align-items: center;">
                            <!-- PRINT -->

                            <!-- PAGINATION -->
                            <div class="pagination-container">
                                <ul class="pagination pagination-lg">
                                    <?php if ($page > 1) : ?>
                                    <li>
                                        <a href="?page=<?php echo ($page - 1); ?>&start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>&search=<?php echo $search; ?>"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <?php endif; ?>
                                    <?php
                                    $startPage = max(1, $page - 1);
                                    $endPage = min($totalPagesSearchDateFilter, $startPage + 4);
                                        for ($p = $startPage; $p <= $endPage; $p++) :
                                     ?>
                                    <li class="<?php if ($p == $page) echo 'active'; ?>">
                                        <a
                                            href="?page=<?php echo $p; ?>&start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>&search=<?php echo $search; ?>">
                                            <?php echo $p; ?>
                                        </a>
                                    </li>
                                    <?php endfor; ?>

                                    <?php if ($page < $totalPagesSearchDateFilter) : ?>
                                    <li>
                                        <a href="?page=<?php echo ($page + 1); ?>&start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>&search=<?php echo $search; ?>"
                                            aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                    <?php endif; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Date Filter Form -->
                <div class="row" style="margin-top: 5px; margin-bottom: 5px">
                    <div class="col-md-12">
                        <form action="" method="GET" class="form-inline">
                            <label for="start_date">Start Date:</label>
                            <input type="date" class="form-control mx-2" id="start_date" name="start_date"
                                value="<?php echo $_GET['start_date'] ?? ''; ?>">

                            <label for="end_date">End Date:</label>
                            <input type="date" class="form-control mx-2" id="end_date" name="end_date"
                                value="<?php echo $_GET['end_date'] ?? ''; ?>">

                            <button type="submit" class="btn btn-success">Apply Filter</button>
                            <a href="baranginsewing.php" class="btn btn-warning mx-2">Clear Filter</a>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table id="data-table" class="table table-hover">
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Tanggal Barang Keluar</th>
                            <th scope="col">SJ For Sewing</th>
                            <th scope="col">Nama Bahan</th>
                            <th scope="col">Out Yard</th>
                            <th scope="col">Out Roll</th>
                            <th scope="col">Vendor Sewing</th>
                            <th scope="col">Launching Date</th>
                            <th scope="col">Collection</th>
                            <th scope="col">Article Name</th>
                            <th scope="col">Size</th>
                            <th scope="col">Tanggal Barang Masuk</th>
                            <th scope="col">SJ From Sewing</th>
                            <th scope="col">Stock Hasil Sewing</th>
                            <th scope="col">Status</th>
                        </tr>

                        <!-- Table and Pagination -->
                        <?php $i = $start + 1; ?>
                        <!-- Hitung indeks awal saat ini berdasarkan halaman dan limit -->
                        <?php foreach ($baranginsewing as $row) : ?>

                        <tr class="data-row">
                            <td><?= $i; ?></td>
                            <td><?= formatDate($row["tgl_brg_keluar"]); ?></td>
                            <td><?= $row["sj_for_vendor"]; ?></td>
                            <td><?= $row["nama"]; ?></td>
                            <td><?= $row["inyard"]; ?></td>
                            <td><?= $row["stock_insewing"]; ?></td>
                            <td><?= $row["vendor_sewing"]; ?></td>
                            <td><?= formatDate($row["launching_date"]); ?></td>
                            <td><?= $row["collection"]; ?></td>
                            <td><?= $row["article_name"]; ?></td>
                            <td><?= $row["size"]; ?></td>
                            <td><?= formatDate($row["tgl_brg_masuk"]); ?></td>
                            <td><?= $row["sj_from_vendor"]; ?></td>
                            <td><?= $row["stock_hasilsewing"]; ?></td>
                            <td><?= $row["status"]; ?></td>
                        </tr>

                        <?php $i++; ?>
                        <?php endforeach; ?>

                    </table>
                </div>

                <div>
                    <a href="../../beranda.php" class="btn btn-success">Kembali</a>
                </div>
        </div>


    </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>©2023 Jenna and Kaia</p>
    </footer>

    <!-- jQuery -->
    <script src="../../../vendor/jquery/jquery.min.js"></script>

    <!--include-->
    <script src="../../../vendor/css/js/bootstrap.min.js"></script>

    <!-- JavaScript file -->
    <script src="script.js"></script>

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