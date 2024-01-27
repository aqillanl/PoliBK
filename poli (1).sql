-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 27 Jan 2024 pada 04.28
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(10) UNSIGNED NOT NULL,
  `id_jadwal` int(10) UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `tanggal`) VALUES
(37, 13, 6, 'adfadqd', 1, '2024-01-07 19:40:14'),
(38, 17, 6, 'Keluhan mata kiri', 2, '2024-01-08 05:46:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_periksa` int(10) UNSIGNED NOT NULL,
  `id_obat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(33, 108, 1),
(34, 108, 6),
(35, 109, 5),
(36, 109, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(10) UNSIGNED NOT NULL,
  `nip` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `nip`, `password`) VALUES
(12, 'dr. IRASTRI ANGGRAINI, Sp.M	', 'Jl. Durian Tiga', '08278462347', 2, 16782230, '$2y$10$fQI0AnlndCjAEjnxUhm90efMfd6JvvFcaADSBPoXnK9cg6cP6kkqG'),
(13, 'dr. LILIA DEWIYANTI, SpA, Msi.Med	', 'Jl. Gading ', '0813267478923', 1, 12233567, '$2y$10$DSkHjKtI6c4O41qH6IJ67.J8b.nvLqPD2DIFNavZpyLrvme.3xtUO'),
(14, 'drg. NURHAERANI, Sp.KGA, PhD', 'Jl. Diponegoro', '08234678235', 3, 12234567, '$2y$10$3Qt7Q7z6WZq0DWnuOmAcyuWXPZ4jRu1ZC5lqh2kbqgYjmQHd2poAO'),
(15, 'dr. KANTI YUNIKA, Sp.THT-KL(K)', 'Jl. Pahlawan', '08234239223', 4, 16782233, '$2y$10$KjxG3.XLe/xYKIfbwwdYm.Orbcv6GpYfzf6VUnN7xcqq.2pwzFRXi'),
(16, 'dr. BAHRUDIN, Msi.Med, PhD, SpJP	', 'Jl. kartini', '093217837981', 1, 16782223, '$2y$10$XfISHJP7RmRONho7jIsVY.MBLlK7xE6a51mhIJmebANpvlGQe8Dyy'),
(17, 'dr. ANDREW ROBERT DIYO, Sp.BS	', 'Jl. Mataram', '08234448235', 5, 12244567, '$2y$10$cxnRf2ardzzvkvdcCQfPPu.V5ZYMFAC/3WWtejlFrkRWUiRebDueS'),
(18, 'dr. Ismail', 'Jl. Diponegoro', '08172626378', 1, 12344556, '$2y$10$EHB4S67kuqRYDDH4G/w01uTdyyxUu2FivMVkcxDvbMHiDfR6K59wu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dokter` int(10) UNSIGNED NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `statues` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `statues`) VALUES
(6, 12, 'Senin', '02:39:00', '04:39:00', 0),
(7, 13, 'Selasa', '10:10:00', '15:15:00', 1),
(8, 14, 'Rabu', '11:00:00', '16:15:00', 1),
(9, 15, 'Kamis', '08:15:00', '13:15:00', 1),
(10, 16, 'Jumat', '10:15:00', '16:15:00', 1),
(11, 17, 'Sabtu', '10:15:00', '15:15:00', 1),
(12, 18, 'Senin', '10:45:00', '16:45:00', 1),
(13, 12, 'Selasa', '13:50:00', '16:50:00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Termorex Patch Bayi & Anak', 'Sachet', 8500),
(2, 'Obh Combi Anak Batuk Flu 60ml', 'Botol', 21000),
(3, 'Paracetamol If 500mg ', 'Tablet', 5000),
(4, 'Imboost Force', 'Tablet', 74000),
(5, 'Amlodipine If 10mg', 'Tablet', 5500),
(6, 'Prosogan Fd 30mg', 'Tablet', 25000),
(7, 'Obh Combi rasa jeruk', 'sirup', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(13, 'Badrul ', 'Jl. Sumber', '$2y$10$5KoVdmEPxatzRe2uAx9qZ.Xk.Dov2D8MyVAiBREVQ8smDOsMaws0C', '08282374972', '2024-01-07-1'),
(14, 'Budi Santoso', 'Jl. Merdeka', '$2y$10$wCZv3i40Ihw1kmQ54BsZHemOXM3DhtoecwXXpCoMz/xauuqf77yW2', '0821726231', '2024-01-07-2'),
(15, 'Irfan Abdullah', 'Jl. Diponegoro', '$2y$10$WrfRlVxTWpZdUiSkj8yWHO/e7wf/Pg4hk7jO3OpwdIhlYLdJ6m31O', '08278462347', '2024-01-07-3'),
(16, 'Hendra Kurniawan', 'Jl. kartini', '$2y$10$LCIAfwpSbLY3d0gQs49Z9eec4LO5uuEyLVHFFt4QRA/i4CwZ98IRG', '08128623659', '2024-01-08-4'),
(17, 'Adrian', 'Jl. Duku ', '$2y$10$jLu0m3CKRC7dRSTy0OfLmOF2Shgw9ln5B/gb1dDXD/6k1AKbZDEjC', '0878136835784', '2024-01-08-5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksa`
--

CREATE TABLE `periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_daftar_poli` int(10) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(108, 37, '2024-01-07 20:40:34', 'fefdgrsfea', 183500),
(109, 38, '2024-01-08 06:48:34', 'tetes sekeli sehari', 229500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'poli anak', 'Menyediakan layanan kesehatan khusus untuk bayi, anak-anak, dan remaja.'),
(2, ' Poli Mata', 'Menangani masalah kesehatan mata, termasuk pemeriksaan mata, kacamata, atau operasi mata'),
(3, 'Poli Gigi', 'Spesialisasi dalam perawatan gigi dan masalah kesehatan mulut.'),
(4, 'Poli THT', 'Menyediakan perawatan untuk masalah kesehatan terkait telinga, hidung, tenggorokan, dan gangguan terkaitnya'),
(5, 'Poli Fisioterapi', 'Menyediakan perawatan rehabilitasi fisik melalui terapi gerak dan latihan'),
(6, 'Poli Kulit', 'Meyediakan layanan kesehatan khusus kulit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$TzWwqU/N6DoevfpmgFzfku2REhhxSyej4xLYlsQR.yhqty3YCDUTW'),
(2, 'aqilla', '$2y$10$J2sW2cEjMaxx1E5qW095OuJ9LrIlxNNU0UoDP.MWJNGFjK/vpbK5O');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indeks untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periksa_ibfk_1` (`id_daftar_poli`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `daftar_poli_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`),
  ADD CONSTRAINT `daftar_poli_ibfk_4` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `detail_periksa_ibfk_2` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Ketidakleluasaan untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `jadwal_periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Ketidakleluasaan untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
