<?php
session_start();
require 'functions.php';

// Check jika user sudah login
if (!isset($_SESSION['usernamepr'])) {
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
    <link href="../../vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../vendor/css/bootstrap/bootstrap.css" rel="stylesheet">

    <!-- icon dan fonts -->
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- tema css -->
    <link href="../../css/tabel.css" rel="stylesheet">
    <title>Barang In Sewing</title>
</head>

<body>
    <!------- NAVBAR ------->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand">ADMIN PRODUKSI</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="../logout.php"><?php echo getNama($_SESSION['usernamepr']); ?></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <form class="" action="../logout.php" onclick="return confirm('yakin ingin logout?');" method="post">
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
                    <li>
                        <a href="../beranda.php">
                            BERANDA
                        </a>
                    </li>
                    <li>
                        <a href="../admin/admin.php">
                            ADMIN
                        </a>
                    </li>
                    <li>
                        <a href="../barangvendor/barangvendor.php">
                            BARANG VENDOR
                        </a>
                    </li>
                    <li>
                        <a href="../barangqc/barangqc.php">
                            BARANG QC
                        </a>
                    </li>
                    <li>
                        <a href="../barangpayet/barangpayet.php">
                            BARANG PAYET
                        </a>
                    </li>
                    <li>
                        <a href="../baranginpayet/baranginpayet.php">
                            BARANG IN PAYET
                        </a>
                    </li>
                    <li>
                        <a href="../barangbaku/barangbaku.php">
                            BARANG BAKU
                        </a>
                    </li>
                    <li class="active">
                        <a href="baranginsewing.php">
                            BARANG IN SEWING
                        </a>
                    </li>
                    <li>
                        <a href="../barangrevisi/barangrevisi.php">
                            BARANG REVISI
                        </a>
                    </li>
                    <li>
                        <a href="../baranginrevisi/baranginrevisi.php">
                            BARANG IN REVISI
                        </a>
                    </li>
                    <li>
                        <a href="../logout.php" onclick="return confirm('yakin ingin logout?')">
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
            <h1 class="page-header">Inventori Barang In Sewing
                <br><br><br>

                <!-- TAMBAH DATA DENGAN MODAL -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="text-left">
                            <a href="#" class="btn btn-success" data-toggle="modal" data-target="#tambahBarangModal">Tambah
                                Barang</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Search Form -->
                        <form action="" method="GET" class="form-inline">
                            <label for="search"></label>
                            <input type="text" class="form-control mx-2" id="search" name="search" value="<?php echo $_GET['search'] ?? ''; ?>" placeholder="cari data barang">
                            <button type="submit" class="btn btn-success">Search</button>
                            <a href="baranginsewing.php" class="btn btn-warning mx-2">Clear</a>
                        </form>

                    </div>
                </div>


                <div class="row" style="margin-top: 5px;">
                    <div class="col-md-6">
                        <div class="button-group" style="display: flex; align-items: center;">
                            <!-- PRINT -->
                            <div style="margin-right: 5px;">
                                <button class="btn btn-warning" onclick="printTable()">
                                    <i class="fa fa-print"></i> Print
                                </button>

                            </div>
                            <!-- PAGINATION -->
                            <div class="pagination-container">
                                <ul class="pagination pagination-lg">
                                    <?php if ($page > 1) : ?>
                                        <li>
                                            <a href="?page=<?php echo ($page - 1); ?>&start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>&search=<?php echo $search; ?>" aria-label="Previous">
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
                                            <a href="?page=<?php echo $p; ?>&start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>&search=<?php echo $search; ?>">
                                                <?php echo $p; ?>
                                            </a>
                                        </li>
                                    <?php endfor; ?>

                                    <?php if ($page < $totalPagesSearchDateFilter) : ?>
                                        <li>
                                            <a href="?page=<?php echo ($page + 1); ?>&start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>&search=<?php echo $search; ?>" aria-label="Next">
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
                    <div class="col-md-10">
                        <form action="" method="GET" class="form-inline">
                            <label for="start_date">Start Date:</label>
                            <input type="date" class="form-control mx-2" id="start_date" name="start_date" value="<?php echo $_GET['start_date'] ?? ''; ?>">

                            <label for="end_date">End Date:</label>
                            <input type="date" class="form-control mx-2" id="end_date" name="end_date" value="<?php echo $_GET['end_date'] ?? ''; ?>">

                            <button type="submit" class="btn btn-success">Apply Filter</button>
                            <a href="baranginsewing.php" class="btn btn-warning mx-2">Clear Filter</a>
                        </form>
                    </div>
                    <div class="col-md-2 text-right">
                        <!-- "text-right" untuk menggeser teks ke kanan -->
                        <a href="baranginsewing_history.php" class="btn btn-info mx-2" target="_blank">History</a>
                    </div>
                </div>


                <!-- Modal -->
                <div class="modal fade" id="tambahBarangModal" tabindex="-1" role="dialog" aria-labelledby="tambahBarangModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title" id="tambahBarangModalLabel">Tambah Barang</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- Form untuk menambahkan data barang -->
                                <form action="proses_tambah.php" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="tgl_brg_keluar">Tanggal Barang Keluar</label>
                                        <input type="date" class="form-control" id="tgl_brg_keluar" name="tgl_brg_keluar" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="sj_for_vendor">SJ For Vendor Sewing</label>
                                        <input type="text" class="form-control" id="sj_for_vendor" name="sj_for_vendor">
                                    </div>
                                    <div class="form-group">
                                        <label for="nama">Nama Bahan</label>
                                        <input type="text" class="form-control" id="nama" name="nama">
                                    </div>
                                    <div class="form-group">
                                        <label for="inyard">Out Yard</label>
                                        <input type="number" class="form-control" id="inyard" name="inyard" pattern="[0-9]*" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="stock_insewing">Out Roll</label>
                                        <input type="number" class="form-control" id="stock_insewing" name="stock_insewing" pattern="[0-9]*" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="vendor_sewing">Vendor Sewing</label>
                                        <select class="form-control" id="vendor_sewing" name="vendor_sewing" required onchange="checkLainnya('vendor_sewing')">
                                            <option value="" disabled selected>Pilih Vendor Sewing</option>
                                            <option value="Alia Digital Printex">Alia Digital Printex</option>
                                            <option value="Atfemale">Atfemale</option>
                                            <option value="Atmosfira Dekatama">Atmosfira Dekatama</option>
                                            <option value="Baju Kertas">Baju Kertas</option>
                                            <option value="Bandanaira">Bandanaira</option>
                                            <option value="Bu Citra">Bu Citra</option>
                                            <option value="Bu Dewi">Bu Dewi</option>
                                            <option value="Bu Elis">Bu Elis</option>
                                            <option value="Bu Hany">Bu Hany</option>
                                            <option value="Bu Icha">Bu Icha</option>
                                            <option value="Bu Kartika">Bu Kartika</option>
                                            <option value="Bu Linda">Bu Linda</option>
                                            <option value="Bu Lilis">Bu Lilis</option>
                                            <option value="Bu Rini">Bu Rini</option>
                                            <option value="Bu Riri">Bu Riri</option>
                                            <option value="Bu Ussy">Bu Ussy</option>
                                            <option value="Bu Yani">Bu Yani</option>
                                            <option value="Bu Yuli">Bu Yuli</option>
                                            <option value="CV SBB">CV SBB</option>
                                            <option value="Kensby Research Co.">Kensby Research Co.</option>
                                            <option value="Muara Global">Muara Global</option>
                                            <option value="Ophie Rever">Ophie Rever</option>
                                            <option value="Pak Edi">Pak Edi</option>
                                            <option value="Pak Giri">Pak Giri</option>
                                            <option value="Pak Sunar">Pak Sunar</option>
                                            <option value="Pa Ohid">Pa Ohid</option>
                                            <option value="Penjahit Rapi">Penjahit Rapi</option>
                                            <option value="PT Jaya Mitra Kurnia">PT Jaya Mitra Kurnia</option>
                                            <option value="PT Thonnamaz">PT Thonnamaz</option>
                                            <option value="PT.SJS">PT.SJS</option>
                                            <option value="RB Manufacturing">RB Manufacturing</option>
                                            <option value="Rumah Renza">Rumah Renza</option>
                                            <option value="Sakh Konveksi">Sakh Konveksi</option>
                                            <option value="Three and Me">Three and Me</option>
                                            <!-- Opsi vendor_sewing lainnya -->
                                            <option value="LAINNYA">Lainnya</option>
                                        </select>
                                        <input type="text" class="form-control mt-2" id="vendor_sewing_input" name="vendor_sewing_input" style="display: none;" placeholder="Masukkan Vendor Sewing">
                                    </div>
                                    <div class="form-group">
                                        <label for="launching_date">Launching Date</label>
                                        <input type="date" class="form-control" id="launching_date" name="launching_date">
                                    </div>
                                    <div class="form-group">
                                        <label for="collection">Collection</label>
                                        <input type="text" class="form-control" id="collection" name="collection">
                                    </div>
                                    <div class="form-group">
                                        <label for="article_name">Article Name</label>
                                        <input type="text" class="form-control" id="article_name" name="article_name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="size">Size</label>
                                        <select class="form-control" id="size" name="size" required>
                                            <option value="" disabled selected>Pilih Size</option>
                                            <option value="S">S</option>
                                            <option value="M">M</option>
                                            <option value="S-M">S-M</option>
                                            <option value="L">L</option>
                                            <option value="XL">XL</option>
                                            <option value="L-XL">L-XL</option>
                                            <option value="All Size">All Size</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="tgl_brg_masuk">Tanggal Barang Masuk</label>
                                        <input type="date" class="form-control" id="tgl_brg_masuk" name="tgl_brg_masuk">
                                    </div>
                                    <div class="form-group">
                                        <label for="sj_from_vendor">SJ From Vendor Sewing</label>
                                        <input type="text" class="form-control" id="sj_from_vendor" name="sj_from_vendor">
                                    </div>
                                    <div class="form-group">
                                        <label for="stock_hasilsewing">Stock Hasil Sewing</label>
                                        <input type="number" class="form-control" id="stock_hasilsewing" name="stock_hasilsewing" pattern="[0-9]*" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select class="form-control" id="status" name="status" required>
                                            <option value="" disabled selected>Pilih Status Barang</option>
                                            <option value="Finished">Finished</option>
                                            <option value="On Progress">On Progress</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-success">Tambah</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table id="data-table" class="table table-hover">
                        <tr>
                            <th scope="col"><button onclick="checkAll()"></button></th>
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
                            <th scope="col">Kirim</th>
                            <th scope="col">Aksi</th>
                        </tr>

                        <!-- Table and Pagination -->
                        <?php $i = $start + 1; ?>
                        <!-- Hitung indeks awal saat ini berdasarkan halaman dan limit -->
                        <?php foreach ($baranginsewing as $row) : ?>

                            <tr class="data-row">
                                <td><input type="checkbox" class="print-checkbox" data-id="<?= $row["idbarang_insewing"]; ?>">
                                </td>
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
                                <td>
                                    <div class="btn-group text-center" style="display: flex; justify-content: center;">
                                        <!-- Button untuk mengirim data ke tabel barangqc -->
                                        <form action="kirim_vendor.php" method="post" style="margin: 0;">
                                            <input type="hidden" name="idbarang_insewing" value="<?= $row["idbarang_insewing"]; ?>">
                                            <button type="submit" class="btn btn-info" onclick="return confirm('Apakah Anda ingin mengirim barang tersebut?');">Vendor</button>
                                        </form>
                                    </div>
                                </td>
                                <td>
                                    <div class="btn-group text-center" style="display: flex; justify-content: center;">
                                        <button type="button" class="btn btn-warning delete-button" data-id="<?= $row["idbarang_insewing"]; ?>">Hapus</button>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ubahBarangModal<?= $row["idbarang_insewing"]; ?>" data-id="<?= $row["idbarang_insewing"]; ?>" data-page="<?= $page; ?>">Ubah</button>
                                        <button type="button" class="btn btn-success copy-button" data-id="<?= $row["idbarang_insewing"]; ?>">Copy</button>
                                    </div>
                                </td>
                            </tr>

                            <div class="modal fade" id="ubahBarangModal<?= $row["idbarang_insewing"]; ?>" tabindex="-1" role="dialog" aria-labelledby="ubahBarangModalLabel<?= $row["idbarang_insewing"]; ?>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="ubahBarangModalLabel<?= $row["idbarang_insewing"]; ?>">
                                                Ubah Barang</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Form untuk mengubah data barang -->
                                            <form action="proses_ubah.php" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="url" value="<?= basename($_SERVER['PHP_SELF']) . "?" . $_SERVER['QUERY_STRING'] ?>">
                                                <input type="hidden" name="id" value="<?= $row["idbarang_insewing"]; ?>">
                                                <div class="form-group">
                                                    <label for="tgl_brg_keluar">Tanggal Barang Keluar</label>
                                                    <input type="date" class="form-control" id="tgl_brg_keluar" name="tgl_brg_keluar" value="<?= $row["tgl_brg_keluar"]; ?>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sj_for_vendor">SJ For Vendor Sewing</label>
                                                    <input type="text" class="form-control" id="sj_for_vendor" name="sj_for_vendor" value="<?= $row["sj_for_vendor"]; ?>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="nama">Nama Bahan</label>
                                                    <input type="text" class="form-control" id="nama" name="nama" value="<?= $row["nama"]; ?>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="inyard">Out Yard</label>
                                                    <input type="number" class="form-control" id="inyard" name="inyard" pattern="[0-9]*" value="<?= $row["inyard"]; ?>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="stock_insewing">Out Roll</label>
                                                    <input type="number" class="form-control" id="stock_insewing" name="stock_insewing" pattern="[0-9]*" value="<?= $row["stock_insewing"]; ?>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="vendor_sewing">Vendor Sewing</label>
                                                    <select class="form-control" id="vendor_sewing" name="vendor_sewing" required onchange="checkOtherOptionVendor_sewing(this);">
                                                        <option value="<?= $row["vendor_sewing"]; ?>" <?= ($row["vendor_sewing"] == $row["vendor_sewing"]) ? "selected" : ""; ?>>
                                                            <?= $row["vendor_sewing"]; ?>
                                                        </option>
                                                        <option value="Alia Digital Printex" <?= ($row["vendor_sewing"] == "Alia Digital Printex") ? "selected" : ""; ?>>
                                                            Alia Digital Printex
                                                        </option>
                                                        <option value="Atfemale" <?= ($row["vendor_sewing"] == "Atfemale") ? "selected" : ""; ?>>
                                                            Atfemale
                                                        </option>
                                                        <option value="Atmosfira Dekatama" <?= ($row["vendor_sewing"] == "Atmosfira Dekatama") ? "selected" : ""; ?>>
                                                            Atmosfira Dekatama
                                                        </option>
                                                        <option value="Baju Kertas" <?= ($row["vendor_sewing"] == "Baju Kertas") ? "selected" : ""; ?>>
                                                            Baju Kertas
                                                        </option>
                                                        <option value="Bandanaira" <?= ($row["vendor_sewing"] == "Bandanaira") ? "selected" : ""; ?>>
                                                            Bandanaira
                                                        </option>
                                                        <option value="Bu Citra" <?= ($row["vendor_sewing"] == "Bu Citra") ? "selected" : ""; ?>>
                                                            Bu Citra
                                                        </option>
                                                        <option value="Bu Dewi" <?= ($row["vendor_sewing"] == "Bu Dewi") ? "selected" : ""; ?>>
                                                            Bu Dewi
                                                        </option>
                                                        <option value="Bu Elis" <?= ($row["vendor_sewing"] == "Bu Elis") ? "selected" : ""; ?>>
                                                            Bu Elis
                                                        </option>
                                                        <option value="Bu Hany" <?= ($row["vendor_sewing"] == "Bu Hany") ? "selected" : ""; ?>>
                                                            Bu Hany
                                                        </option>
                                                        <option value="Bu Icha" <?= ($row["vendor_sewing"] == "Bu Icha") ? "selected" : ""; ?>>
                                                            Bu Icha
                                                        </option>
                                                        <option value="Bu Kartika" <?= ($row["vendor_sewing"] == "Bu Kartika") ? "selected" : ""; ?>>
                                                            Bu Kartika
                                                        </option>
                                                        <option value="Bu Linda" <?= ($row["vendor_sewing"] == "Bu Linda") ? "selected" : ""; ?>>
                                                            Bu Linda
                                                        </option>
                                                        <option value="Bu Lilis" <?= ($row["vendor_sewing"] == "Bu Lilis") ? "selected" : ""; ?>>
                                                            Bu Lilis
                                                        </option>
                                                        <option value="Bu Rini" <?= ($row["vendor_sewing"] == "Bu Rini") ? "selected" : ""; ?>>
                                                            Bu Rini
                                                        </option>
                                                        <option value="Bu Riri" <?= ($row["vendor_sewing"] == "Bu Riri") ? "selected" : ""; ?>>
                                                            Bu Riri
                                                        </option>
                                                        <option value="Bu Ussy" <?= ($row["vendor_sewing"] == "Bu Ussy") ? "selected" : ""; ?>>
                                                            Bu Ussy
                                                        </option>
                                                        <option value="Bu Yani" <?= ($row["vendor_sewing"] == "Bu Yani") ? "selected" : ""; ?>>
                                                            Bu Yani
                                                        </option>
                                                        <option value="Bu Yuli" <?= ($row["vendor_sewing"] == "Bu Yuli") ? "selected" : ""; ?>>
                                                            Bu Yuli
                                                        </option>
                                                        <option value="CV SBB" <?= ($row["vendor_sewing"] == "CV SBB") ? "selected" : ""; ?>>
                                                            CV SBB
                                                        </option>
                                                        <option value="Kensby Research Co." <?= ($row["vendor_sewing"] == "Kensby Research Co.") ? "selected" : ""; ?>>
                                                            Kensby Research Co.
                                                        </option>
                                                        <option value="Muara Global" <?= ($row["vendor_sewing"] == "Muara Global") ? "selected" : ""; ?>>
                                                            Muara Global
                                                        </option>
                                                        <option value="Ophie Rever" <?= ($row["vendor_sewing"] == "Ophie Rever") ? "selected" : ""; ?>>
                                                            Ophie Rever
                                                        </option>
                                                        <option value="Pak Edi" <?= ($row["vendor_sewing"] == "Pak Edi") ? "selected" : ""; ?>>
                                                            Pak Edi
                                                        </option>
                                                        <option value="Pak Giri" <?= ($row["vendor_sewing"] == "Pak Giri") ? "selected" : ""; ?>>
                                                            Pak Giri
                                                        </option>
                                                        <option value="Pak Sunar" <?= ($row["vendor_sewing"] == "Pak Sunar") ? "selected" : ""; ?>>
                                                            Pak Sunar
                                                        </option>
                                                        <option value="Pa Ohid" <?= ($row["vendor_sewing"] == "Pa Ohid") ? "selected" : ""; ?>>
                                                            Pa Ohid
                                                        </option>
                                                        <option value="Penjahit Rapi" <?= ($row["vendor_sewing"] == "Penjahit Rapi") ? "selected" : ""; ?>>
                                                            Penjahit Rapi
                                                        </option>
                                                        <option value="PT Jaya Mitra Kurnia" <?= ($row["vendor_sewing"] == "PT Jaya Mitra Kurnia") ? "selected" : ""; ?>>
                                                            PT Jaya Mitra Kurnia
                                                        </option>
                                                        <option value="PT Thonnamaz" <?= ($row["vendor_sewing"] == "PT Thonnamaz") ? "selected" : ""; ?>>
                                                            PT Thonnamaz
                                                        </option>
                                                        <option value="PT.SJS" <?= ($row["vendor_sewing"] == "PT.SJS") ? "selected" : ""; ?>>
                                                            PT.SJS
                                                        </option>
                                                        <option value="RB Manufacturing" <?= ($row["vendor_sewing"] == "RB Manufacturing") ? "selected" : ""; ?>>
                                                            RB Manufacturing
                                                        </option>
                                                        <option value="Rumah Renza" <?= ($row["vendor_sewing"] == "Rumah Renza") ? "selected" : ""; ?>>
                                                            Rumah Renza
                                                        </option>
                                                        <option value="Sakh Konveksi" <?= ($row["vendor_sewing"] == "Sakh Konveksi") ? "selected" : ""; ?>>
                                                            Sakh Konveksi
                                                        </option>
                                                        <option value="Three and Me" <?= ($row["vendor_sewing"] == "Three and Me") ? "selected" : ""; ?>>
                                                            Three and Me
                                                        </option>
                                                        <option value="OTHER" <?= ($row["vendor_sewing"] == "OTHER") ? "selected" : ""; ?>>
                                                            Other
                                                        </option>
                                                    </select>
                                                </div>
                                                <!-- Kolom input tambahan untuk vendor_sewing lainnya -->
                                                <div class="form-group" id="otherVendor_sewingInput">
                                                    <label for="otherVendor_sewing">Vendor Sewing Lainnya</label>
                                                    <input class="form-control" type="text" id="otherVendor_sewing" name="otherVendor_sewing" placeholder="Pilih Other Pada Dropdown Untuk Memasukkan Vendor Sewing Lainnya">
                                                </div>
                                                <script>
                                                    function checkOtherOptionVendor_sewing(select) {
                                                        var otherVendor_sewingInput = document.getElementById(
                                                            "otherVendor_sewingInput");

                                                        if (select.value === "OTHER") {
                                                            otherVendor_sewingInput.style.display = "block";
                                                            document.getElementById("otherVendor_sewing").setAttribute(
                                                                "required",
                                                                "true");
                                                        } else {
                                                            otherVendor_sewingInput.style.display =
                                                                "block";
                                                            document.getElementById("otherVendor_sewing").removeAttribute(
                                                                "required");
                                                        }
                                                    }
                                                </script>
                                                <div class="form-group">
                                                    <label for="launching_date">Launching Date</label>
                                                    <input type="date" class="form-control" id="launching_date" name="launching_date" value="<?= $row["launching_date"]; ?>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="collection">Collection</label>
                                                    <input type="text" class="form-control" id="collection" name="collection" value="<?= $row["collection"]; ?>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="article_name">Article Name</label>
                                                    <input type="text" class="form-control" id="article_name" name="article_name" value="<?= $row["article_name"]; ?>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="size">Size</label>
                                                    <select class="form-control" id="size" name="size" required>
                                                        <option value="<?= $row["size"]; ?>" <?= ($row["size"] == $row["size"]) ? "selected" : ""; ?>>
                                                            <?= $row["size"]; ?>
                                                        </option>
                                                        <option value="S" <?= ($row["size"] == "S") ? "selected" : ""; ?>>
                                                            S</option>
                                                        <option value="M" <?= ($row["size"] == "M") ? "selected" : ""; ?>>
                                                            M</option>
                                                        <option value="S-M" <?= ($row["size"] == "S-M") ? "selected" : ""; ?>>S-M</option>
                                                        <option value="L" <?= ($row["size"] == "L") ? "selected" : ""; ?>>
                                                            L</option>
                                                        <option value="XL" <?= ($row["size"] == "XL") ? "selected" : ""; ?>>
                                                            XL</option>
                                                        <option value="L-XL" <?= ($row["size"] == "L-XL") ? "selected" : ""; ?>>L-XL
                                                        </option>
                                                        <option value="All Size" <?= ($row["size"] == "All Size") ? "selected" : ""; ?>>All
                                                            Size</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tgl_brg_masuk">Tanggal Barang Masuk</label>
                                                    <input type="date" class="form-control" id="tgl_brg_masuk" name="tgl_brg_masuk" value="<?= $row["tgl_brg_masuk"]; ?>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="sj_from_vendor">SJ From Vendor Sewing</label>
                                                    <input type="text" class="form-control" id="sj_from_vendor" name="sj_from_vendor" value="<?= $row["sj_from_vendor"]; ?>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="stock_hasilsewing">Stock Hasil Sewing</label>
                                                    <input type="number" class="form-control" id="stock_hasilsewing" name="stock_hasilsewing" pattern="[0-9]*" value="<?= $row["stock_hasilsewing"]; ?>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="status">Status</label>
                                                    <select class="form-control" id="status" name="status" required>
                                                        <option value="<?= $row["status"]; ?>" <?= ($row["status"] == $row["status"]) ? "selected" : ""; ?>>
                                                            <?= $row["status"]; ?>
                                                        </option>
                                                        <option value="Finished" <?= ($row["status"] == "Finished") ? "selected" : ""; ?>>
                                                            Finished
                                                        </option>
                                                        <option value="On Progress" <?= ($row["status"] == "On Progress") ? "selected" : ""; ?>>
                                                            On Progress</option>
                                                    </select>
                                                </div>
                                                <input type="hidden" name="page" value="<?= $page; ?>">
                                                <button type="submit" class="btn btn-primary">Ubah</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <?php $i++; ?>
                        <?php endforeach; ?>

                    </table>
                </div>

                <div>
                    <a href="../beranda.php" class="btn btn-success">Kembali</a>
                </div>
        </div>


    </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>©2023 Jenna and Kaia</p>
    </footer>

    <!-- jQuery -->
    <script src="../../vendor/jquery/jquery.min.js"></script>

    <!--include-->
    <script src="../../vendor/css/js/bootstrap.min.js"></script>

    <!-- JavaScript file -->
    <script src="script.js"></script>

    <script>
        function checkAll() {
            var checkboxes = document.querySelectorAll('.print-checkbox');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = true;
            });
        }

        function printTable() {
            const selectedRows = [];
            const checkboxes = document.querySelectorAll('.print-checkbox:checked');

            checkboxes.forEach(checkbox => {
                selectedRows.push(checkbox.getAttribute('data-id'));
            });

            if (selectedRows.length > 0) {
                const selectedRowsStr = selectedRows.join(',');
                const printPageUrl = `print_page.php?selected_rows=${encodeURIComponent(selectedRowsStr)}`;

                // Buka URL Print Page di tab baru
                window.open(printPageUrl, '_blank');
            } else {
                alert('No rows selected for printing.');
            }
        }

        function checkLainnya(field) {
            const dropdown = document.getElementById(field);
            const inputField = document.getElementById(field + "_input");

            if (dropdown.value === "LAINNYA") {
                inputField.style.display = "block";
                inputField.setAttribute("required", "required");
            } else {
                inputField.style.display = "none";
                inputField.removeAttribute("required");
            }
        }
    </script>

</body>

</html>