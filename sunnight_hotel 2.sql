-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Maj 2023, 19:22
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sunnight_hotel`
--

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `dzisiejsze_rezerwacje`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `dzisiejsze_rezerwacje` (
`ID_Rezerwacji` int(11)
,`ID_Goscia` int(11)
,`ID_Uslugi` int(11)
,`ID_Personel` int(11)
,`ID_Pokoju` int(11)
,`ID_Zaplaty` int(11)
,`Data_Wplaty` date
,`Data_Rezerwacji` date
,`Data_Konca_Rezerwacji` datetime
,`Data_Zameldowania` date
,`Data_Wymeldowania` date
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `goscie`
--

CREATE TABLE `goscie` (
  `ID_Goscia` int(11) NOT NULL COMMENT 'Identyfikator gościa, numer przepisywany gościowi automatycznie',
  `Imie` varchar(30) NOT NULL COMMENT 'Imie gościa, które podał w formularzu podczas rezerwacji pokoju w hotelu.',
  `Nazwisko` varchar(50) NOT NULL COMMENT 'Nazwisko gościa, które podał podczas rezerwacji pokoju na stronie hotelu',
  `Pesel` varchar(11) NOT NULL COMMENT 'Pesel gościa, który to był podany podczas rezerwacji  hotelu, bądź podczas rejestrowania się na stronie.',
  `Numer_Paszportu` varchar(20) DEFAULT NULL COMMENT 'Numer paszportu gościa jest to opcjonalne.',
  `Numer_Dowodu` varchar(20) DEFAULT NULL COMMENT 'Numer dowodu gościa, jest to opcjonalne.',
  `Ulica` varchar(50) NOT NULL COMMENT 'Ulica, na której dany gość mieszka',
  `ID_Miasta` int(11) NOT NULL COMMENT 'Klucz obcy odwołujący się do klucza głównego w tabeli miasto.',
  `Panstwo` varchar(30) NOT NULL COMMENT 'Państwo z jakiego dany gość pochodzi',
  `Telefon` int(9) NOT NULL COMMENT 'Numer telefonu gościa',
  `Email` varchar(100) DEFAULT NULL COMMENT 'Email gościa. Jest on opcjonalny'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `goscie`
--

INSERT INTO `goscie` (`ID_Goscia`, `Imie`, `Nazwisko`, `Pesel`, `Numer_Paszportu`, `Numer_Dowodu`, `Ulica`, `ID_Miasta`, `Panstwo`, `Telefon`, `Email`) VALUES
(1, 'John', 'Doe', '02345678901', 'BO7V9E0YL', 'U172916YRQ', 'Main Street 1', 1, 'USA', 234526789, 'john.doe@example.com'),
(2, 'Jane', 'Smith', '98765432109', 'II5A3W0VY', 'U601543NPJ', 'Highway 2', 2, 'Canada', 987654321, 'jane.smth@example.com'),
(3, 'Bob', 'Johnson', '42678901234', 'FG5Y0M1MV', 'U530339RNN', 'Park Avenue 3', 3, 'UK', 456289012, 'bob.johnson@example.com'),
(4, 'John', 'Doe', '12345678901', 'SD5K3L2SY', 'U063599YXT', 'Main Street 1', 1, 'USA', 983456789, 'john@example.com'),
(5, 'Jane', 'Smith', '98265432109', 'OX8R7X1FN', 'R421936NOF', 'Highway 2', 2, 'Canada', 987643213, 'jane.smith@example.com'),
(6, 'Bob', 'Johnson', '45678901234', 'XZ2G5A3TT', 'W362042XSV', 'Park Avenue 3', 3, 'UK', 496089012, 'bob.johnson1@example.com'),
(7, 'Adam', 'Nowak', '75070511111', 'LX2M7D5FM', 'R417084OJH', 'Aleja Jana Pawła II 10', 4, 'Polska', 214748364, 'adam.nowak@example.com'),
(8, 'Katarzyna', 'Kowalska', '88031299999', 'UM1D2Z1PQ', 'N398298KOM', 'ul. Słoneczna 5', 5, 'Polska', 286372822, 'katarzyna.kowalska@example.com'),
(9, 'Tomasz', 'Bąkowski', '84101544444', 'KA0Z9R4MA', 'R677412SXJ', 'ul. Mickiewicza 3', 4, 'Polska', 282728377, 'tomasz.bakowski@example.com'),
(10, 'Maria', 'Garcia', '75061812345', 'OV4P6O7EM', 'N746029EYE', 'Calle de Alcala 20', 6, 'Hiszpania', 382938272, 'maria.garcia@example.com'),
(11, 'Juan', 'Lopez', '76101234567', 'AP9D6A1MZ', 'U617514MCD', 'Calle de Gran Via 15', 6, 'Hiszpania', 555783928, 'juan.lopez@example.com'),
(12, 'Paolo', 'Rossi', '70070212345', 'OT0D3P7FS', 'W238440XHV', 'Via Roma 1', 7, 'Włochy', 928397489, 'paolo.rossi@example.com'),
(13, 'Giuseppe', 'Verdi', '62031234567', 'VB7U5M7BG', 'N460369UDI', 'Piazza del Duomo 2', 7, 'Włochy', 927567243, 'giuseppe.verdi@example.com'),
(14, 'Anna', 'Larsson', '89010123456', 'BN3L9L3LD', 'N056640XLM', 'Storgatan 1', 8, 'Szwecja', 823456736, 'anna.larsson@example.com'),
(15, 'Erik', 'Johansson', '85063012345', 'KR0I4H0OO', 'N317147JSM', 'Storgatan 2', 8, 'Szwecja', 283678390, 'erik.johansson@example.com'),
(16, 'Jan', 'Novák', '8101011234', 'AN5E1G7EL', 'N707938GQN', 'Václavské náměstí 1', 9, 'Czechy', 283784321, 'jan.novak@example.com'),
(17, 'Eva', 'Svobodová', '9101011234', 'UN3D6T8YG', 'S830172UGA', 'Karlovo náměstí 2', 9, 'Czechy', 234567890, 'eva.svobodova@example.com'),
(18, 'Andrzej', 'Kowalczyk', '82020212345', 'KH2L3J9LL', 'W440623DMA', 'ul. Podgórska 3', 10, 'Polska', 232839239, 'and.kowalczy@gmail.com'),
(19, 'Magdalena', 'Nowakowska', '91053198765', 'YH7S3T5PH', 'S225057FPK', 'ul. Grunwaldzka 12', 10, 'Polska', 345678901, 'magdalena.nowakowska@example.com'),
(20, 'Piotr', 'Kaczmarek', '84021523456', 'SP9Y7F6MQ', 'N665658TEO', 'ul. Świętokrzyska 4', 11, 'Polska', 456789012, 'piotr.kaczmarek@example.com'),
(21, 'Aleksandra', 'Wiśniewska', '93122134567', 'QG3X4V5NV', 'W963976HIT', 'ul. Marszałkowska 8', 11, 'Polska', 567890123, 'aleksandra.wisniewska@example.com'),
(22, 'Bartosz', 'Kowalewski', '88081523456', 'MA6F0P8IG', 'R544939RQB', 'ul. Mickiewicza 5', 12, 'Polska', 678901234, 'bartosz.kowalewski@example.com'),
(23, 'Marta', 'Wojciechowska', '90010112345', 'FH8I1P6HO', 'W620602ZFF', 'ul. Żurawia 22', 12, 'Polska', 789012345, 'marta.wojciechowska@example.com'),
(24, 'Tomasz', 'Mazur', '82020223456', 'AH5S9Q2JC', 'W022397SMH', 'ul. Gdańska 11', 13, 'Polska', 890123456, 'tomasz.mazur@example.com'),
(25, 'Monika', 'Kamińska', '87050534567', 'LV8Y0H3AX', 'R659848XZE', 'ul. Kościuszki 9', 14, 'Polska', 901234567, 'monika.kaminska@example.com'),
(26, 'Marcin', 'Lewandowski', '80063023456', 'LN2S8F4TF', 'R212713JRK', 'ul. Wrocławska 6', 15, 'Polska', 147483647, 'marcin.lewandowski@example.com'),
(27, 'Agnieszka', 'Zielińska', '91010156789', 'XV4R0C4EI', 'R433787HEZ', 'ul. Jana III Sobieskiego 16', 16, 'Polska', 123456789, 'agnieszka.zielinska@example.com'),
(28, 'Grzegorz', 'Pawlak', '81081423456', 'BL9J0D4BT', 'T460299DUM', 'ul. Warszawska 2', 17, 'Polska', 239567890, 'grzegorz.pawlak@example.com'),
(29, 'John', 'Smith', '8501011234', 'RC5F5H5CU', 'R571461OMT', '123 Main St', 1, 'USA', 125456789, 'john.smith@example.com'),
(30, 'Emily', 'Johnson', '9005305678', 'OL5I0D5JF', 'W433452SRI', '456 Elm St', 2, 'USA', 147483642, 'emily.johnson@example.com'),
(31, 'Michael', 'Williams', '9208162345', 'AM2Y8R5YA', 'S034524TGA', '789 Oak St', 3, 'USA', 220748364, 'michael.williams@example.com'),
(32, 'Jessica', 'Brown', '8601013456', 'FY1C9I8IZ', 'N313550QAD', '456 Pine St', 4, 'USA', 254890456, 'jessica.brown@example.com'),
(33, 'Daniel', 'Davis', '8305246789', 'XR6H4O2TZ', 'S147600KSI', '789 Maple St', 5, 'USA', 382934890, 'daniel.davis@example.com'),
(34, 'Sophia', 'Miller', '8807123456', 'QE9D8W7DN', 'T492590MGV', '234 Cedar St', 6, 'USA', 283903489, 'sophia.miller@example.com'),
(35, 'David', 'Wilson', '9009251234', 'FN9A4B9NU', 'W481081GTA', '789 Birch St', 7, 'USA', 392039345, 'david.wilson@example.com'),
(36, 'Emma', 'Moore', '9104156789', 'KO6S5S7UP', 'R088041GWP', '1234 Walnut St', 8, 'USA', 382789345, 'emma.moore@example.com'),
(37, 'Oliver', 'Taylor', '8405062345', 'QL3E9K0BC', 'W153291TIJ', '5678 Oak Ave', 9, 'USA', 902345890, 'oliver.taylor@example.com'),
(38, 'Mia', 'Anderson', '8708157890', 'HG3V1K5PF', 'R075660IQC', '9012 Cedar Ave', 10, 'USA', 987656783, 'mia.anderson@example.com'),
(39, 'Mateusz', 'Kowalski', '92121223456', 'HU0U9G4OL', 'S977547JPU', 'ul. Mickiewicza 5', 12, 'Polska', 102345890, 'mateusz.kowalski@example.com'),
(40, 'Katarzyna', 'Nowak', '91010145678', 'NE4R9Z9QJ', 'N794362JYQ', 'ul. Warszawska 11', 13, 'Polska', 233561782, 'katarzyna.nowak@example.com'),
(41, 'Adam', 'Szymański', '88020223456', 'ZS6H4F8RS', 'W094662QGK', 'ul. Kościuszki 9', 14, 'Polska', 203410234, 'adam.szymanski@example.com'),
(42, 'Joanna', 'Dąbrowska', '84060134567', 'PV3D6V2RQ', 'N865069VIE', 'ul. Wrocławska 6', 15, 'Polska', 486789012, 'joanna.dabrowska@example.com'),
(43, 'Paweł', 'Kozłowski', '91020312345', 'FF3C4W0MI', 'R531849KDM', 'ul. Jana III Sobieskiego 16', 16, 'Polska', 597890123, 'pawel.kozlowski@example.com'),
(44, 'Karolina', 'Jankowska', '87121223456', 'GG5W8L7JR', 'U753206ZBJ', 'ul. Marszałkowska 8', 11, 'Polska', 778901234, 'karolina.jankowska@example.com');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `goscie_z_danego_miasta`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `goscie_z_danego_miasta` (
`Nazwa_Miasta` varchar(50)
,`Liczba gości` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `koszta_goscia`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `koszta_goscia` (
`Imie` varchar(30)
,`Nazwisko` varchar(50)
,`Suma kosztów rezerwacji` decimal(29,2)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `liczba_gosci_sposob_zaplaty`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `liczba_gosci_sposob_zaplaty` (
`Liczba gości` bigint(21)
,`Sposob_Zaplaty` varchar(30)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `liczba_pokoji_w_hotelu`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `liczba_pokoji_w_hotelu` (
`Liczba pokoji w hotelu` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `liczba_pracownikow_z_malejaca_pensja`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `liczba_pracownikow_z_malejaca_pensja` (
`Imie` varchar(30)
,`Nazwisko` varchar(50)
,`Pensja` decimal(7,2)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `liczba_rezerwacji_w_danym_dniu`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `liczba_rezerwacji_w_danym_dniu` (
`Liczba rezerwacji w danym dniu` bigint(21)
,`Data_Rezerwacji` date
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `lista_pracownikow`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `lista_pracownikow` (
`ID_Personel` int(11)
,`Imie` varchar(30)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `lista_pracownikow_alfabetycznie`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `lista_pracownikow_alfabetycznie` (
`Imie` varchar(30)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `lista_typow_pokoji`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `lista_typow_pokoji` (
`Nazwa_Typu` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `maksymalna_cena_za_pokoj`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `maksymalna_cena_za_pokoj` (
`Maksymalna cena za pokój` decimal(7,2)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasto`
--

