-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2020 pada 08.46
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekspedisi_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_paket`
--

CREATE TABLE `jenis_paket` (
  `id_paket` varchar(5) NOT NULL,
  `paket_type` varchar(8) NOT NULL,
  `asuransi` int(9) NOT NULL,
  `biaya` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_paket`
--

INSERT INTO `jenis_paket` (`id_paket`, `paket_type`, `asuransi`, `biaya`) VALUES
('a100', 'Express', 5000, 35000),
('a200', 'Kilat', 3000, 25000),
('a300', 'Reguler', 2000, 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengirim`
--

CREATE TABLE `pengirim` (
  `no_pengirim` varchar(7) NOT NULL,
  `nama_pengirim` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kota` varchar(15) NOT NULL,
  `provinsi` varchar(15) NOT NULL,
  `kodepos` int(6) NOT NULL,
  `daerah` varchar(15) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengirim`
--

INSERT INTO `pengirim` (`no_pengirim`, `nama_pengirim`, `alamat`, `kota`, `provinsi`, `kodepos`, `daerah`, `telepon`) VALUES
('B100', 'TEJO', 'CATURTUNGGAL', 'YOGYAKARTA', 'DIY', 55281, 'SLEMAN', '0852938884984'),
('B101', 'BAGAS', 'BERBAH', 'YOGYAKARTA', 'DIY', 55573, 'SLEMAN', '085556475643'),
('B102', 'FARID', 'GODEAN', 'YOGYAKARTA', 'DIY', 55264, 'SLEMAN', '085676567656'),
('B103', 'DIANA', 'TEMPEL', 'YOGYAKARTA', 'DIY', 55511, 'SLEMAN', '0851111990'),
('B104', 'BAYU', 'MLATI', 'YOGYAKARTA', 'DIY', 55284, 'SLEMAN', '081111546575');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengiriman_barang`
--

CREATE TABLE `pengiriman_barang` (
  `no_resi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kota_tujuan` varchar(15) NOT NULL,
  `id_petugas` varchar(6) NOT NULL,
  `no_pengirim` varchar(7) NOT NULL,
  `id_paket` varchar(5) NOT NULL,
  `berat` int(5) NOT NULL,
  `penerima` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `isi_paket` varchar(20) NOT NULL,
  `total` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengiriman_barang`
--

INSERT INTO `pengiriman_barang` (`no_resi`, `tanggal`, `kota_tujuan`, `id_petugas`, `no_pengirim`, `id_paket`, `berat`, `penerima`, `alamat`, `telepon`, `isi_paket`, `total`) VALUES
('BTG3948304', '2019-12-02', 'BATANG', 'A003', 'B101', 'a300', 1, 'JAMILAH', 'JEMBATAN MERAH ', '08392093845', 'TEMBAKAU', 10000),
('jkt0975846', '2019-12-20', 'magelang', 'A004', 'B104', 'a200', 2, 'fitri', 'jl cendrawasih', '08564777777', 'kamera', 50000),
('JKT2134432', '2019-12-02', 'JAKARTA', 'A001', 'B100', 'a200', 2, 'KURNIA', 'JLENAU NO 19', '08324583049', 'LAPTOP', 50000),
('MDN0938475', '2019-12-20', 'MADIUN', 'A003', 'B102', 'a200', 5, 'RAMA', 'JL. JENDRAL SUDIRMAN NO. 2', '085888899000', 'KABEL', 125000),
('SBY5385945', '2019-12-02', 'SURABAYA', 'A003', 'B100', 'a100', 100, 'JULEHA', 'APARTEMEN HORA NO 39', '084329586345', 'NINJA 250', 3500000),
('SOLO965049', '2019-12-02', 'SOLO', 'A003', 'B103', 'a100', 3, 'DANANG', 'ISTANA NO 1', '081111111111', 'SEPEDA', 105000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(4) NOT NULL,
  `nama_petugas` varchar(25) NOT NULL,
  `tugas` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `tugas`, `alamat`, `telepon`) VALUES
('A001', 'BAMBANG', 'KURIR', 'CONDONGCATUR', '085111191831'),
('A002', 'SANTOSO', 'kurir', 'DEPOK', '0812234728398'),
('A003', 'PAIJO', 'KURIR', 'CATURTUNGGAL', '0811112734657'),
('A004', 'dika', 'kurir', 'condongcatur', '085467399999');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_paket`
--
ALTER TABLE `jenis_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `pengirim`
--
ALTER TABLE `pengirim`
  ADD PRIMARY KEY (`no_pengirim`);

--
-- Indeks untuk tabel `pengiriman_barang`
--
ALTER TABLE `pengiriman_barang`
  ADD PRIMARY KEY (`no_resi`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_paket` (`id_paket`),
  ADD KEY `id_pengirim` (`no_pengirim`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengiriman_barang`
--
ALTER TABLE `pengiriman_barang`
  ADD CONSTRAINT `id_paket` FOREIGN KEY (`id_paket`) REFERENCES `jenis_paket` (`id_paket`),
  ADD CONSTRAINT `id_pengirim` FOREIGN KEY (`no_pengirim`) REFERENCES `pengirim` (`no_pengirim`),
  ADD CONSTRAINT `id_petugas` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
