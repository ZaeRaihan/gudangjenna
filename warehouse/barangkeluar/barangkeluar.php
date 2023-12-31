<?php
session_start();
require 'functions.php';

// cek apakah user belum login atau tidak memiliki peran warehouse
if (!isset($_SESSION['usernamewh']) || $_SESSION['role'] !== 'warehouse') {
    header("Location: ../login.php");
    exit();
}

$barangkeluar = query("SELECT * FROM barangkeluar");

// Pagination
$limit = 20;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$totalRecords = count(query("SELECT * FROM barangkeluar"));
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
    $search = str_replace('.', '', $search); // Menghapus tanda titik dari angka format Rupiah
    $search = str_replace('Rp ', '', $search); // Menghapus teks "Rp " dari angka format Rupiah

    $search_filter = "WHERE
            LOWER(tgl_brg_keluar) LIKE '%$search%' OR 
            LOWER(sj_keluar) LIKE '%$search%' OR
            LOWER(gudang) LIKE '%$search%' OR
            LOWER(article_name) LIKE '%$search%' OR
            LOWER(size) LIKE '%$search%' OR
            LOWER(stock) LIKE '%$search%' OR
            LOWER(status) LIKE '%$search%' OR
            LOWER(keterangan) LIKE '%$search%' OR
            DATE_FORMAT(tgl_brg_keluar, '%d-%m-%Y') LIKE '%$search%' OR
            DATE_FORMAT(tgl_brg_keluar, '%Y-%m-%d') LIKE '%$search%' OR
            LOWER(MONTHNAME(tgl_brg_keluar)) LIKE '%$search%' OR
            LOWER(YEAR(tgl_brg_keluar)) LIKE '%$search%'
            ";
}

// Query dengan search filter and date filter
$query = "SELECT * FROM barangkeluar $date_filter $search_filter ORDER BY idbarang_keluar DESC LIMIT $start, $limit";
$barangkeluar = query($query);

// Hitung jumlah total records untuk pencarian yang difilter dan rentang tanggal
$totalRecordsSearchDateFilter = count(query("SELECT * FROM barangkeluar $date_filter $search_filter"));
$totalPagesSearchDateFilter = ceil($totalRecordsSearchDateFilter / $limit);

// Hitung jumlah total catatan untuk filtered date range
$totalRecordsDateFilter = count(query("SELECT * FROM barangkeluar $date_filter"));
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

    <!-- LIBRARY AJAX UNTUK EXPORT EXCEL -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>

    <!-- tema css -->
    <link href="../../css/tabel.css" rel="stylesheet">
    <title>Barang Keluar</title>
</head>

