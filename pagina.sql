-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-06-2021 a las 22:35:41
-- Versión del servidor: 8.0.23
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pagina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` bigint NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `estadoid` int NOT NULL,
  `ordenvisual` int NOT NULL,
  `numerofotos` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `categoria`, `estadoid`, `ordenvisual`, `numerofotos`) VALUES
(0, '', 1, 0, 0),
(1, 'Vehículos', 1, 1, 12),
(2, 'Salud', 1, 3, 7),
(3, 'Maquinaria', 1, 2, 7),
(4, 'Eventos', 1, 6, 7),
(5, 'Electrónicos', 1, 4, 7),
(6, 'Deportes', 1, 7, 7),
(7, 'Disfraces', 1, 12, 7),
(8, 'Libros', 1, 5, 7),
(9, 'Mobiliario', 1, 9, 7),
(10, 'Instrumentos Musicales', 1, 10, 7),
(11, 'Viajes', 1, 11, 7),
(12, 'Herramientas y Útiles', 1, 8, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `chatid` int NOT NULL,
  `envia_userid` int NOT NULL,
  `recibe_userid` int NOT NULL,
  `mensaje` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat`
--

INSERT INTO `chat` (`chatid`, `envia_userid`, `recibe_userid`, `mensaje`, `fecha`, `estado`) VALUES
(28, 2, 27, 'Ingresando', '17:20:9', 1),
(29, 27, 2, 'JHola que tal', '17:43:43', 1),
(30, 2, 1, 'Como estas', '17:43:58', 1),
(32, 2, 2, 'hola que tal', '14:41:35', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_login_details`
--

CREATE TABLE `chat_login_details` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_typing` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat_login_details`
--

INSERT INTO `chat_login_details` (`id`, `userid`, `last_activity`, `is_typing`) VALUES
(1, 1, '2021-05-24 18:59:11', 'no'),
(2, 2, '2021-05-24 19:01:07', 'yes'),
(3, 2, '2021-05-24 19:20:32', 'no'),
(4, 1, '2021-05-24 19:32:05', 'no'),
(5, 1, '2021-05-24 21:35:17', 'no'),
(6, 1, '2021-05-24 21:36:00', 'no'),
(7, 1, '2021-05-25 22:06:35', 'no'),
(8, 3, '2021-05-25 22:22:25', 'no'),
(9, 2, '2021-05-25 22:25:54', 'no'),
(10, 1, '2021-05-26 14:46:40', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_users`
--

CREATE TABLE `chat_users` (
  `userid` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `current_session` int NOT NULL,
  `online` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat_users`
--

INSERT INTO `chat_users` (`userid`, `username`, `password`, `avatar`, `current_session`, `online`) VALUES
(1, 'jorge', 'root', 'user1.jpg', 2, 1),
(2, 'maria', '12345', 'user2.jpg', 1, 1),
(3, 'Jose', '1234', 'user3.jpg', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `iddepartamento` int NOT NULL,
  `departamento` varchar(30) NOT NULL,
  `idpais` int NOT NULL,
  `latitud` float NOT NULL,
  `longitud` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`iddepartamento`, `departamento`, `idpais`, `latitud`, `longitud`) VALUES
(1, 'GUATEMALA', 1, 14.6099, -90.5252),
(2, 'SACATEPÉQUEZ', 1, 14.5567, -90.7337),
(3, 'CHIMALTENANGO', 1, 14.662, -90.82),
(4, 'EL PROGRESO', 1, 14.8539, -90.0686),
(5, 'ESCUINTLA', 1, 14.305, -90.785),
(6, 'SANTA ROSA', 1, 14.279, -90.298),
(7, 'SOLOLÁ', 1, 14.773, -91.183),
(8, 'TOTONICAPÁN', 1, 14.9108, -91.3604),
(9, 'QUETZALTENANGO', 1, 14.8333, -91.5167),
(10, 'SUCHITEPÉQUEZ', 1, 14.5304, -91.51),
(11, 'RETALHULEU', 1, 14.5333, -91.6833),
(12, 'SAN MARCOS', 1, 14.966, -91.8),
(13, 'HUEHUETENANGO', 1, 15.3147, -91.4761),
(14, 'QUICHÉ', 1, 15.05, -91.25),
(15, 'BAJA VERAPAZ', 1, 15.1052, -90.316),
(16, 'ALTA VERAPAZ', 1, 16.9337, -89.8833),
(17, 'PETEN', 1, 16.9337, -83.8833),
(18, 'IZABAL', 1, 15.73, -88.6),
(19, 'ZACAPA', 1, 14.972, -89.529),
(20, 'CHIQUIMULA', 1, 14.797, -89.544),
(21, 'JALAPA', 1, 14.6379, -89.9904),
(22, 'JUTIAPA', 1, 14.29, -89.9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idestado` int NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `descripcion`) VALUES
(0, 'Inactivo'),
(1, 'Activo'),
(2, 'Pendiente'),
(3, 'En Revisión'),
(4, 'Robado'),
(5, 'Suspendido'),
(6, 'Extraviado'),
(7, 'Rechazado'),
(10, 'Reserva pagada'),
(11, 'Reserva consumida'),
(12, 'Reserva cancelada por usuario'),
(13, 'Reserva cancelada por Xglova'),
(99, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariosdelivery`
--

CREATE TABLE `horariosdelivery` (
  `idrango` bigint NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `rango` varchar(30) NOT NULL,
  `estadoid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `horariosdelivery`
--

INSERT INTO `horariosdelivery` (`idrango`, `descripcion`, `rango`, `estadoid`) VALUES
(1, 'Matutino', '08:00 a 12:00 horas', 1),
(2, 'Vespertino', '12:00 a 17:00 horas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `idmunicipio` int NOT NULL,
  `municipio` varchar(30) NOT NULL,
  `iddepartamento` int NOT NULL,
  `latitud` float NOT NULL,
  `longitud` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`idmunicipio`, `municipio`, `iddepartamento`, `latitud`, `longitud`) VALUES
(1, 'GUATEMALA', 1, 14.6099, -90.5252),
(2, 'SANTA CATARINA PINULA', 1, 14.5705, -90.4993),
(3, 'SAN JOSÉ PINULA', 1, 14.546, -90.4129),
(4, 'SAN JOSÉ DEL GOLFO', 1, 14.7641, -90.3723),
(5, 'PALENCIA', 1, 14.6671, -90.3572),
(6, 'CHINAUTLA', 1, 14.7029, -90.4998),
(7, 'SAN PEDRO AYAMPUC', 1, 14.7794, -90.4532),
(8, 'MIXCO', 1, 14.6308, -90.6071),
(9, 'SAN PEDRO SACATEPÉQUEZ', 1, 14.6861, -90.6425),
(10, 'SAN JUAN SACATEPÉQUEZ', 1, 14.7189, -90.6442),
(11, 'SAN RAYMUNDO', 1, 14.7646, -90.5949),
(12, 'CHUARRANCHO', 1, 14.8179, -90.5157),
(13, 'FRAIJANES', 1, 14.4653, -90.4408),
(14, 'AMATITLÁN', 1, 14.4827, -90.6208),
(15, 'VILLA NUEVA', 1, 14.5251, -90.5854),
(16, 'VILLA CANALES', 1, 14.4828, -90.5343),
(17, 'SAN MIGUEL PETAPA', 1, 14.5019, -90.562),
(18, 'ALOTENANGO', 2, 14.4858, -90.8044),
(19, 'ANTIGUA GUATEMALA', 2, 14.5567, -90.7337),
(20, 'CIUDAD VIEJA', 2, 14.524, -90.7631),
(21, 'JOCOTENANGO', 2, 14.5781, -90.738),
(22, 'MAGDALENA MILPAS ALTAS', 2, 14.548, -90.6748),
(23, 'PASTORES', 2, 14.5943, -90.7547),
(24, 'SAN ANTONIO AGUAS CALIENTES', 2, 14.5468, -90.7805),
(25, 'SAN BARTOLOMÉ MILPAS ALTAS', 2, 14.6069, -90.6781),
(26, 'SAN LUCAS SACATEPÉQUEZ', 2, 14.6108, -90.6568),
(27, 'SAN MIGUEL DUEÑAS', 2, 14.5224, -90.7994),
(28, 'SANTA CATARINA BARAHONA', 2, 14.5513, -90.786),
(29, 'SANTA LUCÍA MILPAS ALTAS', 2, 14.5765, -90.6763),
(30, 'SANTA MARÍA DE JESÚS', 2, 14.4945, -90.7104),
(31, 'SANTIAGO SACATEPÉQUEZ', 2, 14.6351, -90.6765),
(32, 'SANTO DOMINGO XENACOJ', 2, 14.6806, -90.7001),
(33, 'SUMPANGO', 2, 14.6462, -90.7343),
(34, 'CHIMALTENANGO', 3, 14.662, -90.82),
(35, 'SAN JOSÉ POAQUÍL', 3, 14.8181, -90.9125),
(36, 'SAN MARTÍN JILOTEPEQUE', 3, 14.7801, -90.7926),
(37, 'SAN JUAN COMALAPA', 3, 14.7409, -90.8876),
(38, 'SANTA APOLONIA', 3, 14.7905, -90.9727),
(39, 'TECPÁN GUATEMALA', 3, 14.7618, -90.9925),
(40, 'PATZÚN', 3, 14.6819, -91.014),
(41, 'POCHUTA', 3, 14.5445, -91.089),
(42, 'PATZICÍA', 3, 14.6319, -90.9266),
(43, 'SANTA CRUZ BALANYÁ', 3, 14.6852, -90.9191),
(44, 'ACATENANGO', 3, 14.5545, -90.9437),
(45, 'SAN PEDRO YEPOCAPA', 3, 14.5019, -90.954),
(46, 'SAN ANDRÉS ITZAPA', 3, 14.6222, -90.8431),
(47, 'PARRAMOS', 3, 14.6089, -90.803),
(48, 'ZARAGOZA', 3, 14.6497, -90.8903),
(49, 'EL TEJAR', 3, 14.6468, -90.7912),
(50, 'GUASTATOYA', 4, 14.8539, -90.0686),
(51, 'MORAZÁN', 4, 14.9328, -90.1431),
(52, 'SAN AGUSTÍN ACASAGUASTLÁN', 4, 14.945, -89.9697),
(53, 'SAN CRISTÓBAL ACASAGUASTLÁN', 4, 14.9248, -89.8743),
(54, 'EL JÍCARO', 4, 14.9133, -89.8965),
(55, 'SANSARE', 4, 14.7457, -90.1162),
(56, 'SANARATE', 4, 14.7883, -90.1988),
(57, 'SAN ANTONIO LA PAZ', 4, 14.7589, -90.2849),
(58, 'ESCUINTLA', 5, 14.305, -90.785),
(59, 'GUANAGAZAPA', 5, 14.226, -90.6433),
(60, 'IZTAPA', 5, 13.9333, -90.7075),
(61, 'LA DEMOCRACIA', 5, 14.2292, -90.9481),
(62, 'LA GOMERA', 5, 14.0821, -91.0538),
(63, 'MASAGUA', 5, 14.2031, -90.8481),
(64, 'NUEVA CONCEPCIÓN', 5, 14.2, -91.3),
(65, 'PALÍN', 5, 14.4036, -90.6966),
(66, 'PUERTO SAN JOSÉ', 5, 13.9167, -90.8167),
(67, 'SAN VICENTE PACAYA', 5, 14.4147, -90.6361),
(68, 'SANTA LUCÍA COTZUMALGUAPA', 5, 14.3351, -91.0234),
(69, 'SIQUINALÁ', 5, 14.3068, -90.9671),
(70, 'TIQUISATE', 5, 14.2894, -91.3675),
(71, 'CUILAPA', 6, 14.279, -90.298),
(72, 'CASILLAS', 6, 14.4192, -90.2433),
(73, 'CHIQUIMULILLA', 6, 14.0858, -90.379),
(74, 'GUAZACAPÁN', 6, 14.0742, -90.4167),
(75, 'NUEVA SANTA ROSA', 6, 14.3811, -90.2761),
(76, 'ORATORIO', 6, 14.2281, -90.1758),
(77, 'PUEBLO NUEVO VIÑAS', 6, 14.2258, -90.4761),
(78, 'SAN JUAN TECUACO', 6, 14.0836, -90.2665),
(79, 'SAN RAFAÉL LAS FLORES', 6, 14.476, -90.1785),
(80, 'SANTA CRUZ NARANJO', 6, 14.3881, -90.3697),
(81, 'SANTA MARÍA IXHUATÁN', 6, 14.19, -90.2747),
(82, 'SANTA ROSA DE LIMA', 6, 14.3881, -90.2956),
(83, 'TAXISCO', 6, 14.0708, -90.4631),
(84, 'BARBERENA', 6, 14.3074, -90.3616),
(85, 'SOLOLÁ', 7, 14.773, -91.183),
(86, 'CONCEPCIÓN', 7, 14.7842, -91.1475),
(87, 'NAHUALÁ', 7, 14.8429, -91.318),
(88, 'PANAJACHEL', 7, 14.7361, -91.1558),
(89, 'SAN ANDRÉS SEMETABAJ', 7, 14.745, -91.1334),
(90, 'SAN ANTONIO PALOPÓ', 7, 14.6923, -91.1164),
(91, 'SAN JOSÉ CHACAYÁ', 7, 14.771, -91.2156),
(92, 'SAN JUAN LA LAGUNA', 7, 14.6945, -91.2867),
(93, 'SAN LUCAS TOLIMÁN', 7, 14.6334, -91.1432),
(94, 'SAN MARCOS LA LAGUNA', 7, 14.725, -91.2584),
(95, 'SAN PABLO LA LAGUNA', 7, 14.7209, -91.2724),
(96, 'SAN PEDRO LA LAGUNA', 7, 14.6918, -91.273),
(97, 'SANTA CATARINA IXTAHUACAN', 7, 14.798, -91.3587),
(98, 'SANTA CATARINA PALOPÓ', 7, 14.7233, -91.1343),
(99, 'SANTA CLARA LA LAGUNA', 7, 14.7151, -91.3036),
(100, 'SANTA CRUZ LA LAGUNA', 7, 14.7442, -91.2072),
(101, 'SANTA LUCÍA UTATLÁN', 7, 14.7713, -91.267),
(102, 'SANTA MARÍA VISITACIÓN', 7, 14.7172, -91.3084),
(103, 'SANTIAGO ATITLÁN', 7, 14.6389, -91.2299),
(104, 'TOTONICAPÁN', 8, 14.9108, -91.3606),
(105, 'MOMOSTENANGO', 8, 15.0444, -91.4086),
(106, 'SAN ANDRÉS XECUL', 8, 14.9048, -91.4831),
(107, 'SAN BARTOLO', 8, 15.0844, -91.4561),
(108, 'SAN CRISTÓBAL TOTONICAPÁN', 8, 14.9168, -91.4406),
(109, 'SAN FRANCISCO EL ALTO', 8, 14.9449, -91.4431),
(110, 'SANTA LUCÍA LA REFORMA', 8, 15.1282, -91.2362),
(111, 'SANTA MARÍA CHIQUIMULA', 8, 15.0299, -91.3292),
(112, 'ALMOLONGA', 9, 14.8159, -91.4946),
(113, 'CABRICÁN', 9, 15.0748, -91.648),
(114, 'CAJOLÁ', 9, 14.9221, -91.6148),
(115, 'CANTEL', 9, 14.8115, -91.4554),
(116, 'COATEPEQUE', 9, 14.7041, -91.8643),
(117, 'COLOMBA', 9, 14.7073, -91.7317),
(118, 'CONCEPCIÓN CHIQUIRICHAPA', 9, 14.8551, -91.6236),
(119, 'EL PALMAR', 9, 14.6508, -91.578),
(120, 'FLORES COSTA CUCA', 9, 14.6563, -91.8254),
(121, 'GÉNOVA', 9, 14.6222, -91.8358),
(122, 'HUITÁN', 9, 15.0492, -91.6394),
(123, 'LA ESPERANZA', 9, 14.8717, -91.5614),
(124, 'OLINTEPEQUE', 9, 14.886, -91.5147),
(125, 'SAN JUAN OSTUNCALCO', 9, 14.8693, -91.6211),
(126, 'PALESTINA DE LOS ALTOS', 9, 14.9334, -91.694),
(127, 'QUETZALTENANGO', 9, 14.8333, -91.5167),
(128, 'SALCAJÁ', 9, 14.8833, -91.45),
(129, 'SAN CARLOS SIJA', 9, 14.9844, -91.5491),
(130, 'SAN FRANCISCO LA UNIÓN', 9, 14.9235, -91.5416),
(131, 'SAN MARTÍN SACATEPÉQUEZ', 9, 14.8244, -91.6419),
(132, 'SAN MATEO', 9, 14.858, -91.59),
(133, 'SAN MIGUEL SIGÜILÁ', 9, 14.8955, -91.6146),
(134, 'SIBILIA', 9, 14.9939, -91.6237),
(135, 'ZUNIL', 9, 14.7846, -91.4834),
(136, 'MAZATENANGO', 10, 14.5304, -91.51),
(137, 'CHICACAO', 10, 14.543, -91.3264),
(138, 'CUYOTENANGO', 10, 14.5401, -91.5718),
(139, 'PATULUL', 10, 14.4232, -91.1605),
(140, 'PUEBLO NUEVO', 10, 14.6471, -91.5395),
(141, 'RÍO BRAVO', 10, 14.3968, -91.322),
(142, 'SAMAYAC', 10, 14.5811, -91.4623),
(143, 'SAN ANTONIO', 10, 14.5394, -91.4144),
(144, 'SAN BERNARDINO', 10, 14.5424, -91.4581),
(145, 'SAN JOSÉ EL ÍDOLO', 10, 14.4502, -91.4222),
(146, 'SAN FRANCISCO ZAPOTITLÁN', 10, 14.5894, -91.5214),
(147, 'SAN GABRIEL', 10, 14.5108, -91.5075),
(148, 'SAN JUAN BAUTISTA', 10, 14.4227, -91.179),
(149, 'SAN LORENZO', 10, 14.4861, -91.5126),
(150, 'SAN MIGUEL PANÁN', 10, 14.5287, -91.3673),
(151, 'SAN PABLO JOCOPILAS', 10, 14.5888, -91.4519),
(152, 'SANTA BARBARA', 10, 14.4356, -91.2269),
(153, 'SANTO DOMINGO', 10, 14.479, -91.4833),
(154, 'SANTO TOMAS LA UNIÓN', 10, 14.6322, -91.4108),
(155, 'ZUNILITO', 10, 14.6126, -91.5098),
(156, 'SAN JOSÉ LA MÁQUINA', 10, 14.3019, -91.567),
(157, 'CHAMPERICO', 11, 14.2934, -91.9121),
(158, 'EL ASINTAL', 11, 14.5963, -91.7274),
(159, 'NUEVO SAN CARLOS', 11, 14.6, -91.7),
(160, 'RETALHULEU', 11, 14.5333, -91.6833),
(161, 'SAN ANDRÉS VILLA SECA', 11, 14.578, -91.5854),
(162, 'SAN MARTÍN ZAPOTITLÁN', 11, 14.6079, -91.6061),
(163, 'SAN FELIPE', 11, 14.623, -91.595),
(164, 'SAN SEBASTIÁN', 11, 14.5618, -91.6486),
(165, 'SANTA CRUZ MULUÁ', 11, 14.5815, -91.6244),
(166, 'SAN MARCOS', 12, 14.966, -91.8),
(167, 'AYUTLA', 12, 14.966, -91.8),
(168, 'CATARINA', 12, 14.8535, -92.0768),
(169, 'COMITANCILLO', 12, 15.0894, -91.7497),
(170, 'CONCEPCIÓN TUTUAPA', 12, 15.2394, -91.8446),
(171, 'EL QUETZAL', 12, 14.7687, -91.8176),
(172, 'EL RODEO', 12, 14.9145, -91.9763),
(173, 'EL TUMBADOR', 12, 14.8638, -91.9342),
(174, 'IXCHIGUÁN', 12, 15.1638, -91.9326),
(175, 'LA REFORMA', 12, 14.801, -91.8223),
(176, 'MALACATÁN', 12, 14.9113, -92.0579),
(177, 'NUEVO PROGRESO', 12, 14.7917, -91.9195),
(178, 'OCÓS', 12, 14.51, -92.193),
(179, 'PAJAPITA', 12, 14.7215, -92.0352),
(180, 'ESQUIPULAS PALO GORDO', 12, 14.9413, -91.8256),
(181, 'SAN ANTONIO SACATEPÉQUEZ', 12, 14.9606, -91.7315),
(182, 'SAN CRISTÓBAL CUCHO', 12, 14.905, -91.7812),
(183, 'SAN JOSÉ OJETENAM', 12, 15.2344, -91.9732),
(184, 'SAN LORENZO', 12, 15.0309, -91.7353),
(185, 'SAN MIGUEL IXTAHUACÁN', 12, 15.2725, -91.7478),
(186, 'SAN PABLO', 12, 14.9327, -92.0041),
(187, 'SAN PEDRO SACATEPÉQUEZ', 12, 14.9681, -91.7617),
(188, 'SAN RAFAÉL PIE DE LACUESTA', 12, 14.9305, -91.9139),
(189, 'SIBINAL', 12, 15.1496, -92.0489),
(190, 'SIPACAPA', 12, 15.2125, -91.6342),
(191, 'TACANÁ', 12, 15.2406, -92.0672),
(192, 'TAJUMULCO', 12, 15.0835, -91.9222),
(193, 'TEJUTLA', 12, 15.1225, -91.8064),
(194, 'RÍO BLANCO', 12, 15.0382, -91.6846),
(195, 'LA BLANCA', 12, 14.5789, -92.1414),
(196, 'AGUACATÁN', 13, 15.3422, -91.3114),
(197, 'CHIANTLA', 13, 15.3548, -91.4581),
(198, 'COLOTENANGO', 13, 15.4051, -91.7144),
(199, 'CONCEPCIÓN HUISTA', 13, 15.6238, -91.6652),
(200, 'CUILCO', 13, 15.4072, -91.9467),
(201, 'HUEHUETENANGO', 13, 15.3147, -91.4761),
(202, 'JACALTENANGO', 13, 15.6666, -91.7118),
(203, 'LA DEMOCRACIA', 13, 15.6333, -91.8667),
(204, 'LA LIBERTAD', 13, 15.5142, -91.8694),
(205, 'MALACATANCITO', 13, 15.2446, -91.499),
(206, 'NENTÓN', 13, 15.8007, -91.7546),
(207, 'SAN ANTONIO HUISTA', 13, 15.6501, -91.7716),
(208, 'SAN GASPAR IXCHIL', 13, 15.388, -91.7256),
(209, 'SAN ILDEFONSO IXTAHUACÁN', 13, 15.4169, -91.7693),
(210, 'SAN JUAN ATITÁN', 13, 15.4289, -91.624),
(211, 'SAN JUAN IXCOY', 13, 15.6002, -91.4464),
(212, 'SAN MATEO IXTATÁN', 13, 15.8319, -91.4781),
(213, 'SAN MIGUEL ACATÁN', 13, 15.704, -91.5977),
(214, 'SAN PEDRO NECTA', 13, 15.4914, -91.7655),
(215, 'SAN PEDRO SOLOMA', 13, 15.6584, -91.4299),
(216, 'SAN RAFAEL LA INDEPENDENCIA', 13, 15.7015, -91.5355),
(217, 'SAN RAFAEL PETZAL', 13, 15.405, -91.6653),
(218, 'SAN SEBASTIÁN COATÁN', 13, 15.7358, -91.5629),
(219, 'SAN SEBASTIÁN HUEHUETENANGO', 13, 15.3877, -91.6153),
(220, 'SANTA ANA HUISTA', 13, 15.6809, -91.82),
(221, 'SANTA BÁRBARA', 13, 15.3162, -91.6328),
(222, 'SANTA CRUZ BARILLAS', 13, 15.8036, -91.3158),
(223, 'SANTA EULALIA', 13, 15.7306, -91.4585),
(224, 'SANTIAGO CHIMALTENANGO', 13, 15.4766, -91.6966),
(225, 'TECTITÁN', 13, 15.3063, -92.0605),
(226, 'TODOS SANTOS CUCHUMATÁN', 13, 15.5085, -91.6038),
(227, 'UNIÓN CANTINIL', 13, 15.9218, -91.7765),
(228, 'SANTA CRUZ DEL QUICHÉ', 14, 15.05, -91.25),
(229, 'CANILLÁ', 14, 15.1655, -90.8526),
(230, 'CHAJUL', 14, 15.4852, -91.0352),
(231, 'CHICAMÁN', 14, 15.3479, -90.7997),
(232, 'CHICHÉ', 14, 15.0088, -91.0638),
(233, 'CHICHICASTENANGO', 14, 14.9433, -91.1112),
(234, 'CHINIQUE', 14, 15.0415, -91.0259),
(235, 'CUNÉN', 14, 15.3363, -91.0278),
(236, 'IXCÁN', 14, 15.7872, -91.095),
(237, 'JOYABAJ', 14, 14.9931, -90.8016),
(238, 'NEBAJ', 14, 15.4061, -91.1468),
(239, 'PACHALUM', 14, 14.9247, -90.6628),
(240, 'PATZITÉ', 14, 14.9643, -91.2079),
(241, 'SACAPULAS', 14, 15.288, -91.0891),
(242, 'SAN ANDRÉS SAJCABAJÁ', 14, 15.176, -90.9422),
(243, 'SAN ANTONIO ILOTENANGO', 14, 15.0547, -91.2299),
(244, 'SAN BARTOLOMÉ JOCOTENANGO', 14, 15.1915, -91.0781),
(245, 'SAN JUAN COTZAL', 14, 15.4337, -91.0348),
(246, 'SAN PEDRO JOCOPILAS', 14, 15.0953, -91.1514),
(247, 'USPANTÁN', 14, 15.3467, -90.8705),
(248, 'ZACUALPA', 14, 15.0268, -90.8782),
(249, 'CUBULCO', 15, 15.1045, -90.6287),
(250, 'SANTA CRUZ EL CHOL', 15, 14.9606, -90.488),
(251, 'GRANADOS', 15, 14.9165, -90.5229),
(252, 'PURULHÁ', 15, 15.2357, -90.2357),
(253, 'RABINAL', 15, 15.0853, -90.4925),
(254, 'SALAMÁ', 15, 15.1052, -90.316),
(255, 'SAN MIGUEL CHICAJ', 15, 15.0947, -90.3944),
(256, 'SAN JERÓNIMO', 15, 15.05, -90.2),
(257, 'COBÁN', 16, 15.47, -90.38),
(258, 'SAN PEDRO CARCHÁ', 16, 15.4774, -90.3111),
(259, 'SAN JUAN CHAMELCO', 16, 15.4243, -90.3304),
(260, 'SAN CRISTÓBAL VERAPAZ', 16, 15.365, -90.4792),
(261, 'TACTIC', 16, 15.3182, -90.3513),
(262, 'TUCURÚ', 16, 15.294, -90.1192),
(263, 'TAMAHÚ', 16, 15.3077, -90.2344),
(264, 'PANZÓS', 16, 15.3986, -89.6415),
(265, 'SENAHÚ', 16, 15.4, -89.8333),
(266, 'CAHABÓN', 16, 15.5667, -89.8167),
(267, 'LANQUÍN', 16, 15.5667, -89.9667),
(268, 'CHAHAL', 16, 15.7901, -89.6021),
(269, 'FRAY BARTOLOMÉ DE LAS CASAS', 16, 15.8051, -89.8605),
(270, 'CHISEC', 16, 15.8131, -90.289),
(271, 'SANTA CRUZ VERAPAZ', 16, 15.3734, -90.4286),
(272, 'SANTA CATALINA LA TINTA', 16, 15.3167, -89.8833),
(273, 'RAXRUHÁ', 16, 15.8667, -90.0333),
(274, 'DOLORES', 17, 16.5118, -89.417),
(275, 'SAN BENITO', 17, 16.9167, -89.9),
(276, 'FLORES', 17, 16.9337, -89.8833),
(277, 'SAN FRANCISCO', 17, 16.8, -89.9333),
(278, 'LA LIBERTAD', 17, 16.7804, -90.12),
(279, 'SAN JOSÉ', 17, 16.9833, -89.9),
(280, 'MELCHOR DE MENCOS', 17, 17.0667, -89.15),
(281, 'SAN LUIS', 17, 16.2, -89.44),
(282, 'POPTÚN', 17, 16.3311, -89.4169),
(283, 'SANTA ANA', 17, 16.8, -89.8333),
(284, 'SAN ANDRÉS', 17, 16.9667, -89.9167),
(285, 'SAYAXCHÉ', 17, 16.5245, -90.188),
(286, 'EL CHAL', 17, 16.6425, -89.6529),
(287, 'PUERTO BARRIOS', 18, 15.73, -88.6),
(288, 'LIVINGSTON', 18, 15.83, -88.75),
(289, 'EL ESTOR', 18, 15.5322, -89.3311),
(290, 'MORALES', 18, 15.4722, -88.8407),
(291, 'LOS AMATES', 18, 15.2549, -89.0936),
(292, 'CABAÑAS', 19, 14.9333, -89.8),
(293, 'ESTANZUELA', 19, 14.9978, -89.5728),
(294, 'GUALÁN', 19, 15.1135, -89.359),
(295, 'HUITÉ', 19, 14.9279, -89.7163),
(296, 'LA UNIÓN', 19, 14.9666, -89.2902),
(297, 'RÍO HONDO', 19, 15.045, -89.5852),
(298, 'SAN DIEGO', 19, 14.7898, -89.7764),
(299, 'TECULUTÁN', 19, 14.989, -89.7194),
(300, 'USUMATLÁN', 19, 14.9478, -89.7771),
(301, 'ZACAPA', 19, 14.972, -89.529),
(302, 'SAN JORGE', 19, 14.9259, -89.5887),
(303, 'CHIQUIMULA', 20, 14.797, -89.544),
(304, 'CAMOTÁN', 20, 14.8202, -89.3722),
(305, 'CONCEPCIÓN LAS MINAS', 20, 14.5217, -89.4572),
(306, 'ESQUIPULAS', 20, 14.6167, -89.2),
(307, 'IPALA', 20, 14.6199, -89.6194),
(308, 'JOCOTÁN', 20, 14.8207, -89.3899),
(309, 'OLOPA', 20, 14.6923, -89.35),
(310, 'QUEZALTEPEQUE', 20, 14.6355, -89.4424),
(311, 'SAN JOSÉ LA ARADA', 20, 14.7227, -89.586),
(312, 'SAN JUAN ERMITA', 20, 14.7647, -89.4301),
(313, 'SAN JACINTO', 20, 14.66, -89.5),
(314, 'JALAPA', 21, 14.6379, -89.9904),
(315, 'SAN PEDRO PINULA', 21, 14.6635, -89.8463),
(316, 'SAN LUIS JILOTEPEQUE', 21, 14.6472, -89.7246),
(317, 'SAN MANUEL CHAPARRÓN', 21, 14.5199, -89.7692),
(318, 'SAN CARLOS ALZATATE', 21, 14.4978, -90.0603),
(319, 'MONJAS', 21, 14.5031, -89.8725),
(320, 'MATAQUESCUINTLA', 21, 14.5292, -90.1842),
(321, 'JUTIAPA', 22, 14.29, -89.9),
(322, 'AGUA BLANCA', 22, 14.498, -89.6496),
(323, 'ASUNCIÓN MITA', 22, 14.3337, -89.7109),
(324, 'ATESCATEMPA', 22, 14.1755, -89.7418),
(325, 'COMAPA', 22, 14.1128, -89.9147),
(326, 'CONGUACO', 22, 14.0442, -90.0311),
(327, 'EL ADELANTO', 22, 14.171, -89.8271),
(328, 'EL PROGRESO', 22, 14.356, -89.8485),
(329, 'JALPATAGUA', 22, 14.1369, -90.0091),
(330, 'JERÉZ', 22, 14.0908, -89.7511),
(331, 'MOYUTA', 22, 14.0386, -90.0808),
(332, 'PASACO', 22, 13.9772, -90.2064),
(333, 'QUESADA', 22, 14.2703, -90.0403),
(334, 'SAN JOSÉ ACATEMPA', 22, 14.2653, -90.1269),
(335, 'SANTA CATARINA MITA', 22, 14.4513, -89.7429),
(336, 'YUPILTEPEQUE', 22, 14.1971, -89.7926),
(337, 'ZAPOTITLÁN', 22, 14.1392, -89.8263),
(338, 'Playa Grande', 14, 15.9333, -90.7333),
(339, 'Ciudad Tecún Umán', 12, 14.6833, -92.1333);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idpais` int NOT NULL,
  `pais` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `pais`) VALUES
(1, 'Guatemala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint NOT NULL,
  `usuarioid` bigint NOT NULL,
  `nombreproducto` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `costo` float NOT NULL DEFAULT '0',
  `restricciones` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `marca` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `talla` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `transmision` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `combustible` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `motor` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `registro` date NOT NULL,
  `rating` float NOT NULL,
  `prestamos` int NOT NULL,
  `fotoprincipal` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `asientos` double NOT NULL DEFAULT '0',
  `estadoid` int NOT NULL,
  `horaentrega` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `horadevolucion` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `costosemana` float NOT NULL,
  `costomes` float NOT NULL,
  `departamentogeografico` int NOT NULL,
  `municipio` int NOT NULL,
  `zona` int NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pesoproducto` float NOT NULL,
  `tamanoproducto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `usuarioid`, `nombreproducto`, `descripcion`, `costo`, `restricciones`, `marca`, `talla`, `modelo`, `transmision`, `combustible`, `motor`, `registro`, `rating`, `prestamos`, `fotoprincipal`, `asientos`, `estadoid`, `horaentrega`, `horadevolucion`, `costosemana`, `costomes`, `departamentogeografico`, `municipio`, `zona`, `direccion`, `pesoproducto`, `tamanoproducto`) VALUES
(31, 2, 'Zapatos adidas', 'Zapatos de la mas alta caldiad', 200, 'no usarlos en el agua', 'Adidas', '34', '1', '1', '1', '1', '2021-03-01', 2, 5, 'adidas.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(34, 27, 'Mochila', 'Mochila para viajes', 25.5, 'lavar en seco', 'totto', 'l', '2', '2', '2', '2', '2021-02-01', 3.5, 2, 'mochila.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(49, 2, 'Carro1', 'Todo terreno', 100, 'No fumar', 'Toyota', 'No aplica', '2012', 'Mecánico', 'Gasolina', '3.0', '2021-03-01', 4, 5, 'image_cropper_1618945345176.jpg', 5, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(50, 1, 'Tanque de oxigeno', 'Aun no', 1000, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-03-01', 5, 2, 'oxigeno.jpg', 0, 1, '', '', 0, 0, 1, 4, 1, '', 0, 0),
(51, 1, 'Excavadora', 'Aun no', 8000, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 3, 2, 'excavadora.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(52, 2, 'Mesas', 'Aun no', 2000, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 3, 2, 'mesas.jpg', 0, 1, '', '', 0, 0, 1, 4, 1, '', 0, 0),
(53, 1, 'computadora', 'Aun no', 300, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 2, 2, 'computadora.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(54, 1, 'Mesa de Ping Pong', 'Aun no', 200, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 3.5, 2, 'mesadejuego.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(65, 1, 'Disfraz de Batman para niño', 'Aun no', 200, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 3.5, 2, 'batman.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(66, 1, 'Libro de matemáticas industrial', 'Aun no', 50, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 2, 5, 'matematicas.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(67, 1, 'Sala', 'Aun no', 1000, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 3.5, 2, 'sillones.jpg', 0, 0, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(68, 1, 'Guitarra', 'Aun no', 300, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 3.5, 2, 'guitarra.jpg', 0, 0, '', '', 0, 0, 1, 2, 1, '', 0, 0),
(69, 1, 'Maleta', 'Aun no', 200, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-01', 3.5, 5, 'maleta.jpg', 0, 0, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(70, 1, 'Pulidora', 'Aun no', 100, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-08', 3.5, 2, 'pulidora.jpg', 0, 0, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(71, 1, 'Silla de ruedas', 'Aun no', 200, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-02', 2, 5, 'silla.jpg', 1, 0, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(72, 1, 'Atomovil Ferrari asdf asdf asd fthunderbird 2020', 'Aun no', 100, 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', 'Aun no', '2021-04-01', 2, 2, 'ferrari.jpg', 2, 0, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(73, 1, 'Termometro Digital', 'Termometro para toda la familia', 25, 'ninguna', 'patito', 'u', '', '', '', '', '2021-04-12', 3, 0, 'termometro.jpg', 2, 0, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(74, 1, 'Lancha Rápida', 'Lancha de acceso rápido para un fin de semana en familia', 10.546, 'Sin restricciones', 'Venom', '0', '2015', 'Automática', 'Pendiente', '2.5', '2021-04-01', 3.5, 5, 'lancha.jpg', 4, 1, '', '', 0, 0, 1, 7, 1, '', 0, 0),
(75, 1, 'Helicóptero Subaru', 'Viaja de un lugar a otro en el menor tiempo posible', 2000, 'Sin restricciones', 'Subaru', '0', '2015', 'Automática', 'Pendiente', 'Pendiente', '2021-04-04', 2, 5, 'helicoptero.jpg', 4, 1, '', '', 0, 0, 1, 3, 1, '', 0, 0),
(76, 1, 'Avioneta BGMP', 'De un lugar a otro en minutos', 1000, 'Sin restricciones', 'BGMP', '0', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-01', 3.5, 2, 'avioneta.jpg', 2, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(79, 1, 'Jet', 'Jet privado para una persona', 1000, 'Sin restricciones', 'Pendiente', '0', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 5, 'jet.jpg', 1, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(80, 1, 'Mavic Mini', 'Sin descripción', 200, 'Sin restricciones', 'Pendiente', '0', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-01', 3.5, 2, 'dron.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(81, 1, 'Moto deportiva', 'Sin restricciones', 500, 'Sin restricciones ', 'Voge', 'No aplica', 'Voge', 'Automática', 'Gasolina', '160', '2021-04-05', 3.5, 2, 'moto.jpg', 2, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(82, 1, 'Bus', 'Excursiones', 600, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Mecanica', 'Gasolina', 'Pendiente', '2021-04-08', 4, 5, 'bus.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(83, 1, 'Camion de carga', 'Sin descripcion', 1000, 'No se permiten mascotas', 'Pendiente', 'No aplica', 'Pendiente', 'Mecanica', 'Gasolina', 'Pendiente', '2021-04-08', 3.5, 2, 'camion.jpg', 4, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(84, 1, 'Casa rodante', 'Linea blanca completa', 2000, 'No se permiten mascotas', 'Pendiente', 'No aplica', 'Pendiente', 'Automática', 'Gasolina', 'Pendiente', '2021-02-01', 5, 2, 'casarodante.jpg', 10, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(85, 1, 'Excavadora', 'Sin restriccion', 1000, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Automática', 'Gasolina', 'Pendiente', '2021-04-08', 3.5, 5, 'excavadora.jpg', 1, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(86, 1, 'Tractor', 'Sin descripcion', 500, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Mecanica', 'Gasolina', 'Pendiente', '2021-04-08', 3.5, 2, 'tractor.jpg', 1, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(87, 1, 'Bicicleta de montaña', 'Sin descripción', 300, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'No aplica', 'No aplica', 'No aplica', '2021-04-08', 3.5, 2, 'bicicleta.jpg', 1, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(88, 1, 'maquina industrial', 'Sin descripcion', 1000, 'Sin restriccion', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 2, 2, 'maquinaindustrial.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(89, 1, 'Maquinaria Autoservicio', 'Sin descripcion', 300, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'maquinariaautoservicio.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(90, 1, 'Maquinaria Electrica', 'Sin descripcion', 500, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 5, 'maquinariaelectrica.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(91, 1, 'Herramienta para maquinaria', 'Sin descripcion', 200, 'Sin restriccion', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'maquinariaherramienta.jpg', 1, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(92, 1, 'Maquinaria Hidraulica', 'Sin descripcion', 200, 'Sin restriccion', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'maquinariahidraulica.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(93, 1, 'Maquinaria Térmica', 'Sin descripcion', 400, 'Sin restriccion', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-05', 3.5, 2, 'maquinariatermica.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(94, 1, 'Camara', 'Sin descripcion', 200, 'Sin restriccion', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'camara.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(95, 1, 'Equipo de sonido', 'Sin descripcion', 200, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'No aplica', 'No aplica', 'No aplica', '2021-04-08', 5, 2, 'equipodesonido.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(96, 1, 'Video Juego', 'Sin descripcion', 100, 'Sin restriccion', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'No aplica', '2021-04-08', 3.5, 2, 'videojuego.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(97, 1, 'Produccion de video', 'Sin descripcion', 100, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 2, 2, 'producciondevideo.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(98, 1, 'Consola', 'Sin descripcion', 240, 'Sin restriccion', 'Sony', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 2, 5, 'consola.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(99, 1, 'Horno de Microondas', 'Sin descripcion', 100, 'Sin restriccion', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-01', 2, 2, 'electrodomesticos.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(100, 1, 'Calculadora científica', 'Sin descripción', 100, 'Sin restricción', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-05', 2, 2, 'calculadora.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(101, 1, 'Equipo paracaidismo', 'Sin descripcion', 100, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 2, 5, 'extremo.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(102, 1, 'Tenis', 'Sin descripcion', 100, 'Sin restricciones', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'terrestre.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(103, 1, 'Casa de campaña', 'SD', 100, 'SR', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-01', 3.5, 2, 'camping.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(104, 1, 'Tabla de surf', 'SD', 100, 'SR', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-02', 4, 5, 'acuatico.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(105, 1, 'Herramienta industrial', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 5, 'industrial.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(106, 1, 'Herramienta doméstica', 'SD', 40, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'domestica.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(107, 1, 'Jardinería', 'SD', 50, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-03-01', 2, 2, 'jardineria.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(108, 1, 'Juego de llaves', 'SD', 40, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-05', 3.5, 2, 'automotriz.jpg', 1, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(109, 1, 'Juego de mesa', 'SD', 30, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-03-01', 4, 2, 'entretenimiento.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(110, 1, 'Sabanas', 'SD', 50, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 2, 5, 'dormitorio.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(111, 1, 'Estufa', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'cocina.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(112, 1, 'Mueble', 'SD', 50, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'varios.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(113, 1, 'Silla', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-03-01', 3.5, 2, 'oficina.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(114, 1, 'Entretenimiento', 'SD', 50, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'entretenimiento2.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(115, 1, 'Trompeta', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'viento.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(116, 1, 'Tambor', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'percusion.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(117, 1, 'Abrigo ', 'SD', 50, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'ropa.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(118, 1, 'Tunel para perro', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-03-01', 2, 5, 'equipoparamascotas.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(119, 1, 'Disfraz', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-08', 3.5, 2, 'mujer.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(120, 1, 'Disfraz de Loki', 'SD', 100, 'SR', 'Pendiente', 'No aplica', 'Pendiente', 'Pendiente', 'Pendiente', 'Pendiente', '2021-04-01', 4, 3, 'hombre.jpg', 0, 1, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(124, 1, 'Moto g7', 'Telefono', 150, 'ninguna por el momento, no lo moje', 'Motorola', '', '', '', '', '', '2021-04-29', 0, 0, 'image_cropper_1619727206561.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(125, 1, 'mi telefono', 'telefono bonito', 110, 'ninguna', 'moto', '', '', '', '', '', '2021-04-29', 0, 0, 'image_cropper_1619727419293.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(126, 1, 'nada', 'nada', 10, '', 'nada', '', '', '', '', '', '2021-04-29', 0, 0, 'image_cropper_1619727493182.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(127, 1, 'doctor', 'doctor detele', 125, '', 'house', '', '', '', '', '', '2021-04-29', 0, 0, 'image_cropper_1619731240531.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(132, 2, ' producto', 'prod', 0.11, 'ninguna', 'prod', '', '', '', '', '', '2021-04-30', 0, 0, '', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(133, 1, 'mesa gel', 'mesa muy floreada con colores', 320.25, 'ninguna', 'patito', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619807850775.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(134, 1, 'mesa2', 'mesa2', 10, '1', 'mesa2', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619808040396.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(135, 1, 'a', 'a', 1, '', 'a', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619808218435.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(136, 1, 'a', 'a', 1, '', 'a', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619810535279.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(137, 1, 'Rodolfo', 'doctor de trabajo', 325, '', 'fito', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619810927182.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(138, 1, 'mueble1', 'mueble1', 10, '1', 'mueble1', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619811248283.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(139, 1, 'dsfasdf', 'asdfasdf', 1, 'asdf', 'asdfasdf', '', '', '', '', '', '2021-04-30', 0, 0, '', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(140, 1, 'a', 'a', 1, '', 'a', '', '', '', '', '', '2021-04-30', 0, 0, '', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(141, 1, 'a', 'a', 1, 'a', 'a', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619813042153.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(142, 1, 'sdfg', 'asdf', 12, 'asd', 'asdf', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619813795004.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(143, 1, 'gsdfgds', 'sdfgsdgf', 343, 'sadfsa', 'dsfgsfdg', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619813915633.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(144, 1, 'sadfasf', 'asdfasdf', 125, '1', 'asdfasdf', '', '', '', '', '', '2021-04-30', 0, 0, 'image_cropper_1619819564464.jpg', 0, 3, '', '', 0, 0, 1, 1, 1, '', 0, 0),
(145, 1, 'asdf', 'asdf', 10, 'asdf', 'asdf', '', '', '', '', 'adsf', '2021-05-12', 0, 0, 'image_cropper_1620830072977.jpg', 0, 3, '08:00 a 12:00 horas', '12:00 a 17:00 horas', 10, 10, 1, 1, 1, 'asdf', 0, 0),
(146, 1, ' asdfasdf asdfasdf', 'asdf', 10, 'asdfasdf', 'asdfasdf', '', 'asdfasdf', 'asdfasdf', 'dsfasfd', 'sdafasfd', '2021-05-14', 0, 0, '', 2, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 10, 10, 1, 1, 1, 'asdfasdf', 0, 0),
(147, 1, ' dfgsdgffd sdfgsdg', 'dfdsfgsdgf', 10, 'sdfgsdg', 'dfgsdgffd', '', 'sdfgsdg', 'dfgsdg', 'sdfgsdfg', 'sdfgsdg', '2021-05-14', 0, 0, '', 10, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 10, 10, 1, 1, 1, 'adsfasfsad', 0, 0),
(148, 1, 'fdgsdfg', 'sdsfdg', 10, 'asdfasfd', 'sdfgsdfg', '', '', '', '', '', '2021-05-14', 0, 0, '', 0, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 10, 10, 1, 1, 1, 'asdfasf', 0, 0),
(149, 1, ' asdfasf asdfasf', 'asdfasf', 10, 'asdfasf', 'asdfasf', '', 'asdfasf', 'asdfasfd', 'asdfasf', 'asdfasf', '2021-05-14', 0, 0, '', 0, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 10, 10, 1, 1, 1, 'asdafd', 0, 0),
(150, 1, ' a a', 'a', 10, 'a', 'a', '', 'a', 'a', 'a', 'a', '2021-05-14', 0, 0, '', 2, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 10, 10, 1, 1, 1, 'afd', 0, 0),
(151, 1, ' asfd asdfa', 'asdfasdf', 10, 'asdf', 'asfd', '', 'asdfa', 'assadf', 'asdf', 'asdfdasf', '2021-05-14', 0, 0, '', 12, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 10, 10, 1, 1, 1, '', 0, 0),
(152, 1, ' asdf asdf', 'asdfasf', 10, 'asdf', 'asdf', '', 'asdf', 'fasfdsa', 'asdfasfd', 'asfdasfd', '2021-05-14', 0, 0, '', 12, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 10, 10, 1, 1, 1, 'asdfasdf', 0, 0),
(153, 24, 'asdfasf', 'asaasfasdf', 10, 'asfasfsda', 'asfasfasdf', '', '', '', '', '', '2021-05-14', 0, 0, 'image_cropper_1621020800509.jpg', 0, 3, '12:00 a 17:00 horas', '08:00 a 12:00 horas', 0, 10, 1, 1, 1, 'asdfsdf', 0, 0),
(154, 24, ' asdfa asdf', 'asdfasdf', 10, '10', 'asdfa', '', 'asdf', 'asdf', 'asfasdfd', 'asdf', '2021-05-14', 0, 0, 'image_cropper_1621021009139.jpg', 2, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 0, 10, 1, 1, 1, 'asdfasdf', 0, 0),
(155, 24, 'dafdasf', 'asdfasdf', 10, 'asdfasf', 'asdfasdf', '', '', '', '', '', '2021-05-14', 0, 0, 'image_cropper_1621021099517.jpg', 0, 3, '08:00 a 12:00 horas', '12:00 a 17:00 horas', 0, 10, 1, 8, 9, 'gt', 0, 0),
(156, 1, 'a', 'a', 1, '1', 'a', '', '', '', '', '', '2021-06-02', 0, 0, '', 0, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 0, 1, 7, 85, 11, 'El Guarda', 0, 0),
(157, 1, 'a', 'a', 1, '1', 'a', '', '', '', '', '', '2021-06-02', 0, 0, 'image_cropper_1622662620290.jpg', 0, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 0, 1, 7, 85, 11, 'El Guarda', 0, 0),
(158, 1, 'b', 'b', 1, '', 'b', '', '', '', '', '', '2021-06-02', 0, 0, 'image_cropper_1622664335402.jpg', 0, 3, '08:00 a 12:00 horas', '08:00 a 12:00 horas', 0, 1, 1, 1, 1, 'a', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocategorias`
--

CREATE TABLE `productocategorias` (
  `idproductocategorias` bigint NOT NULL,
  `idproducto` bigint NOT NULL,
  `idcategoria` bigint NOT NULL,
  `idsubcategoria` bigint NOT NULL,
  `idtipo` bigint NOT NULL,
  `idestado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productocategorias`
--

INSERT INTO `productocategorias` (`idproductocategorias`, `idproducto`, `idcategoria`, `idsubcategoria`, `idtipo`, `idestado`) VALUES
(1, 31, 7, 36, 0, 1),
(2, 34, 7, 36, 0, 1),
(3, 49, 1, 1, 2, 1),
(4, 50, 2, 4, 0, 1),
(5, 51, 3, 7, 0, 1),
(6, 52, 4, 0, 0, 1),
(7, 53, 5, 25, 0, 1),
(8, 54, 6, 34, 0, 1),
(9, 65, 7, 37, 0, 1),
(10, 66, 8, 51, 0, 1),
(11, 67, 9, 54, 0, 1),
(12, 68, 10, 61, 0, 1),
(13, 69, 11, 64, 0, 1),
(14, 70, 12, 70, 0, 1),
(15, 71, 2, 5, 0, 1),
(16, 72, 1, 1, 2, 1),
(17, 73, 2, 4, 0, 1),
(18, 74, 1, 3, 0, 1),
(19, 75, 1, 2, 13, 1),
(20, 76, 1, 2, 14, 1),
(21, 79, 1, 2, 15, 1),
(22, 80, 1, 2, 16, 1),
(23, 81, 1, 1, 3, 1),
(24, 82, 1, 1, 4, 1),
(25, 83, 1, 1, 5, 1),
(26, 84, 1, 1, 6, 1),
(27, 85, 1, 1, 7, 1),
(28, 86, 1, 1, 8, 1),
(29, 87, 1, 1, 9, 1),
(30, 88, 3, 6, 0, 1),
(31, 89, 3, 8, 0, 1),
(32, 90, 3, 9, 0, 1),
(33, 91, 3, 10, 0, 1),
(34, 92, 3, 11, 0, 1),
(35, 93, 3, 12, 0, 1),
(36, 94, 5, 23, 0, 1),
(37, 95, 5, 24, 0, 1),
(38, 96, 5, 26, 0, 1),
(39, 97, 5, 27, 0, 1),
(40, 98, 5, 28, 0, 1),
(41, 99, 5, 29, 0, 1),
(42, 100, 5, 76, 0, 1),
(43, 101, 6, 30, 0, 1),
(44, 102, 6, 31, 0, 1),
(45, 103, 6, 32, 0, 1),
(46, 104, 6, 33, 0, 1),
(47, 105, 12, 66, 0, 1),
(48, 106, 12, 67, 0, 1),
(49, 107, 12, 68, 0, 1),
(50, 108, 12, 69, 0, 1),
(51, 109, 12, 71, 0, 1),
(52, 110, 9, 55, 0, 1),
(53, 111, 9, 56, 0, 1),
(54, 112, 9, 57, 0, 1),
(55, 113, 9, 58, 0, 1),
(56, 114, 9, 59, 0, 1),
(57, 115, 10, 60, 0, 1),
(58, 116, 10, 62, 0, 1),
(59, 117, 11, 63, 0, 1),
(60, 118, 11, 65, 0, 1),
(61, 119, 7, 35, 0, 1),
(62, 120, 7, 36, 0, 1),
(63, 124, 5, 28, 0, 1),
(64, 125, 5, 26, 0, 1),
(65, 126, 2, 5, 0, 1),
(66, 127, 2, 4, 0, 1),
(67, 132, 2, 4, 0, 1),
(68, 133, 4, 0, 0, 1),
(69, 134, 4, 0, 0, 1),
(70, 135, 4, 0, 0, 1),
(71, 136, 8, 38, 0, 1),
(72, 137, 2, 4, 0, 1),
(73, 138, 9, 54, 0, 1),
(74, 139, 8, 38, 0, 1),
(75, 140, 2, 4, 0, 1),
(76, 141, 2, 4, 0, 1),
(77, 142, 2, 4, 0, 1),
(78, 143, 2, 4, 0, 1),
(79, 144, 3, 6, 0, 1),
(80, 145, 8, 38, 0, 1),
(81, 146, 1, 1, 2, 1),
(82, 147, 1, 1, 2, 1),
(83, 148, 2, 4, 0, 1),
(84, 149, 1, 1, 2, 1),
(85, 150, 1, 1, 2, 1),
(86, 151, 1, 1, 2, 1),
(87, 152, 1, 1, 2, 1),
(88, 153, 2, 4, 0, 1),
(89, 154, 1, 1, 2, 1),
(90, 155, 5, 23, 0, 1),
(91, 87, 6, 31, 0, 1),
(92, 157, 2, 4, 0, 1),
(93, 158, 2, 4, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productofotos`
--

CREATE TABLE `productofotos` (
  `idproducto` bigint NOT NULL,
  `idfoto` bigint NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `estadoid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productofotos`
--

INSERT INTO `productofotos` (`idproducto`, `idfoto`, `foto`, `estadoid`) VALUES
(49, 1, 'carro.jpg', 1),
(31, 3, 'adidas.jpg', 1),
(74, 4, 'lancha.jpg', 1),
(75, 5, 'helicoptero.jpg', 1),
(76, 6, 'avioneta.jpg', 1),
(79, 7, 'jet.jpg', 1),
(80, 8, 'dron.jpg', 1),
(72, 9, 'ferrari.jpg', 1),
(81, 10, 'moto.jpg', 1),
(82, 11, 'bus.jpg', 1),
(83, 12, 'camion.jpg', 1),
(84, 13, 'casarodante.jpg', 1),
(85, 14, 'excavadora.jpg', 1),
(86, 15, 'tractor.jpg', 1),
(87, 16, 'bicicleta.jpg', 1),
(88, 17, 'maquinaindustrial.jpg', 1),
(51, 18, 'excavadora.jpg', 1),
(89, 19, 'maquinariaautoservicio.jpg', 1),
(90, 20, 'maquinariaelectrica.jpg', 1),
(91, 21, 'maquinariaherramienta.jpg', 1),
(92, 22, 'maquinariahidraulica.jpg', 1),
(93, 23, 'maquinariatermica.jpg', 1),
(50, 24, 'oxigeno.jpg', 1),
(73, 25, 'termometro.jpg', 1),
(71, 26, 'silla.jpg', 1),
(94, 27, 'camara.jpg', 1),
(95, 28, 'equipodesonido.jpg', 1),
(53, 29, 'computadora.jpg', 1),
(96, 30, 'videojuego.jpg', 1),
(97, 31, 'producciondevideo.jpg', 1),
(98, 32, 'consola.jpg', 1),
(100, 33, 'calculadora.jpg', 1),
(99, 34, 'electrodomesticos.jpg', 1),
(34, 35, 'mochila.jpg', 1),
(52, 36, 'mesas.jpg', 1),
(54, 37, 'mesadejuego.jpg', 1),
(65, 38, 'batman.jpg', 1),
(66, 39, 'matematicas.jpg', 1),
(67, 40, 'sillones.jpg', 1),
(68, 41, 'guitarra.jpg', 1),
(69, 42, 'maleta.jpg', 1),
(70, 43, 'pulidora.jpg', 1),
(101, 44, 'extremo.jpg', 1),
(102, 45, 'terrestre.jpg', 1),
(103, 46, 'camping.jpg', 1),
(104, 47, 'acuatico.jpg', 1),
(105, 49, 'industrial.jpg', 1),
(106, 50, 'domestica.jpg', 1),
(107, 51, 'jardineria.jpg', 1),
(108, 52, 'automotriz.jpg', 1),
(109, 53, 'entretenimiento.jpg', 1),
(110, 54, 'dormitorio.jpg', 1),
(111, 55, 'cocina.jpg', 1),
(112, 56, 'varios.jpg', 1),
(113, 57, 'oficina.jpg', 1),
(114, 58, 'entretenimiento2.jpg', 1),
(115, 59, 'viento.jpg', 1),
(116, 60, 'percusion.jpg', 1),
(117, 61, 'ropa.jpg', 1),
(118, 62, 'equipoparamascotas.jpg', 1),
(119, 63, 'mujer.jpg', 1),
(120, 64, 'hombre.jpg', 1),
(135, 86, 'image_cropper_1619808223380.jpg', 3),
(135, 87, 'image_cropper_1619808218435.jpg', 1),
(136, 88, 'image_cropper_1619809785466.jpg', 3),
(136, 89, 'image_cropper_1619809952346.jpg', 3),
(136, 90, 'image_cropper_1619809959346.jpg', 3),
(136, 91, 'image_cropper_1619810535279.jpg', 3),
(136, 92, 'image_cropper_1619810543700.jpg', 3),
(137, 93, 'image_cropper_1619810937002.jpg', 3),
(137, 94, 'image_cropper_1619810927182.jpg', 3),
(137, 95, 'image_cropper_1619810942968.jpg', 3),
(138, 96, 'image_cropper_1619811248283.jpg', 3),
(138, 97, 'image_cropper_1619811262017.jpg', 3),
(138, 98, 'image_cropper_1619811255916.jpg', 3),
(141, 99, 'image_cropper_1619813046833.jpg', 3),
(141, 100, 'image_cropper_1619813169868.jpg', 3),
(141, 101, 'image_cropper_1619813052997.jpg', 3),
(141, 102, 'image_cropper_1619813042153.jpg', 3),
(141, 103, 'image_cropper_1619813271049.jpg', 3),
(142, 104, 'image_cropper_1619813799221.jpg', 3),
(142, 105, 'image_cropper_1619813795004.jpg', 3),
(143, 106, 'image_cropper_1619813919578.jpg', 3),
(143, 107, 'image_cropper_1619813915633.jpg', 3),
(143, 108, 'image_cropper_1619813938330.jpg', 3),
(143, 109, 'image_cropper_1619813933221.jpg', 3),
(143, 110, 'image_cropper_1619813928431.jpg', 3),
(143, 111, 'image_cropper_1619813923149.jpg', 3),
(144, 112, 'image_cropper_1619819564464.jpg', 3),
(145, 113, 'image_cropper_1620830072977.jpg', 3),
(153, 114, 'image_cropper_1621020800509.jpg', 3),
(154, 115, 'image_cropper_1621021009139.jpg', 3),
(155, 116, 'image_cropper_1621021099517.jpg', 3),
(157, 117, 'image_cropper_1622662620290.jpg', 3),
(158, 118, 'image_cropper_1622664335402.jpg', 3),
(158, 119, 'image_cropper_1622664340421.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idreserva` bigint NOT NULL,
  `idproducto` bigint NOT NULL,
  `idusuario` bigint NOT NULL,
  `idxglover` bigint NOT NULL,
  `fechainicio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estadoid` int NOT NULL,
  `fechafin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diasalquiler` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idreserva`, `idproducto`, `idusuario`, `idxglover`, `fechainicio`, `estadoid`, `fechafin`, `diasalquiler`) VALUES
(165, 31, 27, 2, '31/05/2021', 1, '01/06/2021', 1),
(166, 34, 2, 27, '31/05/2021', 1, '01/06/2021', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rolid` int NOT NULL,
  `roldescripcion` varchar(20) NOT NULL,
  `idestado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rolid`, `roldescripcion`, `idestado`) VALUES
(1, 'Cliente', 1),
(2, 'Xglover', 1),
(3, 'Administrador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `idsubcategoria` bigint NOT NULL,
  `subcategoria` varchar(30) NOT NULL,
  `estadoid` int NOT NULL,
  `ordenvisual` int NOT NULL,
  `idcategoria` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`idsubcategoria`, `subcategoria`, `estadoid`, `ordenvisual`, `idcategoria`) VALUES
(0, '', 1, 0, 0),
(1, 'Terrestres', 1, 1, 1),
(2, 'Aéreo', 1, 2, 1),
(3, 'Marítimo', 1, 3, 1),
(4, 'Equipo Médico', 1, 4, 2),
(5, 'Equipo Spa', 1, 5, 2),
(6, 'Industrial', 1, 6, 3),
(7, 'Agrícola', 1, 7, 3),
(8, 'Autoservicio', 1, 8, 3),
(9, 'Eléctricas', 1, 9, 3),
(10, 'Herramientas', 1, 10, 3),
(11, 'Hidráulica', 1, 11, 3),
(12, 'Térmicas', 1, 12, 3),
(23, 'Cámara', 1, 13, 5),
(24, 'Equipo de sonido', 1, 14, 5),
(25, 'Equipo de computo', 1, 15, 5),
(26, 'Video juego', 1, 16, 5),
(27, 'Producción de video', 1, 17, 5),
(28, 'Consola', 1, 18, 5),
(29, 'Electrodomésticos', 1, 19, 5),
(30, 'Extremo', 1, 20, 6),
(31, 'Terrestre', 1, 21, 6),
(32, 'Camping', 1, 22, 6),
(33, 'Acuático', 1, 23, 6),
(34, 'Mesa', 1, 24, 6),
(35, 'Mujer', 1, 25, 7),
(36, 'Hombre', 1, 26, 7),
(37, 'Niño', 1, 27, 7),
(38, 'Ficción', 1, 28, 8),
(39, 'Romance', 1, 29, 8),
(40, 'Religión', 1, 30, 8),
(41, 'Tecnología e Informática', 1, 31, 8),
(42, 'Historia', 1, 32, 8),
(43, 'Política', 1, 33, 8),
(44, 'Literatura', 1, 34, 8),
(45, 'Infantil', 1, 35, 8),
(46, 'Deportes', 1, 36, 8),
(47, 'Medicina', 1, 37, 8),
(48, 'Derecho', 1, 38, 8),
(49, 'Economía y Negocios', 1, 39, 8),
(50, 'Biografías', 1, 40, 8),
(51, 'Universitarios', 1, 41, 8),
(52, 'Escolares', 1, 42, 8),
(53, 'Ciencias Sociales', 1, 43, 8),
(54, 'Sala', 1, 44, 9),
(55, 'Dormitorio', 1, 45, 9),
(56, 'Cocina', 1, 46, 9),
(57, 'Varios', 1, 47, 9),
(58, 'Oficina', 1, 48, 9),
(59, 'Entretenimiento', 1, 49, 9),
(60, 'Viento', 1, 50, 10),
(61, 'Cuerda', 1, 51, 10),
(62, 'Percusión', 1, 52, 10),
(63, 'Ropa', 1, 53, 11),
(64, 'Equipaje', 1, 54, 11),
(65, 'Equipo para mascotas', 1, 55, 11),
(66, 'Industrial', 1, 56, 12),
(67, 'Doméstica', 1, 57, 12),
(68, 'Jardinería', 1, 58, 12),
(69, 'Automotriz', 1, 59, 12),
(70, 'Ferretera', 1, 60, 12),
(71, 'Entretenimientos', 1, 61, 12),
(76, 'Calculadora', 1, 62, 5),
(81, 'Robótica', 1, 63, 3),
(82, 'Ciencia', 1, 64, 8),
(83, 'Accesorios Inteligentes', 1, 65, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetacredito`
--

CREATE TABLE `tarjetacredito` (
  `idtarjetacredito` bigint NOT NULL,
  `idusuario` bigint NOT NULL,
  `numerotarjeta` varchar(30) NOT NULL,
  `fechavencimiento` varchar(20) NOT NULL,
  `cvv` varchar(10) NOT NULL,
  `Nombrepropietario` varchar(50) NOT NULL,
  `estadoid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tarjetacredito`
--

INSERT INTO `tarjetacredito` (`idtarjetacredito`, `idusuario`, `numerotarjeta`, `fechavencimiento`, `cvv`, `Nombrepropietario`, `estadoid`) VALUES
(34, 1, '5200557813577356', '0622', '112', '', 1),
(47, 2, '4000000000000416', '2401', '123', '', 1),
(48, 1, '4000000000005944', '2401', '123', 'Visa', 1),
(49, 1, '4147496000033668', '2305', '384', '', 1),
(50, 54, '123456789987654', '02/25', '123', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposubcategoria`
--

CREATE TABLE `tiposubcategoria` (
  `idtiposubcategoria` bigint NOT NULL,
  `tiposubcategoria` varchar(30) NOT NULL,
  `estadoid` int NOT NULL,
  `ordenvisual` int NOT NULL,
  `idsubcategoria` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tiposubcategoria`
--

INSERT INTO `tiposubcategoria` (`idtiposubcategoria`, `tiposubcategoria`, `estadoid`, `ordenvisual`, `idsubcategoria`) VALUES
(0, '', 1, 0, 0),
(2, 'Auto', 1, 1, 1),
(3, 'Moto', 1, 2, 1),
(4, 'Bus-Microbus', 1, 3, 1),
(5, 'Camión', 1, 4, 1),
(6, 'Casa Rodante', 1, 5, 1),
(7, 'Construcción', 1, 6, 1),
(8, 'Agricultura', 1, 7, 1),
(9, 'Bicicleta', 1, 8, 1),
(13, 'Helicóptero', 1, 9, 2),
(14, 'Avioneta', 1, 10, 2),
(15, 'Jet', 1, 11, 2),
(16, 'Dron', 1, 12, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariolikeproducto`
--

CREATE TABLE `usuariolikeproducto` (
  `idusuariolikeproducto` bigint NOT NULL,
  `idusuario` bigint NOT NULL,
  `idproducto` bigint NOT NULL,
  `estadolike` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuariolikeproducto`
--

INSERT INTO `usuariolikeproducto` (`idusuariolikeproducto`, `idusuario`, `idproducto`, `estadolike`) VALUES
(1, 1, 49, 0),
(6, 1, 72, 0),
(7, 1, 31, 0),
(8, 1, 34, 0),
(9, 1, 51, 0),
(11, 2, 49, 0),
(12, 2, 72, 1),
(13, 1, 119, 0),
(14, 1, 88, 1),
(15, 1, 74, 0),
(16, 1, 93, 0),
(17, 1, 84, 0),
(18, 1, 71, 0),
(19, 1, 82, 0),
(20, 1, 75, 0),
(21, 1, 67, 0),
(22, 1, 76, 0),
(23, 1, 79, 0),
(24, 1, 52, 0),
(25, 1, 92, 0),
(26, 1, 80, 1),
(27, 54, 75, 1),
(28, 1, 66, 1),
(29, 1, 87, 1),
(30, 1, 90, 0),
(31, 1, 89, 1),
(32, 1, 81, 0),
(33, 1, 83, 0),
(34, 2, 79, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nombres` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fechanacimiento` date NOT NULL,
  `telefonocel` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `usuariosid` bigint NOT NULL,
  `fotodocumento` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fotoperfil` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `idfaceid` bigint NOT NULL,
  `estadoid` int NOT NULL,
  `rol` int NOT NULL,
  `contrasena` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rating` float NOT NULL,
  `registrousuario` date NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `iddepartamento` int NOT NULL,
  `idmunicipio` int NOT NULL,
  `idzona` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`nombres`, `apellidos`, `sexo`, `fechanacimiento`, `telefonocel`, `correo`, `usuariosid`, `fotodocumento`, `fotoperfil`, `idfaceid`, `estadoid`, `rol`, `contrasena`, `rating`, `registrousuario`, `direccion`, `iddepartamento`, `idmunicipio`, `idzona`) VALUES
('Rodolfo', 'Barrientos', '2', '1991-02-02', '2', 'xgtester337@gmail.com', 1, 'Aun no', 'IMG_1617027667844.png', 2, 2, 2, '1234', 3, '2021-11-25', 'aun no2', 2, 2, 2),
('Diego', 'Xglover2', '1', '1991-01-02', '222222', 'prueba@gmail.com', 2, 'Aun no', 'IMG_1617027667761.png', 2, 1, 1, '1234', 4, '2015-07-16', '123', 1, 1, 1),
('Pedro', 'Perez', 'M', '2010-10-10', '12345678', 'test@gmail.com', 17, '', '', 1, 1, 1, '1234', 3, '2021-04-06', '', 1, 1, 1),
('Tito', 'Pelaez', 'N', '1969-01-01', '12345678', 'helado@gmail.com', 24, '', 'e67b953d-6a22-4de6-8ee9-71a4fabbf9491268369769.jpg', 0, 0, 1, '1234', 0, '2021-04-06', '', 1, 1, 1),
('Chepe', 'Lopez', 'N', '1969-01-01', '12345678', 'lapiz@gmail.com', 27, '', '8fe3b346-642a-43e8-8beb-7878014bf0791609859764.jpg', 0, 0, 1, '1234', 0, '2021-04-06', '', 1, 1, 1),
('roul', 'aws', 'N', '1969-01-01', '789456', 'toto@gg.com', 29, '', '04f34c90-1ac6-4a3f-8a6e-a80548b8c2771877705174.jpg', 0, 1, 1, '1234', 0, '2021-04-06', '', 1, 1, 1),
('cesar', 'm', 'N', '1969-01-01', '123', 'cesarguillermo@yahoo.com', 53, '', '', 0, 1, 1, '1234', 0, '2021-05-25', '1', 1, 1, 1),
('jose', 'alfaro', 'N', '1969-01-01', '42219060', 'josecarlosalfarod@gmail.com', 54, '', '', 0, 1, 1, '1234', 0, '2021-05-25', 'Guatemala', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `idzona` int NOT NULL,
  `zona` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`idzona`, `zona`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, '13'),
(14, '14'),
(15, '15'),
(16, '16'),
(17, '17'),
(18, '18'),
(19, '19'),
(20, '20'),
(21, '21'),
(22, '22'),
(23, '23'),
(24, '24'),
(25, '25'),
(26, 'No Aplica');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `orden_unique` (`ordenvisual`),
  ADD KEY `FK_CategoriasEstado` (`estadoid`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chatid`);

--
-- Indices de la tabla `chat_login_details`
--
ALTER TABLE `chat_login_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`userid`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`iddepartamento`),
  ADD KEY `idpais` (`idpais`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `horariosdelivery`
--
ALTER TABLE `horariosdelivery`
  ADD PRIMARY KEY (`idrango`),
  ADD KEY `estadoid` (`estadoid`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`idmunicipio`),
  ADD KEY `Foreign_key01` (`iddepartamento`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idpais`),
  ADD UNIQUE KEY `pais` (`pais`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `FK_productoestado` (`estadoid`),
  ADD KEY `FK_ProductoUsuario` (`usuarioid`),
  ADD KEY `departamentogeografico` (`departamentogeografico`),
  ADD KEY `municipio` (`municipio`),
  ADD KEY `zona` (`zona`);

--
-- Indices de la tabla `productocategorias`
--
ALTER TABLE `productocategorias`
  ADD PRIMARY KEY (`idproductocategorias`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idcategoria` (`idcategoria`),
  ADD KEY `idsubcategoria` (`idsubcategoria`),
  ADD KEY `idtipo` (`idtipo`);

--
-- Indices de la tabla `productofotos`
--
ALTER TABLE `productofotos`
  ADD PRIMARY KEY (`idfoto`),
  ADD KEY `FK_FotoProductos` (`idproducto`),
  ADD KEY `FK_ProductoFotosEstado` (`estadoid`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idreserva`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `estadoid` (`estadoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rolid`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`idsubcategoria`),
  ADD UNIQUE KEY `surorden_unique` (`ordenvisual`),
  ADD KEY `FK_SubCatsEstado` (`estadoid`),
  ADD KEY `FK_SubCatCats` (`idcategoria`);

--
-- Indices de la tabla `tarjetacredito`
--
ALTER TABLE `tarjetacredito`
  ADD PRIMARY KEY (`idtarjetacredito`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `estadoid` (`estadoid`);

--
-- Indices de la tabla `tiposubcategoria`
--
ALTER TABLE `tiposubcategoria`
  ADD PRIMARY KEY (`idtiposubcategoria`),
  ADD UNIQUE KEY `tiporoden_unique` (`ordenvisual`),
  ADD KEY `FK_TipoEstado` (`estadoid`),
  ADD KEY `FK_TipoSubCatTipo` (`idsubcategoria`);

--
-- Indices de la tabla `usuariolikeproducto`
--
ALTER TABLE `usuariolikeproducto`
  ADD PRIMARY KEY (`idusuariolikeproducto`),
  ADD KEY `FK_ULPUsuario` (`idusuario`),
  ADD KEY `FK_ULPProducto` (`idproducto`),
  ADD KEY `estadolike` (`estadolike`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuariosid`),
  ADD KEY `FK_UsuariosEstado` (`estadoid`),
  ADD KEY `iddepartamento` (`iddepartamento`),
  ADD KEY `idmunicipio` (`idmunicipio`),
  ADD KEY `idzona` (`idzona`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`idzona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `chatid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `chat_login_details`
--
ALTER TABLE `chat_login_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `horariosdelivery`
--
ALTER TABLE `horariosdelivery`
  MODIFY `idrango` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
