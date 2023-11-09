<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- boootstrap -->
    <link href="vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/css/bootstrap/bootstrap.css" rel="stylesheet">

    <!-- icon dan fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- tema css -->
    <link href="css/index.css" rel="stylesheet">
    <title>Gudang</title>
</head>

<body>


    <!-- Navbar -->
    <nav class="navbar navbar-default navbar-fixed-top navbar-custom  ">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand">Gudang Jenna and Kaia</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="page-scroll">
                        <a href="index.php">Beranda</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#login">Login</a>
                    </li>
                </ul>
            </div>



        </div>
    </nav>

    <!-- Header-->
    <header>
        <div class="jumbotron">
            <img src="images/Logo.png" alt="Header Gambar">
        </div>
    </header>


    <!-- Content Login Feature Section Start -->

    <section id="login" class="section-margin" style="margin-bottom: 100pt;">

        <div class="row content" id="login">
            <div class="col-lg-12 danger text-center zero-panel">
                <div class="col-lg-12 zero-panel-content">
                    <h1><strong> LOGIN </strong></h1>
                </div>
                <br>
                <a href="warehouse/login.php" target="_blank"><button class="btn btn-warning" style="size: 50px;">ADMIN
                        WAREHOUSE</button></a>
                <br><br>
                <a href="qc/login.php" target="_blank"><button class="btn btn-success" style="size: 50px;">ADMIN
                        QC</button></a>
                <br><br>
                <a href="produksi/login.php" target="_blank"><button class="btn btn-primary" style="size: 50px;">ADMIN
                        PRODUKSI</button></a>
                <br><br>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>©2023 Jenna and Kaia</p>
    </footer>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!--include-->
    <script src="vendor/css/js/bootstrap.min.js"></script>
</body>

</html>