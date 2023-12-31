<?php
session_start();
require 'functions.php';

// cek apakah user belum login atau tidak memiliki peran warehouse
if (!isset($_SESSION['usernamewh']) || $_SESSION['role'] !== 'warehouse') {
    header("Location: ../login.php");
    exit();
}

$adminwh = query("SELECT * FROM admin");

// Pagination
$limit = 5;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$start = ($page - 1) * $limit;

$adminwh = query("SELECT * FROM admin LIMIT $start, $limit");
$totalRecords = count(query("SELECT * FROM admin"));
$totalPages = ceil($totalRecords / $limit);

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
    <link href="../../css/admin.css" rel="stylesheet">
    <title>Admin WH</title>
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
                <a class="dropdown-toggle" data-toggle="dropdown" href="../logout.php"><?php echo getNama($_SESSION['usernamewh']); ?></i>
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
        <div class="navbar-default sidebar" role="navigation" style="font-size : 13.5px" ;>
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="../beranda.php">
                            BERANDA
                        </a>
                    </li>
                    <li class="active">
                        <a href="admin.php">
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
                    <li>
                        <a href="../barangkeluar/barangkeluar.php">
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
            <h1 class="page-header">Data Admin Warehouse
                <br><br><br>

                <!-- TAMBAH DATA DENGAN MODAL -->
                <div class="text-left">
                    <a href="#" class="btn btn-success" data-toggle="modal" data-target="#tambahAdminModal">Tambah
                        Admin</a>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="tambahAdminModal" tabindex="-1" role="dialog" aria-labelledby="tambahAdminModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title" id="tambahAdminModalLabel">Tambah Admin</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- Form untuk menambahkan data admin -->
                                <form action="proses_tambah_admin.php" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="nama">Nama</label>
                                        <input type="text" class="form-control" id="nama" name="nama" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="telepon">Telepon</label>
                                        <input type="text" class="form-control" id="telepon" name="telepon" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="foto">Foto</label>
                                        <input type="file" class="form-control-file" id="foto" name="foto">
                                    </div>
                                    <button type="submit" class="btn btn-info">Tambah</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- LINK PAGINATION -->
                <div class="text-center">
                    <ul class="pagination">
                        <?php for ($p = 1; $p <= $totalPages; $p++) : ?>
                            <li class="<?php if ($p == $page) echo 'active'; ?>">
                                <a href="?page=<?php echo $p; ?>"><?php echo $p; ?></a>
                            </li>
                        <?php endfor; ?>
                    </ul>
                </div>

                <div class="table-responsive">
                    <table id="data-table" class="table table-hover">
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Telepon</th>
                            <th scope="col">Foto</th>
                            <th scope="col">Divisi</th>
                            <th scope="col">Aksi</th>
                        </tr>

                        <!-- Table and Pagination -->
                        <?php $i = 1 + ($page - 1) * $limit; ?>
                        <?php foreach ($adminwh as $row) : ?>

                            <tr>
                                <td><?= $i; ?></td>
                                <td><?= $row["nama"]; ?></td>
                                <td><?= $row["telepon"]; ?></td>
                                <td><img src="../../images/<?= $row["foto"]; ?>"></td>
                                <td><?= $row["role"]; ?></td>
                                <td>
                                    <div class="btn-group text-center" style="display: flex; justify-content: center;">
                                        <!-- <form action="proses_hapus_admin.php" method="post" style="display: inline;">
                                        <input type="hidden" name="id" value="<?= $row["id"]; ?>">
                                        <button type="submit" class="btn btn-warning"
                                            onclick="return confirm('Apakah Anda yakin ingin menghapus admin ini?')">Hapus</button>
                                    </form> -->
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ubahAdminModal<?= $row["id"]; ?>">Ubah</button>
                                    </div>
                                </td>
                            </tr>

                            <div class="modal fade" id="ubahAdminModal<?= $row["id"]; ?>" tabindex="-1" role="dialog" aria-labelledby="ubahAdminModalLabel<?= $row["id"]; ?>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="ubahAdminModalLabel<?= $row["id"]; ?>">Ubah Admin
                                            </h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Form untuk mengubah data admin -->
                                            <form action="proses_ubah_admin.php" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="id" value="<?= $row["id"]; ?>">
                                                <div class="form-group">
                                                    <label for="username">Username</label>
                                                    <input type="password" class="form-control" id="username" name="username" value="<?= $row["username"]; ?>" required readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="nama">Nama</label>
                                                    <input type="text" class="form-control" id="nama" name="nama" value="<?= $row["nama"]; ?>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="telepon">Telepon</label>
                                                    <input type="text" class="form-control" id="telepon" name="telepon" value="<?= $row["telepon"]; ?>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password_lama">Password Lama</label>
                                                    <input type="password" class="form-control" id="password_lama" name="password_lama" autocomplete="off" placeholder="Masukkan Password Ketika Ingin Melakukan Perubahan Data" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password_baru">Password Baru</label>
                                                    <input type="password" class="form-control" id="password_baru" name="password_baru">
                                                </div>
                                                <div class="form-group">
                                                    <label for="konfirmasi_password">Konfirmasi Password Baru</label>
                                                    <input type="password" class="form-control" id="konfirmasi_password" name="konfirmasi_password">
                                                </div>
                                                <div class="form-group">
                                                    <label for="foto">Foto</label>
                                                    <input type="file" class="form-control-file" id="foto" name="foto">
                                                </div>
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


                <div style="margin-top: 20px;">
                    <a href="../beranda.php" class="btn btn-success">Kembali</a>
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
</body>

</html>