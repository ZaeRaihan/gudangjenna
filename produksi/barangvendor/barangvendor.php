<?php
session_start();
require 'functions.php';

// Check jika user sudah login
if (!isset($_SESSION['usernamepr'])) {
    header("Location: ../login.php");
    exit();
}

$barangvendor = query("SELECT * FROM barangvendor");

// Pagination
$limit = 10;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$totalRecords = count(query("SELECT * FROM barangvendor"));
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
    $date_filter = "WHERE tgl_brg_masuk BETWEEN '$start_date' AND '$end_date'";
}

// Periksa apakah query pencarian diatur dalam parameter GET
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Inisialisasi variabel search_filter
$search_filter = '';

// Bangun klausa WHERE untuk filter pencarian
if (!empty($search)) {
    $search = strtolower($search); // Ubah istilah penelusuran menjadi huruf kecil

    $search_filter = "WHERE 
        LOWER(tgl_brg_masuk) LIKE '%$search%' OR
        LOWER(sj_from_vendor) LIKE '%$search%' OR
        LOWER(launching_date) LIKE '%$search%' OR
        LOWER(collection) LIKE '%$search%' OR
        LOWER(article_name) LIKE '%$search%' OR
        LOWER(size) LIKE '%$search%' OR
        LOWER(stock) LIKE '%$search%' OR
        LOWER(vendor) LIKE '%$search%' OR
        LOWER(status) LIKE '%$search%' OR
        DATE_FORMAT(tgl_brg_masuk, '%d-%m-%Y') LIKE '%$search%' OR
        DATE_FORMAT(launching_date, '%d-%m-%Y') LIKE '%$search%' OR
        DATE_FORMAT(tgl_brg_masuk, '%Y-%m-%d') LIKE '%$search%' OR
        DATE_FORMAT(launching_date, '%Y-%m-%d') LIKE '%$search%' OR
        LOWER(MONTHNAME(tgl_brg_masuk)) LIKE '%$search%' OR
        LOWER(MONTHNAME(launching_date)) LIKE '%$search%' OR
        LOWER(YEAR(tgl_brg_masuk)) LIKE '%$search%' OR
        LOWER(YEAR(launching_date)) LIKE '%$search%'";
}

// Query dengan search filter and date filter
$query = "SELECT * FROM barangvendor $date_filter $search_filter ORDER BY idbarang_vendor DESC LIMIT $start, $limit";
$barangvendor = query($query);

// Hitung jumlah total records untuk pencarian yang difilter dan rentang tanggal
$totalRecordsSearchDateFilter = count(query("SELECT * FROM barangvendor $date_filter $search_filter"));
$totalPagesSearchDateFilter = ceil($totalRecordsSearchDateFilter / $limit);

