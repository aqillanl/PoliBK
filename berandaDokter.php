<?php

if (!isset($_SESSION)) {
  session_start();
}

include_once("koneksi.php");
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Poliklinik BK</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
  <body>
    <nav class="navbar fixed-top navbar-expand-lg py-3 navbar-dark" style="background-color: #00274c;">
        <div class="container d-flex align-items-center">
            <a class="navbar-brand" href="berandaDokter.php">Poliklinik BK  </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <?php
                if (isset($_SESSION['nip'])) {
                    // Jika pengguna sudah login, tampilkan tombol "Logout"
                ?>
                    <ul class="navbar-nav d-flex align-items-lg-center ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="berandaDokter.php">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="berandaDokter.php?page=periksa">Periksa</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="berandaDokter.php?page=riwayat">Riwayat</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="berandaDokter.php?page=aturJadwalDokter">Set Jadwal</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="logout.php">Logout (<?php echo $_SESSION['nama'] ?>)</a>
                        </li>
                    </ul>
                <?php
                } else {
                    // Jika pengguna belum login, tampilkan tombol "Login" dan "Register"
                ?>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=loginDokter">Login</a>
                        </li>
                    </ul>
                <?php
                }
                ?>
            </div>
        </div>
    </nav>
    

    <main role="main" >
    <?php
    if (isset($_GET['page'])) {
        include($_GET['page'] . ".php");
    } else {

        if (isset($_SESSION['nama'])) {
            //jika sudah login tampilkan nip
            echo "<div style='background-color: #005596; padding: 120px 0; text-align: center; color: white; width: 100vw; '>
            <h1 class='display-5 fw-bolder text-white mb-2'>PENDAFTARAN ONLINE POLIKLINIK <br>Pasien - Dokter " . $_SESSION['nama'] . "</h1>
            <p class='lead text-white-70 mb-4'>Bimbingan Karir 2023 <br>Universitas Dian Nuswantoro</p>
            </div>";
        } else {
            echo "</h2><hr>Silakan Login untuk menggunakan sistem.";
        }
    }
    ?>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/71c2ab2c83.js" crossorigin="anonymous"></script>
  </body>
</html>