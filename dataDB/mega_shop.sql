-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 01 Lip 2022, 22:21
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mega_shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT uuid(),
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
('0d764eba-a577-4bdc-8df0-c7cd9fa88812', 'Chłodzenia', 'https://www.alsen.pl/media/cache/filemanager_original/icons/categories/alsen/chlodzenie_podzes.png'),
('17a4f15f-870f-40c2-bbfe-40b452f094a5', 'Procesory', 'https://asset.conrad.com/media10/isa/160267/c1/-/pl/1834563_BB_01_FB/image.jpg'),
('298b54b8-6648-4500-8d29-d6f676d0325b', 'Myszki', 'https://f01.osfr.pl/foto/9/43052324441/adfa1c737afb82beb52534e2769b7634/msi-mysz-gamingowa-clutch-gm50,43052324441_8.jpg'),
('3941dedb-3611-49e9-b9fe-c3e33601ea9c', 'Obudowy', 'https://asset.conrad.com/media10/isa/160267/c1/-/pl/1888194_LB_01_FB/image.jpg'),
('41f7b24b-5d55-43dd-b586-7f78124cdcef', 'Klawiatury', 'https://www.mediaexpert.pl/media/cache/resolve/gallery/images/21/2111693/Klawiatura-STEELSERIES-Apex-7-profil-1.jpg'),
('4460011b-485c-4917-a3a4-8dd81ae77d74', 'Monitory', 'https://f01.esfr.pl/foto/9/81012135377/63b9bb1c3b146d986a85ccdb4e1bd9aa/samsung-monitor-samsung-49-240hz-1ms-odyssey-g9,81012135377_8.jpg'),
('6393178b-55d9-4c1c-95cc-afd062bf6ade', 'Zasilacze', 'https://allegro.stati.pl/AllegroIMG/PRODUCENCI/CORSAIR/CP-9020218-EU/1-zasilacz.jpg'),
('8f58a003-3869-49a2-b050-a31a5aef1617', 'Dyski talerzowe', 'https://www.comtrade.pl/pol_pl_Dysk-twardy-500-GB-SATA-III-3-5-Seagate-ST500DM002-4621_2.jpg'),
('bb5e2991-0fa0-488e-81fc-9881c02dbe7f', 'Dyski SSD', 'https://www.apollo.pl/gfx/apollo/_thumbs/sklep_oferta/000/216/425/nvme_2,rH17n6ummWegVo8.jpg'),
('cd7c9cc5-c64c-4ae2-98fd-05a2ea80519c', 'Pamięci RAM', 'https://f00.esfr.pl/foto/1/40812146033/d88ada7584c916a41943ebda4cd15fef/g-skill-trident-z-rgb-ddr4-2x16gb-32gb-4000-cl19,40812146033_8.jpg'),
('d653586f-7bd8-4b2f-b163-725954892ba7', 'Karty graficzne', 'https://foxkomputer.pl/environment/cache/images/500_500_productGfx_71432/img9.jpg'),
('f165b71a-5b8a-485d-b84f-7bf6818ddc94', 'Płyty główne', 'https://www.apollo.pl/gfx/apollo/_thumbs/sklep_oferta/000/171/644/1279168_2,rH17n6ummWegVo8.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `clients`
--

CREATE TABLE `clients` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT uuid(),
  `name` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL DEFAULT 0,
  `gender` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(99) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `clients`
--

INSERT INTO `clients` (`id`, `name`, `surname`, `address`, `code`, `city`, `phone`, `gender`, `birth`, `email`, `orders`, `ban`) VALUES
('105c2983-f788-11ec-8142-00d861548425', 'Hugolina', 'Hugo', 'Hugona 25', '59-365', 'Hugon', 789789798, 'Mężczyzna', '29.06.2022, 10:46:42', 'hugon@hugon.pl', NULL, 0),
('25698dc0-f620-11ec-996b-00d861548425', 'Jan', 'Janek', 'Ćwiartki 3/4', '59-369', 'Libini', 596859684, 'Mężczyzna', '27.06.2022', 'jan@gmail.com', NULL, 0),
('658d28c5-f787-11ec-8142-00d861548425', 'Albert', 'Kliszcz', 'Armii Krajowej 6/3', '59-300', 'Lubin', 608172153, 'Mężczyzna', '29.06.2022', 'albert@gmail.com', NULL, 0),
('b52b8b9b-f787-11ec-8142-00d861548425', 'Tadek', 'Tadet', 'Tadeusza 25', '59-600', 'Tadka', 456789789, 'Mężczyzna', '29.06.2022', 'tadek@tadek.pl', NULL, 0),
('bf7aa25f-f773-11ec-8142-00d861548425', 'Bartosz', 'Bor', 'Złota 38', '57-693', 'Miami', 222444666, 'Mężczyzna', '29.06.2022', 'bartek@gmail.com', NULL, 0),
('e1226040-f787-11ec-8142-00d861548425', 'Maciek', 'Zasada', 'Lubinska 15', '59-300', 'Lubin', 456456465, 'Mężczyzna', '29.06.2022', 'maciek@maciek.pl', NULL, 0),
('e5db155c-f7ac-11ec-8142-00d861548425', 'Tomasz', 'Tomek', 'Górna 87', '59-340', 'Chobienia', 456456456, 'Mężczyzna', '29.06.2022, 15:10:19', 'tomek@tomek.pl', NULL, 0),
('e8dfca99-f613-11ec-996b-00d861548425', 'hubert', 'kliszcz', 'Armii Krajowej 6/3', '59-300', 'Lubin', 608172153, 'Mężczyzna', '27.06.2022', 'hkliszcz@gmail.com', NULL, 0),
('e936ec68-f773-11ec-8142-00d861548425', 'Jakub', 'Królikowski', 'Informatyczna 69', '57-569', 'Rzym', 586475475, 'Mężczyzna', '29.06.2022', 'jakub@gmail.com', NULL, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT uuid(),
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total` float(8,2) NOT NULL,
  `payment` tinyint(1) NOT NULL DEFAULT 0,
  `products` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` smallint(2) NOT NULL,
  `client` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`id`, `date`, `total`, `payment`, `products`, `count`, `client`) VALUES
('15d4b71f-3579-42e9-96e2-5f3061f0e8fc', '1.07.2022, 13:08:30', 7599.00, 0, 'Asus RTX 3080 ROG Strix OC LHR 12GB GDDR6X, ', 1, 'Hugolina Hugo, Hugona 25, 59-365 Hugon'),
('1d6aa2bb-e320-4a70-b2d4-1bacf6b9d6d8', '1.07.2022, 13:07:30', 479.00, 0, 'Logitech K860 Ergo, ', 1, 'Albert Kliszcz, Armii Krajowej 6/3, 59-300 Lubin'),
('aa1a869b-a562-43c0-82b4-3840fabd14b6', '1.07.2022, 13:01:46', 7599.00, 0, 'Asus RTX 3080 ROG Strix OC LHR 12GB GDDR6X, ', 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT uuid(),
  `firm` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT 0.00,
  `quantity` smallint(3) NOT NULL DEFAULT 0,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sells` int(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id`, `firm`, `model`, `price`, `quantity`, `description`, `category`, `picture`, `sells`) VALUES
('2a952d0a-f774-11ec-8142-00d861548425', 'Logitech', 'K860 Ergo', '479.00', 15, 'Jeśli jesteś miłośnikiem informatyki i elektroniki - lubisz być na bieżąco z nowościami technologicznymi i nie umyka Ci żaden szczegół - kup Klawiatura Logitech ERGO K860 po najlepszej cenie.', 'Klawiatury', 'https://ecsmedia.pl/c/klawiatura-logitech-ergo-k860-920-010108-us-grafitowa-b-iext74427043.jpg', 0),
('4b006425-f620-11ec-996b-00d861548425', 'Samsung', '980 Pro 1TB', '729.00', 15, 'Dysk NVMe SSD 980 PRO jest idealny do wymagających zastosowań, w tym przetwarzania treści 8K i 4K, gier w wysokiej rozdzielczości i analizy danych. Dzięki zwiększonej przepustowości interfejsu PCIe 4.0, 980 PRO oferuje prędkość odczytu do 7000 MB/s, jest tym samym 2x szybszy niż SSD PCIe 3.0 i nawet 12,7x szybszy niż SSD SATA.', 'Dyski SSD', 'https://a.allegroimg.com/original/1161a6/b0892f4d47f2b11985f8ae031d28/DYSK-SSD-SAMSUNG-980-PRO-1TB-', 0),
('6471c1a1-f774-11ec-8142-00d861548425', 'Logitech', 'G Pro Wireless', '431.00', 48, 'Logitech Mysz G Pro Wireless Gaming Zaprojektowana wraz z zawodowcami, stworzona do wygrywaniaPRO Wireless to wyjątkowa mysz go grania dla profesjonalnych e-sportowców. Przez ponad 2 lata dział Logitech G współpracował z ponad 50 profesjonalnymi graczami, aby móc zagwarantować idealny kształt, masę i odczucia połączone z technologią bezprzewodową LIGHTSPEED i czujnikiem HERO 16K.', 'Myszki', 'https://ecsmedia.pl/c/mysz-logitech-g-pro-16000-dpi-w-iext79785488.jpg', 0),
('82acd47d-1dfa-45a8-a7bb-624582f1c0f7', 'Asus', 'RTX 3080 ROG Strix OC LHR 12GB GDDR6X', '7599.00', 0, 'Poznaj kolejną falę gamingowej wydajności z architekturą NVIDIA Ampere i kartą graficzną ASUS GeForce RTX 3080 ROG Strix OC 12GB GDDR6X. Korzystaj z innowacji dzięki technologiom takim jak DLSS czy Ray Tracing, które pozwolą Ci cieszyć się płynną i fotorealistyczną rozgrywką. Metaliczna obudowa otacza wentylatory Axial-tech i masywny radiator, dbające o odpowiednie temperatury pracy GPU. A stylowy design z podświetleniem ARGB od razu sugeruje, że ma się do czynienia ze sprzętem Republiki Graczy.', 'Karty graficzne', 'https://allegro.stati.pl/AllegroIMG/PRODUCENCI/ASUS/ROG-STRIX-RTX3080-O12G-GAMING/1-karta-graficzna-box.jpg', 0),
('8347a787-f5f3-11ec-996b-00d861548425', 'MSI', 'RTX 2060', '1949.00', 13, 'Super karta za rozsądną cenę', 'Karty graficzne', 'https://www.notebookcheck.net/fileadmin/_processed_/b/2/csm_RTX_2060_8_d685a800cc.jpg', 0),
('837cc3ed-f858-11ec-bcc5-00d861548425', 'Corsair', 'VS650', '217.00', 8, 'VS650: entry-level 240V zasilacz z zaawansowanymi funkcjami Corsair VS650 jest doskonałym wyborem, jeśli budujemy system w domu lub biurze o niższych ...', 'Zasilacze', 'https://images.morele.net/i1064/663043_0_i1064.png', 0),
('92b13a94-f85b-11ec-bcc5-00d861548425', 'Goodram', 'Irdm X 16GB 3200MHz', '289.00', 13, 'IRDM X DDR4 to moduły stworzone z myślą o graczach, entuzjastach i profesjonalistach. Pamięci zbudowane zostały z wyselekcjonowanych kości oraz 8-warstwowej płytki PCB.', 'Pamięci RAM', 'https://ecsmedia.pl/c/pamiec-ram-16gb-2x8gb-ddr4-3200mhz-irdm-x-by-goodram-ir-x3200d464l16sa-16gdc-b-iext70834905.jpg', 0),
('9de5c7d2-f856-11ec-bcc5-00d861548425', 'Samsung', 'Odyssey G9 Neo', '7799.00', 1, 'Monitor Samsung Odyssey Neo G9 49\" Wkrocz w nową erę immersji. Technologia Quantum Matrix Niezrównane doznania wizualne. Rewolucyjna technologia Quantum Matrix z diodami Quantum Mini LED zapewnia kontrolowaną jasność i doskonały kontrast.Lokalne strefy przyciemniania zostały zwiększone do 2048 i połączone z najwyższymi 12-bitowymi poziomami czerni, aby uzyskać niezrównaną jakość obrazu na monitorze Samsung Oddysey Neo G9. Uchwyć szczegóły, pokonaj wrogów.', 'Monitory', 'https://m.media-amazon.com/images/I/41gtlzTJuLL._AC_SY350_.jpg', 0),
('a28389e5-f606-11ec-996b-00d861548425', 'Intel', 'Core i7-8700K', '999.00', 7, 'Nowe procesorem Intel® Core™ ósmej generacji pozwala iść z duchem epoki cyfrowej. Uzyskaj ogromny wzrost wydajności w porównaniu z poprzednią ...', 'Procesory', 'https://images.morele.net/i1064/978219_0_i1064.jpg', 0),
('f150c818-f858-11ec-bcc5-00d861548425', 'G.skill', 'TridentZ DDR4 2x8GB 3600MHz', '479.00', 18, 'Częstotliwość pracy:3600 MHz;Gwarancja:wieczysta;Kolor:czarny;Liczba kości pamięci:2 x 8 GB;Model wariantowanie:G.Skill Trident Z RGB DDR4;Napięcie zasilania:1,35 V;Obsługa ECC:nie;Opóźnienie CL:18;Opóźnienie CL:18;Podświetlenie RGB:tak;Pojemność pamięci:16 GB;Przeznaczenie:komputery PC (DIMM);Radiator:tak;Rejestrowane (ECCR):nie;Standard:DDR4;Taktowanie pamięci:3600 MHz;Typ pamięci:DDR4;Typ pamięci RAM (relacje):DDR4 3600 MHz', 'Pamięci RAM', 'https://f00.esfr.pl/foto/2/69933730225/d1fa0769bdcf8fe6bed9266d1b69c385/g-skill-pamiec-pc-g-skill-trid-ddr4-2x8gb-3600,69933730225_8.jpg', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sells`
--

CREATE TABLE `sells` (
  `product_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity_sells` int(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `sells`
--

INSERT INTO `sells` (`product_id`, `quantity_sells`) VALUES
('2a952d0a-f774-11ec-8142-00d861548425', 5),
('6471c1a1-f774-11ec-8142-00d861548425', 6),
('a28389e5-f606-11ec-996b-00d861548425', 5),
('8347a787-f5f3-11ec-996b-00d861548425', 11),
('6471c1a1-f774-11ec-8142-00d861548425', 3),
('82acd47d-1dfa-45a8-a7bb-624582f1c0f7', 6);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indeksy dla tabeli `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders` (`orders`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_products_category` (`category`);

--
-- Indeksy dla tabeli `sells`
--
ALTER TABLE `sells`
  ADD KEY `FK_sells_products` (`product_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`orders`) REFERENCES `orders` (`id`);

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_category` FOREIGN KEY (`category`) REFERENCES `category` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `FK_sells_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
