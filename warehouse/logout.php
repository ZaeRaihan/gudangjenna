<?php
session_start();
// session_unset();
// session_destroy();
unset($_SESSION['usernamewh']);
header("Location: login.php");
exit();
?>