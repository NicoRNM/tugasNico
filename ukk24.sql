-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Apr 2024 pada 15.31
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk24`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(10) NOT NULL,
  `tg_pengaduan` datetime NOT NULL,
  `isi_laporan` varchar(1000) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai') DEFAULT NULL,
  `petugas_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `tg_pengaduan`, `isi_laporan`, `foto`, `status`, `petugas_id`) VALUES
(11, '2024-04-18 05:43:34', 'The Raid Redemtion', 'theraid.jpg', '0', 6),
(12, '2024-04-18 12:54:36', 'BANYAK ORMAS', 'theraid.jpg', '0', 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` int(10) NOT NULL,
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('masyarakat','petugas','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `nik`, `nama`, `username`, `password`, `telp`, `level`) VALUES
(6, '12097387213', 'Nico', 'nicornm', '$2y$10$5l7w6JirhJYt/bZveP.EheqtAhShkwknnBM/XS2T0.AEOHL9mLOSe', '083130017828', 'admin'),
(14, '0832458721', 'Fylciaa', 'Nico', '$2y$10$xiAycEcoRQilmCalwF2RpOMRJxbEpwdCKXxiIPWPObomwnYozJqf6', '083130017828', 'masyarakat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id` int(10) NOT NULL,
  `id_pengaduan` int(10) NOT NULL,
  `tg_tanggapan` datetime NOT NULL,
  `isi_laporan` varchar(1000) NOT NULL,
  `id_petugas` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id`, `id_pengaduan`, `tg_tanggapan`, `isi_laporan`, `id_petugas`) VALUES
(11, 12, '2024-04-18 12:55:24', 'pemuda pancasila', 14);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpengaduan52247` (`petugas_id`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtanggapan340580` (`id_petugas`),
  ADD KEY `FKtanggapan374346` (`id_pengaduan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `FKpengaduan52247` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `FKtanggapan340580` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id`),
  ADD CONSTRAINT `FKtanggapan374346` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
