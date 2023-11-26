<?php
// Koneksi ke database
$db = mysqli_connect("localhost", "root", "", "gudangjenna");

function query($query)
{
    global $db;
    $result = mysqli_query($db, $query);
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

// Password hashed
function getHashedPassword($username)
{
    global $db;
    $query = "SELECT password FROM admin WHERE username = '$username' AND role = 'qc'";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        return $user['password'];
    } else {
        return false; // Username not found or role is not 'qc'
    }
}

// Get username's name
function getNama($username)
{
    global $db;
    $query = "SELECT nama FROM admin WHERE username = '$username' AND role = 'qc'";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        return $user['nama'];
    } else {
        return "Nama Tidak Ditemukan";
    }
}

function getUserRole($username)
{
    global $db;
    $query = "SELECT role FROM admin WHERE username = '$username'";
    $result = mysqli_query($db, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        return $user['role'];
    } else {
        return "unknown"; // Role not found
    }
}
