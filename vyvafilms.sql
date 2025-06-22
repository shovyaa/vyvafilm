-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jun 2025 pada 19.03
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
-- Database: `vyvafilms`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Recommended'),
(2, 'Comedy'),
(3, 'Romance'),
(4, 'Horror'),
(9, 'Action'),
(10, 'Drama'),
(11, 'Adventure'),
(12, 'Fantasy'),
(13, 'History'),
(14, 'Anime'),
(15, 'Kids'),
(16, 'Thriller'),
(17, 'Drama korea');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kritik_saran`
--

CREATE TABLE `kritik_saran` (
  `id_ks` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggapan` text NOT NULL,
  `tanggal` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kritik_saran`
--

INSERT INTO `kritik_saran` (`id_ks`, `nama`, `tanggapan`, `tanggal`) VALUES
(1, 'vasa', 'bagus bangett', '2025-06-15 05:47:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `language` varchar(50) NOT NULL,
  `release_year` year(4) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_banner` tinyint(1) DEFAULT 0,
  `poster_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `language`, `release_year`, `release_date`, `duration`, `banner_url`, `video_url`, `created_at`, `is_banner`, `poster_url`) VALUES
(1, 'The Ugly Stepsister', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'inggris', '2025', '2025-08-01', 100, 'img/banner/theuglystepsister.jpg', 'https://youtu.be/Rz_bgqyxgEc?si=B4T8yImxWZwf_H-n', '2025-06-06 06:03:39', 0, 'img/the_ugly_stepsister.jpg'),
(2, 'Sinners', 'A mysterious journey of redemption.', 'indonesia', '2025', '2025-09-10', 115, NULL, 'https://youtu.be/bKGxHflevuk?si=wLQxkyg0RG0UtD0s', '2025-06-06 06:03:39', 0, 'img/sinners.jpg'),
(3, 'Snow White', 'A dark fantasy retelling.', 'indonesia', '2025', '2025-07-15', 120, '', 'https://youtu.be/iV46TJKL8cU?si=pRVhREWe8qzCrv9z', '2025-06-06 06:03:39', 0, 'img/snow_white.jpg'),
(4, 'Minions: The Rise of Gru', 'The rise of Gru and his minions.', '', '2022', '2022-06-29', 90, '', 'https://youtu.be/6DxjJzmYsXo?si=Ys-JfLCHfmpKRP7u', '2025-06-06 06:03:39', 0, 'img/minions.jpg'),
(5, 'Galaksi', 'Drama remaja penuh konflik.', '', '2023', '2023-12-05', 105, '', 'https://youtu.be/vEioDeOiqEs?si=7LDKTolH7cGGU-y2', '2025-06-06 06:03:39', 0, 'img/murderbot.jpg'),
(6, 'The Gorge', 'Romantic thriller of a dangerous love.', '', '2023', '2023-11-20', 110, '', 'https://youtu.be/rUSdnuOLebE?si=gHQTL9-j-ezIzvpD', '2025-06-06 06:03:39', 0, 'img/gorge_ver2.jpg'),
(8, 'Mangkujiwo 2', 'Kelanjutan kisah teror mistis.', '', '2023', '2023-01-26', 115, 'img/banner/mangkujiwo_banner.jpeg', 'https://youtu.be/nbSJnsSekfo?si=MYYYMCy0f5HiTgTs', '2025-06-06 06:12:02', 0, 'img/Poster_Mangkujiwo_2.jpg'),
(9, 'Avatar: The Way of Water', 'Kembalinya Jake Sully ke dunia Pandora.', 'inggris', '2022', '2022-12-16', 192, 'img/banner/Avatar.jpg', 'https://youtu.be/d9MyW72ELq0?si=_fd2sQ4jp0Qniz2D', '2025-06-08 15:04:48', 1, 'img/avatar2.jpg'),
(10, 'Jatuh Cinta Seperti di Film-Film', 'Kisah cinta yang penuh nostalgia dan referensi sinema.', 'indonesia', '2023', '2023-10-05', 101, NULL, 'https://youtu.be/F6jPobzz-ag?si=f_DHtzrS3t77qXgb', '2025-06-08 15:04:48', 0, 'img/jatuhcinta.jpg'),
(11, 'Inside Out 2', 'Petualangan emosional Riley yang mulai remaja.', 'inggris', '2024', '2024-06-14', 95, NULL, 'https://youtu.be/LEjhY15eCx0?si=Mj-Yf03U8-cMhhuX', '2025-06-08 15:04:48', 0, 'img/insideout2.jpg'),
(12, 'The Batman', 'Bruce Wayne menghadapi Riddler dalam Gotham yang kelam.', 'inggris', '2022', '2022-03-04', 176, NULL, 'https://youtu.be/mqqft2x_Aa4?si=RIBNjacWdF5LBy4s', '2025-06-08 15:04:48', 0, 'img/thebatman.jpg'),
(13, 'KKN di Desa Penari', 'Mahasiswa menghadapi teror mistis di desa asing.', 'indonesia', '2022', '2022-04-30', 130, NULL, 'https://youtu.be/jtDRXPTZT-M?si=8oKKXkh18Wqq2CbV', '2025-06-08 15:04:48', 0, 'img/kkn.jpg'),
(14, 'Elemental', 'Api dan air jatuh cinta di kota unsur.', 'inggris', '2023', '2023-06-16', 102, NULL, 'https://youtu.be/hXzcyx9V0xw?si=aMVtPi-lzED_SY3P', '2025-06-08 15:04:48', 0, 'img/elemental.jpg'),
(15, 'Sri Asih', 'Pahlawan wanita dari jagat Bumilangit bangkit.', 'indonesia', '2022', '2022-11-17', 115, NULL, 'https://youtu.be/564eG_1Mvf0?si=5K_quhuKBH92y04n', '2025-06-08 15:04:48', 0, 'img/sriasih.jpg'),
(16, 'John Wick: Chapter 4', 'John menghadapi musuh baru dari seluruh dunia.', 'inggris', '2023', '2023-03-24', 169, NULL, 'https://youtu.be/qEVUtrk8_B4?si=deVuEz3mKotBlkBz', '2025-06-08 15:04:48', 0, 'img/johnwick4.jpg'),
(17, 'Suzume', 'Petualangan magis di Jepang saat menyegel bencana.', 'jepang', '2023', '2023-03-08', 122, NULL, 'https://youtu.be/5pTcio2hTSw?si=6JseIbP6y_KTJu0c', '2025-06-08 15:04:48', 0, 'img/suzume.jpg'),
(18, 'The Marvels', 'Tim super hero wanita bertarung dalam galaksi.', 'inggris', '2023', '2023-11-10', 105, 'img/banner/marvel.jpg', 'https://youtu.be/wS_qbDztgVY?si=M-OjV1138ORW6rR9', '2025-06-08 15:04:48', 1, 'img/marvels.jpg'),
(19, 'Spirited Away', 'Gadis kecil tersesat di dunia roh.', 'jepang', '2001', '2001-07-20', 125, NULL, 'https://youtu.be/ByXuk9QqQkk?si=rqWxXPcn39MwwZ9_', '2025-06-08 15:04:48', 0, 'img/spiritedaway.jpg'),
(20, 'Dilan 1990', 'Kisah cinta remaja di Bandung tahun 90-an.', 'indonesia', '2018', '2018-01-25', 110, NULL, 'https://youtu.be/X_b-wNkz4DU?si=jNk4hpAGe4cjvDHr', '2025-06-08 15:04:48', 0, 'img/dilan.jpg'),
(21, 'Tenggelamnya Kapal Van Der Wijck', 'Tragedi cinta yang epik.', 'indonesia', '2013', '2013-12-19', 163, NULL, 'https://youtu.be/k_nK2PQ1Q8Q?si=Helmuq-NcnltNhwP', '2025-06-08 15:04:48', 0, 'img/kapalvan.jpg'),
(22, 'Tenet', 'Agen rahasia memanipulasi waktu untuk mencegah perang dunia.', 'inggris', '2020', '2020-08-26', 150, NULL, 'https://youtu.be/L3pk_TBkihU?si=nFzY5AKbXdUGZbbC', '2025-06-08 15:04:48', 0, 'img/tenet.jpg'),
(23, 'Doraemon: Nobita’s Sky Utopia', 'Petualangan Nobita dan kawan-kawan di langit.', 'jepang', '2023', '2023-03-03', 108, NULL, 'https://youtu.be/V6RPisdW7FI?si=GKmPU_Yrtsz65YTg', '2025-06-08 15:04:48', 0, 'img/doraemon2023.jpg'),
(24, 'Pengabdi Setan 2', 'Cerita film ini melanjutkan kisah Rini dan keluarganya yang berjuang untuk menjalani kehidupan normal setelah teror yang mereka alami dari ibu mereka yang telah meninggal. Setelah lima tahun berlalu, keluarga Suwono pindah ke sebuah rumah susun yang tidak terawat di Jakarta. Mereka berusaha membangun kehidupan baru sambil menghadapi berbagai tantangan, termasuk badai besar yang diprediksi akan melanda. Namun, kehidupan mereka kembali diganggu oleh teror supernatural dan misteri yang melibatkan ibu mereka serta kelompok pemuja setan.', 'indonesia', '2022', '2022-08-01', 110, 'img/pengabdisetan2.jpg', 'https://youtu.be/8LIHcd7WfWI?si=ECqvDC7HaX8AmLXh', '2025-06-11 06:00:00', 0, 'img/pengabdisetan2.jpg'),
(26, '200 Pounds Beauty', '200 Pounds Beauty merupakan film romantis Indonesia 2023 yang merupakan adaptasi dari film Korea. 200 Pounds Beauty menceritakan tentang seorang perempuan bernama Juwita (Syifa Hadju) yang memiliki masalah berat badan. Walaupun fisiknya sering menjadi sorotan, Juwita memiliki bakat menyanyi yang luar biasa dan suaranya sangat indah. Dia juga dikenal sebagai sosok yang ceria dan baik hati. Kemampuan menyanyinya membawanya menjadi backing vocal untuk Eva Primadona (Alyssa Daguise), seorang penyanyi terkenal meskipun suaranya tidak sebagus bakat vokal Juwita. Juwita menerima pekerjaan ini karena perasaannya kepada Andre (Baskara Mahenra).Namun, suatu kejadian memalukan di atas panggung membuat Juwita merasa sangat malu dan ia pun mengasingkan diri dari semua orang. Setelah beberapa waktu, ia kembali dengan identitas baru sebagai gadis cantik bernama Angel.', 'Indonesia', '2023', '2020-06-15', 100, 'img/pounds.jpg', 'https://youtu.be/sGjhhlHhEhA?si=MlTRNJ6j1L-j1equ', '2025-06-11 06:00:00', 0, 'img/pounds.jpg'),
(27, 'Puspa Indah Taman Hati', 'Puspa Indah Taman Hati berkisah tentang penyanyi pria bernama Galih (Yesaya Abraham) yang memiliki hubungan asmara dengan perempuan bernama Ratna (Prilly Latuconsina). Namun, hubungan mereka kandas di tengah jalan. Suatu hari, Galih bertemu dengan Marlina (Prilly Latuconsina) yang mirip dengan mantannya. Keduanya merupakan mahasiswa jurusan yang berbeda di salah satu Universitas. Lama kelamaan, keduanya semakin dekat dan membuat Galih jatuh hati pada Marlina. Sayangnya, Galih memiliki kekhawatiran akan ditolak oleh orang tua Marlina karena status sosial yang berbeda. Suatu hari, Galih teringat dengan sosok mantannya, Ratna, yang pada saat itu berada di Yogyakarta. Marlina kemudian ragu dengan perasaan Galih karena masih ada Ratna dihatinya.', 'indonesia', '2023', '2023-05-12', 95, 'img/puspa.jpg', 'https://youtu.be/_PODEpX5LUE?si=yhK5DBDiXaNQDVd-', '2025-06-11 06:00:00', 0, 'img/puspa.jpg'),
(28, 'Antologi', 'Keara diam-diam suka dengan Ruly yang rajin beribadah dan punya jiwa petualang. Keara yakin kalau Ruly adalah soulmate-nya walaupun ia tahu kalau pria yang disukainya ini jatuh hati pada sosok Denise yang sudah punya suami. Tanpa diketahui oleh Keara, Harris juga menyimpan hati padanya. Harris yang playboy dan suka ke club malam pun mendeklarasikan kalau Keara adalah cinta matinya. Bagi Keara sendiri, Harris yang aneh dan liar ini adalah sahabat terbaik. Kepada siapa cinta Keara akan berlabuh? Ruly yang dicintainya selama ini atau Harris sang sahabat yang selalu memujanya selama ini?', 'indonesia', '2019', '2022-09-17', 90, 'img/rasa.jpg', 'https://youtu.be/JNsm3MpC6dQ?si=-RPxB8tauB49vAOO', '2025-06-11 06:00:00', 0, 'img/rasa.jpg'),
(30, 'Sabrina', 'MAIRA hidup bahagia di pernikahan barunya bersama AIDEN, pembuat boneka Sabrina sekaligus pemilik sebuah perusahaan mainan. Tapi kebahagiaan mereka belum sempurna karena VANYA, anak angkat sekaligus keponakan Aiden yang yang piatu belum bisa menerima kehadiran Maira sebagai ibunya karena Vanya masih belum bisa merelakan kepergian ANDINI, bundanya yang sudah meninggal. Suatu hari, Vanya melakukan permainan ‘Pensil Charlie’ untuk memanggil bundanya dan kejanggalan-kejanggalan pun mulai terjadi. Maira dan Aiden Adak percaya, hingga akhirnya Maira mengalami serentetan kejadian menakutkan dan mereka melihat sendiri sosok Andini. Maira pun memanggil BU LARAS, seorang paranormal yang dulu pernah membantunya. Tapi Andini ternyata bukanlah Andini, melainkan iblis keji bernama BAGHIAH yang menetap di boneka Sabrina dan menginginkan tubuh manusia...', 'indonesia', '2018', '2018-07-12', 110, 'img/sabrina.jpg', 'https://youtu.be/S6XunixW6_Y?si=eFYQlcBXrYag2ZoN', '2025-06-11 06:00:00', 0, 'img/sabrina.jpg'),
(31, 'Sewu Dino', 'Ditengah kesulitan ekonomi, Sri diterima bekerja untuk keluarga Atmojo dengan bayaran yang tinggi, karena keunikan yang ia miliki, yaitu lahir pada hari Jumat Kliwon. Bersama Erna dan Dini, mereka dibawa ke sebuah gubuk tersembunyi di tengah hutan. Di gubuk tersebut, Sri, Erna, dan Dini bertugas untuk memandikan Dela Atmojo, cucu dari Mbah Karsa Atmojo yang tidak sadarkan diri karena kutukan santet Sewu Dino, salah satu santet yang paling mengerikan. Mereka tidak bisa lari dari gubuk tersebut karena terikat perjanjian mistis dengan Mbah Karsa Atmojo, dan mereka harus selesaikan ritual sampai hari ke 1000. Jika melanggar, kematian menanti mereka.', 'indonesia', '2023', '2023-04-20', 120, 'img/sewu.jpg', 'https://youtu.be/12sXNFbQa6I?si=UtQJV00cvr9aiXEv', '2025-06-11 06:00:00', 0, 'img/sewu.jpg'),
(32, 'Susah Sinyal', 'Ellen (Adinia Wirasti), pengacara yang sukses, adalah seorang single mom yang jarang bisa meluangkan waktu bagi anak tunggalnya Kiara (Aurora Ribero), yang akhirnya tumbuh sebagai remaja pemberontak yang lebih banyak melampiaskan emosinya di media sosial. Mereka tinggal bersama Agatha (Niniek L. Karim), ibunda Ellen yang sangat menyayangi Kiara. Ketika Agatha meninggal terkena serangan jantung, Kiara yang sejak kecil sangat dekat dengan Omanya langsung terguncang. Oleh psikolog, Ellen disarankan untuk mengajak Kiara berlibur, menghabiskan quality time untuk mengobati masa-masa di mana Ellen terlalu sibuk bekerja. Mereka pun pergi ke Sumba, menghabiskan saat-saat menyenangkan berdua. Kiara pulang dengan hati riang. Di Jakarta, Ellen langsung disambut masalah besar di kantor. Proyek besar yang sedang ia tangani bersama Iwan (Ernest Prakasa) terancam berantakan. Akhirnya karna sibuk, Ellen tidak menepati janjinya untuk menonton Kiara tampil di perlombaan talent show antar SMA yang sudah Kiara persiapkan sejak lama. Kiara pun marah dan pergi ke Sumba sendirian, tempat dimana terakhir kali ia bisa merasakan secercah kebahagiaan. Akankah Kiara bisa percaya lagi pada ibunya? Apakah Ellen sanggup merajut kembali keluarga kecil ini? Saksikan SUSAH SINYAL, tayang di bioskop mulai 21 Desember.', 'indonesia', '2019', '2019-03-11', 100, 'img/sinyal.jpg', 'https://youtu.be/MbZtoOuRpyU?si=0YyDv8HB1DortEM9', '2025-06-11 06:00:00', 0, 'img/sinyal.jpg'),
(35, 'Srimulat : Hill yang Mustahil', 'Film ini mengisahkan tentang grup lawak asal Solo yang bernama Srimulat. Mereka merintis karier dari bawah dan memulai pertunjukan mereka di Teater Sriwedari. Grup Srimulat menyajikan set komedi yang baru dan kreatif, sehingga mendapat respons baik dari publik di luar kota Solo. Nama Srimulat semakin menanjak melalui pertunjukan komedinya. Dengan latar tahun 1981, film ini akan berfokus pada masalah di mana karier Srimulat mulai menanjak dan menjadi semakin dikenal di Indonesia. Pada masa tersebut, komedi dilihat sebagai hal yang bisa mempersatukan keberagaman Indonesia. Srimulat pun berhasil menjadi grup komedi pertama yang tampil di televisi nasional. Hingga saat ini, lelucon Srimulat dinilai masih relevan dengan kehidupan generasi muda.', 'indonesia', '2022', '2022-05-19', 110, 'img/srimulat.jpg', 'https://youtu.be/uJIqVKTaeMs?si=blwO3s3MHw1XlCaA', '2025-06-11 06:00:00', 0, 'img/srimulat.jpg'),
(36, 'Sunyi', 'Film ini mengisahkan Alex (Angga Yunanda), seorang siswa baru di SMA unggulan yang terkenal dengan sistem senioritas yang keras. Di sekolah ini, perpeloncoan dan kekerasan menjadi hal biasa. Alex yang pendiam sering menjadi sasaran bullying oleh para seniornya. Namun, kejadian-kejadian aneh dan menyeramkan mulai terjadi setelah satu per satu siswa yang terlibat dalam perundungan mengalami nasib tragis. Bersama teman barunya, Maggie (Amanda Rawles), Alex berusaha mengungkap rahasia kelam di balik sekolah tersebut, yang ternyata menyimpan kisah mistis dan penuh teror.', 'indonesia', '2019', '2019-04-11', 95, 'img/sunyi.jpg', 'https://youtu.be/yJKjJoYGTu8?si=a1K8tmdgOLP1dWul', '2025-06-11 06:00:00', 0, 'img/sunyi.jpg'),
(37, 'Perempuan Tanah Jahanam', 'Cerita film berfokus pada dua sahabat, Maya dan Dini, yang berjuang untuk bertahan hidup di kota setelah kehilangan pekerjaan. Ketika Maya mengetahui kemungkinan adanya warisan dari keluarganya di desa asalnya, mereka memutuskan untuk mencari harta tersebut. Setibanya di desa Harjosari, mereka menemukan suasana yang aneh dan misterius, termasuk banyak kuburan anak-anak. Maya mulai mengungkap sejarah kelam keluarganya dan kutukan yang melanda desa tersebut. Konflik meningkat ketika Dini terjebak dalam rencana jahat warga desa yang terlibat dalam praktik ilmu hitam.', 'indonesia', '2019', '2019-10-17', 110, 'img/tanahjahanam.jpg', 'https://youtu.be/XY7falovJiI?si=CJikridC10xkBA9f', '2025-06-11 06:00:00', 0, 'img/tanahjahanam.jpg'),
(38, 'Gara-Gara Warisan', 'Film ini bercerita mengenai seorang ayah yang memiliki tiga orang anak dan sebuah guest house untuk diwariskan kepada mereka. Suatu saat karena sebuah kejadian sang ayah memutuskan untuk memanggil semua anaknya untuk pulang dan memberikan pengumuman bahwa mereka akan mewarisi guest house dengan cara menjadi bos secara bergantian selama satu bulan penuh. Nantinya karyawan guest house tersebutlah yang akan memilih siapa yang tepat untuk menjadi bos baru dari tempat tersebut.', 'indonesia', '2022', '2022-01-28', 100, 'img/warisan.jpg', 'https://youtu.be/m61GXHXU4vg?si=UE5t2IIyIlmYUvLg', '2025-06-11 06:00:00', 0, 'img/warisan.jpg'),
(39, 'Extraction 2', 'Tyler Rake kembali dalam misi penyelamatan berbahaya.', 'inggris', '2023', '2023-06-16', 123, NULL, 'https://youtu.be/Y274jZs5s7s?si=bWMNeA3vtR85_6En', '2025-06-15 14:40:57', 0, 'img/extraction2.jpg'),
(40, 'The Raid', 'Operasi polisi di gedung kriminal berubah menjadi pertempuran brutal.', 'indonesia', '2011', '2011-03-23', 101, NULL, 'https://youtu.be/m6Q7KnXpNOg?si=XnDR7aCQZlDkJRFc', '2025-06-15 14:40:57', 0, 'img/theraid.jpg'),
(41, 'A Man Called Otto', 'Seorang pria tua yang pemarah mulai membuka hatinya pada tetangga baru.', 'inggris', '2022', '2022-12-29', 126, NULL, 'https://youtu.be/eFYUX9l-m5I?si=8ZRY5HiM-c76DEBl', '2025-06-15 14:40:57', 0, 'img/otto.jpg'),
(42, 'Dilan 1991', 'Kisah cinta remaja Dilan dan Milea di Bandung tahun 90-an.', 'indonesia', '2018', '2018-01-25', 110, NULL, 'https://youtu.be/nwhB2Hb7g5c?si=iydydARJtIxOkSl2', '2025-06-15 14:40:57', 0, 'img/dilan1991.jpg'),
(43, 'Jumanji: Welcome to the Jungle', 'Empat remaja masuk ke dunia game Jumanji dan harus bertahan hidup.', 'inggris', '2017', '2017-12-20', 119, NULL, 'https://youtu.be/2QKg5SZ_35I?si=bVGN-3f-rahecs9D', '2025-06-15 14:40:57', 0, 'img/jumanji.jpg'),
(44, '5 Cm', 'Petualangan lima sahabat mendaki Mahameru untuk menguji persahabatan mereka.', 'indonesia', '2012', '2012-12-12', 125, NULL, 'https://youtu.be/wT2aPdXwdt8?si=P6-ZDCpGeCLpetuO', '2025-06-15 14:40:57', 0, 'img/5cm.jpg'),
(45, 'Harry Potter and the Sorcerer\'s Stone', 'Seorang anak yatim menemukan dirinya adalah penyihir.', 'inggris', '2001', '2001-11-16', 152, NULL, 'https://youtu.be/VyHV0BRtdxo?si=EbHN4Aus3wewigZu', '2025-06-15 14:40:57', 0, 'img/harrypotter1.jpg'),
(46, 'Ratu Ilmu Hitam', 'Kejadian horor di panti asuhan menguak masa lalu kelam.', 'indonesia', '2019', '2019-11-07', 99, NULL, 'https://youtu.be/594PxKASQfg?si=DNIHvyXw_MQAN19a', '2025-06-15 14:40:57', 0, 'img/ratu.jpg'),
(47, 'Soekarno', 'Perjalanan hidup dan perjuangan proklamator Indonesia.', 'indonesia', '2013', '2013-12-11', 137, NULL, 'https://youtu.be/UuhB8EZhPxg?si=rP8CsRM-iI1jxrVM', '2025-06-15 14:40:57', 0, 'img/soekarno.jpg'),
(48, 'Oppenheimer', 'Kisah fisikawan di balik bom atom pertama di dunia.', 'inggris', '2023', '2023-07-21', 180, NULL, 'https://youtu.be/uYPbbksJxIg?si=0W3m9ZPWcSSyvsCq', '2025-06-15 14:40:57', 0, 'img/oppenheimer.jpg'),
(49, 'Your Name', 'Dua remaja terhubung lewat mimpi dan waktu.', 'jepang', '2016', '2016-08-26', 112, NULL, 'https://youtu.be/yH143G_IIAc?si=ZLmcGikCz4CrPn_z', '2025-06-15 14:40:57', 0, 'img/yourname.jpg'),
(50, 'Demon Slayer: Mugen Train', 'Tanjiro dan kawan-kawan bertarung melawan iblis di atas kereta.', 'jepang', '2020', '2020-10-16', 117, 'img/banner/kny.jpg', 'https://youtu.be/ATJYac_dORw?si=AVXUdHztiTTGfwm_', '2025-06-15 14:40:57', 1, 'img/mugentrain.jpg'),
(51, 'Moana', 'Gadis pemberani berlayar untuk menyelamatkan desanya.', 'inggris', '2016', '2016-11-23', 107, NULL, 'https://youtu.be/cPAbx5kgCJo?si=oYABVBraxLfzYCac', '2025-06-15 14:40:57', 0, 'img/moana.jpg'),
(52, 'Kiko In The Deep Sea', 'Petualangan seru Kiko di dunia bawah laut.', 'indonesia', '2023', '2023-01-23', 85, NULL, 'https://youtu.be/HgZG8wAyk-c?si=wETg_7muB9471osO', '2025-06-15 14:40:57', 0, 'img/kiko.jpg'),
(53, 'Bird Box', 'Dunia dilanda teror makhluk misterius yang menyebabkan kematian jika dilihat.', 'inggris', '2018', '2018-12-21', 124, NULL, 'https://youtu.be/o2AsIXSh2xo?si=zdxesCP0UtmYv3-5', '2025-06-15 14:40:57', 0, 'img/birdbox.jpg'),
(55, 'Parasite', 'Dua keluarga dari kelas sosial berbeda terhubung dalam situasi penuh intrik.', 'korea', '2019', '2019-05-30', 132, NULL, 'https://youtu.be/SEUXfv87Wpk?si=11Gt_RAhWS__pK6P', '2025-06-15 14:40:57', 0, 'img/parasite.jpg'),
(56, '20th Century Girl', 'Cinta dan persahabatan di masa remaja Korea tahun 1999.', 'korea', '2022', '2022-10-21', 119, NULL, 'https://youtu.be/9E9zuPbF2dg?si=XVg3DrDSs6m_vyLO', '2025-06-15 14:40:57', 0, 'img/20thcentury.jpg'),
(57, 'Mad Max: Fury Road', 'Dunia pasca-apokaliptik penuh kekacauan dan kejar-kejaran brutal.', 'inggris', '2015', '2015-05-15', 120, NULL, 'https://youtu.be/YWNWi-ZWL3c?si=mz9fKpJvgbvvZQbu', '2025-06-15 14:42:23', 0, 'img/madmax.jpg'),
(58, 'The Equalizer 3', 'Seorang mantan agen rahasia membalas kejahatan dengan adil.', 'inggris', '2023', '2023-09-01', 109, NULL, 'https://youtu.be/19ikl8vy4zs?si=Ay-HvkK_fzDDB-sj', '2025-06-15 14:42:23', 0, 'img/equalizer3.jpg'),
(59, 'Miracle in Cell No. 7', 'Ayah dengan keterbelakangan mental dipenjara secara tidak adil.', 'korea', '2013', '2013-01-23', 127, NULL, 'https://youtu.be/0uf6QUacVgs?si=UHxhxN1A0GpBGbK8', '2025-06-15 14:42:23', 0, 'img/miraclecell7.jpg'),
(60, 'Habibie & Ainun', 'Kisah cinta sejati Presiden RI ke-3 dan istrinya.', 'indonesia', '2012', '2012-12-20', 118, NULL, 'https://youtu.be/Bgt9g1q-xj0?si=CuC3N8_H4BXED8gb', '2025-06-15 14:42:23', 0, 'img/habibieainun.jpg'),
(61, 'Indiana Jones and the Dial of Destiny', 'Petualangan arkeolog legendaris dengan misteri waktu.', 'inggris', '2023', '2023-06-30', 154, NULL, 'https://youtu.be/eQfMbSe7F2g?si=0tSvWlftMd223EXl', '2025-06-15 14:42:23', 0, 'img/indiana5.jpg'),
(62, 'Petualangan Sherina 2', 'Sherina dan Sadam bertemu kembali dalam misi penyelamatan orangutan.', 'indonesia', '2023', '2023-09-28', 117, NULL, 'https://youtu.be/YoopUGMwDeQ?si=Sry3dNEUvKqQ5W9O', '2025-06-15 14:42:23', 0, 'img/sherina2.jpg'),
(63, 'Doctor Strange in the Multiverse of Madness', 'Pertarungan antar dimensi yang penuh keajaiban dan kegelapan.', 'inggris', '2022', '2022-05-06', 126, NULL, 'https://youtu.be/aWzlQ2N6qqg?si=HyssyMCE0-Qa1nxp', '2025-06-15 14:42:23', 0, 'img/strange2.jpg'),
(64, 'Gundala', 'Pahlawan super lokal yang melawan ketidakadilan di tengah badai petir.', 'indonesia', '2019', '2019-08-29', 119, NULL, 'https://youtu.be/8rauD1vxMCw?si=LlTQn2YXUvKAzbOy', '2025-06-15 14:42:23', 0, 'img/gundala.jpg'),
(65, 'Kartini', 'Perjuangan RA Kartini dalam memperjuangkan hak wanita di masa kolonial.', 'indonesia', '2017', '2017-04-19', 122, NULL, 'https://youtu.be/ePQV41Rk9uw?si=BHwWuACHL37WB8Eo', '2025-06-15 14:42:23', 0, 'img/kartini.jpg'),
(66, 'The King’s Speech', 'Raja George VI mengatasi kegagapannya demi bangsanya.', 'inggris', '2010', '2010-12-25', 118, NULL, 'https://youtu.be/EcxBrTvLbBM?si=z3z3GXPIt5WF0rzV', '2025-06-15 14:42:23', 0, 'img/kingsspeech.jpg'),
(68, 'Weathering With You', 'Remaja bertemu gadis yang bisa mengubah cuaca dengan doanya.', 'jepang', '2019', '2019-07-19', 112, NULL, 'https://youtu.be/Q6iK6DjV_iE?si=oNACMPE_aE8RuReP', '2025-06-15 14:42:23', 0, 'img/weathering.jpg'),
(69, 'Frozen II', 'Elsa dan Anna mencari kebenaran masa lalu dan kekuatan baru.', 'inggris', '2019', '2019-11-22', 103, NULL, 'https://youtu.be/Zi4LMpSDccc?si=NA4cBFqfkG4lDPco', '2025-06-15 14:42:23', 0, 'img/frozen2.jpg'),
(70, 'Upin & Ipin: Keris Siamang Tunggal', 'Upin Ipin masuk ke dunia dongeng dan bertualang menyelamatkan kerajaan.', 'indonesia', '2019', '2019-03-21', 100, NULL, 'https://youtu.be/wM8ic6PNMYA?si=JHUJ4bfP4nS7WOeU', '2025-06-15 14:42:23', 0, 'img/upinipin.jpg'),
(71, 'Split', 'Pria dengan 23 kepribadian menculik tiga gadis remaja.', 'inggris', '2016', '2017-01-20', 117, NULL, 'https://youtu.be/84TouqfIsiI?si=2HJzG8Y_L3s2zn1Q', '2025-06-15 14:42:23', 0, 'img/split.jpg'),
(72, 'The Night Comes for Us', 'Pembantaian brutal di dunia kriminal Jakarta.', 'indonesia', '2018', '2018-10-19', 121, NULL, 'https://youtu.be/HfSisHrUTLM?si=BGS1G-kg3FLtZSL8', '2025-06-15 14:42:23', 0, 'img/thenight.jpg'),
(73, 'The Glory', 'Seorang wanita membalas dendam atas bullying brutal di masa SMA.', 'korea', '2022', '2022-12-30', 60, NULL, 'https://youtu.be/tqVVrTvrI8U?si=9g6EXt-4mBrDEcBO', '2025-06-15 14:42:23', 0, 'img/theglory.jpg'),
(74, 'Crash Landing on You', 'Wanita Korea Selatan jatuh ke Korea Utara dan jatuh cinta dengan tentara.', 'korea', '2019', '2019-12-14', 70, NULL, 'https://youtu.be/GVQGWgeVc4k?si=U4LinVDYigm5UHG3', '2025-06-15 14:42:23', 0, 'img/crashlanding.jpg'),
(75, 'Naruto Shippuden: The Lost Tower', 'Naruto terlempar ke masa lalu dan bertemu ayahnya.', 'jepang', '2010', '2010-07-31', 85, NULL, 'https://youtu.be/s4JpZxunAt8?si=932lb36e25M_UcNb', '2025-06-15 14:42:23', 0, 'img/narutotower.jpg'),
(76, 'Avengers: Endgame', 'Pertempuran epik Avengers melawan Thanos demi masa depan semesta.', 'inggris', '2019', '2019-04-26', 181, NULL, 'https://youtu.be/TcMBFSGVi1c?si=oSsNxIFhKZhXB0iM', '2025-06-15 14:42:23', 0, 'img/endgame.jpg'),
(77, 'The Revenant', 'Seorang pemburu berjuang hidup-hidupan setelah dikhianati rekan.', 'inggris', '2015', '2015-12-25', 156, NULL, 'https://youtu.be/LoebZZ8K5N0?si=KAW7v2YsPZDEZZvz', '2025-06-15 14:42:23', 0, 'img/revenant.jpg'),
(78, 'Train to Busan', 'Penumpang kereta harus bertahan dari wabah zombie.', 'korea', '2016', '2016-07-20', 118, NULL, 'https://youtu.be/1ovgxN2VWNc?si=vkEBrhCcHP--WRtS', '2025-06-15 14:42:23', 0, 'img/busan.jpg'),
(79, 'Battle of Surabaya', 'Petualangan bocah tukang semir sepatu di tengah pertempuran kemerdekaan.', 'indonesia', '2015', '2015-08-20', 99, NULL, 'https://youtu.be/-3EYqoN_z-g?si=Sv76oRTgJk86ZTY6', '2025-06-15 14:42:23', 0, 'img/surabaya.jpg'),
(80, 'Death Note', 'Seorang siswa menemukan buku pembunuh dan menjadi “Tuhan baru”.', 'jepang', '2006', '2006-06-17', 126, NULL, 'https://youtu.be/mdZQ-_GLzYs?si=EbYFOLkqY5GIVuHS', '2025-06-15 14:42:23', 0, 'img/deathnote.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `movie_genres`
--

INSERT INTO `movie_genres` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(3, 1),
(4, 1),
(4, 2),
(5, 2),
(6, 3),
(9, 1),
(9, 3),
(10, 3),
(10, 10),
(11, 1),
(11, 2),
(11, 16),
(12, 4),
(12, 11),
(12, 17),
(13, 1),
(13, 4),
(13, 9),
(13, 10),
(14, 2),
(14, 3),
(14, 13),
(14, 16),
(15, 3),
(15, 11),
(15, 13),
(16, 1),
(16, 4),
(16, 11),
(16, 17),
(17, 3),
(17, 4),
(17, 13),
(17, 15),
(18, 1),
(18, 2),
(18, 11),
(18, 12),
(19, 3),
(19, 4),
(19, 11),
(19, 17),
(20, 3),
(21, 3),
(22, 1),
(22, 4),
(23, 2),
(24, 1),
(24, 4),
(26, 1),
(26, 3),
(27, 3),
(28, 3),
(30, 4),
(31, 4),
(32, 1),
(32, 2),
(36, 1),
(36, 4),
(37, 4),
(38, 2),
(39, 9),
(40, 9),
(41, 10),
(42, 10),
(43, 11),
(44, 11),
(45, 12),
(46, 4),
(47, 13),
(48, 13),
(49, 14),
(50, 14),
(51, 15),
(52, 15),
(53, 16),
(55, 17),
(56, 17),
(57, 9),
(58, 9),
(59, 10),
(60, 10),
(61, 11),
(62, 11),
(63, 12),
(64, 12),
(65, 13),
(66, 13),
(68, 14),
(69, 15),
(70, 15),
(71, 16),
(72, 16),
(73, 17),
(74, 17),
(75, 14),
(76, 9),
(77, 10),
(78, 16),
(79, 13),
(80, 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `my_list`
--

CREATE TABLE `my_list` (
  `id_list` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `my_list`
--

INSERT INTO `my_list` (`id_list`, `movie_id`, `added_at`) VALUES
(2, 26, '2025-06-15 01:31:45'),
(3, 36, '2025-06-15 01:31:50'),
(4, 11, '2025-06-15 01:32:02'),
(5, 3, '2025-06-15 01:32:10'),
(6, 38, '2025-06-15 01:32:16'),
(8, 27, '2025-06-15 01:32:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `rated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ratings`
--

INSERT INTO `ratings` (`rating_id`, `movie_id`, `rating`, `rated_at`) VALUES
(1, 1, 9.0, '2025-06-07 07:52:34'),
(2, 1, 8.0, '2025-06-07 07:58:15'),
(3, 2, 9.0, '2025-06-15 06:37:46'),
(4, 3, 5.0, '2025-06-15 06:37:46'),
(5, 4, 6.5, '2025-06-15 06:37:46'),
(6, 5, 8.5, '2025-06-15 06:37:46'),
(7, 6, 7.0, '2025-06-15 06:37:46'),
(9, 9, 9.5, '2025-06-15 06:37:46'),
(10, 10, 8.0, '2025-06-15 06:37:46'),
(11, 11, 8.5, '2025-06-15 06:37:46'),
(12, 12, 9.0, '2025-06-15 06:37:46'),
(13, 13, 8.0, '2025-06-15 06:37:46'),
(14, 14, 7.0, '2025-06-15 06:37:46'),
(15, 15, 9.5, '2025-06-15 06:37:46'),
(16, 16, 8.5, '2025-06-15 06:37:46'),
(17, 17, 8.0, '2025-06-15 06:37:46'),
(18, 19, 10.0, '2025-06-15 06:37:46'),
(19, 20, 8.0, '2025-06-15 06:37:46'),
(20, 21, 9.0, '2025-06-15 06:37:46'),
(21, 22, 9.5, '2025-06-15 06:37:46'),
(22, 22, 8.5, '2025-06-15 06:37:46'),
(23, 23, 6.0, '2025-06-15 06:37:46'),
(24, 24, 7.0, '2025-06-15 06:37:46'),
(25, 26, 8.5, '2025-06-15 06:37:46'),
(26, 27, 9.0, '2025-06-15 06:37:46'),
(27, 28, 8.5, '2025-06-15 06:37:46'),
(28, 30, 6.5, '2025-06-15 06:42:38'),
(29, 31, 7.0, '2025-06-15 06:43:01'),
(30, 32, 7.5, '2025-06-15 06:43:01'),
(32, 36, 7.5, '2025-06-15 06:43:23'),
(33, 37, 8.0, '2025-06-15 06:43:42'),
(34, 38, 8.0, '2025-06-15 06:43:42'),
(36, 40, 8.0, '2024-01-21 17:00:00'),
(37, 41, 7.3, '2024-01-24 17:00:00'),
(38, 42, 7.7, '2024-01-25 17:00:00'),
(39, 43, 6.9, '2024-01-27 17:00:00'),
(40, 44, 7.2, '2024-01-31 17:00:00'),
(41, 45, 8.1, '2024-02-03 17:00:00'),
(42, 46, 6.8, '2024-02-05 17:00:00'),
(43, 47, 7.4, '2024-02-09 17:00:00'),
(44, 48, 8.5, '2024-02-11 17:00:00'),
(45, 49, 8.9, '2024-02-13 17:00:00'),
(46, 50, 10.0, '2024-02-16 17:00:00'),
(47, 51, 7.8, '2024-02-19 17:00:00'),
(48, 52, 7.1, '2024-02-20 17:00:00'),
(49, 53, 6.6, '2024-02-23 17:00:00'),
(51, 55, 8.6, '2024-02-29 17:00:00'),
(52, 56, 7.9, '2024-03-02 17:00:00'),
(53, 57, 8.2, '2024-03-05 17:00:00'),
(54, 58, 7.4, '2024-03-07 17:00:00'),
(55, 59, 8.8, '2024-03-09 17:00:00'),
(56, 60, 7.6, '2024-03-12 17:00:00'),
(57, 61, 7.0, '2024-03-14 17:00:00'),
(58, 62, 7.5, '2024-03-17 17:00:00'),
(59, 63, 7.9, '2024-03-19 17:00:00'),
(60, 64, 6.7, '2024-03-21 17:00:00'),
(61, 65, 7.3, '2024-03-24 17:00:00'),
(62, 66, 8.0, '2024-03-26 17:00:00'),
(64, 68, 8.2, '2024-04-01 17:00:00'),
(65, 69, 7.9, '2024-04-03 17:00:00'),
(66, 70, 6.5, '2024-04-05 17:00:00'),
(68, 72, 7.4, '2024-04-10 17:00:00'),
(69, 73, 8.5, '2024-04-13 17:00:00'),
(70, 74, 8.3, '2024-04-15 17:00:00'),
(71, 75, 7.7, '2024-04-17 17:00:00'),
(72, 76, 8.9, '2024-04-19 17:00:00'),
(73, 77, 8.0, '2024-04-21 17:00:00'),
(74, 78, 8.1, '2024-04-24 17:00:00'),
(75, 79, 7.6, '2024-04-27 17:00:00'),
(76, 80, 8.4, '2024-04-30 17:00:00'),
(78, 24, 8.4, '2025-06-22 16:04:19'),
(79, 53, 3.0, '2025-01-31 06:07:32'),
(80, 42, 7.4, '2024-07-28 07:10:47'),
(81, 62, 5.9, '2025-01-16 00:52:18'),
(82, 53, 2.9, '2025-03-12 15:42:18'),
(83, 77, 9.5, '2024-09-12 23:19:08'),
(84, 59, 2.2, '2025-06-10 05:38:53'),
(85, 37, 9.7, '2024-11-10 08:29:24'),
(86, 17, 7.3, '2024-12-23 18:16:13'),
(87, 35, 8.2, '2024-11-08 00:53:52'),
(88, 40, 3.9, '2025-01-12 22:37:56'),
(89, 3, 9.0, '2025-02-07 19:56:03'),
(90, 70, 9.9, '2025-03-08 20:29:05'),
(91, 40, 3.9, '2024-08-29 15:26:37'),
(92, 64, 4.5, '2025-06-06 08:14:02'),
(93, 56, 2.4, '2024-08-17 00:09:32'),
(94, 5, 4.9, '2024-10-26 22:28:28'),
(95, 43, 8.8, '2024-10-09 21:11:21'),
(96, 73, 2.5, '2025-01-10 04:55:54'),
(97, 68, 4.6, '2025-04-28 15:50:10'),
(98, 77, 4.4, '2024-10-19 15:22:06'),
(99, 36, 2.0, '2025-06-17 05:54:05'),
(100, 24, 9.5, '2025-04-07 05:33:41'),
(101, 52, 6.9, '2024-12-29 05:25:32'),
(102, 32, 4.4, '2025-06-17 00:55:56'),
(103, 80, 9.1, '2025-06-12 13:40:15'),
(104, 2, 6.9, '2025-06-20 05:50:15'),
(105, 68, 5.2, '2025-06-09 00:36:48'),
(106, 69, 2.3, '2025-01-15 13:16:55'),
(107, 45, 8.8, '2024-06-29 04:15:44'),
(108, 70, 1.3, '2024-11-30 19:18:28'),
(109, 44, 9.9, '2025-05-13 08:52:06'),
(110, 22, 3.8, '2025-05-06 11:47:42'),
(111, 69, 9.7, '2025-05-14 00:30:38'),
(112, 63, 4.1, '2024-11-18 13:28:10'),
(113, 78, 3.4, '2025-04-14 13:04:40'),
(114, 65, 3.2, '2025-04-20 09:05:52'),
(115, 69, 8.3, '2025-04-02 09:13:21'),
(116, 57, 7.2, '2025-03-27 13:04:30'),
(117, 28, 7.2, '2025-03-07 04:28:21'),
(118, 75, 5.5, '2024-09-02 17:34:56'),
(119, 57, 1.7, '2024-06-25 14:13:29'),
(120, 60, 3.1, '2025-02-18 02:52:19'),
(121, 80, 10.0, '2024-12-20 08:57:14'),
(122, 2, 6.2, '2025-04-04 21:00:50'),
(123, 63, 1.8, '2024-10-28 20:53:37'),
(124, 41, 6.9, '2024-06-25 18:14:15'),
(125, 10, 7.3, '2025-04-11 17:06:49'),
(126, 31, 3.0, '2024-11-12 21:24:42'),
(127, 69, 4.4, '2025-04-30 16:42:49'),
(128, 64, 7.1, '2025-02-25 14:15:42'),
(129, 36, 2.8, '2025-02-13 21:24:34'),
(130, 45, 1.4, '2025-05-28 12:44:24'),
(131, 38, 6.4, '2025-02-02 05:53:17'),
(132, 71, 9.2, '2024-09-26 17:24:34'),
(133, 23, 7.5, '2025-05-08 08:27:56'),
(134, 46, 8.2, '2025-03-15 02:45:23'),
(135, 69, 3.0, '2025-05-24 17:54:43'),
(136, 28, 4.6, '2024-09-20 07:02:05'),
(137, 20, 2.4, '2025-05-27 10:37:03'),
(138, 36, 7.5, '2025-03-10 07:11:01'),
(139, 1, 9.1, '2025-03-14 17:55:56'),
(140, 50, 9.3, '2024-09-15 18:34:27'),
(141, 69, 4.2, '2024-09-24 01:20:02'),
(142, 5, 7.6, '2025-01-13 17:36:41'),
(143, 23, 5.5, '2025-01-04 10:24:55'),
(144, 73, 5.6, '2025-06-14 00:55:50'),
(145, 56, 4.2, '2024-12-19 04:56:20'),
(146, 20, 3.9, '2024-09-28 14:21:43'),
(147, 79, 3.5, '2025-05-20 12:23:45'),
(148, 80, 8.5, '2024-12-24 17:27:47'),
(149, 71, 8.2, '2024-07-13 10:02:44'),
(150, 53, 2.4, '2025-03-15 08:54:08'),
(151, 1, 4.0, '2024-07-11 21:32:03'),
(152, 80, 9.8, '2025-06-10 12:18:16'),
(153, 35, 4.1, '2024-10-07 20:20:53'),
(154, 15, 7.0, '2024-07-22 09:25:58'),
(155, 16, 7.0, '2025-02-04 14:00:50'),
(156, 18, 9.6, '2025-01-10 12:08:15'),
(157, 65, 7.0, '2024-07-28 13:20:45'),
(158, 3, 1.9, '2025-02-10 00:28:44'),
(159, 63, 8.5, '2025-03-24 13:56:05'),
(160, 15, 8.4, '2024-07-17 21:02:29'),
(161, 76, 2.8, '2024-11-26 10:28:50'),
(162, 52, 4.8, '2025-01-08 03:11:42'),
(163, 69, 8.2, '2024-08-25 04:55:08'),
(164, 66, 3.3, '2024-08-25 08:06:43'),
(165, 69, 3.0, '2024-09-21 11:16:47'),
(166, 20, 5.9, '2025-02-22 00:42:56'),
(167, 52, 2.3, '2024-06-24 22:25:06'),
(168, 50, 9.9, '2024-12-27 13:23:44'),
(169, 59, 5.0, '2024-09-26 12:07:36'),
(170, 73, 2.4, '2024-10-22 08:22:09'),
(171, 77, 4.5, '2025-01-10 03:06:40'),
(172, 10, 6.6, '2024-06-22 09:44:24'),
(173, 79, 9.8, '2024-09-03 19:10:22'),
(174, 15, 8.6, '2025-06-15 05:24:07'),
(175, 19, 2.2, '2024-07-25 17:43:16'),
(176, 73, 7.5, '2024-10-14 04:07:22'),
(177, 36, 1.6, '2024-11-13 03:30:37'),
(178, 75, 9.5, '2025-05-27 22:35:42'),
(179, 78, 6.7, '2025-05-18 03:30:15'),
(180, 52, 9.2, '2024-07-01 09:45:00'),
(181, 15, 3.8, '2025-03-20 01:10:20'),
(182, 36, 7.5, '2024-11-29 16:55:00'),
(183, 60, 4.1, '2025-01-04 23:20:30'),
(184, 2, 8.3, '2024-08-14 04:05:40'),
(185, 73, 5.0, '2025-04-09 12:15:50'),
(186, 40, 6.9, '2024-10-01 21:30:00'),
(187, 69, 2.7, '2025-02-28 07:00:00'),
(188, 59, 8.8, '2024-09-07 14:00:00'),
(189, 77, 3.5, '2025-06-03 02:40:00'),
(190, 20, 7.1, '2024-07-25 11:25:00'),
(191, 5, 9.4, '2025-03-09 18:00:00'),
(192, 45, 6.2, '2024-12-19 05:30:00'),
(193, 3, 1.5, '2025-05-01 15:10:00'),
(194, 71, 7.9, '2024-08-08 00:00:00'),
(195, 23, 4.6, '2025-04-22 08:00:00'),
(196, 64, 8.5, '2024-10-11 03:10:00'),
(197, 10, 3.0, '2025-01-15 20:00:00'),
(198, 31, 9.1, '2024-09-23 06:40:00'),
(199, 56, 5.7, '2025-02-08 17:00:00'),
(200, 1, 6.8, '2024-07-17 10:00:00'),
(201, 79, 2.2, '2025-06-11 01:00:00'),
(202, 62, 9.9, '2024-11-04 13:00:00'),
(203, 38, 4.0, '2025-03-05 04:30:00'),
(204, 80, 7.3, '2024-08-27 19:00:00'),
(205, 50, 9.5, '2025-04-18 09:50:00'),
(206, 68, 8.0, '2024-10-26 16:00:00'),
(207, 75, 3.4, '2025-01-21 00:15:00'),
(208, 17, 9.5, '2024-07-09 07:00:00'),
(209, 35, 5.1, '2025-05-23 03:00:00'),
(210, 42, 6.6, '2024-11-30 22:00:00'),
(211, 43, 2.5, '2025-03-12 11:00:00'),
(212, 70, 8.7, '2024-09-01 02:00:00'),
(213, 6, 4.8, '2025-01-28 17:00:00'),
(214, 11, 7.2, '2024-07-04 04:00:00'),
(215, 58, 3.9, '2025-04-10 13:00:00'),
(216, 21, 9.0, '2024-11-18 09:00:00'),
(217, 22, 5.3, '2025-02-03 00:00:00'),
(218, 48, 7.6, '2024-09-15 05:00:00'),
(219, 47, 2.8, '2025-05-16 14:00:00'),
(220, 78, 8.1, '2024-10-05 20:00:00'),
(221, 61, 4.4, '2025-01-20 08:00:00'),
(222, 49, 9.6, '2024-08-19 23:00:00'),
(223, 72, 1.2, '2025-03-01 12:00:00'),
(224, 14, 6.0, '2024-12-25 03:00:00'),
(225, 63, 7.0, '2025-04-02 21:00:00'),
(226, 13, 3.3, '2024-07-30 01:00:00'),
(227, 30, 8.4, '2025-02-15 15:00:00'),
(228, 74, 5.5, '2024-09-10 06:00:00'),
(229, 39, 9.8, '2025-06-08 10:00:00'),
(230, 4, 2.0, '2024-11-08 17:00:00'),
(231, 51, 7.7, '2025-04-29 02:00:00'),
(232, 8, 4.3, '2024-07-22 11:00:00'),
(233, 32, 9.0, '2025-03-17 07:00:00'),
(234, 16, 6.5, '2024-10-04 23:00:00'),
(235, 18, 10.0, '2025-01-01 04:00:00'),
(236, 19, 8.9, '2024-08-01 14:00:00'),
(237, 65, 5.2, '2025-05-10 03:00:00'),
(238, 55, 7.4, '2024-12-07 21:00:00'),
(239, 76, 2.6, '2025-02-20 12:00:00'),
(240, 66, 9.3, '2024-09-25 09:00:00'),
(241, 53, 4.7, '2025-06-19 00:00:00'),
(242, 37, 8.6, '2024-11-12 05:00:00'),
(243, 73, 1.8, '2025-04-05 18:00:00'),
(244, 24, 7.0, '2024-07-13 13:00:00'),
(245, 52, 3.6, '2025-03-28 02:00:00'),
(246, 32, 9.5, '2024-10-19 07:00:00'),
(247, 80, 5.0, '2025-05-07 16:00:00'),
(248, 68, 2.9, '2024-08-04 22:00:00'),
(249, 75, 8.2, '2025-01-26 11:00:00'),
(250, 17, 4.1, '2024-12-13 17:00:00'),
(251, 35, 9.7, '2025-03-03 03:00:00'),
(252, 42, 6.3, '2024-09-03 08:00:00'),
(253, 43, 1.1, '2025-05-25 00:00:00'),
(254, 70, 7.8, '2024-11-20 04:00:00'),
(255, 6, 3.7, '2025-02-17 13:00:00'),
(256, 11, 8.5, '2024-07-06 19:00:00'),
(257, 58, 4.9, '2025-04-13 06:00:00'),
(258, 21, 9.2, '2024-10-29 15:00:00'),
(259, 22, 5.6, '2025-01-08 23:00:00'),
(260, 48, 7.1, '2024-08-10 12:00:00'),
(261, 47, 2.3, '2025-06-01 07:00:00'),
(262, 78, 8.4, '2024-11-27 01:00:00'),
(263, 61, 4.0, '2025-03-07 17:00:00'),
(264, 49, 9.9, '2024-09-17 03:00:00'),
(265, 72, 1.5, '2025-05-04 09:00:00'),
(266, 14, 6.7, '2024-07-28 16:00:00'),
(267, 63, 7.3, '2025-03-31 22:00:00'),
(268, 13, 3.9, '2024-12-10 04:00:00'),
(269, 30, 8.0, '2025-02-23 11:00:00'),
(270, 74, 5.1, '2024-09-05 18:00:00'),
(271, 39, 9.4, '2025-06-13 02:00:00'),
(272, 4, 2.7, '2024-11-15 07:00:00'),
(273, 51, 7.0, '2025-03-24 13:00:00'),
(274, 8, 4.6, '2024-07-15 20:00:00'),
(275, 32, 8.8, '2025-01-03 10:00:00'),
(276, 16, 6.1, '2024-10-09 15:00:00'),
(277, 18, 9.0, '2025-05-11 23:00:00'),
(278, 19, 8.1, '2024-08-04 04:00:00'),
(279, 9, 9.9, '2025-06-22 16:13:51'),
(280, 18, 9.0, '2025-01-01 04:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
  ADD PRIMARY KEY (`id_ks`);

--
-- Indeks untuk tabel `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indeks untuk tabel `my_list`
--
ALTER TABLE `my_list`
  ADD PRIMARY KEY (`id_list`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indeks untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
  MODIFY `id_ks` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `my_list`
--
ALTER TABLE `my_list`
  MODIFY `id_list` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Ketidakleluasaan untuk tabel `my_list`
--
ALTER TABLE `my_list`
  ADD CONSTRAINT `my_list_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Ketidakleluasaan untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
