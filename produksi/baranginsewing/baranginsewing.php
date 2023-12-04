<?php
session_start();
require 'functions.php';

// cek apakah user belum login atau tidak memiliki peran produksi
if (!isset($_SESSION['usernamepr']) || $_SESSION['role'] !== 'produksi') {
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
            <img src="../../images/Jenna-Kaia.png" alt="Logo Perusahaan" class="navbar-logo">
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
                                        <label for="vendor_sewing">Vendor</label>
                                        <select class="form-control" id="vendor_sewing" name="vendor_sewing" required>
                                            <option value="" disabled selected>Pilih Vendor</option>
                                            <?php
                                            // Mengambil data vendor dari tabel 'vendor'
                                            $conn = new mysqli("localhost", "root", "", "gudangjenna");
                                            $sql = "SELECT * FROM vendor";
                                            $result = $conn->query($sql);

                                            if ($result->num_rows > 0) {
                                                while ($row = $result->fetch_assoc()) {
                                                    echo '<option value="' . $row["nama_vendor"] . '">' . $row["nama_vendor"] . '</option>';
                                                }
                                            } else {
                                                echo '<option value="">Tidak ada data vendor</option>';
                                            }
                                            $conn->close();
                                            ?>
                                        </select>
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
                                                    <label for="vendor_sewing">Vendor</label>
                                                    <select class="form-control" id="vendor_sewing" name="vendor_sewing" required>
                                                        <option value="<?= $row["vendor_sewing"]; ?>" selected>
                                                            <?= $row["vendor_sewing"]; ?>
                                                        </option>

                                                        <?php
                                                        // Mengambil data vendor dari tabel 'vendor'
                                                        $koneksi = new mysqli("localhost", "root", "", "gudangjenna");
                                                        $sql = "SELECT * FROM vendor";
                                                        $result = $koneksi->query($sql);

                                                        // Loop melalui hasil kueri untuk membuat opsi dropdown
                                                        if ($result->num_rows > 0) {
                                                            while ($vendor = $result->fetch_assoc()) {
                                                        ?>
                                                                <option value="<?= $vendor["nama_vendor"]; ?>">
                                                                    <?= $vendor["nama_vendor"]; ?>
                                                                </option>
                                                        <?php
                                                            }
                                                        }
                                                        $koneksi->close();
                                                        ?>
                                                    </select>
                                                </div>
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
    </script>

</body>

</html>