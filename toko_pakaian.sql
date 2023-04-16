-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 15.00
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_pakaian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(4) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` decimal(10,0) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_distributor` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` varchar(3) NOT NULL,
  `nama_distributor` varchar(25) NOT NULL,
  `telepon_distributor` int(12) NOT NULL,
  `email_distributor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_poin`
--

CREATE TABLE `id_poin` (
  `id_poin` varchar(3) NOT NULL,
  `nama_poin` varchar(25) NOT NULL,
  `nilai_poin` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_transaksi`
--

CREATE TABLE `jenis_transaksi` (
  `id_jenis_transaksi` varchar(1) NOT NULL,
  `nama_transaksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsumen`
--

CREATE TABLE `konsumen` (
  `id_konsumen` varchar(6) NOT NULL,
  `nama_konsumen` varchar(25) NOT NULL,
  `telepon_konsumen` int(12) NOT NULL,
  `email_konsumen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kritik_saran`
--

CREATE TABLE `kritik_saran` (
  `id_kritik_saran` varchar(4) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `isi_kritik_saran` varchar(100) NOT NULL,
  `tanggal_kritik_saran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(5) NOT NULL,
  `username_pegawai` varchar(25) NOT NULL,
  `password_pegawai` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(7) NOT NULL,
  `nama_pelanggan` varchar(25) NOT NULL,
  `telepon_pelanggan` int(12) NOT NULL,
  `email_pelanggan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_konsumen`
--

CREATE TABLE `transaksi_konsumen` (
  `id_transaksi_konsumen` varchar(10) NOT NULL,
  `id_konsumen` varchar(6) NOT NULL,
  `id_barang` varchar(4) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `id_jenis_transaksi` varchar(3) NOT NULL,
  `jumlah_barang` int(100) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `total_harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_pelanggan`
--

CREATE TABLE `transaksi_pelanggan` (
  `id_transaksi_pelanggan` varchar(10) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `id_barang` varchar(4) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `id_jenis_transaksi` varchar(3) NOT NULL,
  `jumlah_barang` int(100) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `total_harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_poin`
--

CREATE TABLE `transaksi_poin` (
  `id_transaksi_poin` varchar(4) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `id_poin` varchar(3) NOT NULL,
  `tanggal_transaksi_poin` date NOT NULL,
  `jumlah_poin` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(4) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `id_distributor` (`id_distributor`);

--
-- Indeks untuk tabel `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indeks untuk tabel `id_poin`
--
ALTER TABLE `id_poin`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indeks untuk tabel `jenis_transaksi`
--
ALTER TABLE `jenis_transaksi`
  ADD PRIMARY KEY (`id_jenis_transaksi`);

--
-- Indeks untuk tabel `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`id_konsumen`);

--
-- Indeks untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
  ADD PRIMARY KEY (`id_kritik_saran`),
  ADD UNIQUE KEY `id_konsumen` (`id_pelanggan`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi_konsumen`
--
ALTER TABLE `transaksi_konsumen`
  ADD PRIMARY KEY (`id_transaksi_konsumen`),
  ADD UNIQUE KEY `id_pelanggan` (`id_konsumen`,`id_barang`),
  ADD UNIQUE KEY `id_pegawai` (`id_pegawai`,`id_jenis_transaksi`),
  ADD KEY `jenis_transaksi` (`id_jenis_transaksi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `transaksi_pelanggan`
--
ALTER TABLE `transaksi_pelanggan`
  ADD PRIMARY KEY (`id_transaksi_pelanggan`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`,`id_barang`,`id_pegawai`,`id_jenis_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `jenis_transaksi` (`id_jenis_transaksi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `transaksi_poin`
--
ALTER TABLE `transaksi_poin`
  ADD PRIMARY KEY (`id_transaksi_poin`),
  ADD UNIQUE KEY `id_konsumen` (`id_pelanggan`,`id_poin`),
  ADD KEY `id_poin` (`id_poin`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`);

--
-- Ketidakleluasaan untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
  ADD CONSTRAINT `kritik_saran_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Ketidakleluasaan untuk tabel `transaksi_konsumen`
--
ALTER TABLE `transaksi_konsumen`
  ADD CONSTRAINT `transaksi_konsumen_ibfk_1` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id_konsumen`),
  ADD CONSTRAINT `transaksi_konsumen_ibfk_2` FOREIGN KEY (`id_jenis_transaksi`) REFERENCES `jenis_transaksi` (`id_jenis_transaksi`),
  ADD CONSTRAINT `transaksi_konsumen_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `transaksi_pelanggan`
--
ALTER TABLE `transaksi_pelanggan`
  ADD CONSTRAINT `transaksi_pelanggan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_pelanggan_ibfk_3` FOREIGN KEY (`id_jenis_transaksi`) REFERENCES `jenis_transaksi` (`id_jenis_transaksi`),
  ADD CONSTRAINT `transaksi_pelanggan_ibfk_4` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `transaksi_poin`
--
ALTER TABLE `transaksi_poin`
  ADD CONSTRAINT `transaksi_poin_ibfk_1` FOREIGN KEY (`id_poin`) REFERENCES `id_poin` (`id_poin`),
  ADD CONSTRAINT `transaksi_poin_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
