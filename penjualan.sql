-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 28 Sep 2017 pada 03.14
-- Versi Server: 5.6.14
-- Versi PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id_barang` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `stok` smallint(6) NOT NULL,
  `harga` float NOT NULL,
  `persen_laba` float NOT NULL DEFAULT '5',
  `diskon` float NOT NULL DEFAULT '0',
  `id_jenis_brg` tinyint(4) NOT NULL,
  `id_suplier` char(4) NOT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `id_jenis_brg` (`id_jenis_brg`),
  KEY `id_suplier` (`id_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama`, `stok`, `harga`, `persen_laba`, `diskon`, `id_jenis_brg`, `id_suplier`) VALUES
('B001', 'Blouse', 202, 65000, 7, 2.5, 4, 's001'),
('B002', 'Beras', 52, 82637.5, 12, 3.5, 4, 's002'),
('B003', 'Ember', 212, 15125, 4, 0, 4, 's002'),
('B004', 'Chitato', 502, 4000, 2, 0, 4, 's001'),
('B005', 'Fanta', 122, 5900, 2, 0, 1, 's005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE IF NOT EXISTS `detail_transaksi` (
  `kode_transaksi` char(4) NOT NULL DEFAULT '',
  `id_barang` char(4) NOT NULL DEFAULT '',
  `jumlah` smallint(6) NOT NULL,
  PRIMARY KEY (`kode_transaksi`,`id_barang`),
  KEY `id_barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`kode_transaksi`, `id_barang`, `jumlah`) VALUES
('J012', 'B002', 2),
('J013', 'B004', 30),
('J014', 'B003', 3),
('J015', 'B001', 12),
('J016', 'B002', 21),
('J017', 'B003', 14),
('J018', 'B001', 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE IF NOT EXISTS `jenis_barang` (
  `id_jenis_brg` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama_jenis_brg` varchar(20) NOT NULL,
  PRIMARY KEY (`id_jenis_brg`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis_brg`, `nama_jenis_brg`) VALUES
(1, 'Minuman'),
(2, 'Pakaian'),
(3, 'Elektronik'),
(4, 'Sandang'),
(5, 'Makanan'),
(7, 'Makanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE IF NOT EXISTS `karyawan` (
  `id_karyawan` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `gaji` double NOT NULL,
  PRIMARY KEY (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `gaji`) VALUES
('K001', 'Frans', 650000),
('K002', 'Susanto', 400000),
('K003', 'Primati', 500000),
('K004', 'Tina', 700000),
('K005', 'Antina', 750000),
('K006', 'Fajar', 300000),
('K007', 'Genita', 800000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis_kelamin` enum('P','W') NOT NULL DEFAULT 'P',
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_pelanggan` enum('G','S') NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `jenis_kelamin`, `alamat`, `telepon`, `tgl_lahir`, `jenis_pelanggan`) VALUES
('P011', 'Charles', 'P', 'Jl.Balikpapan No.8', '0858732620', '1975-11-03', 'G'),
('P012', 'Hardiansyah', 'P', 'Jl.Bondowoso No.95', '0858767463', '1975-11-10', 'G'),
('P013', 'Meiliana', 'P', 'Jl.Merapi No.54', '08585342716', '1992-04-08', 'S'),
('P014', 'Susan', 'P', 'Jl.Tunjungseto No.32', '081931744350', '1981-11-10', 'S'),
('P015', 'Antoni', 'P', 'Jl.Kerbau No.34', '083534362523', '1983-05-24', 'G'),
('P016', 'Anti', 'W', 'Jl.Merauke No.25', '097353624333', '1985-06-03', 'S'),
('P017', 'Susanti', 'W', 'Jl.Kebon Agung No.67', '08125459763', '1986-05-05', 'S'),
('P018', 'Susanto', 'P', 'Jl.Kebon Jeruk No.23', '081266374454', '1983-06-07', 'G');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplier`
--

CREATE TABLE IF NOT EXISTS `suplier` (
  `id_suplier` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  PRIMARY KEY (`id_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `suplier`
--

INSERT INTO `suplier` (`id_suplier`, `nama`, `alamat`, `telepon`) VALUES
('s001', 'IkiEnak', 'Jl.Tunjung No.21', '0876363532543'),
('s002', 'Pungkas Mandiri', 'Jl.Kerbau No.34', '9376393083'),
('s003', 'elektronik', 'Jl.Merapi No.54', '9736383233'),
('s004', 'barangpokok', 'Jl.Negara No.12', '03736383873663'),
('s005', 'kecoh', 'Jl.Kebon Agung No.67', '08127474545444');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `kode_transaksi` char(4) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `id_pelanggan` char(4) NOT NULL,
  `id_karyawan` char(4) NOT NULL,
  PRIMARY KEY (`kode_transaksi`),
  KEY `id_pelanggan` (`id_pelanggan`),
  KEY `id_karyawan` (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `tgl_transaksi`, `id_pelanggan`, `id_karyawan`) VALUES
('J012', '2015-06-24 13:32:08', 'P015', 'K001'),
('J013', '2015-06-16 08:35:53', 'P015', 'K007'),
('J014', '2015-05-18 08:36:08', 'P015', 'K004'),
('J015', '2015-05-12 08:40:32', 'P011', 'K006'),
('J016', '2015-12-17 08:45:08', 'P011', 'K005'),
('J017', '2015-12-01 11:11:57', 'P018', 'K007'),
('J018', '2015-12-02 11:12:17', 'P013', 'K002');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_jenis_brg`) REFERENCES `jenis_barang` (`id_jenis_brg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_suplier`) REFERENCES `suplier` (`id_suplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
