--
-- Düzenlenmiþtir.
--
-- Orjinal Hali: 'okul_vt_hrzafer'
-- www.hrzafer.com/sql-17-ornek-okul-veritabani
--




create database okul
use okul

-- --------------------------------------------------------

--
-- Table structure for table 'bolum'
--


CREATE TABLE bolum (
  bid int NOT NULL,
  badi varchar(30) NOT NULL,
  aciklama varchar(50),
  eposta varchar(30),
  PRIMARY KEY (bid)
) 

--
-- Dumping data for table 'bolum'
--

INSERT INTO bolum (bid, badi, aciklama, eposta) VALUES
(1, 'Bil. Müh.', 'Bilgisayar Mühendisliði Bölümü', 'ceng@firat.edu.tr'),
(2, 'Elk. Müh.', 'Elektronik Mühendisliði Bölümü', 'ee@firat.edu.tr'),
(3, 'Çev. Müh.', 'Çevre Mühendisliði Bölümü', 'env@firat.edu.tr'),
(4, 'End. Müh.', 'Endüstri Mühendisliði Bölümü', 'ie@firat.edu.tr');

-- --------------------------------------------------------

--
-- Table structure for table 'ders'
--

CREATE TABLE ders (
  did int NOT NULL,
  dadi varchar(30),
  dkodu varchar(50),
  kredi int,
  bid int,
  PRIMARY KEY (did),
  FOREIGN KEY (bid) REFERENCES bolum
) 

--
-- Dumping data for table 'ders'
--

INSERT INTO ders (did, dadi, dkodu, kredi, bid) VALUES
(1, 'Veritabaný', 'CENG 351', 3, 1),
(2, 'Ýþletim Sistemleri', 'CENG 341', 3, 1),
(3, 'Programlamaya Giriþ', 'CENG 101', 4, 1),
(4, 'Elektroniðe Giriþ', 'EE 101', 2, 2),
(5, 'Ýstatistik', 'IE 301', 4, 4),
(6, 'Devre Teorisi', 'EE 202', 3, 2),
(7, 'Çevre Bilgisi', 'ENV 102', 3, 3),
(8, 'Yöneylem Araþtýrmasý', 'IE 208', 3, 4),
(9, 'Yaz Stajý', 'IE 299', 2, 4),
(10, 'Yaz Stajý', 'ENV 299', 3, 3),
(11, 'Yaz Stajý', 'CENG 299', 3, 1),
(12, 'Yaz Stajý', 'EE 299', 3, 2),
(13, 'Test Course', 'TEST 101', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table 'ogrenci'
--

CREATE TABLE ogrenci(
  ono int,
  adi varchar(30),
  soyadi varchar(30),
  dyeri varchar(50),
  bid int,
  PRIMARY KEY (ono),
  FOREIGN KEY (bid) REFERENCES bolum
)

--
-- Dumping data for table 'ogrenci'
--

INSERT INTO ogrenci (ono, adi, soyadi, dyeri, bid) VALUES
(1, 'Ali', 'Turan', 'Ýstanbul', 1),
(2, 'Ahmet', 'Büyük', 'Ankara', 1),
(3, 'Leyla', 'Þahin', 'Konya', 1),
(4, 'Can', 'Türkoðlu', 'Manisa', 2),
(5, 'Aziz', 'Keskin', 'Ýstanbul', 2),
(6, 'Talat', 'Þanlý', 'Adýyaman', 3),
(7, 'Kamuran', 'Kece', 'Elazýð', 3),
(8, 'Turgut', 'Cemal', 'Bursa', 4),
(9, 'Öznur', 'Güneþ', 'Elazýð', 2),
(10, 'Pelin', 'Tugay', 'Malatya', 4),
(11, 'Savaþ', 'Tan', 'Elazýð', 4);

-- --------------------------------------------------------

--
-- Table structure for table 'ogrenci_ders'
--

CREATE TABLE ogrenci_ders (
  ono int,
  did int,
  dersNotu float,
  PRIMARY KEY (ono,did),
  FOREIGN KEY (did) REFERENCES ders,
  FOREIGN KEY (ono) REFERENCES ogrenci
)

--
-- Dumping data for table 'ogrenci_ders'
--

INSERT INTO ogrenci_ders (ono, did, dersNotu) VALUES
(1, 1, 3),
(1, 3, 2.5),
(1, 4, 3.5),
(1, 6, 3),
(1, 9, 4),
(1, 10, 3),
(2, 1, 4),
(2, 2, 4),
(2, 3, 4),
(2, 4, 4),
(2, 5, 4),
(2, 6, 4),
(2, 7, 4),
(2, 8, 4),
(2, 9, 4),
(2, 10, 3),
(2, 11, 4),
(3, 1, 4),
(3, 2, 4),
(3, 3, 4),
(3, 4, 4),
(3, 5, 4),
(3, 6, 4),
(3, 7, 4),
(3, 8, 4),
(3, 9, 4),
(3, 10, 3),
(3, 11, 3.5),
(4, 1, 2.5),
(4, 5, 1.5),
(5, 1, 3),
(5, 2, NULL),
(5, 3, NULL),
(5, 5, 1.5),
(5, 11, 3.5),
(5, 13, NULL),
(6, 2, 4),
(7, 1, 2.5),
(7, 2, 3),
(7, 5, 1.5),
(7, 8, 1.5),
(8, 2, 3.5),
(8, 7, 1.5),
(9, 1, NULL),
(10, 2, 4),
(10, 8, 3),
(11, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table 'ogretmen'
--

CREATE TABLE ogretmen (
  oid int,
  adi varchar(30),
  soyadi varchar(30),
  dyeri varchar(50),
  bid int,
  PRIMARY KEY (oid),
  FOREIGN KEY (bid) REFERENCES bolum
)

--
-- Dumping data for table 'ogretmen'
--

INSERT INTO ogretmen (oid, adi, soyadi, dyeri, bid) VALUES
(1, 'Selami', 'Durgun', 'Elazýð', 1),
(2, 'Cengiz', 'Tahir', 'Ýstanbul', 1),
(3, 'Derya', 'Seçkin', 'Elazýð', 1),
(4, 'Doðan', 'Gedikli', 'Elazýð', 2),
(5, 'Ayten', 'Kahraman', 'Malatya', 3),
(6, 'Tahsin', 'Uður', 'Erzurum', 4),
(7, 'Selçuk', 'Ozan', 'Amasya', 4);

-- --------------------------------------------------------

--
-- Table structure for table 'ogretmen_ders'
--

CREATE TABLE ogretmen_ders (
  oid int,
  did int,
  PRIMARY KEY (oid,did),
  FOREIGN KEY (did) REFERENCES ders,
  FOREIGN KEY (oid) REFERENCES ogrenci
)

--
-- Dumping data for table 'ogretmen_ders'
--

INSERT INTO ogretmen_ders (oid, did) VALUES
(1, 1),
(3, 2),
(2, 3),
(4, 4),
(7, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(5, 10),
(1, 11),
(4, 12);