<body>
    <!------- NAVBAR ------->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <img src="../../images/Jenna-Kaia.png" alt="Logo Perusahaan" class="navbar-logo">
            <a class="navbar-brand">ADMIN WAREHOUSE</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown"
                    href="../logout.php"><?php echo getNama($_SESSION['usernamewh']); ?></i>
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
        <div class="navbar-default sidebar" role="navigation" style="font-size : 13.5px" ;>
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
                        <a href="../baranglolosqc/baranglolosqc.php">
                            BARANG LOLOS QC MASUK
                        </a>
                    </li>
                    <li>
                        <a href="../stockgudang/stockgudang.php">
                            STOCK GUDANG
                        </a>
                    </li>
                    <li>
                        <a href="../barangreject/barangreject.php">
                            BARANG REJECT MASUK
                        </a>
                    </li>
                    <li>
                        <a href="../gudangreject/gudangreject.php">
                            GUDANG BARANG REJECT
                        </a>
                    </li>
                    <li>
                        <a href="../barangminor/barangminor.php">
                            BARANG MINOR MASUK
                        </a>
                    </li>
                    <li>
                        <a href="../gudangminor/gudangminor.php">
                            GUDANG BARANG MINOR
                        </a>
                    </li>
                    <li class="active">
                        <a href="barangkeluar.php">
                            BARANG KELUAR
                        </a>
                    </li>
                    <li>
                        <a href="../barangretur/barangretur.php">
                            BARANG RETUR
                        </a>
                    </li>
                    <li>
                        <a href="../barangpinjam/barangpinjam.php">
                            BARANG PINJAM
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
            <h1 class="page-header">Inventori Barang Keluar
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
                            <a href="barangkeluar.php" class="btn btn-warning mx-2">Clear</a>
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
                            <!-- EXCEL -->
                            <div style="margin-right: 5px;">
                                <button class="btn btn-success" onclick="exportSelectedToExcel()">
                                    <i class="fa fa-file-excel-o"></i> Excel
                                </button>
                            </div>
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
                            <a href="barangkeluar.php" class="btn btn-warning mx-2">Clear Filter</a>
                        </form>
                    </div>
                    <div class="col-md-2 text-right">
                        <!-- "text-right" untuk menggeser teks ke kanan -->
                        <a href="barangkeluar_history.php" class="btn btn-info mx-2" target="_blank">History</a>
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
                                        <label for="tgl_brg_keluar">Tanggal Barang Keluar</label>
                                        <input type="date" class="form-control" id="tgl_brg_keluar"
                                            name="tgl_brg_keluar" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="sj_keluar">Surat keluar</label>
                                        <input type="text" class="form-control" id="sj_keluar" name="sj_keluar">
                                    </div>
                                    <div class="form-group">
                                        <label for="gudang">Gudang</label>
                                        <select class="form-control" id="gudang" name="gudang" required>
                                            <option value="" disabled selected>Pilih Gudang Asal</option>
                                            <option value="Stock Gudang">Stock Gudang</option>
                                            <option value="Gudang Barang Reject">Gudang Barang Reject</option>
                                            <option value="Gudang Barang Minor">Gudang Barang Minor</option>
                                        </select>
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
                                            pattern="[0-9]*" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Status Keluar</label>
                                        <select class="form-control" id="status" name="status" required>
                                            <option value="" disabled selected>Pilih Status Keluar</option>
                                            <option value="Online">Online</option>
                                            <option value="Offline">Offline</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="keterangan">Keterangan</label>
                                        <textarea class="form-control" id="keterangan" name="keterangan"
                                            required></textarea>
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
                            <th scope="col">Surat keluar</th>
                            <th scope="col">Gudang</th>
                            <th scope="col">Article Name</th>
                            <th scope="col">Size</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Status Keluar</th>
                            <th scope="col">Keterangan</th>
                            <th scope="col">Aksi</th>
                            <th scope="col">Printed</th>
                        </tr>

                        <!-- Table and Pagination -->
                        <?php $i = $start + 1; ?>
                        <!-- Hitung indeks awal saat ini berdasarkan halaman dan limit -->
                        <?php foreach ($barangkeluar as $row) : ?>

                        <tr class="data-row">
                            <td><input type="checkbox" class="print-checkbox" data-id="<?= $row["idbarang_keluar"]; ?>">
                            </td>
                            <td><?= $i; ?></td>
                            <td><?= formatDate($row["tgl_brg_keluar"]); ?></td>
                            <td><?= $row["sj_keluar"]; ?></td>
                            <td><?= $row["gudang"]; ?></td>
                            <td><?= $row["article_name"]; ?></td>
                            <td><?= $row["size"]; ?></td>
                            <td><?= $row["stock"]; ?></td>
                            <td><?= $row["status"]; ?></td>
                            <td>
                                <textarea name="keterangan" rows="2" cols="20" readonly
                                    onmousedown="return false;"><?= $row["keterangan"]; ?></textarea>
                            </td>
                            <!-- Rows untuk tinggi kolom, cols untuk lebar. onmousedown false agar textarea tidak dapat diklik -->
                            <td>
                                <div class="btn-group text-center" style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-warning delete-button"
                                        data-id="<?= $row["idbarang_keluar"]; ?>">Hapus</button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#ubahBarangModal<?= $row["idbarang_keluar"]; ?>"
                                        data-id="<?= $row["idbarang_keluar"]; ?>"
                                        data-page="<?= $page; ?>">Ubah</button>
                                    <button type="button" class="btn btn-success copy-button"
                                        data-id="<?= $row["idbarang_keluar"]; ?>">Copy</button>
                                </div>
                            </td>
                            <td><?= $row["print_timestamp"]; ?></td>
                        </tr>

                        <div class="modal fade" id="ubahBarangModal<?= $row["idbarang_keluar"]; ?>" tabindex="-1"
                            role="dialog" aria-labelledby="ubahBarangModalLabel<?= $row["idbarang_keluar"]; ?>"
                            aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title"
                                            id="ubahBarangModalLabel<?= $row["idbarang_keluar"]; ?>">
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
                                            <input type="hidden" name="id" value="<?= $row["idbarang_keluar"]; ?>">
                                            <div class="form-group">
                                                <label for="tgl_brg_keluar">Tanggal Barang Keluar</label>
                                                <input type="date" class="form-control" id="tgl_brg_keluar"
                                                    name="tgl_brg_keluar" value="<?= $row["tgl_brg_keluar"]; ?>"
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label for="sj_keluar">Surat keluar</label>
                                                <input type="text" class="form-control" id="sj_keluar" name="sj_keluar"
                                                    value="<?= $row["sj_keluar"]; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label for="gudang">Gudang</label>
                                                <select class="form-control" id="gudang" name="gudang" required>
                                                    <option value="<?= $row["gudang"]; ?>"
                                                        <?= ($row["gudang"] == $row["gudang"]) ? "selected" : ""; ?>>
                                                        <?= $row["gudang"]; ?>
                                                    </option>
                                                    <option value="Stock Gudang"
                                                        <?= ($row["gudang"] == "Stock Gudang") ? "selected" : ""; ?>>
                                                        Stock Gudang
                                                    </option>
                                                    <option value="Gudang Barang Reject"
                                                        <?= ($row["gudang"] == "Gudang Barang Reject") ? "selected" : ""; ?>>
                                                        Gudang Barang Reject</option>
                                                    <option value="Gudang Barang Minor"
                                                        <?= ($row["gudang"] == "Gudang Barang Minor") ? "selected" : ""; ?>>
                                                        Gudang Barang Minor</option>
                                                </select>
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
                                                    value="<?= $row["stock"]; ?>" pattern="[0-9]*" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="status">Status Keluar</label>
                                                <select class="form-control" id="status" name="status" required>
                                                    <option value="<?= $row["status"]; ?>"
                                                        <?= ($row["status"] == $row["status"]) ? "selected" : ""; ?>>
                                                        <?= $row["status"]; ?>
                                                    </option>
                                                    <option value="Online"
                                                        <?= ($row["status"] == "Online") ? "selected" : ""; ?>>
                                                        Online
                                                    </option>
                                                    <option value="Offline"
                                                        <?= ($row["status"] == "Offline") ? "selected" : ""; ?>>
                                                        Offline</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="keterangan">Keterangan</label>
                                                <textarea class="form-control" id="keterangan" name="keterangan"
                                                    required><?= $row["keterangan"]; ?></textarea>
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

            // Kirim request ke server untuk menyimpan timestamp
            fetch('save_timestamp.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        selectedRows
                    })
                })
                .then(response => {
                    if (response.ok) {
                        // Buka URL Print Page di tab baru
                        window.open(printPageUrl, '_blank');
                    } else {
                        throw new Error('Failed to save timestamp.');
                    }
                })
                .catch(error => {
                    alert(error.message);
                });
        } else {
            alert('No rows selected for printing.');
        }
    }

    function exportSelectedToExcel() {
        // Dapatkan semua checkbox terpilih
        var selectedRows = document.querySelectorAll('.print-checkbox:checked');

        if (selectedRows.length === 0) {
            alert('Tidak ada baris yang dipilih untuk diekspor.');
            return;
        }

        // Menyusun kolom
        var header = ["No", "Tanggal Barang Keluar", "Surat keluar", "Gudang", "Article Name", "Size", "Stock",
            "Status Keluar", "Keterangan"
        ];

        // Buat array untuk menyimpan data baris yang terpilih
        var data = [];

        // Loop melalui baris terpilih
        selectedRows.forEach(function(row) {
            var rowData = [];
            var cells = row.parentElement.parentElement.cells;

            // Loop melalui sel di dalam baris, i=1 agar tidak menghitung kolom checkbox
            for (var i = 1; i < cells.length - 1; i++) {
                rowData.push(cells[i].textContent);
            }

            // Tambahkan data baris ke dalam array data
            data.push(rowData);
        });

        // Gabungkan header dengan data
        var finalData = [header].concat(data);

        // Panggil fungsi untuk menghasilkan file Excel
        generateExcel(finalData);
    }

    function generateExcel(data) {
        var wb = XLSX.utils.book_new();
        var ws = XLSX.utils.aoa_to_sheet(data);

        XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
        XLSX.writeFile(wb, 'exported_Barang_Keluar.xlsx');
    }
    </script>


</body>

</html>