-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2024 pada 07.37
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbina`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `transaksi_id` int(11) DEFAULT NULL,
  `paket_id` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `transaksi_id`, `paket_id`, `qty`, `total_harga`, `keterangan`, `total_bayar`) VALUES
(11, 35, 4, 3, 45000, NULL, 100000),
(12, 36, 6, 1, 2000, NULL, 9000),
(13, 37, 5, 10, 50000, NULL, NULL),
(14, 38, 7, 2, 20000, NULL, NULL),
(15, 39, 7, 2, 20000, NULL, 30000),
(16, 40, 7, 2, 20000, NULL, 30000),
(17, 41, 6, 5, 10000, NULL, 90000),
(18, 42, 7, 4, 40000, NULL, NULL),
(19, 43, 9, 2, 30000, NULL, 50000),
(20, 44, 0, 0, 0, NULL, 1000),
(21, 45, 7, 20000, 200000000, NULL, 1000000000),
(22, 46, 11, 3, 45000, NULL, 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) DEFAULT NULL,
  `alamat_member` text DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `telp_member` varchar(15) DEFAULT NULL,
  `no_ktp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat_member`, `jenis_kelamin`, `telp_member`, `no_ktp`) VALUES
(10, 'kesha', 'jl.amil', 'P', '086753636573', '31740419050120001'),
(11, 'JEKI', 'jl.kemuning al tanjungan', 'L', '084577890967', '3174047099870001'),
(12, 'Khrisna Fattah', 'JL.PASARMINGGU NO.10', 'L', '086753636573', '31740419050120001'),
(13, 'Eric', 'jl.siaga 1', 'L', '084577890967', '31740478982342490'),
(14, 'oktobs', 'jl.kemuning al tanjungan', 'L', '086753636573', '31740419050120001'),
(15, 'KhrisnaFattah', 'jl.siaga 1', 'L', '086753636573', '31740419050120001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) DEFAULT NULL,
  `alamat_outlet` text DEFAULT NULL,
  `telp_outlet` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telp_outlet`) VALUES
(32, 'londree Cab.pemabangunan jaya', 'jl.palapa no.11000', '098024353235'),
(34, 'londree Cab.Pesanggrahan', 'Jl.Pesanggrahan no.80', '089976894342'),
(35, 'londree Cab.Pasar Minggu', 'Jl.DarmaLingkungan n0.09', '098024353235'),
(36, 'londree Cab.Kalibata', 'Jl.kalibata timur no.19', '086743209988');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bedcover','kaos','lain') DEFAULT NULL,
  `nama_paket` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`, `outlet_id`) VALUES
(4, 'kiloan', 'Paket Hemat', 15000, 26),
(5, 'kiloan', 'paket hemat', 5000, 29),
(7, 'kiloan', 'PACET', 10000, 33),
(8, 'bedcover', 'pakiat', 10000, 29),
(9, 'kiloan', 'PAKANNN!!!!', 15000, 32),
(10, 'kiloan', 'pakiat', 10000, 36),
(11, 'kiloan', 'PELIT', 15000, 35),
(12, 'kiloan', 'khrisna', 12000, 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `kode_invoice` varchar(100) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') DEFAULT NULL,
  `status_bayar` enum('dibayar','belum') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `outlet_id`, `kode_invoice`, `member_id`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `status_bayar`, `user_id`) VALUES
(34, 26, 'DRY202309254854', 5, '2023-09-25 02:54:58', '2023-10-02 12:00:00', '2023-09-25 03:16:51', 0, 0, 0, 'selesai', 'dibayar', 1),
(35, 26, 'DRY202309250927', 5, '2023-09-25 05:27:22', '2023-10-02 12:00:00', '2023-09-25 05:27:58', 0, 0, 0, 'selesai', 'dibayar', 1),
(36, 29, 'DRY202402075612', 5, '2024-02-07 08:13:21', '2024-02-14 12:00:00', '2024-02-13 05:39:36', 0, 10, 0, 'baru', 'dibayar', 1),
(37, 29, 'DRY202402133345', 5, '2024-02-13 01:45:42', '2024-02-20 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 1),
(38, 33, 'DRY202402135143', 6, '2024-02-13 02:43:56', '2024-02-20 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 1),
(39, 33, 'DRY202402135843', 6, '2024-02-13 02:44:01', '2024-02-20 12:00:00', '2024-02-13 02:49:37', 0, 0, 0, 'baru', 'dibayar', 1),
(40, 33, 'DRY202402134346', 6, '2024-02-13 02:46:46', '2024-02-20 12:00:00', '2024-02-13 05:36:41', 0, 0, 0, 'baru', 'dibayar', 1),
(41, 32, 'DRY202402135049', 7, '2024-02-13 02:49:56', '2024-02-20 12:00:00', '2024-02-13 02:52:52', 0, 0, 0, 'baru', 'dibayar', 1),
(42, 33, 'DRY202402134439', 6, '2024-02-13 05:39:52', '2024-02-20 12:00:00', NULL, 2000, 0, 0, 'baru', 'belum', 2),
(43, 32, 'DRY202403285243', 9, '2024-03-28 05:43:58', '2024-04-04 12:00:00', '2024-03-28 05:44:21', 0, 0, 0, 'baru', 'dibayar', 11),
(44, 34, 'DRY202403280656', 11, '2024-03-28 05:56:11', '2024-04-04 12:00:00', '2024-03-28 05:58:11', 0, 0, 0, 'baru', 'dibayar', 11),
(45, 33, 'DRY202403284356', 11, '2024-03-28 05:56:48', '2024-04-04 12:00:00', '2024-03-28 05:58:31', 0, 0, 0, 'proses', 'dibayar', 11),
(46, 35, 'DRY202403285326', 12, '2024-03-28 07:27:03', '2024-04-04 12:00:00', '2024-03-28 07:27:15', 0, 0, 0, 'baru', 'dibayar', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `role` enum('admin','kasir','owner') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `outlet_id`, `role`) VALUES
(11, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'admin'),
(12, 'owner', 'owner', '72122ce96bfec66e2396d2e25225d70a', 37, 'owner'),
(13, 'kasir', 'kasir', 'c7911af3adbd12a035b289556d96470a', NULL, 'kasir'),
(15, 'inaaa', 'ina', 'a0fb2daa33c637d078d1d276dd453ea2', 33, 'owner'),
(16, 'vury', 'vury', 'd41d8cd98f00b204e9800998ecf8427e', NULL, 'kasir'),
(17, 'juaro', 'pitqm', 'd41d8cd98f00b204e9800998ecf8427e', 36, 'owner'),
(18, 'Okotbs', 'okto', '2ed20177a0b12db6c51a5c51ba24a3a7', 34, 'owner');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `paket_id` (`paket_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `outlet_id` (`outlet_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
