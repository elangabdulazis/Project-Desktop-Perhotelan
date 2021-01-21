-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 13 Jun 2019 pada 03.52
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_perhotelan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan_transaksi`
--

CREATE TABLE IF NOT EXISTS `catatan_transaksi` (
  `id_customer` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `id_kamar` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` varchar(10) NOT NULL,
  `nama_customer` varchar(15) NOT NULL,
  `no_telp_customer` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE IF NOT EXISTS `fasilitas` (
  `no_fasilitas` varchar(10) NOT NULL,
  `id_jenis` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE IF NOT EXISTS `jabatan` (
  `nama_jabatan` varchar(15) NOT NULL,
  `id_jabatan` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_fasilitas`
--

CREATE TABLE IF NOT EXISTS `jenis_fasilitas` (
  `id_fasilitas` varchar(10) NOT NULL,
  `nama_fasilitas` varchar(15) NOT NULL,
  `harga_fasilitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kamar`
--

CREATE TABLE IF NOT EXISTS `jenis_kamar` (
  `id_jenis` varchar(10) NOT NULL,
  `nama_jenis_kamar` varchar(15) NOT NULL,
  `harga_jenis_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE IF NOT EXISTS `kamar` (
  `id_jenis` varchar(10) NOT NULL,
  `no_kamar` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE IF NOT EXISTS `karyawan` (
  `id_karyawan` varchar(10) NOT NULL,
  `nama_karyawan` varchar(25) NOT NULL,
  `alamat_karyawan` varchar(20) NOT NULL,
  `no_telp_karyawan` varchar(15) NOT NULL,
  `id_jenis` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemakaian`
--

CREATE TABLE IF NOT EXISTS `pemakaian` (
  `id_jenis` varchar(10) NOT NULL,
  `id_customer` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `tanggal` date NOT NULL,
  `id_karyawan` varchar(10) NOT NULL,
  `id_customer` varchar(10) NOT NULL,
  `id_kamar` varchar(10) NOT NULL,
  `id_fasilitas` varchar(10) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `harga_kamar` int(11) NOT NULL,
  `total_hari` int(11) NOT NULL,
  `harga_fasilitas` int(11) NOT NULL,
  `total_pembayaran` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catatan_transaksi`
--
ALTER TABLE `catatan_transaksi`
 ADD PRIMARY KEY (`id_customer`,`tanggal`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
 ADD PRIMARY KEY (`no_fasilitas`), ADD UNIQUE KEY `txtidw` (`id_jenis`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
 ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jenis_fasilitas`
--
ALTER TABLE `jenis_fasilitas`
 ADD UNIQUE KEY `txtid` (`id_fasilitas`);

--
-- Indexes for table `jenis_kamar`
--
ALTER TABLE `jenis_kamar`
 ADD PRIMARY KEY (`id_jenis`), ADD KEY `idxidjenis` (`id_jenis`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
 ADD PRIMARY KEY (`no_kamar`), ADD KEY `idxidjenis` (`id_jenis`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
 ADD PRIMARY KEY (`id_karyawan`), ADD KEY `id_karyawan` (`id_jenis`) USING BTREE;

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
 ADD KEY `idkaryawan` (`id_karyawan`), ADD KEY `idxidkamar` (`id_kamar`) USING BTREE, ADD KEY `idxidcus` (`id_customer`), ADD KEY `idxidfasi` (`id_fasilitas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `transaksi` (`id_customer`);

--
-- Ketidakleluasaan untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
ADD CONSTRAINT `fasilitas_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_fasilitas` (`id_fasilitas`);

--
-- Ketidakleluasaan untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
ADD CONSTRAINT `jabatan_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `karyawan` (`id_jenis`);

--
-- Ketidakleluasaan untuk tabel `kamar`
--
ALTER TABLE `kamar`
ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_kamar` (`id_jenis`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_jenis`),
ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas` (`id_jenis`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
