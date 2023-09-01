<?php
session_start();
// session_unset();
// session_destroy();
unset($_SESSION['usernamemg']);
header("Location: login.php");
exit();
?>