<?php
session_start();
require 'functions.php';

$error_message = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['user'];
    $password = $_POST['pass'];

    // fungsi untuk mengambil kata sandi hash dari database
    $hashedPassword = getHashedPassword($username);

    // Compare password yang sudah pakai hash
    if (password_verify($password, $hashedPassword)) {
        $_SESSION['username'] = $username;
        header("Location: beranda.php");
        exit();
    } else {
        $error_message = "Username atau Password Salah!";
    }
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Agar dapat terlihat di Mobile/Responsif -->
    <title>Login Admin Produksi</title>

    <!-- boootstrap -->
    <link href="../vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- icon dan fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- tema css -->
    <link href="../css/login.css" rel="stylesheet">

</head>

<body>
    <!-- Menu -->
    <nav class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand">Login Admin Produksi</a>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <section class="bagian3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title text-center">Masuk</h1>
                        </div>
                        <div class="panel-body">
                            <form class="form" action="" method="post">
                                <!-- LOGIN ACTION PHP -->
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="fa fa-laptop"></i></span>
                                    <input class="form-control" type="text" name="user" required=""
                                        placeholder="Masukkan username Anda">
                                </div>

                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                    <input class="form-control" type="password" name="pass" value="" required=""
                                        placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <a href="../index.php">
                                        <button type="button" name="button" class="btn btn-danger">Batal</button>
                                    </a>

                                    <input class="btn btn-success" type="submit" name="daftar" value="Masuk">
                                </div>
                                <?php if (!empty($error_message)) : ?>
                                <p class="text-danger text-center"><?php echo $error_message; ?></p>
                                <?php endif; ?>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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