<?php
session_start();
// session_unset();
// session_destroy();
unset($_SESSION['usernamepr']);
header("Location: login.php");
exit();
?>