// Hitung jumlah total catatan untuk filtered date range
$totalRecordsDateFilter = count(query("SELECT * FROM barangvendor $date_filter"));
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
    <title>Barang vendor</title>
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
                <a class="dropdown-toggle" data-toggle="dropdown"
                    href="../logout.php"><?php echo getNama($_SESSION['usernamepr']); ?></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <form class="" action="../logout.php" onclick="return confirm('yakin ingin logout?');"
                            method="post">
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
                        <a href="barangvendor.php">
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
                    <li>
                        <a href="../baranginsewing/baranginsewing.php">
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
            <h1 class="page-header">Inventori Barang Vendor
                <br><br><br>

                <!-- TAMBAH DATA DENGAN MODAL -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="text-left">
                            <a href="#" class="btn btn-success" data-toggle="modal"
                                data-target="#tambahBarangModal">Tambah
                                Barang</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Search Form -->
                        <form action="" method="GET" class="form-inline">
                            <label for="search"></label>
                            <input type="text" class="form-control mx-2" id="search" name="search"
                                value="<?php echo $_GET['search'] ?? ''; ?>" placeholder="cari data barang">
                            <button type="submit" class="btn btn-success">Search</button>
                            <a href="barangvendor.php" class="btn btn-warning mx-2">Clear</a>
                        </form>

                    </div>
                </div>
                <div class="row" style="margin-top: 5px;">
                    <div class="col-md-6">
                        <div class="button-group" style="display: flex; align-items: center;">
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
                    <div class="col-md-10">
                        <form action="" method="GET" class="form-inline">
                            <label for="start_date">Start Date:</label>
                            <input type="date" class="form-control mx-2" id="start_date" name="start_date"
                                value="<?php echo $_GET['start_date'] ?? ''; ?>">

                            <label for="end_date">End Date:</label>
                            <input type="date" class="form-control mx-2" id="end_date" name="end_date"
                                value="<?php echo $_GET['end_date'] ?? ''; ?>">

                            <button type="submit" class="btn btn-success">Apply Filter</button>
                            <a href="barangvendor.php" class="btn btn-warning mx-2">Clear Filter</a>
                        </form>
                    </div>
                    <div class="col-md-2 text-right">
                        <!-- "text-right" untuk menggeser teks ke kanan -->
                        <a href="barangvendor_history.php" class="btn btn-info mx-2" target="_blank">History</a>
                    </div>
                </div>


                <!-- Modal -->
                <div class="modal fade" id="tambahBarangModal" tabindex="-1" role="dialog"
                    aria-labelledby="tambahBarangModalLabel" aria-hidden="true">
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
                                        <label for="tgl_brg_masuk">Tanggal Barang Masuk</label>
                                        <input type="date" class="form-control" id="tgl_brg_masuk" name="tgl_brg_masuk"
                                            required>
                                    </div>
                                    <div class="form-group">
                                        <label for="sj_from_vendor">SJ From Vendor</label>
                                        <input type="text" class="form-control" id="sj_from_vendor"
                                            name="sj_from_vendor">
                                    </div>
                                    <div class="form-group">
                                        <label for="launching_date">Launching Date</label>
                                        <input type="date" class="form-control" id="launching_date"
                                            name="launching_date">
                                    </div>
                                    <div class="form-group">
                                        <label for="collection">Collection</label>
                                        <input type="text" class="form-control" id="collection" name="collection">
                                    </div>
                                    <div class="form-group">
                                        <label for="article_name">Article Name</label>
                                        <input type="text" class="form-control" id="article_name" name="article_name"
                                            required>
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
                                        <label for="stock">Stock</label>
                                        <input type="number" class="form-control" id="stock" name="stock"
                                            pattern="[0-9]*">
                                    </div>
                                    <div class="form-group">
                                        <label for="vendor">Vendor</label>
                                        <select class="form-control" id="vendor" name="vendor" required
                                            onchange="checkLainnya('vendor')">
                                            <option value="" disabled selected>Pilih Vendor</option>
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
                                            <!-- Opsi vendor lainnya -->
                                            <option value="LAINNYA">Lainnya</option>>
                                        </select>
                                        <input type="text" class="form-control mt-2" id="vendor_input"
                                            name="vendor_input" style="display: none;" placeholder="Masukkan Vendor">
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select class="form-control" id="status" name="status" required>
                                            <option value="" disabled selected>Pilih Status</option>
                                            <option value="QC">QC</option>
                                            <option value="Payet">Payet</option>
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
                            <th scope="col">No</th>
                            <th scope="col">Tanggal Barang Masuk</th>
                            <th scope="col">SJ From Vendor</th>
                            <th scope="col">Launching Date</th>
                            <th scope="col">Collection</th>
                            <th scope="col">Article Name</th>
                            <th scope="col">Size</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Vendor</th>
                            <th scope="col">Status</th>
                            <th scope="col">Kirim</th>
                            <th scope="col">Aksi</th>
                        </tr>

                        <!-- Table and Pagination -->
                        <?php $i = $start + 1; ?>
                        <!-- Hitung indeks awal saat ini berdasarkan halaman dan limit -->
                        <?php foreach ($barangvendor as $row) : ?>

                        <tr class="data-row">
                            <td><?= $i; ?></td>
                            <td><?= formatDate($row["tgl_brg_masuk"]); ?></td>
                            <td><?= $row["sj_from_vendor"]; ?></td>
                            <td><?= formatDate($row["launching_date"]); ?></td>
                            <td><?= $row["collection"]; ?></td>
                            <td><?= $row["article_name"]; ?></td>
                            <td><?= $row["size"]; ?></td>
                            <td><?= $row["stock"]; ?></td>
                            <td><?= $row["vendor"]; ?></td>
                            <td><?= $row["status"]; ?></td>
                            <td>
                                <div class="btn-group text-center" style="display: flex; justify-content: center;">
                                    <!-- Button untuk mengirim data ke tabel barangqc -->
                                    <form action="kirim_qc.php" method="post" style="margin: 0;">
                                        <input type="hidden" name="idbarang_vendor"
                                            value="<?= $row["idbarang_vendor"]; ?>">
                                        <button type="submit" class="btn btn-info">QC</button>
                                    </form>

                                    <!-- Button untuk mengirim data ke tabel barangpayet -->
                                    <form action="kirim_payet.php" method="post" style="margin: 0;">
                                        <input type="hidden" name="idbarang_vendor"
                                            value="<?= $row["idbarang_vendor"]; ?>">
                                        <button type="submit" class="btn btn-warning">Payet</button>
                                    </form>
                                </div>
                            </td>
                            <td>
                                <div class="btn-group text-center" style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-warning delete-button"
                                        data-id="<?= $row["idbarang_vendor"]; ?>">Hapus</button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#ubahBarangModal<?= $row["idbarang_vendor"]; ?>"
                                        data-id="<?= $row["idbarang_vendor"]; ?>"
                                        data-page="<?= $page; ?>">Ubah</button>
                                    <button type="button" class="btn btn-success copy-button"
                                        data-id="<?= $row["idbarang_vendor"]; ?>">Copy</button>
                                </div>
                            </td>
                        </tr>

                        <div class="modal fade" id="ubahBarangModal<?= $row["idbarang_vendor"]; ?>" tabindex="-1"
                            role="dialog" aria-labelledby="ubahBarangModalLabel<?= $row["idbarang_vendor"]; ?>"
                            aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title"
                                            id="ubahBarangModalLabel<?= $row["idbarang_vendor"]; ?>">
                                            Ubah Barang</h3>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- Form untuk mengubah data barang -->
                                        <form action="proses_ubah.php" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="url"
                                                value="<?= basename($_SERVER['PHP_SELF']) . "?" . $_SERVER['QUERY_STRING'] ?>">
                                            <input type="hidden" name="id" value="<?= $row["idbarang_vendor"]; ?>">
                                            <div class="form-group">
                                                <label for="tgl_brg_masuk">Tanggal Barang Masuk</label>
                                                <input type="date" class="form-control" id="tgl_brg_masuk"
                                                    name="tgl_brg_masuk" value="<?= $row["tgl_brg_masuk"]; ?>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="sj_from_vendor">Sj From Vendor</label>
                                                <input type="text" class="form-control" id="sj_from_vendor"
                                                    name="sj_from_vendor" value="<?= $row["sj_from_vendor"]; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label for="launching_date">Launching Date</label>
                                                <input type="date" class="form-control" id="launching_date"
                                                    name="launching_date" value="<?= $row["launching_date"]; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label for="collection">Collection</label>
                                                <input type="text" class="form-control" id="collection"
                                                    name="collection" value="<?= $row["collection"]; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label for="article_name">Article Name</label>
                                                <input type="text" class="form-control" id="article_name"
                                                    name="article_name" value="<?= $row["article_name"]; ?>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="size">Size</label>
                                                <select class="form-control" id="size" name="size" required>
                                                    <option value="<?= $row["size"]; ?>"
                                                        <?= ($row["size"] == $row["size"]) ? "selected" : ""; ?>>
                                                        <?= $row["size"]; ?>
                                                    </option>
                                                    <option value="S" <?= ($row["size"] == "S") ? "selected" : ""; ?>>
                                                        S</option>
                                                    <option value="M" <?= ($row["size"] == "M") ? "selected" : ""; ?>>
                                                        M</option>
                                                    <option value="S-M"
                                                        <?= ($row["size"] == "S-M") ? "selected" : ""; ?>>S-M</option>
                                                    <option value="L" <?= ($row["size"] == "L") ? "selected" : ""; ?>>
                                                        L</option>
                                                    <option value="XL" <?= ($row["size"] == "XL") ? "selected" : ""; ?>>
                                                        XL</option>
                                                    <option value="L-XL"
                                                        <?= ($row["size"] == "L-XL") ? "selected" : ""; ?>>L-XL
                                                    </option>
                                                    <option value="All Size"
                                                        <?= ($row["size"] == "All Size") ? "selected" : ""; ?>>All
                                                        Size</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="stock">Stock</label>
                                                <input type="number" class="form-control" id="stock" name="stock"
                                                    pattern="[0-9]*" value="<?= $row["stock"]; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label for="vendor">Vendor</label>
                                                <select class="form-control" id="vendor" name="vendor" required
                                                    onchange="checkOtherOptionVendor(this);">
                                                    <option value="<?= $row["vendor"]; ?>"
                                                        <?= ($row["vendor"] == $row["vendor"]) ? "selected" : ""; ?>>
                                                        <?= $row["vendor"]; ?>
                                                    </option>
                                                    <option value="Alia Digital Printex"
                                                        <?= ($row["vendor"] == "Alia Digital Printex") ? "selected" : ""; ?>>
                                                        Alia Digital Printex
                                                    </option>
                                                    <option value="Atfemale"
                                                        <?= ($row["vendor"] == "Atfemale") ? "selected" : ""; ?>>
                                                        Atfemale
                                                    </option>
                                                    <option value="Atmosfira Dekatama"
                                                        <?= ($row["vendor"] == "Atmosfira Dekatama") ? "selected" : ""; ?>>
                                                        Atmosfira Dekatama
                                                    </option>
                                                    <option value="Baju Kertas"
                                                        <?= ($row["vendor"] == "Baju Kertas") ? "selected" : ""; ?>>
                                                        Baju Kertas
                                                    </option>
                                                    <option value="Bandanaira"
                                                        <?= ($row["vendor"] == "Bandanaira") ? "selected" : ""; ?>>
                                                        Bandanaira
                                                    </option>
                                                    <option value="Bu Citra"
                                                        <?= ($row["vendor"] == "Bu Citra") ? "selected" : ""; ?>>
                                                        Bu Citra
                                                    </option>
                                                    <option value="Bu Dewi"
                                                        <?= ($row["vendor"] == "Bu Dewi") ? "selected" : ""; ?>>
                                                        Bu Dewi
                                                    </option>
                                                    <option value="Bu Elis"
                                                        <?= ($row["vendor"] == "Bu Elis") ? "selected" : ""; ?>>
                                                        Bu Elis
                                                    </option>
                                                    <option value="Bu Hany"
                                                        <?= ($row["vendor"] == "Bu Hany") ? "selected" : ""; ?>>
                                                        Bu Hany
                                                    </option>
                                                    <option value="Bu Icha"
                                                        <?= ($row["vendor"] == "Bu Icha") ? "selected" : ""; ?>>
                                                        Bu Icha
                                                    </option>
                                                    <option value="Bu Kartika"
                                                        <?= ($row["vendor"] == "Bu Kartika") ? "selected" : ""; ?>>
                                                        Bu Kartika
                                                    </option>
                                                    <option value="Bu Linda"
                                                        <?= ($row["vendor"] == "Bu Linda") ? "selected" : ""; ?>>
                                                        Bu Linda
                                                    </option>
                                                    <option value="Bu Lilis"
                                                        <?= ($row["vendor"] == "Bu Lilis") ? "selected" : ""; ?>>
                                                        Bu Lilis
                                                    </option>
                                                    <option value="Bu Rini"
                                                        <?= ($row["vendor"] == "Bu Rini") ? "selected" : ""; ?>>
                                                        Bu Rini
                                                    </option>
                                                    <option value="Bu Riri"
                                                        <?= ($row["vendor"] == "Bu Riri") ? "selected" : ""; ?>>
                                                        Bu Riri
                                                    </option>
                                                    <option value="Bu Ussy"
                                                        <?= ($row["vendor"] == "Bu Ussy") ? "selected" : ""; ?>>
                                                        Bu Ussy
                                                    </option>
                                                    <option value="Bu Yani"
                                                        <?= ($row["vendor"] == "Bu Yani") ? "selected" : ""; ?>>
                                                        Bu Yani
                                                    </option>
                                                    <option value="Bu Yuli"
                                                        <?= ($row["vendor"] == "Bu Yuli") ? "selected" : ""; ?>>
                                                        Bu Yuli
                                                    </option>
                                                    <option value="CV SBB"
                                                        <?= ($row["vendor"] == "CV SBB") ? "selected" : ""; ?>>
                                                        CV SBB
                                                    </option>
                                                    <option value="Kensby Research Co."
                                                        <?= ($row["vendor"] == "Kensby Research Co.") ? "selected" : ""; ?>>
                                                        Kensby Research Co.
                                                    </option>
                                                    <option value="Muara Global"
                                                        <?= ($row["vendor"] == "Muara Global") ? "selected" : ""; ?>>
                                                        Muara Global
                                                    </option>
                                                    <option value="Ophie Rever"
                                                        <?= ($row["vendor"] == "Ophie Rever") ? "selected" : ""; ?>>
                                                        Ophie Rever
                                                    </option>
                                                    <option value="Pak Edi"
                                                        <?= ($row["vendor"] == "Pak Edi") ? "selected" : ""; ?>>
                                                        Pak Edi
                                                    </option>
                                                    <option value="Pak Giri"
                                                        <?= ($row["vendor"] == "Pak Giri") ? "selected" : ""; ?>>
                                                        Pak Giri
                                                    </option>
                                                    <option value="Pak Sunar"
                                                        <?= ($row["vendor"] == "Pak Sunar") ? "selected" : ""; ?>>
                                                        Pak Sunar
                                                    </option>
                                                    <option value="Pa Ohid"
                                                        <?= ($row["vendor"] == "Pa Ohid") ? "selected" : ""; ?>>
                                                        Pa Ohid
                                                    </option>
                                                    <option value="Penjahit Rapi"
                                                        <?= ($row["vendor"] == "Penjahit Rapi") ? "selected" : ""; ?>>
                                                        Penjahit Rapi
                                                    </option>
                                                    <option value="PT Jaya Mitra Kurnia"
                                                        <?= ($row["vendor"] == "PT Jaya Mitra Kurnia") ? "selected" : ""; ?>>
                                                        PT Jaya Mitra Kurnia
                                                    </option>
                                                    <option value="PT Thonnamaz"
                                                        <?= ($row["vendor"] == "PT Thonnamaz") ? "selected" : ""; ?>>
                                                        PT Thonnamaz
                                                    </option>
                                                    <option value="PT.SJS"
                                                        <?= ($row["vendor"] == "PT.SJS") ? "selected" : ""; ?>>
                                                        PT.SJS
                                                    </option>
                                                    <option value="RB Manufacturing"
                                                        <?= ($row["vendor"] == "RB Manufacturing") ? "selected" : ""; ?>>
                                                        RB Manufacturing
                                                    </option>
                                                    <option value="Rumah Renza"
                                                        <?= ($row["vendor"] == "Rumah Renza") ? "selected" : ""; ?>>
                                                        Rumah Renza
                                                    </option>
                                                    <option value="Sakh Konveksi"
                                                        <?= ($row["vendor"] == "Sakh Konveksi") ? "selected" : ""; ?>>
                                                        Sakh Konveksi
                                                    </option>
                                                    <option value="Three and Me"
                                                        <?= ($row["vendor"] == "Three and Me") ? "selected" : ""; ?>>
                                                        Three and Me
                                                    </option>
                                                    <option value="OTHER"
                                                        <?= ($row["vendor"] == "OTHER") ? "selected" : ""; ?>>
                                                        Other
                                                    </option>
                                                </select>
                                            </div>
                                            <!-- Kolom input tambahan untuk vendor lainnya -->
                                            <div class="form-group" id="otherVendorInput" style="display:none;">
                                                <label for="otherVendor">Vendor Lainnya</label>
                                                <input class="form-control" type="text" id="otherVendor"
                                                    name="otherVendor">
                                            </div>
                                            <script>
                                            function checkOtherOptionVendor(select) {
                                                var otherVendorInput = document.getElementById("otherVendorInput");
                                                var otherVendor = document.getElementById("otherVendor");

                                                if (select.value === "OTHER") {
                                                    otherVendorInput.style.display = "block";
                                                    otherVendor.setAttribute("required", "true");
                                                } else {
                                                    otherVendorInput.style.display = "none";
                                                    otherVendor.removeAttribute("required");
                                                }
                                            }
                                            </script>
                                            <div class="form-group">
                                                <label for="status">Status</label>
                                                <select class="form-control" id="status" name="status" required>
                                                    <option value="<?= $row["status"]; ?>"
                                                        <?= ($row["status"] == $row["status"]) ? "selected" : ""; ?>>
                                                        <?= $row["status"]; ?>
                                                    </option>
                                                    <option value="QC"
                                                        <?= ($row["status"] == "QC") ? "selected" : ""; ?>>QC
                                                    </option>
                                                    <option value="Payet"
                                                        <?= ($row["status"] == "Payet") ? "selected" : ""; ?>>
                                                        Payet</option>
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