CREATE TABLE `miasto` (
  `ID_Miasta` int(11) NOT NULL COMMENT 'Identyfikator odnoszący się do miasta.',
  `Nazwa_Miasta` varchar(50) NOT NULL COMMENT 'Nazwa Miasta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `miasto`
--

INSERT INTO `miasto` (`ID_Miasta`, `Nazwa_Miasta`) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago'),
(4, 'Houston'),
(5, 'Phoenix'),
(6, 'Philadelphia'),
(7, 'San Antonio'),
(8, 'San Diego'),
(9, 'Dallas'),
(10, 'San Jose'),
(11, 'Austin'),
(12, 'Jacksonville'),
(13, 'Fort Worth'),
(14, 'Columbus'),
(15, 'San Francisco'),
(16, 'Charlotte'),
(17, 'Indianapolis'),
(18, 'Seattle'),
(19, 'Denver'),
(20, 'Washington'),
(21, 'Boston'),
(22, 'Nashville'),
(23, 'El Paso'),
(24, 'Detroit'),
(25, 'Memphis'),
(26, 'Portland'),
(27, 'Oklahoma City'),
(28, 'Las Vegas'),
(29, 'Louisville'),
(30, 'Baltimore'),
(31, 'Milwaukee'),
(32, 'Albuquerque'),
(33, 'Tucson'),
(34, 'Fresno'),
(35, 'Mesa'),
(36, 'Sacramento'),
(37, 'Atlanta'),
(38, 'Kansas City'),
(39, 'Colorado Springs'),
(40, 'Miami'),
(41, 'Raleigh'),
(42, 'Omaha'),
(43, 'Long Beach'),
(44, 'Virginia Beach'),
(45, 'Oakland'),
(46, 'Minneapolis'),
(47, 'Tulsa'),
(48, 'Wichita'),
(49, 'New Orleans'),
(50, 'Arlington'),
(51, 'Tampa'),
(52, 'Warszawa'),
(53, 'Kraków'),
(54, 'Łódź'),
(55, 'Wrocław'),
(56, 'Poznań'),
(57, 'Gdańsk'),
(58, 'Szczecin'),
(59, 'Bydgoszcz'),
(60, 'Lublin'),
(61, 'Białystok'),
(62, 'Katowice'),
(63, 'Gdynia'),
(64, 'Częstochowa'),
(65, 'Radom'),
(66, 'Sosnowiec'),
(67, 'Toruń'),
(68, 'Kielce'),
(69, 'Rzeszów'),
(70, 'Gliwice'),
(71, 'Zabrze'),
(72, 'Olsztyn'),
(73, 'Bielsko-Biała'),
(74, 'Bytom'),
(75, 'Ruda Śląska'),
(76, 'Tychy'),
(77, 'Opole'),
(78, 'Gorzów Wielkopolski'),
(79, 'Dąbrowa Górnicza'),
(80, 'Płock'),
(81, 'Elbląg'),
(82, 'Nowy Sącz'),
(83, 'Wałbrzych'),
(84, 'Zielona Góra'),
(85, 'Tarnów'),
(86, 'Chorzów'),
(87, 'Kalisz'),
(88, 'Koszalin'),
(89, 'Legnica'),
(90, 'Grudziądz'),
(91, 'Słupsk'),
(92, 'Jaworzno'),
(93, 'Jastrzębie-Zdrój'),
(94, 'Przemyśl'),
(95, 'Mysłowice'),
(96, 'Piła'),
(97, 'Lębork'),
(98, 'Ostrołęka'),
(99, 'Kędzierzyn-Koźle'),
(100, 'Skierniewice'),
(101, 'Starachowice');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny_gosci`
--

CREATE TABLE `oceny_gosci` (
  `ID_Oceny` int(11) NOT NULL COMMENT 'Identyfikator oceny gościa z hotelu. Gość może dwa razy wyrazić swoją opinię, jeśli dokonał rezerwacji więcej niż raz.',
  `Ocena` int(11) NOT NULL COMMENT 'Ocena gościa od w skali od 1 do 10',
  `ID_Goscia` int(11) DEFAULT NULL COMMENT 'Identyfikator gościa hotelu.',
  `Data_Oceny` date NOT NULL COMMENT 'Data oceny gościa.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `oceny_gosci`
--

INSERT INTO `oceny_gosci` (`ID_Oceny`, `Ocena`, `ID_Goscia`, `Data_Oceny`) VALUES
(1, 7, 1, '2023-01-14'),
(2, 9, 2, '2023-01-09'),
(3, 5, 3, '2023-01-02'),
(4, 8, 4, '2023-01-16'),
(5, 6, 5, '2023-01-11'),
(6, 2, 6, '2023-01-07'),
(7, 3, 7, '2023-01-01'),
(8, 4, 8, '2023-01-15'),
(9, 7, 9, '2023-01-11'),
(10, 10, 10, '2023-01-07'),
(11, 1, 11, '2023-01-31'),
(12, 8, 12, '2023-01-13'),
(13, 5, 13, '2023-01-02'),
(14, 6, 14, '2023-01-30'),
(15, 9, 15, '2023-01-22'),
(16, 2, 16, '2023-01-17'),
(17, 7, 17, '2023-01-18'),
(18, 4, 18, '2023-01-08'),
(19, 6, 19, '2023-01-19'),
(20, 3, 20, '2023-01-07'),
(21, 8, 21, '2023-01-10'),
(22, 9, 22, '2023-01-28'),
(23, 1, 23, '2023-01-17'),
(24, 4, 24, '2023-01-29'),
(25, 7, 25, '2023-01-01'),
(26, 6, 26, '2023-01-12'),
(27, 3, 27, '2023-01-23'),
(28, 8, 28, '2023-01-17'),
(29, 2, 29, '2023-01-15'),
(30, 5, 30, '2023-01-22'),
(31, 10, 31, '2023-01-05'),
(32, 7, 32, '2023-01-19'),
(33, 9, 33, '2023-01-17'),
(34, 6, 34, '2023-01-27'),
(35, 8, 35, '2023-01-20'),
(36, 5, 36, '2023-01-21'),
(37, 2, 37, '2023-01-15'),
(38, 4, 38, '2023-01-10'),
(39, 1, 39, '2023-01-04'),
(40, 7, 40, '2023-01-21'),
(41, 3, 41, '2023-01-29'),
(42, 9, 42, '2023-01-22'),
(43, 6, 43, '2023-01-21'),
(44, 8, 44, '2023-01-09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personel`
--

CREATE TABLE `personel` (
  `ID_Personel` int(11) NOT NULL COMMENT 'Klucz główny-identyfikator pracownika hotelu, jest on ustawiany automatycznie.',
  `Imie` varchar(30) NOT NULL COMMENT 'Imię pracownika hotelu',
  `Nazwisko` varchar(50) NOT NULL COMMENT 'Nazwisko pracownika hotelu.',
  `ID_Stanowiska` int(11) NOT NULL COMMENT 'Klucz obcy identyfikator odnoszący się do numeru stanowiska, które przysługuję danemu pracownikowi.',
  `Telefon` int(9) NOT NULL COMMENT 'Numer telefonu pracownika.',
  `Adres` varchar(80) DEFAULT NULL COMMENT 'Adres pracownika. Jest on opcjonalny.',
  `Pesel` varchar(11) NOT NULL COMMENT 'Pesel pracownika',
  `Numer_Dowodu` varchar(20) NOT NULL COMMENT 'Numer dowodu pracownika hotelu.',
  `Pensja` decimal(7,2) DEFAULT NULL COMMENT 'Miesięczna pensja pracownika.',
  `Ubezpieczenie` tinyint(1) NOT NULL COMMENT 'Ubezpieczenie pracownika wartość zero bądź jeden, 0-posiada ubezpieczenie, 1 - nie posiada ubezpieczenia.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `personel`
--

INSERT INTO `personel` (`ID_Personel`, `Imie`, `Nazwisko`, `ID_Stanowiska`, `Telefon`, `Adres`, `Pesel`, `Numer_Dowodu`, `Pensja`, `Ubezpieczenie`) VALUES
(1, 'Aleksy', 'Szymczak', 1, 259416798, 'ul. Lipowa 1, Kraków, Polska', '60010112345', 'HZQ159737', '5000.00', 1),
(2, 'Agnieszka', 'Górska', 2, 331726459, 'ul. Długa 2, Wrocław, Polska', '87100212345', 'VFC746009', '6000.00', 0),
(3, 'Marek', 'Zieliński', 3, 880381931, 'ul. Sienkiewicza 3, Gdańsk, Polska', '91030112345', 'JLD331066', '4000.00', 0),
(4, 'Małgorzata', 'Kwiatkowska', 4, 406730310, 'ul. Paderewskiego 4, Poznań, Polska', '82070812345', 'FWH231446', '4500.00', 1),
(5, 'Tomasz', 'Kaczmarek', 5, 392505788, 'ul. Kopernika 5, Warszawa, Polska', '75082112345', 'TWW699393', '5500.00', 0),
(6, 'Monika', 'Michalska', 2, 742338042, 'ul. Wita Stwosza 6, Kraków, Polska', '87120612345', 'WYM642927', '6500.00', 0),
(7, 'Wojciech', 'Kowalewski', 3, 534172877, 'ul. Mikołaja Reja 7, Wrocław, Polska', '80070212345', 'KLD177588', '7000.00', 1),
(8, 'Katarzyna', 'Lis', 3, 443850289, 'ul. Jagiellońska 8, Gdańsk, Polska', '92050412345', 'MZL123545', '5500.00', 0),
(9, 'Bartosz', 'Cieślak', 4, 616732846, 'ul. Mickiewicza 9, Łódź, Polska', '78040712345', 'SNF177856', '5000.00', 0),
(10, 'Anna', 'Nowak', 5, 752113395, 'ul. Słowackiego 10, Kraków, Polska', '84010612345', 'FBA515027', '4500.00', 0),
(11, 'Janusz', 'Piotrowski', 6, 910368466, 'ul. Piłsudskiego 11, Warszawa, Polska', '76071412345', 'OME579638', '4000.00', 0),
(12, 'Ewelina', 'Kubiak', 7, 295502178, 'ul. Słoneczna 12, Poznań, Polska', '92080812345', 'AXU837250', '5500.00', 0),
(13, 'Patryk', 'Kowalski', 8, 746405523, 'ul. Grunwaldzka 13, Gdańsk, Polska', '83062412345', 'FXM959649', '5000.00', 0),
(14, 'Maciej', 'Nowakowski', 9, 845521114, 'ul. Świerkowa 1, Warszawa, Polska', '85111212345', 'RLY812519', '5000.00', 1),
(15, 'Alicja', 'Kowalska', 10, 988389031, 'ul. Krótka 2, Kraków, Polska', '95030712345', 'TPL295740', '6000.00', 1),
(16, 'Piotr', 'Zawadzki', 11, 405381846, 'ul. Długa 3, Gdańsk, Polska', '85051512345', 'NLR334070', '4000.00', 0),
(17, 'Katarzyna', 'Wójcik', 12, 617216700, 'ul. Słoneczna 4, Wrocław, Polska', '81020312345', 'MZP202783', '4500.00', 1),
(18, 'Rafał', 'Kowalczyk', 13, 234253534, 'ul. Kwiatowa 5, Poznań, Polska', '75010212345', 'XBF456691', '5500.00', 1),
(19, 'Marta', 'Górka', 14, 277600180, 'ul. Podgórna 6, Kraków, Polska', '94120312345', 'GOP214363', '6500.00', 1),
(20, 'Krzysztof', 'Pawlak', 12, 110304941, 'ul. Słowackiego 7, Warszawa, Polska', '83121112345', 'LMD642448', '7000.00', 0),
(21, 'Dominika', 'Dąbrowska', 12, 718724196, 'ul. Kościuszki 8, Gdańsk, Polska', '93101212345', 'XAU446635', '5500.00', 1),
(22, 'Bartosz', 'Kozłowski', 21, 262706188, 'ul. Kilińskiego 9, Łódź, Polska', '90010112345', 'XZU446635', '5000.00', 0),
(23, 'Monika', 'Lis', 20, 157358384, 'ul. Lipowa 10, Lublin, Polska', '91123112345', 'TZG454702', '6000.00', 1),
(24, 'Tomasz', 'Jankowski', 19, 998673388, 'ul. Chopina 11, Poznań, Polska', '87072812345', 'MCL143034', '4500.00', 1),
(25, 'Magdalena', 'Kaczmarek', 18, 521291819, 'ul. Polna 12, Warszawa, Polska', '92100712345', 'ONS572636', '5000.00', 1),
(26, 'Jakub', 'Wojciechowski', 2, 610438963, 'ul. Bracka 13, Kraków, Polska', '88053112345', 'UNW837186', '5500.00', 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `personel_ubezpieczenie`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `personel_ubezpieczenie` (
`Liczba pracowników` bigint(21)
,`Ubezpieczenie` varchar(3)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `ID_Pokoju` int(11) NOT NULL COMMENT 'Klucz główny- identyfikator danego pokoju, wpisuje się on automatycznie, nie należy go zmieniać.',
  `Numer_Pokoju` int(200) NOT NULL COMMENT 'Numer pokoju od 1 do 200, odnoszący się do numeru pokoju w hotelu',
  `ID_Typ_Pokoju` int(11) NOT NULL COMMENT 'Klucz obcy identyfikator typu pokoju, odnoszący się do identyfikatora w tabeli typ_pokoju.',
  `Status_Pokoju` int(11) NOT NULL COMMENT 'Ukazuje status pokoju, czy dany pokój jest wolny, czy też zajęty. Może być też wyłączony z użytku lub może stać za tym inna przyczyna.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pokoje`
--

INSERT INTO `pokoje` (`ID_Pokoju`, `Numer_Pokoju`, `ID_Typ_Pokoju`, `Status_Pokoju`) VALUES
(1, 101, 1, 1),
(2, 102, 1, 2),
(3, 103, 2, 1),
(4, 104, 2, 2),
(5, 105, 3, 1),
(6, 106, 3, 1),
(7, 107, 4, 2),
(8, 108, 4, 1),
(9, 109, 5, 1),
(10, 110, 5, 1),
(11, 111, 6, 1),
(12, 112, 6, 2),
(13, 201, 1, 2),
(14, 202, 1, 1),
(15, 203, 2, 1),
(16, 204, 2, 2),
(17, 205, 3, 1),
(18, 206, 3, 1),
(19, 207, 4, 1),
(20, 208, 4, 1),
(21, 209, 1, 1),
(22, 210, 2, 1),
(23, 211, 3, 1),
(24, 212, 1, 1),
(25, 213, 2, 1),
(26, 214, 3, 1),
(27, 215, 1, 1),
(28, 216, 2, 1),
(29, 217, 3, 1),
(30, 218, 1, 1),
(31, 219, 2, 1),
(32, 220, 3, 1),
(33, 221, 1, 1),
(34, 222, 2, 1),
(35, 223, 3, 1),
(36, 224, 1, 1),
(37, 225, 2, 1),
(38, 226, 3, 1),
(39, 227, 1, 1),
(40, 228, 2, 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pokoje_ceny`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pokoje_ceny` (
`Numer_Pokoju` int(200)
,`Nazwa_Typu` varchar(50)
,`Cena` decimal(7,2)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownik_z_danego_stanowiska`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownik_z_danego_stanowiska` (
`imie` varchar(30)
,`nazwisko` varchar(50)
,`Stanowisko` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `ID_Rezerwacji` int(11) NOT NULL COMMENT 'Klucz główny - identyfikator do rezerwacji, jest on uzupełniany automatycznie i nie należy go zmieniać ani modyfikować.',
  `ID_Goscia` int(11) NOT NULL COMMENT 'Klucz obcy odwołujący się do identyfikatora gościa z tabeli goscie.',
  `ID_Uslugi` int(11) DEFAULT NULL COMMENT 'Klucz obcy odwołujący się do identyfikatora usługi w tabeli uslugi.',
  `ID_Personel` int(11) DEFAULT NULL COMMENT 'Klucz obcy odwołujący się do identyfikatora personelu z tabeli personel.',
  `ID_Pokoju` int(11) NOT NULL COMMENT 'Klucz obcy odwołujący się do identyfikatora pokoju z tabeli pokoje.',
  `ID_Zaplaty` int(11) NOT NULL COMMENT 'Klucz obcy odwołujący się do identyfikatora opcji zapłaty z tabeli zaplata.',
  `Data_Wplaty` date NOT NULL COMMENT 'Data wpłaty za pobyt w hotelu.',
  `Data_Rezerwacji` date NOT NULL COMMENT 'Data rezerwacji pokoju przez danego gościa.',
  `Data_Konca_Rezerwacji` datetime NOT NULL COMMENT 'Data końca pobytu gościa z godziną jego wymeldowania się z hotelu.',
  `Data_Zameldowania` date NOT NULL COMMENT 'Data Zameldowania się gościa w hotelu.',
  `Data_Wymeldowania` date NOT NULL COMMENT 'Data wymeldowania się gościa z hotelu',
  `Cena` decimal(10,2) NOT NULL COMMENT 'Cena za rezerwację, jest to cena całościowa. Wlicza się w nią liczba dni w hotelu oraz cena z pokój za noc.',
  `Ilosc_Osob` int(11) DEFAULT NULL COMMENT 'Ilość osób, które zarezerwowały dany pokój.',
  `Ilosc_Dni` int(11) NOT NULL COMMENT 'Ilość dni, które gość zarezerwował w hotelu.',
  `Sniadanie` int(30) NOT NULL COMMENT 'Cena za śniadanie, jeśli gośc nie wybrał rezerwacji ze śniadaniem wartość można zostawić wartość zero złotych.',
  `ID_Typ_Rezerwacji` int(11) DEFAULT NULL COMMENT 'Typ danej rezerwacji, klucz obcy.',
  `ID_Status_Rezerwacji` int(11) DEFAULT NULL COMMENT 'Status danej rezerwacji',
  `Uwagi` varchar(255) DEFAULT NULL COMMENT 'Uwagi dotyczące rezerwacji.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rezerwacje`
--

INSERT INTO `rezerwacje` (`ID_Rezerwacji`, `ID_Goscia`, `ID_Uslugi`, `ID_Personel`, `ID_Pokoju`, `ID_Zaplaty`, `Data_Wplaty`, `Data_Rezerwacji`, `Data_Konca_Rezerwacji`, `Data_Zameldowania`, `Data_Wymeldowania`, `Cena`, `Ilosc_Osob`, `Ilosc_Dni`, `Sniadanie`, `ID_Typ_Rezerwacji`, `ID_Status_Rezerwacji`, `Uwagi`) VALUES
(1, 1, 3, 4, 2, 6, '2023-04-01', '2023-05-01', '2023-05-05 12:22:00', '2023-05-01', '2023-05-04', '380.00', 2, 3, 20, 1, 2, 'Brak uwag'),
(2, 2, 5, 14, 40, 3, '2023-03-29', '2023-06-01', '2023-05-05 16:22:00', '2023-05-05', '2023-05-09', '720.00', 3, 4, 0, 1, 2, NULL),
(3, 3, 2, 7, 5, 1, '2023-04-02', '2023-06-15', '2023-05-05 10:36:00', '2023-05-06', '2023-05-08', '420.00', 1, 2, 20, 1, 2, 'Proszę o podwójne łóżko'),
(4, 4, 9, 16, 3, 5, '2023-04-03', '2023-07-01', '2023-05-05 08:17:00', '2023-05-03', '2023-05-05', '360.00', 1, 2, 0, 1, 2, NULL),
(5, 5, 11, 20, 19, 4, '2023-03-31', '2023-08-01', '2023-08-09 07:00:00', '2023-05-04', '2023-05-08', '1400.00', 2, 4, 0, 1, 2, NULL),
(6, 6, 1, 11, 20, 2, '2023-04-04', '2023-09-01', '2023-08-09 11:00:00', '2023-05-06', '2023-05-07', '350.00', 3, 1, 0, 1, 2, NULL),
(7, 7, 12, 22, 2, 7, '2023-04-02', '2023-10-01', '2023-08-09 08:00:00', '2023-05-07', '2023-05-09', '260.00', 5, 2, 20, 1, 2, NULL),
(8, 8, 6, 8, 18, 1, '2023-04-01', '2023-11-01', '2023-08-09 10:00:00', '2023-05-08', '2023-05-10', '400.00', 2, 2, 0, 2, 1, NULL),
(9, 9, 15, 25, 17, 3, '2023-03-29', '2023-12-01', '2023-08-09 12:00:00', '2023-05-10', '2023-05-12', '400.00', 1, 2, 0, 2, 2, NULL),
(10, 10, 4, 19, 16, 2, '2023-04-03', '2024-01-01', '2023-08-09 06:00:00', '2023-05-13', '2023-05-16', '560.00', 1, 3, 20, 2, 2, NULL),
(11, 11, 8, 10, 15, 5, '2023-04-01', '2024-02-01', '2023-08-09 11:00:00', '2023-05-17', '2023-05-20', '540.00', 2, 3, 0, 2, 2, 'Brak uwag'),
(12, 12, 13, 23, 14, 7, '2023-04-02', '2024-03-01', '2023-08-09 09:00:00', '2023-05-18', '2023-05-22', '480.00', 3, 4, 0, 1, 2, NULL),
(13, 13, 10, 15, 13, 6, '2023-04-03', '2024-04-01', '2023-08-09 18:00:00', '2023-08-10', '2023-08-12', '240.00', 2, 2, 0, 3, 1, NULL),
(14, 14, 7, 5, 12, 4, '2023-04-02', '2024-05-01', '2023-08-09 13:00:00', '2023-06-28', '2023-07-02', '6020.00', 3, 4, 20, 1, 2, NULL),
(15, 15, 3, 13, 11, 1, '2023-04-01', '2024-06-01', '2023-08-09 16:00:00', '2023-07-01', '2023-07-04', '4500.00', 4, 3, 0, 1, 1, 'Proszę o śniadanie o ósmej rano'),
(16, 16, 9, 17, 10, 2, '2023-03-29', '2024-07-01', '2023-08-09 12:00:00', '2023-07-03', '2023-07-06', '750.00', 5, 3, 0, 1, 2, NULL),
(17, 17, 11, 21, 1, 6, '2023-04-04', '2024-08-01', '2023-08-09 10:00:00', '2023-07-05', '2023-07-08', '360.00', 5, 3, 0, 1, 1, NULL),
(18, 18, 2, 9, 2, 3, '2023-04-02', '2024-09-01', '2023-08-09 15:00:00', '2023-07-07', '2023-07-10', '380.00', 4, 3, 20, 1, 2, NULL),
(19, 1, 3, 10, 3, 4, '2023-07-01', '2023-08-01', '2023-08-09 13:00:00', '2023-07-09', '2023-07-12', '540.00', 3, 3, 0, 2, 1, NULL),
(20, 2, 8, 21, 5, 5, '2023-07-01', '2023-08-02', '2023-08-09 11:00:00', '2023-07-11', '2023-07-14', '600.00', 2, 3, 0, 1, 2, NULL),
(21, 3, 11, 16, 6, 7, '2023-07-02', '2023-08-10', '2023-08-09 07:00:00', '2023-07-13', '2023-07-16', '620.00', 1, 3, 20, 2, 2, NULL),
(22, 4, 2, 4, 4, 1, '2023-07-02', '2023-08-05', '2023-08-09 15:00:00', '2023-08-20', '2023-08-21', '180.00', 2, 1, 0, 1, 2, NULL),
(23, 5, 12, 22, 7, 6, '2023-07-03', '2023-08-01', '2023-08-09 13:00:00', '2023-08-25', '2023-08-27', '700.00', 3, 2, 0, 2, 2, NULL),
(24, 1, 10, 5, 8, 2, '2023-07-03', '2023-08-02', '2023-08-09 11:00:00', '2023-08-15', '2023-08-20', '1750.00', 4, 5, 0, 1, 2, NULL),
(25, 6, 7, 13, 9, 3, '2023-05-02', '2023-05-02', '2023-08-09 14:00:00', '2023-05-02', '2023-06-11', '2500.00', 4, 10, 0, 3, 2, 'Zmiana planów'),
(26, 7, 14, 26, 2, 1, '2023-07-04', '2023-08-07', '2023-08-09 11:00:00', '2023-06-09', '2023-06-12', '360.00', 2, 3, 0, 1, 2, NULL),
(27, 8, 1, 8, 9, 4, '2023-07-05', '2023-08-04', '2023-08-09 14:00:00', '2023-06-11', '2023-06-14', '750.00', 2, 3, 0, 2, 2, 'Brak uwag'),
(28, 9, 15, 6, 16, 2, '2023-07-05', '2023-08-06', '2023-08-09 10:00:00', '2023-06-12', '2023-06-15', '540.00', 1, 3, 0, 1, 1, NULL),
(29, 10, 9, 18, 18, 3, '2023-07-06', '2023-08-07', '2023-08-09 12:00:00', '2023-06-14', '2023-06-17', '600.00', 2, 3, 0, 1, 2, NULL),
(30, 11, 3, 24, 24, 6, '2023-07-06', '2023-08-10', '2023-08-09 07:00:00', '2023-06-16', '2023-06-19', '380.00', 2, 3, 20, 2, 2, NULL),
(31, 12, 8, 17, 35, 5, '2023-07-07', '2023-08-03', '2023-08-09 10:00:00', '2023-06-18', '2023-06-21', '600.00', 2, 3, 0, 1, 1, NULL),
(32, 13, 11, 15, 3, 7, '2023-07-07', '2023-08-05', '2023-08-09 09:00:00', '2023-06-19', '2023-06-22', '540.00', 1, 3, 0, 1, 2, NULL),
(33, 14, 2, 2, 8, 1, '2023-07-08', '2023-08-06', '2023-08-09 08:00:00', '2023-06-21', '2023-06-24', '1050.00', 2, 3, 0, 1, 1, NULL),
(34, 15, 12, 9, 5, 4, '2023-07-08', '2023-08-05', '2023-08-09 13:00:00', '2023-06-23', '2023-06-26', '600.00', 2, 3, 0, 1, 2, NULL),
(35, 16, 10, 14, 10, 3, '2023-07-09', '2023-08-08', '2023-08-09 11:00:00', '2023-06-25', '2023-06-28', '770.00', 1, 3, 20, 1, 1, NULL),
(36, 17, 7, 20, 2, 2, '2023-07-09', '2023-08-04', '2023-08-09 10:00:00', '2023-06-26', '2023-06-29', '360.00', 2, 3, 0, 1, 2, 'Brak uwag'),
(37, 18, 14, 19, 1, 1, '2023-07-10', '2023-08-06', '2023-08-09 10:00:00', '2023-08-12', '2023-08-13', '120.00', 1, 1, 0, 1, 1, NULL),
(38, 10, 3, 4, 2, 6, '2023-04-23', '2023-04-23', '2023-05-05 12:20:00', '2023-06-01', '2023-06-04', '380.00', 1, 3, 20, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `rezerwacje_w_ciagu_miesiaca`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `rezerwacje_w_ciagu_miesiaca` (
`Miesiąc` varchar(11)
,`Liczba rezerwacji` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `rezerwacje_z_ostatnich_siedmiu_dni`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `rezerwacje_z_ostatnich_siedmiu_dni` (
`ID_Rezerwacji` int(11)
,`ID_Goscia` int(11)
,`ID_Uslugi` int(11)
,`ID_Personel` int(11)
,`ID_Pokoju` int(11)
,`ID_Zaplaty` int(11)
,`Data_Wplaty` date
,`Data_Rezerwacji` date
,`Data_Konca_Rezerwacji` datetime
,`Data_Zameldowania` date
,`Data_Wymeldowania` date
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowisko`
--

CREATE TABLE `stanowisko` (
  `ID_Stanowiska` int(11) NOT NULL COMMENT 'Klucz główny, Numer Stanowiska danego pracownika hotelu, nie można go zmieniać.',
  `Nazwa_Stanowiska` varchar(30) NOT NULL COMMENT 'Nazwa Stanowiska danego pracownika hotelu.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `stanowisko`
--

INSERT INTO `stanowisko` (`ID_Stanowiska`, `Nazwa_Stanowiska`) VALUES
(1, 'Recepcjonista'),
(2, 'Kucharz'),
(3, 'Kelner'),
(4, 'Sprzątacz'),
(5, 'Hotelarz'),
(6, 'Administrator'),
(7, 'Administrator baz danych'),
(8, 'Menadżer'),
(9, 'Portier'),
(10, 'Manager'),
(11, 'Barman'),
(12, 'Pokojówka'),
(13, 'Kelnerka'),
(14, 'Ochroniarz'),
(15, 'Kieronik służby pięter'),
(16, 'Księgowy'),
(17, 'Menedżer'),
(18, 'Kierownik Recepcji'),
(19, 'Dyrektor'),
(20, 'Konserwator'),
(21, 'Konserwator techniczny');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `status_danego_pokoju`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `status_danego_pokoju` (
`Numer_Pokoju` int(200)
,`Status` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_pokoju`
--

CREATE TABLE `status_pokoju` (
  `Status_Pokoju` int(11) NOT NULL COMMENT 'Klucz główny, identyfikator statusu pokoju.',
  `Nazwa_Statusu` varchar(30) DEFAULT NULL COMMENT 'Nazwa statusu pokoju w hotelu.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `status_pokoju`
--

INSERT INTO `status_pokoju` (`Status_Pokoju`, `Nazwa_Statusu`) VALUES
(4, 'zajęty'),
(3, 'wolny'),
(1, 'inny'),
(2, 'w trakcie renowacji')
;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_rezerwacji`
--

CREATE TABLE `status_rezerwacji` (
  `ID_Status_Rezerwacji` int(11) NOT NULL COMMENT 'Status danej rezerwacji',
  `Status_Rezerwacji` varchar(40) NOT NULL COMMENT 'Nazwa statusu danej rezerwacji.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `status_rezerwacji`
--

INSERT INTO `status_rezerwacji` (`ID_Status_Rezerwacji`, `Status_Rezerwacji`) VALUES
(3, 'Potwierdzona'),
(2, 'Oczekująca'),
(1, 'Anulowana')
;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_pokoju`
--

CREATE TABLE `typ_pokoju` (
  `ID_Typu_Pokoju` int(11) NOT NULL COMMENT 'Identyfikator danego typu pokoju.',
  `Nazwa_Typu` varchar(50) NOT NULL COMMENT 'Nazwa danego typu pokoju w hotelu.',
  `Cena` decimal(7,2) NOT NULL COMMENT 'Cena za jedną dobę w hotelu.',
  `Opis` text DEFAULT NULL COMMENT 'Opis danego pokoju'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `typ_pokoju`
--

INSERT INTO `typ_pokoju` (`ID_Typu_Pokoju`, `Nazwa_Typu`, `Cena`, `Opis`) VALUES
(1, 'Pokój jednoosobowy', '120.00', 'Pokój z jednym łóżkiem dla jednej osoby.'),
(2, 'Pokój dwuosobowy', '180.00', 'Pokój z jednym łóżkiem dla dwóch osób.'),
(3, 'Pokój dwuosobowy twin', '200.00', 'Pokój z dwoma oddzielnymi łóżkami dla dwóch osób.'),
(4, 'Apartament', '350.00', 'Elegancki apartament z oddzielną sypialnią i salonem.'),
(5, 'Studio', '250.00', 'Przestronne studio z aneksem kuchennym.'),
(6, 'Pokój premium', '1500.00', 'Wyjątkowy pokój z widokiem na panoramę Warszawy, jacuzzi oraz luksusowym wyposażeniem.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_rezerwacji`
--

CREATE TABLE `typ_rezerwacji` (
  `ID_Typ_Rezerwacji` int(11) NOT NULL COMMENT 'Idetyfikator typu danej rezerwacji, klucz główny, ale posłuży do tabeli rezerwacje, jako klucz obcy.',
  `Typ_Rezerwacji` varchar(40) NOT NULL COMMENT 'Nazwa typu rezerwacji, która gość zarezerwował.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `typ_rezerwacji`
--

INSERT INTO `typ_rezerwacji` (`ID_Typ_Rezerwacji`, `Typ_Rezerwacji`) VALUES
(3, 'Standard'),
(2, 'Ekskluzywna'),
(1, 'Ekonomiczna')
;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uslugi`
--

CREATE TABLE `uslugi` (
  `ID_Uslugi` int(11) NOT NULL COMMENT 'Klucz główny, identyfikator usług w hotelu.',
  `Nazwa_Uslugi` varchar(40) NOT NULL COMMENT 'Nazwa danej usługi w hotelu.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uslugi`
--

INSERT INTO `uslugi` (`ID_Uslugi`, `Nazwa_Uslugi`) VALUES


(4, 'Dostęp do Wi-Fi'),
(7, 'Parking'),
(6, 'Obsługa pokoju'),
(3, 'Basen'),
(10, 'Sauna'),
(11, 'Siłownia'),
(12, 'SPA'),
(9, 'Restauracja'),
(2, 'Bar'),
(5, 'Konferencje'),
(14, 'Wypożyczalnia rowerów'),
(15, 'Wypożyczalnia sprzętu sportowego'),
(1, 'Animacje dla dzieci'),
(8, 'Programy rekreacyjne'),
(13, 'Transport z lotniska');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wolne_pokoje`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wolne_pokoje` (
`Numer_Pokoju` int(200)
,`Status` varchar(30)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wybor_goscia`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wybor_goscia` (
`Imie` varchar(30)
,`Nazwisko` varchar(50)
,`Nazwa_Typu` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zajete_pokoje`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zajete_pokoje` (
`Numer_Pokoju` int(200)
,`Status` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zaplata`
--

CREATE TABLE `zaplata` (
  `ID_Zaplaty` int(11) NOT NULL COMMENT 'Klucz główny, identyfikator zapłaty.',
  `Sposob_Zaplaty` varchar(30) NOT NULL COMMENT 'Nazwa sposobu zapłaty przez danego gościa.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zaplata`
--

INSERT INTO `zaplata` (`ID_Zaplaty`, `Sposob_Zaplaty`) VALUES
(3, 'Gotówka'),
(4, 'Karta kredytowa'),
(7, 'Przelew bankowy'),
(5, 'Płatność online'),
(2, 'Bon turystyczny'),
(6, 'Przelew'),
(1, 'BLIK')
;

-- --------------------------------------------------------

--
-- Struktura widoku `dzisiejsze_rezerwacje`
--
DROP TABLE IF EXISTS `dzisiejsze_rezerwacje`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dzisiejsze_rezerwacje`  AS SELECT `rezerwacje`.`ID_Rezerwacji` AS `ID_Rezerwacji`, `rezerwacje`.`ID_Goscia` AS `ID_Goscia`, `rezerwacje`.`ID_Uslugi` AS `ID_Uslugi`, `rezerwacje`.`ID_Personel` AS `ID_Personel`, `rezerwacje`.`ID_Pokoju` AS `ID_Pokoju`, `rezerwacje`.`ID_Zaplaty` AS `ID_Zaplaty`, `rezerwacje`.`Data_Wplaty` AS `Data_Wplaty`, `rezerwacje`.`Data_Rezerwacji` AS `Data_Rezerwacji`, `rezerwacje`.`Data_Konca_Rezerwacji` AS `Data_Konca_Rezerwacji`, `rezerwacje`.`Data_Zameldowania` AS `Data_Zameldowania`, `rezerwacje`.`Data_Wymeldowania` AS `Data_Wymeldowania` FROM `rezerwacje` WHERE `rezerwacje`.`Data_Rezerwacji` = curdate()  ;

-- --------------------------------------------------------

--
-- Struktura widoku `goscie_z_danego_miasta`
--
DROP TABLE IF EXISTS `goscie_z_danego_miasta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `goscie_z_danego_miasta`  AS SELECT `miasto`.`Nazwa_Miasta` AS `Nazwa_Miasta`, count(`goscie`.`ID_Goscia`) AS `Liczba gości` FROM (`goscie` join `miasto` on(`miasto`.`ID_Miasta` = `goscie`.`ID_Miasta`)) GROUP BY `miasto`.`Nazwa_Miasta`;

-- --------------------------------------------------------

--
-- Struktura widoku `koszta_goscia`
--
DROP TABLE IF EXISTS `koszta_goscia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `koszta_goscia`  AS SELECT `goscie`.`Imie` AS `Imie`, `goscie`.`Nazwisko` AS `Nazwisko`, sum(`typ_pokoju`.`Cena`) AS `Suma kosztów rezerwacji` FROM (((`rezerwacje` join `goscie` on(`rezerwacje`.`ID_Goscia` = `goscie`.`ID_Goscia`)) join `pokoje` on(`rezerwacje`.`ID_Pokoju` = `pokoje`.`ID_Pokoju`)) join `typ_pokoju` on(`pokoje`.`ID_Typ_Pokoju` = `typ_pokoju`.`ID_Typu_Pokoju`)) GROUP BY `goscie`.`ID_Goscia` ORDER BY sum(`typ_pokoju`.`Cena`) ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `liczba_gosci_sposob_zaplaty`
--
DROP TABLE IF EXISTS `liczba_gosci_sposob_zaplaty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liczba_gosci_sposob_zaplaty`  AS SELECT count(`rezerwacje`.`ID_Goscia`) AS `Liczba gości`, `zaplata`.`Sposob_Zaplaty` AS `Sposob_Zaplaty` FROM (`rezerwacje` join `zaplata` on(`zaplata`.`ID_Zaplaty` = `rezerwacje`.`ID_Zaplaty`)) GROUP BY `zaplata`.`Sposob_Zaplaty` ORDER BY count(`rezerwacje`.`ID_Goscia`) ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `liczba_pokoji_w_hotelu`
--
DROP TABLE IF EXISTS `liczba_pokoji_w_hotelu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liczba_pokoji_w_hotelu`  AS SELECT count(`pokoje`.`ID_Pokoju`) AS `Liczba pokoji w hotelu` FROM `pokoje`;

-- --------------------------------------------------------

--
-- Struktura widoku `liczba_pracownikow_z_malejaca_pensja`
--
DROP TABLE IF EXISTS `liczba_pracownikow_z_malejaca_pensja`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liczba_pracownikow_z_malejaca_pensja`  AS SELECT `personel`.`Imie` AS `Imie`, `personel`.`Nazwisko` AS `Nazwisko`, `personel`.`Pensja` AS `Pensja` FROM `personel` ORDER BY `personel`.`Pensja` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `liczba_rezerwacji_w_danym_dniu`
--
DROP TABLE IF EXISTS `liczba_rezerwacji_w_danym_dniu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liczba_rezerwacji_w_danym_dniu`  AS SELECT count(`rezerwacje`.`ID_Rezerwacji`) AS `Liczba rezerwacji w danym dniu`, `rezerwacje`.`Data_Rezerwacji` AS `Data_Rezerwacji` FROM `rezerwacje` GROUP BY `rezerwacje`.`Data_Rezerwacji`;

-- --------------------------------------------------------

--
-- Struktura widoku `lista_pracownikow`
--
DROP TABLE IF EXISTS `lista_pracownikow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lista_pracownikow`  AS SELECT `personel`.`ID_Personel` AS `ID_Personel`, `personel`.`Imie` AS `Imie`, `personel`.`Nazwisko` AS `Nazwisko` FROM `personel`;

-- --------------------------------------------------------

--
-- Struktura widoku `lista_pracownikow_alfabetycznie`
--
DROP TABLE IF EXISTS `lista_pracownikow_alfabetycznie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lista_pracownikow_alfabetycznie`  AS SELECT `personel`.`Imie` AS `Imie`, `personel`.`Nazwisko` AS `Nazwisko` FROM `personel` ORDER BY `personel`.`Nazwisko` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `lista_typow_pokoji`
--
DROP TABLE IF EXISTS `lista_typow_pokoji`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lista_typow_pokoji`  AS SELECT `typ_pokoju`.`Nazwa_Typu` AS `Nazwa_Typu` FROM `typ_pokoju`;

-- --------------------------------------------------------

--
-- Struktura widoku `maksymalna_cena_za_pokoj`
--
DROP TABLE IF EXISTS `maksymalna_cena_za_pokoj`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maksymalna_cena_za_pokoj`  AS SELECT max(`typ_pokoju`.`Cena`) AS `Maksymalna cena za pokój` FROM `typ_pokoju`;

-- --------------------------------------------------------

--
-- Struktura widoku `personel_ubezpieczenie`
--
DROP TABLE IF EXISTS `personel_ubezpieczenie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `personel_ubezpieczenie`  AS SELECT count(`personel`.`ID_Personel`) AS `Liczba pracowników`, if(`personel`.`Ubezpieczenie` = 0,'Tak','Nie') AS `Ubezpieczenie` FROM `personel` GROUP BY `personel`.`Ubezpieczenie` ORDER BY if(`personel`.`Ubezpieczenie` = 0,'Tak','Nie') ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `pokoje_ceny`
--
DROP TABLE IF EXISTS `pokoje_ceny`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pokoje_ceny`  AS SELECT `pokoje`.`Numer_Pokoju` AS `Numer_Pokoju`, `typ_pokoju`.`Nazwa_Typu` AS `Nazwa_Typu`, `typ_pokoju`.`Cena` AS `Cena` FROM (`pokoje` join `typ_pokoju`)  ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownik_z_danego_stanowiska`
--
DROP TABLE IF EXISTS `pracownik_z_danego_stanowiska`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownik_z_danego_stanowiska`  AS SELECT `personel`.`Imie` AS `imie`, `personel`.`Nazwisko` AS `nazwisko`, `stanowisko`.`Nazwa_Stanowiska` AS `Stanowisko` FROM (`personel` join `stanowisko` on(`stanowisko`.`ID_Stanowiska` = `personel`.`ID_Stanowiska`))  ;

-- --------------------------------------------------------

--
-- Struktura widoku `rezerwacje_w_ciagu_miesiaca`
--
DROP TABLE IF EXISTS `rezerwacje_w_ciagu_miesiaca`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rezerwacje_w_ciagu_miesiaca`  AS SELECT if(month(`rezerwacje`.`Data_Rezerwacji`) = 1,'Styczeń',if(month(`rezerwacje`.`Data_Rezerwacji`) = 2,'Luty',if(month(`rezerwacje`.`Data_Rezerwacji`) = 3,'Marzec',if(month(`rezerwacje`.`Data_Rezerwacji`) = 4,'Kwiecień',if(month(`rezerwacje`.`Data_Rezerwacji`) = 5,'Maj',if(month(`rezerwacje`.`Data_Rezerwacji`) = 6,'Czerwiec',if(month(`rezerwacje`.`Data_Rezerwacji`) = 7,'Lipiec',if(month(`rezerwacje`.`Data_Rezerwacji`) = 8,'Sierpień',if(month(`rezerwacje`.`Data_Rezerwacji`) = 9,'Wrzesień',if(month(`rezerwacje`.`Data_Rezerwacji`) = 10,'Październik',if(month(`rezerwacje`.`Data_Rezerwacji`) = 11,'Listopad',if(month(`rezerwacje`.`Data_Rezerwacji`) = 12,'Grudzień',NULL)))))))))))) AS `Miesiąc`, count(0) AS `Liczba rezerwacji` FROM `rezerwacje` GROUP BY month(`rezerwacje`.`Data_Rezerwacji`)  ;

-- --------------------------------------------------------

--
-- Struktura widoku `rezerwacje_z_ostatnich_siedmiu_dni`
--
DROP TABLE IF EXISTS `rezerwacje_z_ostatnich_siedmiu_dni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rezerwacje_z_ostatnich_siedmiu_dni`  AS SELECT `rezerwacje`.`ID_Rezerwacji` AS `ID_Rezerwacji`, `rezerwacje`.`ID_Goscia` AS `ID_Goscia`, `rezerwacje`.`ID_Uslugi` AS `ID_Uslugi`, `rezerwacje`.`ID_Personel` AS `ID_Personel`, `rezerwacje`.`ID_Pokoju` AS `ID_Pokoju`, `rezerwacje`.`ID_Zaplaty` AS `ID_Zaplaty`, `rezerwacje`.`Data_Wplaty` AS `Data_Wplaty`, `rezerwacje`.`Data_Rezerwacji` AS `Data_Rezerwacji`, `rezerwacje`.`Data_Konca_Rezerwacji` AS `Data_Konca_Rezerwacji`, `rezerwacje`.`Data_Zameldowania` AS `Data_Zameldowania`, `rezerwacje`.`Data_Wymeldowania` AS `Data_Wymeldowania` FROM `rezerwacje` WHERE `rezerwacje`.`Data_Rezerwacji` >= curdate() - interval 7 day  ;

-- --------------------------------------------------------

--
-- Struktura widoku `status_danego_pokoju`
--
DROP TABLE IF EXISTS `status_danego_pokoju`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `status_danego_pokoju`  AS SELECT `pokoje`.`Numer_Pokoju` AS `Numer_Pokoju`, `status_pokoju`.`Nazwa_Statusu` AS `Status` FROM (`pokoje` join `status_pokoju` on(`status_pokoju`.`Status_Pokoju` = `pokoje`.`Status_Pokoju`))  ;

-- --------------------------------------------------------

--
-- Struktura widoku `wolne_pokoje`
--
DROP TABLE IF EXISTS `wolne_pokoje`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wolne_pokoje`  AS SELECT `pokoje`.`Numer_Pokoju` AS `Numer_Pokoju`, `status_pokoju`.`Nazwa_Statusu` AS `Status` FROM (`pokoje` join `status_pokoju` on(`pokoje`.`Status_Pokoju` = `status_pokoju`.`Status_Pokoju`)) WHERE `status_pokoju`.`Nazwa_Statusu` = 'wolny';

-- --------------------------------------------------------

--
-- Struktura widoku `wybor_goscia`
--
DROP TABLE IF EXISTS `wybor_goscia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wybor_goscia`  AS SELECT `goscie`.`Imie` AS `Imie`, `goscie`.`Nazwisko` AS `Nazwisko`, `typ_pokoju`.`Nazwa_Typu` AS `Nazwa_Typu` FROM (((`rezerwacje` join `goscie` on(`rezerwacje`.`ID_Goscia` = `goscie`.`ID_Goscia`)) join `pokoje` on(`rezerwacje`.`ID_Pokoju` = `pokoje`.`ID_Pokoju`)) join `typ_pokoju` on(`pokoje`.`ID_Typ_Pokoju` = `typ_pokoju`.`ID_Typu_Pokoju`))  ;

-- --------------------------------------------------------

--
-- Struktura widoku `zajete_pokoje`
--
DROP TABLE IF EXISTS `zajete_pokoje`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zajete_pokoje`  AS SELECT `pokoje`.`Numer_Pokoju` AS `Numer_Pokoju`, `status_pokoju`.`Nazwa_Statusu` AS `Status` FROM (`pokoje` join `status_pokoju` on(`pokoje`.`Status_Pokoju` = `status_pokoju`.`Status_Pokoju`)) WHERE `status_pokoju`.`Nazwa_Statusu` = 'zajęty';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `goscie`
--
ALTER TABLE `goscie`
  ADD PRIMARY KEY (`ID_Goscia`),
  ADD UNIQUE KEY `unique_pesel` (`Pesel`),
  ADD UNIQUE KEY `unique_telefon` (`Telefon`),
  ADD UNIQUE KEY `unique_email` (`Email`),
  ADD UNIQUE KEY `unique_email1` (`Email`),
  ADD UNIQUE KEY `unique_email0` (`Email`),
  ADD UNIQUE KEY `unique_email00` (`Email`),
  ADD UNIQUE KEY `unique_numerpaszportu` (`Numer_Paszportu`),
  ADD UNIQUE KEY `unique_numerdowodu` (`Numer_Dowodu`),
  ADD KEY `FK_Goscie_Miasto` (`ID_Miasta`);

--
-- Indeksy dla tabeli `miasto`
--
ALTER TABLE `miasto`
  ADD PRIMARY KEY (`ID_Miasta`);

--
-- Indeksy dla tabeli `oceny_gosci`
--
ALTER TABLE `oceny_gosci`
  ADD PRIMARY KEY (`ID_Oceny`),
  ADD KEY `FK_oceny_gosci_goscie` (`ID_Goscia`);

--
-- Indeksy dla tabeli `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`ID_Personel`),
  ADD UNIQUE KEY `unique_telefonper` (`Telefon`),
  ADD UNIQUE KEY `unique_peselper` (`Pesel`),
  ADD UNIQUE KEY `unique_numerdowoduper` (`Numer_Dowodu`),
  ADD KEY `FK_Personel_Stanowisko` (`ID_Stanowiska`);

--
-- Indeksy dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD PRIMARY KEY (`ID_Pokoju`),
  ADD UNIQUE KEY `unique_numerpokoju` (`Numer_Pokoju`),
  ADD KEY `FK_Pokoje_Status_Pokoju` (`Status_Pokoju`),
  ADD KEY `FK_pokoje_typ_pokoju` (`ID_Typ_Pokoju`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`ID_Rezerwacji`),
  ADD KEY `FK_rezerwacje_Goscie` (`ID_Goscia`),
  ADD KEY `FK_rezerwacje_Uslugi` (`ID_Uslugi`),
  ADD KEY `FK_rezerwacje_personel` (`ID_Personel`),
  ADD KEY `FK_rezerwacje_zaplata` (`ID_Zaplaty`),
  ADD KEY `FK_rezerwacje_pokoje` (`ID_Pokoju`),
  ADD KEY `fk_rezerwacje_typ_rezerwacji` (`ID_Typ_Rezerwacji`),
  ADD KEY `FK_Status_Rezerwacji` (`ID_Status_Rezerwacji`);

--
-- Indeksy dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  ADD PRIMARY KEY (`ID_Stanowiska`);
--
-- Indeksy dla tabeli `status_pokoju`
--
ALTER TABLE `status_pokoju`
  ADD PRIMARY KEY (`Status_Pokoju`),
  ADD UNIQUE KEY `unique_nazwastatusu` (`Nazwa_Statusu`);

--
-- Indeksy dla tabeli `status_rezerwacji`
--
ALTER TABLE `status_rezerwacji`
  ADD PRIMARY KEY (`ID_Status_Rezerwacji`),
  ADD UNIQUE KEY `unique_rezerwacjistatus` (`Status_Rezerwacji`);

--
-- Indeksy dla tabeli `typ_pokoju`
--
ALTER TABLE `typ_pokoju`
  ADD PRIMARY KEY (`ID_Typu_Pokoju`),
  ADD UNIQUE KEY `unique_nazwatypu` (`Nazwa_Typu`);

--
-- Indeksy dla tabeli `typ_rezerwacji`
--
ALTER TABLE `typ_rezerwacji`
  ADD PRIMARY KEY (`ID_Typ_Rezerwacji`),
  ADD UNIQUE KEY `unique_nazwarezerwacji` (`Typ_Rezerwacji`);

--
-- Indeksy dla tabeli `uslugi`
--
ALTER TABLE `uslugi`
  ADD PRIMARY KEY (`ID_Uslugi`),
  ADD UNIQUE KEY `unique_nazwauslugi` (`Nazwa_Uslugi`);

--
-- Indeksy dla tabeli `zaplata`
--
ALTER TABLE `zaplata`
  ADD PRIMARY KEY (`ID_Zaplaty`),
  ADD UNIQUE KEY `unique_zaplaty` (`Sposob_Zaplaty`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `goscie`
--
ALTER TABLE `goscie`
  MODIFY `ID_Goscia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identyfikator gościa, numer przepisywany gościowi automatycznie', AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT dla tabeli `miasto`
--
ALTER TABLE `miasto`
  MODIFY `ID_Miasta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identyfikator odnoszący się do miasta.', AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT dla tabeli `oceny_gosci`
--
ALTER TABLE `oceny_gosci`
  MODIFY `ID_Oceny` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identyfikator oceny gościa z hotelu. Gość może dwa razy wyrazić swoją opinię, jeśli dokonał rezerwacji więcej niż raz.', AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT dla tabeli `personel`
--
ALTER TABLE `personel`
  MODIFY `ID_Personel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny-identyfikator pracownika hotelu, jest on ustawiany automatycznie.', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  MODIFY `ID_Pokoju` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny- identyfikator danego pokoju, wpisuje się on automatycznie, nie należy go zmieniać.', AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `ID_Rezerwacji` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny - identyfikator do rezerwacji, jest on uzupełniany automatycznie i nie należy go zmieniać ani modyfikować.', AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  MODIFY `ID_Stanowiska` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny, Numer Stanowiska danego pracownika hotelu, nie można go zmieniać.', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `status_pokoju`
--
ALTER TABLE `status_pokoju`
  MODIFY `Status_Pokoju` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny, identyfikator statusu pokoju.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `status_rezerwacji`
--
ALTER TABLE `status_rezerwacji`
  MODIFY `ID_Status_Rezerwacji` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Status danej rezerwacji', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `typ_pokoju`
--
ALTER TABLE `typ_pokoju`
  MODIFY `ID_Typu_Pokoju` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identyfikator danego typu pokoju.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `typ_rezerwacji`
--
ALTER TABLE `typ_rezerwacji`
  MODIFY `ID_Typ_Rezerwacji` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Idetyfikator typu danej rezerwacji, klucz główny, ale posłuży do tabeli rezerwacje, jako klucz obcy.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `uslugi`
--
ALTER TABLE `uslugi`
  MODIFY `ID_Uslugi` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny, identyfikator usług w hotelu.', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `zaplata`
--
ALTER TABLE `zaplata`
  MODIFY `ID_Zaplaty` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny, identyfikator zapłaty.', AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `goscie`
--
ALTER TABLE `goscie`
  ADD CONSTRAINT `FK_Goscie_Miasto` FOREIGN KEY (`ID_Miasta`) REFERENCES `miasto` (`ID_Miasta`);

--
-- Ograniczenia dla tabeli `oceny_gosci`
--
ALTER TABLE `oceny_gosci`
  ADD CONSTRAINT `FK_oceny_gosci_goscie` FOREIGN KEY (`ID_Goscia`) REFERENCES `goscie` (`ID_Goscia`);

--
-- Ograniczenia dla tabeli `personel`
--
ALTER TABLE `personel`
  ADD CONSTRAINT `FK_Personel_Stanowisko` FOREIGN KEY (`ID_Stanowiska`) REFERENCES `stanowisko` (`ID_Stanowiska`);

--
-- Ograniczenia dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD CONSTRAINT `FK_Pokoje_Status_Pokoju` FOREIGN KEY (`Status_Pokoju`) REFERENCES `status_pokoju` (`Status_Pokoju`),
  ADD CONSTRAINT `FK_pokoje_typ_pokoju` FOREIGN KEY (`ID_Typ_Pokoju`) REFERENCES `typ_pokoju` (`ID_Typu_Pokoju`);

--
-- Ograniczenia dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `FK_Status_Rezerwacji` FOREIGN KEY (`ID_Status_Rezerwacji`) REFERENCES `status_rezerwacji` (`ID_Status_Rezerwacji`),
  ADD CONSTRAINT `FK_rezerwacje_Goscie` FOREIGN KEY (`ID_Goscia`) REFERENCES `goscie` (`ID_Goscia`),
  ADD CONSTRAINT `FK_rezerwacje_Uslugi` FOREIGN KEY (`ID_Uslugi`) REFERENCES `uslugi` (`ID_Uslugi`),
  ADD CONSTRAINT `FK_rezerwacje_personel` FOREIGN KEY (`ID_Personel`) REFERENCES `personel` (`ID_Personel`),
  ADD CONSTRAINT `FK_rezerwacje_pokoje` FOREIGN KEY (`ID_Pokoju`) REFERENCES `pokoje` (`ID_Pokoju`),
  ADD CONSTRAINT `FK_rezerwacje_zaplata` FOREIGN KEY (`ID_Zaplaty`) REFERENCES `zaplata` (`ID_Zaplaty`),
  ADD CONSTRAINT `fk_rezerwacje_typ_rezerwacji` FOREIGN KEY (`ID_Typ_Rezerwacji`) REFERENCES `typ_rezerwacji` (`ID_Typ_Rezerwacji`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
