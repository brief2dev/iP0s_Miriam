-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-04-2022 a las 19:57:39
-- Versión del servidor: 8.0.28
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ModaMiriam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Abonos`
--

CREATE TABLE `Abonos` (
  `ID_Abono` int NOT NULL,
  `ID_Venta` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo_Ant` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Saldo_Pend` double DEFAULT NULL,
  `Estatus` int DEFAULT NULL COMMENT '1=Fianlizado, 0 Pendiente',
  `ID_Medio` int DEFAULT NULL COMMENT '1=Venta,2=Credito,3=Apartado',
  `Fecha_Final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Abonos`
--

INSERT INTO `Abonos` (`ID_Abono`, `ID_Venta`, `ID_Cliente`, `Fecha`, `Saldo_Ant`, `Abono`, `Saldo_Pend`, `Estatus`, `ID_Medio`, `Fecha_Final`) VALUES
(1, 1, 3, '2022-03-30 18:13:01', 633, 0, 133, 0, 2, '2022-05-02'),
(2, 3, 6, '2022-04-06 09:51:31', 330, 0, 30, 0, 2, '2022-05-09'),
(3, 4, 6, '2022-04-06 10:27:36', 403, 0, 403, 0, 2, '2022-05-09'),
(4, 5, 7, '2022-04-06 10:46:59', 1169, 100, 0, 1, 3, '2022-05-06'),
(5, 8, 8, '2022-04-07 11:04:23', 229, 0, 229, 0, 2, '2022-05-10'),
(6, 9, 9, '2022-04-07 16:19:07', 389, 0, 0, 1, 2, '2022-05-10'),
(7, 14, 10, '2022-04-08 12:00:21', 748, 0, 48, 0, 2, '2022-05-11'),
(8, 16, 11, '2022-04-08 14:29:02', 360, 0, 0, 1, 3, '2022-05-08'),
(9, 17, 12, '2022-04-09 10:12:35', 480, 0, 480, 0, 2, '2022-05-12'),
(10, 18, 13, '2022-04-09 12:43:03', 165, 0, 165, 0, 2, '2022-05-12'),
(11, 20, 15, '2022-04-09 16:17:02', 679, 0, 79, 0, 2, '2022-05-12'),
(12, 21, 16, '2022-04-09 16:32:11', 619, 0, 619, 0, 2, '2022-05-12'),
(14, 28, 20, '2022-04-11 16:26:06', 625, 0, 625, 0, 2, '2022-05-14'),
(15, 29, 21, '2022-04-11 18:06:48', 360, 0, 160, 0, 2, '2022-05-14'),
(16, 34, 17, '2022-04-12 17:54:23', 777, 0, 777, 0, 2, '2022-05-15'),
(17, 37, 22, '2022-04-13 11:13:03', 400, 0, 300, 0, 3, '2022-05-13'),
(18, 38, 23, '2022-04-13 12:47:55', 310, 0, 310, 0, 2, '2022-05-16'),
(19, 40, 5, '2022-04-13 19:19:56', 1387, 0, 0, 1, 2, '2022-05-16'),
(20, 41, 24, '2022-04-13 19:29:15', 1533, 0, 1533, 0, 2, '2022-05-16'),
(21, 42, 24, '2022-04-13 19:44:30', 1387, 0, 1387, 0, 2, '2022-05-16'),
(22, 44, 25, '2022-04-14 09:35:00', 1500, 0, 0, 0, 2, '2022-05-17'),
(23, 45, 26, '2022-04-14 11:09:09', 630, 0, 630, 0, 2, '2022-05-17'),
(24, 48, 27, '2022-04-14 15:41:11', 530, 0, 0, 1, 3, '2022-05-14'),
(25, 49, 17, '2022-04-14 16:21:23', 250, 0, 250, 0, 2, '2022-05-17'),
(26, 51, 28, '2022-04-14 18:22:25', 1295, 0, 915, 0, 2, '2022-05-17'),
(27, 52, 28, '2022-04-14 18:35:00', 380, 0, 0, 0, 2, '2022-05-17'),
(28, 53, 28, '2022-04-14 18:37:48', 266, 0, 266, 0, 2, '2022-05-17'),
(29, 56, 29, '2022-04-15 11:41:54', 340, 0, 240, 0, 3, '2022-05-15'),
(30, 58, 13, '2022-04-15 11:45:38', 119, 0, 119, 0, 2, '2022-05-18'),
(31, 62, 30, '2022-04-16 18:25:46', 1255, 0, 0, 1, 2, '2022-05-19'),
(32, 64, 31, '2022-04-17 10:27:43', 1160, 0, 980, 0, 2, '2022-05-20'),
(33, 66, 15, '2022-04-17 12:48:39', 350, 0, 0, 0, 2, '2022-05-20'),
(34, 67, 33, '2022-04-18 09:26:52', 830, 0, 330, 0, 3, '2022-05-18'),
(35, 69, 35, '2022-04-19 11:48:00', 2090, 0, 1040, 0, 2, '2022-05-22'),
(36, 70, 35, '2022-04-19 11:56:58', 220, 0, 220, 0, 2, '2022-05-22'),
(37, 71, 36, '2022-04-19 12:57:48', 1160, 0, 1160, 0, 2, '2022-05-22'),
(38, 72, 37, '2022-04-19 13:32:28', 1960, 0, 1960, 0, 2, '2022-05-22'),
(39, 74, 30, '2022-04-19 18:54:59', 500, 0, 0, 1, 2, '2022-05-22'),
(40, 75, 30, '2022-04-19 18:57:30', 520, 0, 0, 1, 2, '2022-05-22'),
(41, 82, 38, '2022-04-21 13:04:01', 680, 0, 480, 0, 3, '2022-05-21'),
(42, 83, 10, '2022-04-22 11:58:22', 400, 0, 400, 0, 2, '2022-05-25'),
(43, 91, 40, '2022-04-24 11:42:30', 360, 0, 260, 0, 3, '2022-05-24'),
(44, 92, 41, '2022-04-24 11:45:20', 798, 0, 359, 0, 2, '2022-05-27'),
(45, 94, 41, '2022-04-25 10:33:23', 438, 0, 438, 0, 2, '2022-05-28'),
(46, 100, 42, '2022-04-27 10:32:33', 350, 0, 250, 0, 3, '2022-05-27'),
(49, 112, 44, '2022-04-29 14:12:30', 285, 0, 235, 0, 3, '2022-05-29'),
(50, 114, 30, '2022-04-29 14:24:10', 430, 0, 430, 0, 2, '2022-06-01'),
(51, 115, 43, '2022-04-29 14:34:42', 798, 0, 548, 0, 2, '2022-06-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja`
--

CREATE TABLE `Caja` (
  `ID_Caja` int NOT NULL,
  `ID_Personal` int DEFAULT NULL,
  `ID_Caja_T` int DEFAULT NULL,
  `Descripcion` varchar(160) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Monto` double NOT NULL,
  `Abono` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Tarjeta` decimal(8,2) DEFAULT NULL,
  `Gastos` decimal(8,2) DEFAULT NULL,
  `S_Inicial` decimal(8,2) DEFAULT NULL,
  `T_Ventas` int DEFAULT NULL,
  `Comprobante` mediumblob,
  `Saldo` decimal(10,0) DEFAULT NULL,
  `Cort` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Saldo_Inicial` int DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Tip` int DEFAULT NULL COMMENT '1=efectivo 2=banco',
  `idcorte` int DEFAULT NULL,
  `ms` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Caja`
--

INSERT INTO `Caja` (`ID_Caja`, `ID_Personal`, `ID_Caja_T`, `Descripcion`, `Fecha`, `Monto`, `Abono`, `Efectivo`, `Tarjeta`, `Gastos`, `S_Inicial`, `T_Ventas`, `Comprobante`, `Saldo`, `Cort`, `Saldo_Inicial`, `Tip`, `idcorte`, `ms`) VALUES
(1, 3, 1, 'CAMBIO', '2022-04-02 18:24:20', 450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 2, NULL),
(2, 3, 2, 'Retito y corte de caja ', '2022-04-02 18:25:02', 0, '0.00', '679.00', '0.00', '0.00', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 'SI'),
(3, 4, 1, 'Abono del Credito con folio: 2 del Cliente: KARINA', '2022-04-06 09:59:04', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 5, NULL),
(4, 4, 1, 'CANBIO CAJA', '2022-04-06 10:37:33', 572, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 5, NULL),
(5, 3, 2, 'Retito y corte de caja ', '2022-04-06 19:54:49', 100, '100.00', '0.00', '0.00', '0.00', NULL, 0, NULL, '100', 1, 0, NULL, NULL, 'SI'),
(6, 3, 1, 'CANBIO', '2022-04-07 09:11:14', 568, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 7, NULL),
(7, 3, 2, 'Retito y corte de caja ', '2022-04-07 20:03:36', 2300, '0.00', '2300.00', '0.00', '0.00', NULL, 5, NULL, '2300', 1, 0, NULL, NULL, 'SI'),
(8, 3, 1, 'Abono del Credito con folio: 8 del Cliente: LIGIA', '2022-04-08 14:30:05', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 9, NULL),
(9, 3, 2, 'Retito y corte de caja ', '2022-04-08 19:35:04', 500, '150.00', '350.00', '0.00', '0.00', NULL, 1, NULL, '500', 1, 0, NULL, NULL, 'SI'),
(10, 4, 1, 'CAMBIO', '2022-04-09 16:02:53', 854, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 13, NULL),
(11, 4, 2, 'CARNE ', '2022-04-09 16:03:18', 188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 13, NULL),
(12, 4, 2, 'TORTILLA', '2022-04-09 16:03:29', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 13, NULL),
(13, 3, 2, 'Retito y corte de caja ', '2022-04-09 20:07:04', 1054, '0.00', '1249.00', '0.00', '195.00', NULL, 3, NULL, '1054', 1, 0, NULL, NULL, 'SI'),
(14, 4, 1, 'Abono del Credito con folio: 11 del Cliente: JAZMIN', '2022-04-10 11:01:25', 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 15, NULL),
(15, 3, 2, 'Retito y corte de caja ', '2022-04-11 12:05:24', 1920, '300.00', '1620.00', '0.00', '0.00', NULL, 3, NULL, '1920', 1, 0, NULL, NULL, 'SI'),
(16, 3, 1, 'CAMBIO', '2022-04-11 12:06:47', 137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 20, NULL),
(17, 4, 1, 'Abono del Credito con folio: 15 del Cliente: ANA ', '2022-04-11 18:07:10', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 20, NULL),
(18, 4, 2, 'PAGO DE CALZADO  DE WISS', '2022-04-11 18:17:56', 469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 20, NULL),
(19, 4, 1, 'Liquidación del Credito del Cliente: TERESA ', '2022-04-11 19:38:34', 1069, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 20, NULL),
(20, 3, 2, 'Retito y corte de caja ', '2022-04-11 20:08:09', 800, '1269.00', '0.00', '0.00', '469.00', NULL, 0, NULL, '800', 1, 0, NULL, NULL, 'SI'),
(21, 4, 1, 'CAMBIO', '2022-04-12 18:35:49', 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 24, NULL),
(22, 4, 2, 'MIRIAM', '2022-04-12 18:36:29', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 24, NULL),
(23, 4, 2, 'CARIDAD', '2022-04-12 18:36:39', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 24, NULL),
(24, 3, 2, 'Retito y corte de caja ', '2022-04-12 20:33:50', 2177, '0.00', '2379.00', '0.00', '202.00', NULL, 4, NULL, '2177', 1, 0, NULL, NULL, 'SI'),
(25, 3, 1, 'Abono del Credito con folio: 17 del Cliente: VERO', '2022-04-13 11:14:46', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 26, NULL),
(26, 3, 2, 'Retito y corte de caja ', '2022-04-13 20:24:40', 1270, '100.00', '1170.00', '0.00', '0.00', NULL, 3, NULL, '1270', 1, 0, NULL, NULL, 'SI'),
(27, 3, 2, 'Retito y corte de caja ', '2022-04-13 20:24:49', 0, '0.00', '0.00', '0.00', '0.00', NULL, 0, NULL, '0', 1, 0, NULL, NULL, 'SI'),
(28, 4, 1, 'cambio', '2022-04-14 10:23:50', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 33, NULL),
(29, 4, 1, 'Abono del Credito con folio: 24 del Cliente: URIS DEL CARMEN', '2022-04-14 15:41:33', 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 33, NULL),
(30, 4, 1, 'CAMBIO', '2022-04-14 17:32:10', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 1, 33, NULL),
(31, 4, 2, 'TORTILLA', '2022-04-14 17:32:29', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 33, NULL),
(32, 3, 1, 'Liquidación del Credito del Cliente: URIS DEL CARMEN', '2022-04-14 19:02:15', 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 33, NULL),
(33, 3, 2, 'Retito y corte de caja ', '2022-04-14 20:03:26', 2296, '560.00', '1743.00', '0.00', '7.00', NULL, 5, NULL, '2296', 1, 0, NULL, NULL, 'SI'),
(34, 3, 1, 'Abono del Credito con folio: 29 del Cliente: SELENE', '2022-04-15 11:42:17', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 35, NULL),
(35, 3, 2, 'Retito y corte de caja ', '2022-04-15 14:11:51', 219, '100.00', '119.00', '0.00', '0.00', NULL, 1, NULL, '219', 1, 0, NULL, NULL, 'SI'),
(36, 3, 1, 'cambio', '2022-04-16 09:28:00', 465, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 1, 41, NULL),
(37, 4, 2, 'MOTOTAXI MICHO', '2022-04-16 13:26:42', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 41, NULL),
(38, 4, 2, 'FRUTERIA', '2022-04-16 13:26:53', 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 41, NULL),
(39, 4, 2, 'AGUA PURIFICADA ', '2022-04-16 15:41:13', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, 0, 41, NULL),
(40, 4, 1, 'Abono del Credito con folio: 31 del Cliente: GEORGINA ', '2022-04-16 18:26:13', 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 41, NULL),
(41, 3, 2, 'Retito y corte de caja ', '2022-04-16 18:31:54', 2371, '1465.00', '1110.00', '0.00', '204.00', NULL, 3, NULL, '2371', 1, 0, NULL, NULL, 'SI'),
(42, 4, 1, 'Abono del Credito con folio: 32 del Cliente: LUCY ARIANE', '2022-04-17 10:29:49', 180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 45, NULL),
(43, 4, 1, 'Liquidación del Credito del Cliente: LIGIA', '2022-04-17 12:16:34', 210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 45, NULL),
(44, 4, 1, 'Abono del Credito con folio: 11 del Cliente: JAZMIN', '2022-04-17 12:40:03', 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 45, NULL),
(45, 3, 2, 'Retito y corte de caja ', '2022-04-17 17:18:37', 1413.7, '690.00', '723.70', '0.00', '0.00', NULL, 2, NULL, '1414', 1, 0, NULL, NULL, 'SI'),
(46, 4, 1, 'Abono del Credito con folio: 34 del Cliente: KARLA', '2022-04-18 09:27:06', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 48, NULL),
(47, 4, 1, 'CAMBIO', '2022-04-18 09:34:02', 572, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 48, NULL),
(48, 3, 2, 'Retito y corte de caja ', '2022-04-18 20:44:37', 200, '200.00', '0.00', '0.00', '0.00', NULL, 0, NULL, '200', 1, 0, NULL, NULL, 'SI'),
(49, 4, 1, 'Abono del Credito con folio: 2 del Cliente: KARINA', '2022-04-19 11:12:07', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 53, NULL),
(50, 3, 1, 'CAMBIO', '2022-04-19 17:02:58', 221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 53, NULL),
(51, 4, 1, 'Liquidación del Credito del Cliente: GEORGINA ', '2022-04-19 18:52:42', 255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 53, NULL),
(52, 4, 1, 'Liquidación del Credito del Cliente: GEORGINA ', '2022-04-19 18:55:44', 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 53, NULL),
(53, 3, 2, 'Retito y corte de caja ', '2022-04-19 20:22:29', 1765, '955.00', '810.00', '0.00', '0.00', NULL, 2, NULL, '1765', 1, 0, NULL, NULL, 'SI'),
(54, 4, 1, 'Abono del Credito con folio: 7 del Cliente: MARIELA', '2022-04-20 10:48:22', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 55, NULL),
(55, 3, 2, 'Retito y corte de caja ', '2022-04-20 23:21:02', 1156, '200.00', '956.00', '0.00', '0.00', NULL, 5, NULL, '1156', 1, 0, NULL, NULL, 'SI'),
(56, 4, 1, 'CAMBIO', '2022-04-21 09:34:09', 678, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 58, NULL),
(57, 3, 1, 'Abono del Credito con folio: 41 del Cliente: SANDRA', '2022-04-21 13:05:43', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 58, NULL),
(58, 3, 2, 'Retito y corte de caja ', '2022-04-21 20:02:52', 385, '100.00', '285.00', '0.00', '0.00', NULL, 1, NULL, '385', 1, 0, NULL, NULL, 'SI'),
(59, 3, 2, 'Retito y corte de caja ', '2022-04-21 20:09:36', 0, '0.00', '0.00', '0.00', '0.00', NULL, 0, NULL, '0', 1, 0, NULL, NULL, 'SI'),
(60, 3, 2, 'Retito y corte de caja ', '2022-04-21 20:10:15', 0, '0.00', '0.00', '0.00', '0.00', NULL, 0, NULL, '0', 1, 0, NULL, NULL, 'SI'),
(61, 4, 1, 'Abono del Credito con folio: 7 del Cliente: MARIELA', '2022-04-22 11:45:16', 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 63, NULL),
(62, 4, 1, 'CAMBIO\r\n', '2022-04-22 12:02:59', 258, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 63, NULL),
(63, 3, 2, 'Retito y corte de caja ', '2022-04-22 20:31:59', 1624, '500.00', '1124.00', '0.00', '0.00', NULL, 2, NULL, '1624', 1, 0, NULL, NULL, 'SI'),
(64, 4, 1, 'CAMBIO', '2022-04-23 09:55:50', 456, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 65, NULL),
(65, 3, 2, 'Retito y corte de caja ', '2022-04-23 19:54:06', 2419, '0.00', '2419.00', '0.00', '0.00', NULL, 4, NULL, '2419', 1, 0, NULL, NULL, 'SI'),
(66, 4, 1, 'Abono del Credito con folio: 43 del Cliente: LEYDI DEL CARMEN', '2022-04-24 11:42:48', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 67, NULL),
(67, 3, 2, 'Retito y corte de caja ', '2022-04-24 14:19:06', 1249, '100.00', '1149.00', '0.00', '0.00', NULL, 2, NULL, '1249', 1, 0, NULL, NULL, 'SI'),
(68, 4, 1, 'Abono del Credito con folio: 34 del Cliente: KARLA', '2022-04-25 10:19:04', 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 69, NULL),
(69, 3, 2, 'Retito y corte de caja ', '2022-04-25 20:29:18', 1095, '300.00', '795.00', '0.00', '0.00', NULL, 2, NULL, '1095', 1, 0, NULL, NULL, 'SI'),
(70, 4, 1, 'CAMBIO', '2022-04-26 09:11:16', 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1, 1, 71, NULL),
(71, 3, 2, 'Retito y corte de caja ', '2022-04-26 20:15:27', 684, '0.00', '684.00', '0.00', '0.00', NULL, 3, NULL, '684', 1, 0, NULL, NULL, 'SI'),
(72, 4, 1, 'Abono del Credito con folio: 41 del Cliente: SANDRA', '2022-04-27 10:25:43', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 75, NULL),
(73, 4, 1, 'Abono del Credito con folio: 46 del Cliente: MARIA YOLANDA ', '2022-04-27 10:32:47', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 75, NULL),
(74, 3, 1, 'Abono del Credito con folio: 1 del Cliente: JUANI ', '2022-04-27 11:29:20', 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 75, NULL),
(75, 3, 2, 'Retito y corte de caja ', '2022-04-27 20:02:54', 1218, '700.00', '518.00', '0.00', '0.00', NULL, 3, NULL, '1218', 1, 0, NULL, NULL, 'SI'),
(76, 3, 2, 'Retito y corte de caja ', '2022-04-28 20:18:54', 0, '0.00', '0.00', '0.00', '0.00', NULL, 0, NULL, '0', 1, 0, NULL, NULL, 'SI'),
(79, 3, 1, 'Liquidación del Credito del Cliente: DALIA ', '2022-04-29 13:07:25', 389, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(80, 3, 1, 'Abono del Credito con folio: 49 del Cliente: SANDY ', '2022-04-29 14:13:33', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(81, 3, 1, 'Liquidación del Credito del Cliente: GEORGINA ', '2022-04-29 14:20:13', 520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(82, 3, 1, 'Abono del Credito con folio: 51 del Cliente: CARMINIA  ASUNCION', '2022-04-29 14:35:11', 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL),
(83, 3, 1, 'cambio', '2022-04-29 14:45:27', 411, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 1, 1, NULL, NULL),
(84, 3, 2, 'carne', '2022-04-29 14:46:34', 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja_T`
--

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int NOT NULL,
  `Motivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Caja_T`
--

INSERT INTO `Caja_T` (`ID_Caja_T`, `Motivo`) VALUES
(1, 'Ingreso'),
(2, 'Retiro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `ID_Categoria` int NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Importado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`ID_Categoria`, `Nombre`, `Descripcion`, `Importado`) VALUES
(1, 'BLUSAS', '', NULL),
(2, 'PANTALONES DAMA ', '', NULL),
(3, 'PERFUMES', '', NULL),
(4, 'EXFOLIANTE ', '', NULL),
(5, 'ACEITE ', '', NULL),
(6, 'AGUA MICELAR ', '', NULL),
(7, 'RIMEL', '', NULL),
(8, 'MAQUILLAJE ', '', NULL),
(9, 'CALZADO DAMA ', '', NULL),
(10, 'CALZADO CABALLERO ', '', NULL),
(11, 'CALZADO NIÑOS ', '', NULL),
(12, 'AROMATIZANTES ', '', NULL),
(13, 'REPUESTO AROMATIZANTE ', '', NULL),
(14, 'VESTIDOS ', '', NULL),
(15, 'SHORT DAMA ', '', NULL),
(16, 'SHORT CABALLERO', '', NULL),
(17, 'PANTIS ', '', NULL),
(18, 'PANTALON CABALLERO ', '', NULL),
(19, 'SUPLEMENTO ALIMENTICIO', '', NULL),
(20, 'FALDA SHORT', 'MEZCLILLA', NULL),
(21, 'CAPRI', 'MEZCLILLA ', NULL),
(22, 'BERMUDA', 'MEZCLILLA', NULL),
(23, 'PESQUERO', '', NULL),
(24, 'PANTALON ZULE', 'AZUL MARINO', NULL),
(25, 'JUMPER', '', NULL),
(26, 'PALAZZO', '', NULL),
(27, 'UTENCILIO DE HOGAR', '', NULL),
(28, 'CREMA', '', NULL),
(29, 'TRATAMIENTO PARA EL CABELLO', '', NULL),
(30, 'BODY', '', NULL),
(31, 'SACOS', '', NULL),
(32, 'FALDA ', '', NULL),
(33, 'CORCEL ', '', NULL),
(34, 'BRASIERE', '', NULL),
(35, 'BLUMER', '', NULL),
(36, 'TRUSAS', '', NULL),
(37, 'TRAJE DE BAÑO', '', NULL),
(38, 'HOBEROL ', '', NULL),
(39, 'OFERTA', '', NULL),
(40, 'TOP', '', NULL),
(41, 'BABYDOLL', '', NULL),
(42, 'MUTUALISTA', 'PAGOS DE MUTUALISTA', NULL),
(43, 'SHOR ,MAYON,PANTALON,CALZADO', '', NULL),
(44, '  SHORT', '', NULL),
(45, 'MAYON', '', NULL),
(46, 'CALZADO', '', NULL),
(47, 'PANTALON', '', NULL),
(48, 'PLAYERA', '', NULL),
(49, 'CONJUNTO', '', NULL),
(50, 'CAMISA', '', NULL),
(51, 'BOXER', '', NULL),
(52, 'SPORT', '', NULL),
(53, 'PIJAMA', '', NULL),
(54, 'TRUZA', '', NULL),
(55, 'SUDADERAS', '', NULL),
(56, 'CHAMARRAS', '', NULL),
(57, 'SUETER ', '', NULL),
(58, 'MASCARILLA', '', NULL),
(59, 'POLVO DE ARROZ', '', NULL),
(60, 'BIFASICO', '', NULL),
(61, 'MATIZADOR', '', NULL),
(62, 'DESMAQUILLANTE', '', NULL),
(63, 'LAPIZ ', '', NULL),
(64, 'TONICO', '', NULL),
(65, 'DESODORANTE', '', NULL),
(66, 'DELINEADOR', '', NULL),
(67, 'SHAMPOO MATIZADOR', '', NULL),
(68, 'SHAMPOO', '', NULL),
(69, 'ACONDICIONADOR', '', NULL),
(70, 'SUERO', '', NULL),
(71, 'GEL', '', NULL),
(72, 'OLEO', '', NULL),
(73, 'REPELENTE', '', NULL),
(74, 'JABON', '', NULL),
(75, 'CEPILLO', '', NULL),
(76, ' CORTA UñA', '', NULL),
(77, 'TAJADOR', '', NULL),
(78, 'PAPELILLOS', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `ID_Cliente` int NOT NULL,
  `Nombres` varchar(120) NOT NULL,
  `Apellidos` varchar(120) DEFAULT NULL,
  `Correo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `CP` int DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `visible` int DEFAULT '1',
  `Credito` double DEFAULT NULL COMMENT '$$$',
  `Premium` int DEFAULT NULL COMMENT '0=NO,1=SI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`ID_Cliente`, `Nombres`, `Apellidos`, `Correo`, `Telefono`, `Direccion`, `CP`, `Fecha_Registro`, `visible`, `Credito`, `Premium`) VALUES
(3, 'JUANI ', 'RAMON CAMARA', 'JUANIRAMON', '9971027146', 'C.', NULL, '2022-03-30', 1, 2867, 1),
(4, 'IVAN', 'ROJAS', 'AAAA', '9971018985', 'CALLE 35 22A Y 24', NULL, '2022-03-31', 1, 0, 0),
(5, 'VENTA', 'GENERAL', 'ASD', '997000001', 'TICUL, CENTRO', NULL, '2022-03-31', 1, NULL, 0),
(6, 'KARINA', 'EK CASTRO', 'AAAA', '9971179241', 'C.', NULL, '2022-03-31', 1, 2567, 1),
(7, 'TERESA ', 'SABIDO', 'TERESA', '9971027542', 'PETO', NULL, '2022-04-06', 1, 1069, 0),
(8, 'MANUELA', 'SOSA', 'MAESTRA ', '9999', 'C.', NULL, '2022-04-07', 1, 2771, 1),
(9, 'DALIA ', 'PEBA', 'DALIAPEBA', '9971130083', 'TINAJAS.', NULL, '2022-04-07', 1, 2000, 1),
(10, 'MARIELA', 'MAGAÑA VALENCIA ', 'MARIELA ', '9993867018', 'TICUL', NULL, '2022-04-08', 1, 2552, 1),
(11, 'LIGIA', 'CASTELLANOS LOPEZ', 'LIGIA', '9991905818', 'CALLE 19 ENTRE 14 Y 16 COL SAN JUAN ', NULL, '2022-04-08', 1, 360, 0),
(12, 'ROSI', 'PERALTA BE', 'ROSI', '9971029598', 'CALLE 30 ENTRE 15 Y 13 MEJORADA', NULL, '2022-04-09', 1, 2520, 1),
(13, 'GRISELDA', 'MAGAÑA GARMA', 'GRISELDA', '9993308268', 'C.', NULL, '2022-04-09', 1, 1716, 1),
(14, 'MIRIAM', 'CHI CASTRO', 'MIRIAM', '', 'C', NULL, '2022-04-09', 1, 0, 0),
(15, 'JAZMIN', 'SOSA', 'JAZMIN', '9971079499', 'PLAZITA', NULL, '2022-04-09', 1, 1921, 1),
(16, 'BETY ', 'PINIA', 'BETY PIÑA', '', 'C.', NULL, '2022-04-09', 1, 2381, 1),
(17, 'PATRICIA ', 'GONZALEZ CHI ', 'PATY ', '997', 'C. 24', NULL, '2022-04-11', 1, 1973, 1),
(19, 'FATIMA ', 'GONZALEZ CHI ', 'HIJA DE DOÑA MIRIAM', '.', 'TICUL', NULL, '2022-04-11', 1, 3000, 1),
(20, 'MIRNA', 'MATA', 'MIRNA MATA', '9971075001', 'TICUL', NULL, '2022-04-11', 1, 2375, 1),
(21, 'ANA ', 'PACHECO ', 'ANITA PACHECO', '9971320445', 'TINAJAS.', NULL, '2022-04-11', 1, 2840, 1),
(22, 'VERO', 'GAMBOA CHAN', 'VERO', '9971343575', 'CALLE 19 ENTRE 44 Y 46 SAN JOAQUIN', NULL, '2022-04-13', 1, 100, 0),
(23, 'YAZMIN ', 'KU CEJIN', 'YAZMIN', '9971230786', 'DZAN', NULL, '2022-04-13', 1, 1690, 1),
(24, 'CRISTINA', 'POOT AVILA', 'CRISTINA', '9995456270', '38 ENTRE 11 Y 13', NULL, '2022-04-13', 1, 1080, 1),
(25, 'MIRIAM', 'CHI MUTUALISTA', '', '', 'TICUL', NULL, '2022-04-14', 1, 1500, 1),
(26, 'ROSARIO', 'SANCHEZ PERERA', '', '9971297294', 'CALLE 24 ENTRE 29 Y 31 SANTIAGO', NULL, '2022-04-14', 1, 1370, 1),
(27, 'URIS DEL CARMEN', 'LOPEZ DE DIOS', '', '9934611418', 'TICUL', NULL, '2022-04-14', 1, 530, 0),
(28, 'SUSANA', 'QUINTAL', '', '9971383688', 'TICUL', NULL, '2022-04-14', 1, 1819, 1),
(29, 'SELENE', 'AKE CHAN', '', '9971409410', 'CALLE 34 ENTRE 23 Y 25 SACALUM', NULL, '2022-04-15', 1, 100, 0),
(30, 'GEORGINA ', 'CEJIN SIERRA', '', '9971518670', 'TICUL', NULL, '2022-04-16', 1, 2570, 1),
(31, 'LUCY ARIANE', 'POOT DIAZ', '', '9971232700', 'CALLE 20 ENTRE 19 Y 21 COL SAN JUAN', NULL, '2022-04-17', 1, 3020, 1),
(32, 'ANA', 'MORENO CHAN', '', '9994163118', 'CALLE 8 #433 ENTRE 25 Y 25A MERIDA', NULL, '2022-04-17', 1, 3000, 1),
(33, 'KARLA', 'CANUL MANRIQUE ', '', '9971394339', 'CALLE 48 ENTRE 15 Y 17', NULL, '2022-04-18', 1, 500, 0),
(35, 'ABIGAIL ', 'CEJIN CASTRO', 'ABI', '9971168267', 'TICUL', NULL, '2022-04-19', 1, 1740, 1),
(36, 'MARISOL YAMILE', 'CARRILLO RAMIRES', 'TICUL', '9979737943', 'CALLE 19 ENTRE 14 Y 16 COL SAN JUAN ', NULL, '2022-04-19', 1, 1840, 1),
(37, 'FANY', 'TRUJEQUE RAMIREZ', 'PRIMA DE MARISOL CARRILLO', '9979737943', 'BOLONCHEN', NULL, '2022-04-19', 1, 1040, 1),
(38, 'SANDRA', 'CHAN DURAN', 'TICUL', '9971163707', 'TICUL', NULL, '2022-04-21', 1, 200, 0),
(39, 'ARACELY ', 'BRICEÑO GONZALEZ', '', '9971184825', 'CALLE 18  ENTRE 25 SAN JUAN ', NULL, '2022-04-22', 1, 2000, 1),
(40, 'LEYDI DEL CARMEN', 'JIMENEZ MATA', 'TICUL', '9999940466', 'C.30 X 17 ESQUINA ', NULL, '2022-04-24', 1, 100, 0),
(41, 'ANA MARIA ', 'CRUZ SANDOVAL', 'TICUL', '9971285105', 'C.36X 32 Y 25 ', NULL, '2022-04-24', 1, 2203, 1),
(42, 'MARIA YOLANDA ', 'DZUL JIL', '', '', 'CALLE 25 ENTRE 10 Y 12 FRAC XETEMAY.', NULL, '2022-04-27', 1, 100, 0),
(43, 'CARMINIA  ASUNCION', 'CHAN LOPEZ', 'CARMINIA', '9971401895', 'CALLE 22 #225 ENTRE 33 Y 35', NULL, '2022-04-28', 1, 2452, 1),
(44, 'SANDY ', 'AYALA KU', '', '9971365288', 'CALLE 24 ENTRE 21 Y 19 COL. CENTRO', NULL, '2022-04-29', 1, 50, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuentas_Prove`
--

CREATE TABLE `Cuentas_Prove` (
  `ID_Cuentas` int NOT NULL,
  `ID_Proveedor` int NOT NULL,
  `Banco` varchar(30) NOT NULL,
  `Numero` varchar(16) NOT NULL,
  `Targeta` varchar(16) NOT NULL,
  `Clabe` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cupon`
--

CREATE TABLE `Cupon` (
  `ID_Cupon` int NOT NULL,
  `ID_Venta` bigint UNSIGNED NOT NULL,
  `Fecha_Gen` date NOT NULL,
  `Fecha_Exp` date NOT NULL,
  `Valor` int NOT NULL,
  `Usado` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Deudas`
--

CREATE TABLE `Deudas` (
  `ID_Deuda` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `ID_Credito` int DEFAULT NULL COMMENT 'ID Abono',
  `ID_Personal` int DEFAULT NULL,
  `Anterior` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Pendiente` double DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int DEFAULT NULL,
  `estatus` int DEFAULT NULL COMMENT '0=deuda, 1=liquidado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Deudas`
--

INSERT INTO `Deudas` (`ID_Deuda`, `ID_Cliente`, `ID_Credito`, `ID_Personal`, `Anterior`, `Abono`, `Pendiente`, `Fecha`, `ID_Medio`, `estatus`) VALUES
(1, 6, 2, 4, 330, 100, 230, '2022-04-06 09:59:04', 1, NULL),
(2, 11, 8, 3, 360, 150, 210, '2022-04-08 14:30:05', 1, NULL),
(3, 15, 11, 4, 679, 300, 379, '2022-04-10 11:01:25', 1, NULL),
(4, 21, 15, 4, 360, 200, 160, '2022-04-11 18:07:10', 1, NULL),
(5, 7, NULL, 4, 1069, 1069, 0, '2022-04-11 19:38:34', 1, NULL),
(6, 22, 17, 3, 400, 100, 300, '2022-04-13 11:14:46', 1, NULL),
(7, 27, 24, 4, 530, 130, 400, '2022-04-14 15:41:33', 1, NULL),
(8, 27, NULL, 3, 400, 400, 0, '2022-04-14 19:02:15', 1, NULL),
(9, 29, 29, 3, 340, 100, 240, '2022-04-15 11:42:17', 1, NULL),
(10, 30, 31, 4, 1255, 1000, 255, '2022-04-16 18:26:13', 1, NULL),
(11, 31, 32, 4, 1160, 180, 980, '2022-04-17 10:29:49', 1, NULL),
(12, 11, NULL, 4, 210, 210, 0, '2022-04-17 12:16:34', 1, NULL),
(13, 15, 11, 4, 379, 300, 79, '2022-04-17 12:40:03', 1, NULL),
(14, 33, 34, 4, 830, 200, 630, '2022-04-18 09:27:06', 1, NULL),
(15, 6, 2, 4, 230, 200, 30, '2022-04-19 11:12:07', 1, NULL),
(16, 30, NULL, 4, 255, 255, 0, '2022-04-19 18:52:42', 1, NULL),
(17, 30, NULL, 4, 500, 500, 0, '2022-04-19 18:55:44', 1, NULL),
(18, 10, 7, 4, 748, 200, 548, '2022-04-20 10:48:22', 1, NULL),
(19, 38, 41, 3, 680, 100, 580, '2022-04-21 13:05:43', 1, NULL),
(20, 10, 7, 4, 548, 500, 48, '2022-04-22 11:45:16', 1, NULL),
(21, 40, 43, 4, 360, 100, 260, '2022-04-24 11:42:48', 1, NULL),
(22, 33, 34, 4, 630, 300, 330, '2022-04-25 10:19:04', 1, NULL),
(23, 38, 41, 4, 580, 100, 480, '2022-04-27 10:25:43', 1, NULL),
(24, 42, 46, 4, 350, 100, 250, '2022-04-27 10:32:47', 1, NULL),
(25, 3, 1, 3, 633, 500, 133, '2022-04-27 11:29:20', 1, NULL),
(26, 5, 19, 3, 0, 0, 0, '2022-04-29 11:52:48', 1, NULL),
(27, 5, 48, 3, 285, 50, 235, '2022-04-29 12:00:19', 1, NULL),
(28, 9, NULL, 3, 389, 389, 0, '2022-04-29 13:07:25', 1, NULL),
(29, 44, 49, 3, 285, 50, 235, '2022-04-29 14:13:33', 1, NULL),
(30, 30, NULL, 3, 520, 520, 0, '2022-04-29 14:20:13', 1, NULL),
(31, 43, 51, 3, 798, 250, 548, '2022-04-29 14:35:11', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medio_Pago`
--

CREATE TABLE `Medio_Pago` (
  `ID_Medio` int NOT NULL,
  `Tipo` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Medio_Pago`
--

INSERT INTO `Medio_Pago` (`ID_Medio`, `Tipo`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta / SPEI'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Personal`
--

CREATE TABLE `Personal` (
  `ID_Personal` int NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Bio` varchar(80) DEFAULT NULL,
  `Direccion` varchar(90) DEFAULT NULL,
  `Colonia` varchar(90) DEFAULT NULL,
  `CP` int DEFAULT NULL,
  `Correo` varchar(35) DEFAULT NULL,
  `Pass` varchar(10) NOT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Foto` varchar(254) DEFAULT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Puesto` int NOT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `Baja` int DEFAULT NULL COMMENT '0=No, 1=Si',
  `visible` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Personal`
--

INSERT INTO `Personal` (`ID_Personal`, `Nombre`, `Apellido`, `Bio`, `Direccion`, `Colonia`, `CP`, `Correo`, `Pass`, `Telefono`, `Foto`, `ID_Sucursal`, `ID_Puesto`, `Fecha_Registro`, `Baja`, `visible`) VALUES
(3, 'admin', 'sys', NULL, '4434d', NULL, NULL, 'mmd@', '1425', '9971259967', 'lib/Personal/img/blitzc0de_log.png', 5, 2, '2021-10-14', 0, 1),
(4, 'Vendedor', NULL, NULL, 'c 232 ksd 8836 x 66', NULL, NULL, 'vendedor@mail.com', '56789', '999999', 'lib/Personal/img/FB2F7934-4C91-4055-8DBB-493452C6F6B2.jpeg', 5, 4, '2022-03-13', 0, 1),
(5, 'MIRIAM', 'CHI CASTRO', NULL, '', NULL, NULL, '', '0839', '', 'lib/Personal/img/blitz_SN.png', 5, 3, '2022-03-30', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `Codigo` varchar(255) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `PrecioVenta` decimal(8,2) DEFAULT NULL,
  `PrecioCompra` decimal(8,2) DEFAULT NULL,
  `Existencia` int NOT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Categoria` int NOT NULL,
  `Fecha_Ingreso` datetime DEFAULT NULL,
  `ID_Proveedor` int NOT NULL,
  `Importado` varchar(50) DEFAULT NULL,
  `visto` int DEFAULT '0',
  `can` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `Marca`, `Foto`, `PrecioVenta`, `PrecioCompra`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `can`) VALUES
(1, '7501853805994', 'GUMMYS', 'GOMITAS SABOR CEREZA', NULL, 'lib/Productos/img/blitz_SN.png', '633.00', '0.00', 0, 5, 19, '2022-03-30 17:39:09', 14, NULL, 0, NULL),
(2, 'MS54188AEI05', 'SHORT ', 'SHORT STAN M.54188 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 09:48:49', 20, NULL, 0, NULL),
(3, 'MS54188ARM05', 'SHORT ', 'SHORT DKIN M.54188 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 09:51:04', 20, NULL, 0, NULL),
(4, 'MB5414505', 'SHORT ', 'SHORT BLANCO M.54145 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '269.00', '0.00', 0, 5, 15, '2022-03-31 16:14:51', 20, NULL, 0, NULL),
(5, 'BA34164AZM05', 'SHORT ', 'SHORT BLANCO M.34164 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 09:54:08', 17, NULL, 0, NULL),
(6, 'M3413305', 'SHORT ', 'SHORTSVDO M.34133 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 09:56:08', 17, NULL, 0, NULL),
(7, 'MA34166AEI05', 'SHORT ', 'SHORT STAN M.34166 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 09:57:36', 17, NULL, 0, NULL),
(8, 'MA34167ASM05', 'SHORT ', 'SHORT DKSK M.34167 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 10:28:48', 17, NULL, 0, NULL),
(9, 'MA34158SFAPI05', 'SHORT ', 'SHORT STBL M.34158 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-03-31 10:30:17', 17, NULL, 0, NULL),
(10, 'MA34166ARM05', 'SHORT ', 'SHORT DKIN M.34166 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 10:31:22', 17, NULL, 0, NULL),
(11, 'MA54203SFARM05', 'FALDA SHORT', 'FALDA SHORT DKIN M.54203 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 10:45:33', 20, NULL, 0, NULL),
(12, 'MA54203SFFXI05', 'FALDA SHORT', 'SHORT SWIN M.54203 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 10:45:54', 20, NULL, 0, NULL),
(13, 'MS34157MFAII05', 'SHORT ', 'SHORT SVIN M. 34157 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 12:04:19', 17, NULL, 0, NULL),
(14, 'MA54187API05', 'SHORT ', 'SHORT STBL M.54187 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 12:05:36', 20, NULL, 0, NULL),
(15, 'MA34167ARI05', 'SHORT ', 'SHORT DKIN M.34167 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 12:07:04', 17, NULL, 0, NULL),
(16, 'MA34158SFAPI07', ' FALDA SHORT ', ' FALDA SHORT STBL M.34158 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-03-31 12:33:17', 17, NULL, 0, NULL),
(17, 'MA34162SFAPI07', 'FALDA SHORT', 'FALDA SHORT M.34162 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 12:34:55', 17, NULL, 0, NULL),
(18, 'MA34166ARM07', 'SHORT ', 'SHORT DKIN M.34166 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 12:36:18', 17, NULL, 0, NULL),
(19, 'MS54188AEI07', 'SHORT ', 'SHORT STAN M.54188 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 12:37:25', 20, NULL, 0, NULL),
(20, 'MA34162SFARG07', 'FALDA SHORT', 'FALDA SHORT M.34162 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 12:38:35', 17, NULL, 0, NULL),
(21, 'MA54203SFARM07', 'FALDA SHORT', 'FALDA SHORT DKIN M.54203 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 12:40:32', 20, NULL, 0, NULL),
(22, 'MA34166AEI07', 'SHORT ', 'SHORT STAN M.34166 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 12:41:41', 17, NULL, 0, NULL),
(23, 'BA34164AZM07', 'SHORT ', 'SHORT BLANCO M.34164 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 12:44:02', 17, NULL, 0, NULL),
(24, 'MB5414507', 'SHORT ', 'SHORT BLANCO M.54145 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '265.00', '0.00', 1, 5, 15, '2022-03-31 12:45:16', 20, NULL, 0, NULL),
(25, 'MA34158SFARI07', 'FALDA SHORT', 'FALDA SHORT M.34158 DKIN T.7', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 12:46:35', 17, NULL, 0, NULL),
(26, 'MA34167ARI07', 'SHORT ', 'SHORT DKIN M.34167 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 12:47:30', 17, NULL, 0, NULL),
(27, 'MA34167ASM07', 'SHORT ', 'SHORT DKSK M.34167 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 14:11:01', 17, NULL, 0, NULL),
(28, 'MA54187ARM07', 'SHORT ', 'SHORT DKIN M.54187 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 14:12:18', 20, NULL, 0, NULL),
(29, 'NA104004AHM07', 'SHORT ', 'SHORT NEGRO M.104004 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 14:15:58', 17, NULL, 0, NULL),
(30, 'MS34157MFAII07', 'SHORT ', 'SHORT SVIN M.34157 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 3, 5, 15, '2022-03-31 14:17:01', 17, NULL, 0, NULL),
(31, 'MA34167ARI09', 'SHORT ', 'SHOR DKIN M.34167 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:22:11', 17, NULL, 0, NULL),
(32, 'MS34157MFAII09', 'SHORT ', 'SHORT SVIN M.34157 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:23:24', 17, NULL, 0, NULL),
(33, 'MA54203SFARM09', 'FALDA SHORT', 'FALDA SHORT DKIN M.54203 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 16:24:39', 20, NULL, 0, NULL),
(34, 'MA54187ARM09', 'SHORT ', 'SHORT DKIN M.54187 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:26:38', 20, NULL, 0, NULL),
(35, 'MA54203SFFXI09', 'FALDA SHORT', 'FALDA SHORT SWIN M.54203 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 16:28:02', 20, NULL, 0, NULL),
(36, 'MA34158SFAPI09', 'FALDA SHORT', 'FALDA SHORT STBL M.34158 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 16:29:09', 17, NULL, 0, NULL),
(37, 'MA54187API09', 'SHORT ', 'SHORT STBL M.54187 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 16:30:24', 20, NULL, 0, NULL),
(38, 'MS54188AEI11', 'SHORT ', 'SHORT STAN M.54188 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:38:55', 20, NULL, 0, NULL),
(39, 'MA34167ARI11', 'SHORT ', 'SHORT DKIN M.34167 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:39:45', 17, NULL, 0, NULL),
(40, 'MS54191FMM11', 'SHORT ', 'SHORT STSK M.54191 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:41:03', 20, NULL, 0, NULL),
(41, 'MA54203SFARM11', 'FALDA SHORT', 'FALDA SHORT DKIN M.54203 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 16:42:23', 20, NULL, 0, NULL),
(42, 'MS34157MFAII11', 'SHORT ', 'SHORT SVIN M.34157 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:43:38', 17, NULL, 0, NULL),
(43, 'MA34158SFAPI11', 'FALDA SHORT', 'FALDA SHORT STBL M.34158 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 20, '2022-03-31 16:45:45', 17, NULL, 0, NULL),
(44, 'MA34166AEI11', 'SHORT', 'SHORT STAN M.34166 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:46:55', 17, NULL, 0, NULL),
(45, 'MA34167ASM11', 'SHORT ', 'SHORT DKSK M.34167 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 16:47:50', 17, NULL, 0, NULL),
(46, 'MS54191ARI11', 'SHORT ', 'SHORT DKIN M.54191 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 16:48:48', 20, NULL, 0, NULL),
(47, 'MA54187API11', 'SHORT ', 'SHORT STBL M.54187 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-04-15 10:17:09', 20, NULL, 0, NULL),
(48, 'MA54190ARM11', 'SHORT ', 'SHORT DKIN M.54190 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 16:50:46', 20, NULL, 0, NULL),
(49, 'MA54187ARM11', 'SHORT ', 'SHORT DKIN M.54187 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 16:51:45', 20, NULL, 0, NULL),
(50, 'MS54191FMM13', 'SHORT ', 'SHORT STSK M.54191 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:55:19', 20, NULL, 0, NULL),
(51, 'MA34167ASM13', 'SHORT ', 'SHORT DKSK M.34167 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:56:13', 17, NULL, 0, NULL),
(52, 'MS54191ARI13', 'SHORT ', 'SHORT DKIN M.54191 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 0, 5, 15, '2022-03-31 16:57:28', 20, NULL, 0, NULL),
(53, 'MS34157MFAII13', 'SHORT ', 'SHORT SVIN M.34156 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 15, '2022-03-31 16:58:20', 17, NULL, 0, NULL),
(54, 'MA54187API13', 'SHORT ', 'SHORT STBL M,54187 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 16:59:59', 20, NULL, 0, NULL),
(55, 'NA104004AHM13', 'SHORT ', 'SHORT NEGRO M.104004 T.13 ', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 15, '2022-03-31 17:01:17', 17, NULL, 0, NULL),
(56, 'MA34167ARI15', 'SHORT ', 'SHORT DKIN M.34167 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-03-31 17:03:48', 17, NULL, 0, NULL),
(57, 'MA34166ARM15', 'SHORT ', 'SHORT DKIN M.34166 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-03-31 17:04:38', 17, NULL, 0, NULL),
(58, 'MA34166AEI15', 'SHORT ', 'SHORT STAN M.34166 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-03-31 17:05:25', 17, NULL, 0, NULL),
(59, 'MA34167ASM15', 'SHORT ', 'SHORT DKSK M.34167 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 2, 5, 15, '2022-03-31 17:06:17', 17, NULL, 0, NULL),
(60, 'MS54191FMM15', 'SHORT ', 'SHORT STKS M.54191 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 2, 5, 15, '2022-03-31 17:07:22', 20, NULL, 0, NULL),
(61, 'MA34167ASM17', 'SHORT ', 'SHORT DKSK M.34167 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 0, 5, 15, '2022-04-01 11:18:26', 17, NULL, 0, NULL),
(62, 'MA54190ARM17', 'SHORT ', 'SHORT DKIN M.54190 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-01 11:20:40', 20, NULL, 0, NULL),
(63, 'M35216BS17', 'SHORT ', 'SHORT SWEN M.35216 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-01 11:21:57', 17, NULL, 0, NULL),
(64, 'M35211BS17', 'SHORT ', 'SHORT SVDO M.35211 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 0, 5, 15, '2022-04-01 11:22:45', 17, NULL, 0, NULL),
(65, 'MA34166ARM17', 'SHORT ', 'SHORT DKIN M.34166 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-01 11:23:50', 17, NULL, 0, NULL),
(66, 'MA34166AEI17', 'SHORT ', 'SHORT STAN M.34166 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-01 11:24:37', 17, NULL, 0, NULL),
(67, 'MA34167ARI17', 'SHORT ', 'SHORT DKIN M.34167 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 2, 5, 15, '2022-04-01 11:25:24', 17, NULL, 0, NULL),
(68, 'MA34166ARM19', 'SHORT ', 'SHORT DKIN M.34166 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-01 11:26:48', 17, NULL, 0, NULL),
(69, 'MS51964RFXM05', 'PANTALON', 'PANTALON SWIN M.51964 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 1, 5, 2, '2022-04-01 11:54:24', 20, NULL, 0, NULL),
(70, 'M31847E05', 'PANTALON', 'PANTALON SVDO M.31847 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-01 11:56:03', 17, NULL, 0, NULL),
(71, 'M31844E05', 'PANTALON', 'PANTALON DKSW M.31844 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-01 12:12:48', 17, NULL, 0, NULL),
(72, 'MA31927JAIAM05', 'PANTALON', 'PANTALON SVIN M.31927 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-01 12:13:58', 17, NULL, 0, NULL),
(73, '124688720507', 'PANTALON', 'PANTALON INDIGO M.12468 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '600.00', '0.00', 1, 5, 2, '2022-04-01 12:15:18', 2, NULL, 0, NULL),
(74, 'MA101084MFARG05', 'PANTALON', 'PANTALON DKIN M.101084 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 2, 5, 2, '2022-04-01 12:16:52', 17, NULL, 0, NULL),
(75, 'M32204L05', 'CAPRI', 'CAPRI SVDO M.32204 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 3, 5, 21, '2022-04-01 13:12:49', 17, NULL, 0, NULL),
(76, 'M5520607', 'BERMUDA', 'BERMUDA SVDO M.55206 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 22, '2022-04-01 13:34:58', 20, NULL, 0, NULL),
(77, 'M5521507', 'BERMUDA', 'BERMUDA SVDO M.55215 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 22, '2022-04-01 13:38:35', 20, NULL, 0, NULL),
(78, 'M35187SVDO07', 'BERMUDA', 'BERMUDA SVDO M.35187 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 22, '2022-04-01 13:44:49', 17, NULL, 0, NULL),
(79, 'M3523307', 'BERMUDA', 'BERMUDA STDB M.35233 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 22, '2022-04-01 13:47:45', 17, NULL, 0, NULL),
(80, 'MS35270AET07', 'BERMUDA', 'BERMUDA STAN  M.35270T.7', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 1, 5, 22, '2022-04-01 13:49:35', 17, NULL, 0, NULL),
(81, 'AM3524607', 'BERMUDA', 'BERMUDA STAN M.35246 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 22, '2022-04-01 13:58:38', 17, NULL, 0, NULL),
(82, 'M3524007', 'BERMUDA', 'BERMUDA DKSW M.35240 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 2, 5, 22, '2022-04-01 14:01:38', 17, NULL, 0, NULL),
(83, 'M35238C07', 'BERMUDA', 'BERMUDA DKSW M.35238 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 2, 5, 22, '2022-04-01 14:02:33', 17, NULL, 0, NULL),
(84, 'M3523607', 'BERMUDA', 'BERMUDA STAN M.35236 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 2, 5, 22, '2022-04-01 14:03:41', 17, NULL, 0, NULL),
(85, 'M3523507', 'BERMUDA', 'BERMUDA STDB YDKSW M.35235 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 22, '2022-04-02 12:43:46', 17, NULL, 0, NULL),
(86, 'BA32291EHM07', 'PESQUERO', 'PESQUERO BLANCO M.32291 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 23, '2022-04-02 12:49:57', 17, NULL, 0, NULL),
(87, 'M5223807', 'PESQUERO', 'PESQUERO SVDO M.52238 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 2, 5, 23, '2022-04-02 12:51:54', 20, NULL, 0, NULL),
(88, 'AM13200107', 'PESQUERO', 'PESQUERO SVDO M.132001 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 23, '2022-04-02 12:59:21', 17, NULL, 0, NULL),
(89, 'MA32297LAIM07', 'CAPRI', 'CAPRI SVIN M.32297 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 21, '2022-04-02 13:19:52', 17, NULL, 0, NULL),
(90, 'MA32281LFWM07', 'CAPRI', 'CAPRI SVMR M.32281 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 21, '2022-04-02 13:21:12', 17, NULL, 0, NULL),
(91, 'MA52274LAOS07', 'CAPRI', 'CAPRI SWPD M.52254 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 1, 5, 21, '2022-04-02 13:22:17', 17, NULL, 0, NULL),
(92, 'GM31871E07', 'PANTALON', 'PANTALO SVDO M.31871 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-02 13:33:20', 17, NULL, 0, NULL),
(93, 'NA31920EAHAMS07', 'PANTALON', 'PANTALON NEGRO M.31920 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-02 13:34:18', 17, NULL, 0, NULL),
(94, 'MS31934EAIM07', 'PANTALON', 'PANTALON SVIN M.31934 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-02 13:35:10', 17, NULL, 0, NULL),
(95, '7642RM141050P07', 'PANTALON', 'PANTALON STMDY STBL M.141050 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 2, '2022-04-02 13:36:33', 17, NULL, 0, NULL),
(96, 'MA51962EDSS07', 'PANTALON', 'PANTALON SWCL M.51962 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 1, 5, 2, '2022-04-02 13:37:51', 17, NULL, 0, NULL),
(97, 'MA51959EARM07', 'PANTALON', 'PANTALON DKIN M.51959 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-02 13:38:52', 20, NULL, 0, NULL),
(98, 'MA101084MFARG07', 'PANTALON', 'PANTALON M.DKIN M.101084 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 2, 5, 2, '2022-04-02 13:40:06', 17, NULL, 0, NULL),
(99, 'NA51938EAHAMS07', 'PANTALON', 'PANTALON NEGRO M.51938 T.7 ', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 2, 5, 2, '2022-04-02 13:41:15', 17, NULL, 0, NULL),
(100, 'MA31927JAIAM07', 'PANTALON', 'PANTALON SVIN M.31927 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 2, '2022-04-02 13:42:12', 17, NULL, 0, NULL),
(101, 'MS51964RAEI07', 'PANTALON', 'PANTALON STAN M.51964 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 1, 5, 2, '2022-04-02 13:43:07', 20, NULL, 0, NULL),
(102, 'M51871E07', 'PANTALON', 'PANTALON DKSW M.51871 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-02 13:43:53', 20, NULL, 0, NULL),
(103, 'MS31921EAAAM07', 'PANTALON', 'PANTALON DKSW M.31921 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-02 13:44:37', 17, NULL, 0, NULL),
(104, 'MA31936SPAPI07', 'PANTALON', 'PANTALON STBL M.31936 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 2, '2022-04-02 13:45:39', 17, NULL, 0, NULL),
(105, 'MS34178AKI15', 'SHORT ', 'SHORT STDB M.34178 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 15, '2022-04-02 17:34:41', 17, NULL, 0, NULL),
(106, 'MS34178AKI13', 'SHORT ', 'SHORT STDB M.34178 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-02 17:33:42', 17, NULL, 0, NULL),
(107, 'MS34178AKI11', 'SHORT ', 'SHORT STDB M.34178 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-02 17:36:19', 17, NULL, 0, NULL),
(108, 'MS34178AKI09', 'SHORT ', 'SHORT STDB M.34178 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-02 17:37:23', 17, NULL, 0, NULL),
(109, 'MS34178AKI07', 'SHORT ', 'SHORT STDB M.34178', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 0, 5, 15, '2022-04-02 17:38:50', 17, NULL, 0, NULL),
(110, 'MA32314AIM07', 'PESQUERO', 'PESCADOR SVIN M.32314 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 23, '2022-04-02 17:54:24', 17, NULL, 0, NULL),
(111, 'MA32314AIM09', 'PESQUERO', 'PESCADOR SVIN M.32314 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 23, '2022-04-02 17:55:34', 17, NULL, 0, NULL),
(112, 'MA32314AIM11', 'PESQUERO', 'CAPRI SVIN M.3214 T11', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 0, 5, 23, '2022-04-02 17:56:41', 17, NULL, 0, NULL),
(113, 'MA32314AIM13', 'PESQUERO', 'PESCADOR SVIN M.32314 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 0, 5, 23, '2022-04-02 17:58:01', 17, NULL, 0, NULL),
(114, 'MA32314AIM15', 'PESQUERO', 'PESCADOR SVIN M.32314 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 23, '2022-04-02 17:59:32', 17, NULL, 0, NULL),
(115, 'MA32314AIM17', 'PESQUERO', 'PESQUERO SVIN M.32314 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 23, '2022-04-02 18:00:46', 17, NULL, 0, NULL),
(116, 'MA32314AIM19', 'PESQUERO', 'PESQUERO SVIN M.32314 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 23, '2022-04-02 18:02:09', 17, NULL, 0, NULL),
(117, 'MA32314AIM21', 'PESQUERO', 'PESQUERO SVIN M.32314 T.21', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 2, 5, 23, '2022-04-02 18:03:07', 17, NULL, 0, NULL),
(118, 'NA32315AHM09', 'PESQUERO', 'PESQUERO NEGRO  M.32315 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 0, 5, 23, '2022-04-02 18:08:44', 17, NULL, 0, NULL),
(119, 'NA32315AHM11', 'PESQUERO', 'PESQUERO NEGRO M.32315 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 23, '2022-04-02 18:09:41', 17, NULL, 0, NULL),
(120, 'NA32315AHM13', 'PESQUERO', 'PESQUERO NEGRO M.32315 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 23, '2022-04-02 18:10:40', 16, NULL, 0, NULL),
(121, 'NA32315AHM15', 'PESQUERO', 'PESQUERO NEGRO M.32315 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 2, 5, 23, '2022-04-02 18:11:31', 17, NULL, 0, NULL),
(122, 'NA32315AHM17', 'PESQUERO', 'PESQUERO NEGRO M.32315 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 2, 5, 23, '2022-04-02 18:12:33', 17, NULL, 0, NULL),
(123, 'NA32315AHM19', 'PESQUERO', 'PESQUERO NEGRO M.32315 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 2, 5, 23, '2022-04-02 18:13:41', 17, NULL, 0, NULL),
(124, '298270332307', 'CALZADO', 'CALZADO BLANCO M.29827 #3', NULL, 'lib/Productos/img/blitz_SN.png', '679.00', '0.00', 0, 5, 9, '2022-04-02 18:16:44', 2, NULL, 0, NULL),
(125, 'NA32315AHM21', 'PESQUERO', 'PESQUERO NEGRO M.32315 T.21', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 23, '2022-04-02 18:21:50', 17, NULL, 0, NULL),
(126, 'MS35280ASM09', 'BERMUDA', 'BERMUDA DKSK M.35280 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 2, 5, 22, '2022-04-03 10:51:38', 17, NULL, 0, NULL),
(127, 'MS35280ASM11', 'BERMUDA', 'BERMUDA DKSK M.35280 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 0, 5, 22, '2022-04-03 10:53:00', 17, NULL, 0, NULL),
(128, 'MS35280ASM13', 'BERMUDA', 'BERMUDA DKSK M.35280 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 22, '2022-04-03 10:54:16', 17, NULL, 0, NULL),
(129, 'MS35280ASM15', 'BERMUDA', 'BERMUDA DKSK M.35280 T15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 0, 5, 22, '2022-04-03 10:55:35', 17, NULL, 0, NULL),
(130, 'MS35280ASM17', 'BERMUDA', 'BERMUDA DKSK 35280 T.320', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 0, 5, 22, '2022-04-03 10:57:32', 17, NULL, 0, NULL),
(132, 'MS35280ASM19', 'BERMUDA', 'BERMUDA DKSK M.35280 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 22, '2022-04-03 11:02:36', 17, NULL, 0, NULL),
(133, 'MS101128EASM05', 'PANTALON', 'PANTALON DKSK M.101128 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 2, 5, 2, '2022-04-03 11:16:40', 17, NULL, 0, NULL),
(134, 'MS101128EASM07', 'PANTALON', 'PANTALON DKSK M.101128 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 2, 5, 2, '2022-04-03 11:18:59', 17, NULL, 0, NULL),
(135, 'MS101128EASM09', 'PANTALON', 'PANTALON  DKSK M.101128 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 1, 5, 2, '2022-04-03 11:20:19', 17, NULL, 0, NULL),
(136, 'MS101128EASM11', 'PANTALON', 'PANTALON DKSK M.101128 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 2, 5, 2, '2022-04-03 11:21:12', 17, NULL, 0, NULL),
(137, 'MS101128EASM13', 'PANTALON', 'PANTALON DKSK M.101128 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 1, 5, 2, '2022-04-03 11:22:04', 17, NULL, 0, NULL),
(138, 'MS101128EASM15', 'PANTALON', 'PANTALON DKSK M.101128 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 1, 5, 2, '2022-04-03 11:22:54', 17, NULL, 0, NULL),
(139, 'MS35267MFARI09', 'BERMUDA', 'BERMUDA DKIN M.35267 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 2, 5, 22, '2022-04-03 11:27:18', 17, NULL, 0, NULL),
(140, 'MA32292LARM09', 'CAPRI', 'CAPRI DKIN M.32292 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 0, 5, 21, '2022-04-03 11:29:57', 17, NULL, 0, NULL),
(141, 'MA52281LFXS09', 'CAPRI', 'CAPRI SWIN M.52281 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 21, '2022-04-03 11:31:48', 20, NULL, 0, NULL),
(142, 'BA32291EHM09', 'PESQUERO', 'PESQUERO BLANCO M.32291 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 23, '2022-04-03 11:33:08', 17, NULL, 0, NULL),
(143, 'MS32305LAIM09', 'CAPRI', 'CAPRI SWIN M.32305 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 2, 5, 21, '2022-04-03 11:35:13', 17, NULL, 0, NULL),
(144, 'MS32305LARI09', 'CAPRI', 'CAPRI DKIN M.32305 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 2, 5, 21, '2022-04-03 11:36:33', 17, NULL, 0, NULL),
(145, 'MA31951EFXM09', 'PANTALON', 'PANTALON SWIN M.31951 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-03 11:48:19', 17, NULL, 0, NULL),
(146, 'M31844E09', 'PANTALON', 'PANTALON DKSW M.31844 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-03 11:50:56', 17, NULL, 0, NULL),
(147, 'MS51964RFXM09', 'PANTALON', 'PANTALON SWIN M.51964 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 1, 5, 2, '2022-04-03 11:51:59', 20, NULL, 0, NULL),
(148, 'MS31921EAMAI09', 'PANTALON', 'PANTALON SWEA M.31921 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-03 11:52:50', 17, NULL, 0, NULL),
(149, 'MA51959EARM09', 'PANTALON', 'PNTALON DKIN M.51959 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-03 11:53:46', 20, NULL, 0, NULL),
(150, 'MA51953SPARM09', 'PANTALON', 'PANTALON DKIN M.51953 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '345.00', '0.00', 1, 5, 2, '2022-04-03 11:54:54', 17, NULL, 0, NULL),
(151, 'M131079E09', 'PANTALON', 'PANTALON SVDO M.131079 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-03 11:56:28', 17, NULL, 0, NULL),
(152, 'MA31927JAIAM09', 'PANTALON', 'PANTALON SVIN M.31927 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-03 11:57:46', 17, NULL, 0, NULL),
(153, '7631AM51928E09', 'PANTALON', 'PANTALON SVDO M.51928 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-03 11:58:38', 20, NULL, 0, NULL),
(154, 'MS31921EAAAM09', 'PANTALON', 'PANTALON DKSW M.31921 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-03 11:59:28', 17, NULL, 0, NULL),
(155, 'M31839P09', 'PANTALON', 'PANTALON DKSW M.31839 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 1, 5, 2, '2022-04-03 12:00:20', 17, NULL, 0, NULL),
(156, '7638SM51926E09', 'PANTALON', 'PANTALON SVDO YDKSW M.51926 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 2, '2022-04-03 12:02:05', 20, NULL, 0, NULL),
(157, 'MA31936SPAPI09', 'PANTALON', 'PANTALON STBL M.31936 T,9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 2, '2022-04-03 12:03:45', 17, NULL, 0, NULL),
(158, 'MA101084MFARG09', 'PANTALON', 'PANTALON DKIN M.101084 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 2, 5, 2, '2022-04-03 12:05:13', 17, NULL, 0, NULL),
(159, 'MS32293LFXI09', 'CAPRI', 'CAPRI SWIN M.32293 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 21, '2022-04-03 12:06:32', 17, NULL, 0, NULL),
(160, 'MS35261AAM11', 'BERMUDA', 'BERMUDA DKSW M.35261 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 1, 5, 22, '2022-04-03 12:10:42', 17, NULL, 0, NULL),
(161, 'MS55230AIAMB11', 'BERMUDA', 'BERMUDA SVIN M.55230 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 1, 5, 22, '2022-04-03 12:11:44', 20, NULL, 0, NULL),
(162, 'MS55258FXI11', 'BERMUDA', 'BERMUDA SWIN M.55258 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 0, 5, 22, '2022-04-03 12:12:44', 20, NULL, 0, NULL),
(163, 'MA55257FXI11', 'BERMUDA', 'BERMUDA SWIN M.55257 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 0, 5, 22, '2022-04-15 10:14:42', 20, NULL, 0, NULL),
(164, 'MS35256AAM11', 'BERMUDA', 'BERMUDA DKSW M.35256 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 22, '2022-04-03 12:14:26', 17, NULL, 0, NULL),
(165, 'M3523611', 'BERMUDA', 'BERMUDA STAN M.35236 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 22, '2022-04-03 12:15:23', 17, NULL, 0, NULL),
(166, 'MS35256AAT11', 'BERMUDA', 'BERMUDA DKSW M.35256 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 22, '2022-04-03 12:16:37', 17, NULL, 0, NULL),
(167, 'MS35267MFARI11', 'BERMUDA', 'BERMUDA DKIN M.35267 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 2, 5, 22, '2022-04-03 12:17:34', 17, NULL, 0, NULL),
(168, 'ZULE09', 'PANTALON', 'PANTALON ZULE MARINO T.9', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 24, '2022-04-03 12:23:40', 25, NULL, 0, NULL),
(169, '7606AM32271L11', 'CAPRI', 'CAPRI SWDO M.32271 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 21, '2022-04-03 12:24:44', 17, NULL, 0, NULL),
(170, '7596SM3227011', 'PESQUERO', 'PESQUERO DKSW M.32270 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 1, 5, 23, '2022-04-03 12:25:46', 17, NULL, 0, NULL),
(171, 'MM32288ARB11', 'CAPRI', 'CAPRI DKIN M.32288 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 0, 5, 21, '2022-04-03 12:26:40', 17, NULL, 0, NULL),
(172, 'MA32287ARM11', 'PESQUERO', 'PESQUERO DKIN M.32287 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 23, '2022-04-03 12:27:41', 17, NULL, 0, NULL),
(173, 'BA32291EHM11', 'PESQUERO', 'PESQURO BLANCO M.32291 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 23, '2022-04-03 12:28:35', 17, NULL, 0, NULL),
(174, 'MA101084MFARG11', 'PANTALON', 'PANTALON DKIN M.101084 T.|11', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 2, 5, 2, '2022-04-03 12:30:33', 17, NULL, 0, NULL),
(175, 'MS35267MFARI13', 'BERMUDA', 'BERMUDA DKIN M. 35267 T. 13', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 2, 5, 22, '2022-04-03 12:34:26', 17, NULL, 0, NULL),
(176, 'NA32304AHM13', 'PESQUERO', 'PESQUERO NEGRO M.32304 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 23, '2022-04-03 12:36:38', 17, NULL, 0, NULL),
(177, 'BA32291EHM13', 'PESQUERO', 'PESQUERO BLANCO M.32291 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 23, '2022-04-03 12:37:37', 17, NULL, 0, NULL),
(178, '7606AM32271L13', 'CAPRI', 'CAPRI SVDO M.32271 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 21, '2022-04-03 12:38:39', 17, NULL, 0, NULL),
(179, 'MA101084MFARG13', 'PANTALON', 'PANTALON DKIN M.101084 T.13 ', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 1, 5, 2, '2022-04-03 12:40:50', 17, NULL, 0, NULL),
(180, 'BA34164AZM15', 'SHORT ', 'SHORT BLANCO M.34164 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-03 12:44:27', 17, NULL, 0, NULL),
(181, 'BA32291EHM15', 'PESQUERO', 'PESQUERO BLANCO M.32291 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 23, '2022-04-03 12:45:54', 17, NULL, 0, NULL),
(182, 'MS52268AAI15', 'PESQUERO', 'PESQUERO DKSW M.52268 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 23, '2022-04-03 12:47:24', 20, NULL, 0, NULL),
(183, 'MS55258AIM15', 'BERMUDA', 'BERMUDA SVIN M.55258 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 22, '2022-04-03 12:48:32', 20, NULL, 0, NULL),
(184, 'MA55257AIM15', 'BERMUDA', 'BERMUDA SVIN M.55257 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 22, '2022-04-03 12:49:40', 20, NULL, 0, NULL),
(185, 'MA55257FXI15', 'BERMUDA', 'BERMUDA SWIN M.55257 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 2, 5, 22, '2022-04-03 12:50:40', 20, NULL, 0, NULL),
(186, 'MA52274LAOS15', 'CAPRI', 'CAPRI SWPD M.52274 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 21, '2022-04-03 13:02:13', 20, NULL, 0, NULL),
(187, 'MA32297LAIM15', 'CAPRI', 'CAPRI SVIN M.32297 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 1, 5, 21, '2022-04-03 13:03:59', 17, NULL, 0, NULL),
(188, 'MS32305LAIM15', 'CAPRI', 'CAPRI SVIN M.32305 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 21, '2022-04-03 13:04:59', 17, NULL, 0, NULL),
(189, 'MA32294AIM15', 'CAPRI', 'CAPRI SVIN M.32294 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 21, '2022-04-03 13:05:51', 17, NULL, 0, NULL),
(190, 'NA32304AHM15', 'PESQUERO', 'PESQUERO NEGRO M.32304 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 23, '2022-04-03 13:06:43', 17, NULL, 0, NULL),
(191, 'MA32294FXI15', 'CAPRI', 'CAPRI SWIN M.32294 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 21, '2022-04-03 13:07:40', 17, NULL, 0, NULL),
(192, 'MS32305LARI15', 'CAPRI', 'CAPRI DKIN M.32305 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 21, '2022-04-03 13:08:38', 17, NULL, 0, NULL),
(193, 'AM13200115', 'PESQUERO', 'PESQUERO SVDO Y STAN M.132001 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 3, 5, 23, '2022-04-03 13:10:23', 17, NULL, 0, NULL),
(194, 'GA32281LFUM15', 'CAPRI', 'CAPRI  SVOR M.32281 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 0, 5, 21, '2022-04-03 13:12:04', 17, NULL, 0, NULL),
(195, 'SM5224315', 'PESQUERO', 'PESQUERO DKSW M.52243 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 2, 5, 23, '2022-04-03 13:13:07', 20, NULL, 0, NULL),
(196, 'MA31936SPARM15', 'PESQUERO', 'PESQUERO DKIN M.31936 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 0, 5, 23, '2022-04-03 13:16:30', 17, NULL, 0, NULL),
(197, '7617SM5225015', 'PESQUERO', 'PESQUERO STAN M.52250 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 23, '2022-04-03 13:17:38', 20, NULL, 0, NULL),
(198, 'MA51959EAEQ15', 'PANTALON', 'PANTALON STAN M.51959 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 2, '2022-04-03 13:20:00', 20, NULL, 0, NULL),
(199, 'MS51964RAEI15', 'PANTALON', 'PANTALON STAN M.51964 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 0, 5, 2, '2022-04-03 13:21:21', 20, NULL, 0, NULL),
(200, 'MB31862E15', 'PANTALON', 'PANTALON BLANCO M.31862 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-03 13:22:32', 17, NULL, 0, NULL),
(201, '7679SM101069P15', 'PANTALON', 'PANTALON SVDO M.101069 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 1, 5, 2, '2022-04-03 13:25:51', 17, NULL, 0, NULL),
(202, 'MS51964RFXM15', 'PANTALON', 'PANTALON SWIN M.51964 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '365.00', '0.00', 0, 5, 2, '2022-04-03 13:27:33', 17, NULL, 0, NULL),
(203, 'MA31947EDSR15', 'PANTALON', 'PANTALON SWCL M.31947 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-03 13:28:54', 17, NULL, 0, NULL),
(204, 'MS55258AIM17', 'BERMUDA', 'BERMUDA SVIN M.55258 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 22, '2022-04-03 13:37:49', 20, NULL, 0, NULL),
(205, 'NS55246CAHM17', 'BERMUDA', 'BERMUDA NEGRO M.55246 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 22, '2022-04-03 13:38:47', 20, NULL, 0, NULL),
(206, 'MS55258FXI17', 'BERMUDA', 'BERMUDA SWIN M.55258 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 0, 5, 22, '2022-04-03 13:39:38', 20, NULL, 0, NULL),
(207, 'MS55243AEI17', 'BERMUDA', 'BERMUDA STAN M.55243 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 22, '2022-04-03 13:41:00', 20, NULL, 0, NULL),
(208, 'MA55257AIM17', 'BERMUDA', 'BERMUDA SVIN M.55257 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 1, 5, 22, '2022-04-03 13:41:50', 20, NULL, 0, NULL),
(209, 'MA55257FXI17', 'BERMUDA', 'BERMUDA SWIN M.55257 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 2, 5, 22, '2022-04-03 13:43:01', 20, NULL, 0, NULL),
(210, 'MN09030148R15', 'PANTALON', 'PANTALON NEGRO M.09030148 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 0, 5, 2, '2022-04-03 13:48:32', 20, NULL, 0, NULL),
(211, 'GA32281LFUM17', 'CAPRI', 'CAPRI SVOR M.32281 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 21, '2022-04-03 13:49:36', 17, NULL, 0, NULL),
(212, 'BA34164AZM17', 'SHORT ', 'SHORT BLANCO M.34164 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 15, '2022-04-03 13:50:45', 17, NULL, 0, NULL),
(213, 'MS51964RFXM17', 'PANTALON', 'PANTALON SWIN M.51964 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 1, 5, 2, '2022-04-03 14:05:25', 20, NULL, 0, NULL),
(214, 'MA51959EARM17', 'PANTALON', 'PANTALON DKIN M.51959 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 2, '2022-04-03 14:06:33', 20, NULL, 0, NULL),
(215, 'MA51966PARM17', 'PANTALON', 'PANTALON DKIN M.51966 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 0, 5, 2, '2022-04-03 14:08:06', 20, NULL, 0, NULL),
(216, 'MS55258AIM19', 'BERMUDA', 'BERMUDA SVIN M.55258 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 22, '2022-04-04 12:09:36', 20, NULL, 0, NULL),
(217, 'MA55257AIM19', 'BERMUDA', 'BERMUDA SVIN M.55257 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 1, 5, 22, '2022-04-04 12:10:43', 20, NULL, 0, NULL),
(218, 'MA55257FXI19', 'BERMUDA', 'BERMUDA SWIN M.55257 T.19 ', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 2, 5, 22, '2022-04-04 12:11:42', 20, NULL, 0, NULL),
(219, 'MS55258FXI19', 'BERMUDA', 'BERMUDA  SWIN  M 55258 T.19.', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 2, 5, 22, '2022-04-04 12:13:08', 20, NULL, 0, NULL),
(220, 'MA32297LFXI19', 'CAPRI', 'CAPRI SWIN M.32297 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 1, 5, 21, '2022-04-04 12:17:51', 17, NULL, 0, NULL),
(221, 'MA52281LDSM19', 'CAPRI', 'CAPRI SWCL M.52281 T.19 ', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 21, '2022-04-04 12:18:39', 20, NULL, 0, NULL),
(222, 'MA32284LARM19', 'CAPRI', 'CAPRI DKIN M.32284 T.19 ', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 21, '2022-04-04 12:19:21', 17, NULL, 0, NULL),
(223, 'MA52270ARM19', 'PESQUERO', 'PESQUERO DKIN M.52270 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 23, '2022-04-04 12:20:22', 20, NULL, 0, NULL),
(224, 'MA32289AIM19', 'PESQUERO', 'PESQUERO SVIN M.32289 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 23, '2022-04-04 12:21:08', 17, NULL, 0, NULL),
(225, 'MS32305LARI19', 'CAPRI', 'CAPRI DKIN M.32305 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 21, '2022-04-04 12:21:55', 17, NULL, 0, NULL),
(226, 'MS32305LAIM19', 'CAPRI', 'CAPRI SVIN M.32305 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 21, '2022-04-04 12:22:44', 17, NULL, 0, NULL),
(227, 'MS52268AAI19', 'PESQUERO', 'PESQUERO DKSW M.52268 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 2, 5, 23, '2022-04-04 12:23:39', 20, NULL, 0, NULL),
(228, 'BA32291EHM19', 'PESQUERO', 'PESQUERO BLACO M.32291 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 0, 5, 23, '2022-04-04 12:24:56', 17, NULL, 0, NULL),
(229, 'MS51964RFXM19', 'PANTALON', 'PANTALON SWIN M.51964 T.19 ', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 1, 5, 2, '2022-04-04 12:33:39', 20, NULL, 0, NULL),
(230, 'MS51964RAEI19', 'PANTALON', 'PANTALON STAN M.51964 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 1, 5, 2, '2022-04-04 12:34:44', 20, NULL, 0, NULL),
(231, 'MN09030148R19', 'PANTALON', 'PANTALON NEGRO M.09030148 T.19', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-04 12:35:49', 20, NULL, 0, NULL),
(232, 'MA51966PARM19', 'PANTALON', 'PANTALON DKIN M.51966 T.19 ', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 2, 5, 2, '2022-04-04 12:36:44', 20, NULL, 0, NULL),
(233, 'MS55258AIM19', 'BERMUDA', 'BERMUDA SVIN M.55258 T.19 ', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 22, '2022-04-04 12:46:07', 20, NULL, 0, NULL),
(234, 'MA52281LFXS21', 'PESQUERO', 'PESQUERO SWIN M.52281 T.21', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 0, 5, 23, '2022-04-04 12:48:18', 20, NULL, 0, NULL),
(235, 'MA31932EFXS21', 'PANTALON', 'PANTALON SWIN M.31932 T.21', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-04 12:49:14', 17, NULL, 0, NULL),
(236, 'MA31939PARI21', 'PANTALON', 'PANTALON DKIN M.31939 T.21', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 2, '2022-04-04 12:50:18', 17, NULL, 0, NULL),
(237, 'MA31932EAIM21', 'PANTALON', 'PANTALON SVIN M.31932 T.21', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 2, '2022-04-04 12:51:11', 17, NULL, 0, NULL),
(238, 'MS51964RFXM21', 'PANTALON', 'PANTALON SWIN M.51964 T.21', NULL, 'lib/Productos/img/blitz_SN.png', '385.00', '0.00', 1, 5, 2, '2022-04-04 12:52:04', 20, NULL, 0, NULL),
(239, 'MS31940EAIM21', 'PANTALON', 'PANTALON SVIN M.31940  T.21', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 2, 5, 2, '2022-04-04 12:53:00', 17, NULL, 0, NULL),
(240, 'PA0LA42', 'PESQUERO', 'PAOLA PESQUERO NEGRO T.42', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 23, '2022-04-04 13:12:45', 24, NULL, 0, NULL),
(241, 'PAOLAT46', 'BERMUDA', 'PAOLA BERMUDA NEGRO T.46', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 22, '2022-04-04 13:14:20', 24, NULL, 0, NULL),
(242, '5901234123457', 'PESQUERO', 'PAOLA PESQUERO AZUL T.46', NULL, 'lib/Productos/img/blitz_SN.png', '325.00', '0.00', 1, 5, 23, '2022-04-04 13:18:11', 24, NULL, 0, NULL),
(243, 'PAOLA44', 'PESQUERO', 'PESQUERO AZUL MEZCLILLA T.44', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 23, '2022-04-04 13:22:17', 24, NULL, 0, NULL),
(244, 'ZULE13', 'BERMUDA', 'BERMUDA ZULE T. 13', NULL, 'lib/Productos/img/blitz_SN.png', '315.00', '0.00', 1, 5, 22, '2022-04-04 13:36:27', 25, NULL, 0, NULL),
(245, 'ZULE21', 'PESQUERO', 'PESQUERO VINO Y BEX  T.21', NULL, 'lib/Productos/img/blitz_SN.png', '325.00', '0.00', 2, 5, 23, '2022-04-04 13:38:55', 25, NULL, 0, NULL),
(246, 'ZULE19', 'PESQUERO', 'PESQUERO ZULE VINO Y MOSTAZA T.19', NULL, 'lib/Productos/img/blitz_SN.png', '325.00', '0.00', 2, 5, 23, '2022-04-04 13:41:01', 25, NULL, 0, NULL),
(247, 'ZULE25', 'PESQUERO', 'PESQUERO ZULE VERDE Y CAFE T.25', NULL, 'lib/Productos/img/blitz_SN.png', '325.00', '0.00', 2, 5, 23, '2022-04-04 13:44:12', 25, NULL, 0, NULL),
(248, '004219', 'VESTIDO', 'VESTIDO PUNTO DE CRUZ HUESO T.42', NULL, 'lib/Productos/img/blitz_SN.png', '900.00', '0.00', 6, 5, 14, '2022-04-04 16:45:30', 29, NULL, 0, NULL),
(249, '004198', 'VESTIDO', 'VESTIDO PUNTO DE CRUZ T.34', NULL, 'lib/Productos/img/blitz_SN.png', '900.00', '0.00', 2, 5, 14, '2022-04-04 16:50:00', 29, NULL, 0, NULL),
(250, '004211', 'VESTIDO', 'VESTIDO PUNTO DE CRUZ T.40', NULL, 'lib/Productos/img/blitz_SN.png', '900.00', '0.00', 3, 5, 14, '2022-04-04 16:51:17', 29, NULL, 0, NULL),
(251, '004208', 'VESTIDO', 'VESTIDO PUNTO DE CRUZ T.38', NULL, 'lib/Productos/img/blitz_SN.png', '900.00', '0.00', 2, 5, 14, '2022-04-04 16:52:55', 29, NULL, 0, NULL),
(252, '004200', 'VESTIDO', 'VESTIDO PUNTO DE CRUZ T.36', NULL, 'lib/Productos/img/blitz_SN.png', '900.00', '0.00', 1, 5, 14, '2022-04-04 16:54:10', 29, NULL, 0, NULL),
(253, '20135213', 'VESTIDO', 'VESTIDO PAULA FIUSHA T.G', NULL, 'lib/Productos/img/blitz_SN.png', '545.00', '0.00', 1, 5, 14, '2022-04-04 16:57:27', 8, NULL, 0, NULL),
(254, '20135212', 'VESTIDO', 'VESTIDO PAULA FIUSHA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '545.00', '0.00', 1, 5, 14, '2022-04-04 16:58:50', 8, NULL, 0, NULL),
(255, '21733611', 'VESTIDO', 'VESTIDO BELI T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '620.00', '0.00', 1, 5, 14, '2022-04-04 17:00:25', 8, NULL, 0, NULL),
(256, '21733613', 'VESTIDO', 'VESTIDO BELI T.G', NULL, 'lib/Productos/img/blitz_SN.png', '620.00', '0.00', 1, 5, 14, '2022-04-04 17:01:09', 8, NULL, 0, NULL),
(257, '20138316', 'VESTIDO', 'VESTIDO MARA T. 40', NULL, 'lib/Productos/img/blitz_SN.png', '570.00', '0.00', 2, 5, 14, '2022-04-04 17:02:23', 8, NULL, 0, NULL),
(258, '20138315', 'VESTIDO', 'VESTIDO MARA T.38', NULL, 'lib/Productos/img/blitz_SN.png', '570.00', '0.00', 2, 5, 14, '2022-04-04 17:03:16', 8, NULL, 0, NULL),
(259, '280720218316', 'VESTIDO', 'VESTIDO TABACO YSHEDRON M.831 T.34 Y40', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 2, 5, 14, '2022-04-04 17:05:14', 9, NULL, 0, NULL),
(260, 'MOD 516', 'JUMPER', 'JUMPER NEGRO T.MYG M.516', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 25, '2022-04-04 17:10:25', 30, NULL, 0, NULL),
(261, '809370951109', 'VESTIDO', 'VESTIDO ROJO M.80937 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 1, 5, 14, '2022-04-04 17:11:39', 2, NULL, 0, NULL),
(262, '809370951208', 'VESTIDO', 'VESTIDO ROJO M.80937 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 0, 5, 14, '2022-04-04 17:12:25', 2, NULL, 0, NULL),
(263, '436780751106', 'VESTIDO', 'VESTIDO MOSTAZA M.43678 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '359.00', '0.00', 1, 5, 14, '2022-04-04 17:13:50', 2, NULL, 0, NULL),
(264, '982524921002', 'VESTIDO', 'VESTIDO IVORY M.98252 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '559.00', '0.00', 2, 5, 14, '2022-04-04 17:15:19', 2, NULL, 0, NULL),
(265, 'VS742', 'VESTIDO', 'VESTIDO SHEDRON M.7775 T.42', NULL, 'lib/Productos/img/blitz_SN.png', '560.00', '0.00', 1, 5, 14, '2022-04-04 17:20:24', 31, NULL, 0, NULL),
(266, 'GR7775', 'VESTIDO', 'VESTIDO ROJO M.7775 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '570.00', '0.00', 1, 5, 14, '2022-04-04 17:21:37', 31, NULL, 0, NULL),
(267, '004234', 'JUMPER', 'JUMPER MULTI PONPONES T.CH Y M', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 2, 5, 25, '2022-04-04 17:24:24', 30, NULL, 0, NULL),
(268, 'M524TG', 'VESTIDO', 'VESTIDO MEZCLILLA M.524 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 14, '2022-04-04 17:26:23', 30, NULL, 0, NULL),
(269, 'ROYALMARINO', 'VESTIDO', 'VESTIDO ROYAL T.UNITALLA', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 14, '2022-04-04 17:28:39', 31, NULL, 0, NULL),
(270, '18331021', 'VESTIDO', 'VESTIDO YANET NEGRO Y MARINO CH', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 2, 5, 14, '2022-04-04 17:30:10', 8, NULL, 0, NULL),
(271, '993258611008', 'JUMPER', 'JUMPER MULTI M.99325 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '519.00', '0.00', 1, 5, 25, '2022-04-04 17:35:23', 2, NULL, 0, NULL),
(272, '972768791004', 'VESTIDO', 'VESTIDO AZUL M.97276 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '589.00', '0.00', 1, 5, 14, '2022-04-04 17:42:56', 2, NULL, 0, NULL),
(273, '972713711002', 'VESTIDO', 'VESTIDO MEZCLILLA M.97271 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '509.00', '0.00', 1, 5, 14, '2022-04-04 17:46:19', 2, NULL, 0, NULL),
(274, '017495761101', 'VESTIDO', 'VESTIDO ANIMAL PRINT M.01749 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '539.00', '0.00', 0, 5, 14, '2022-04-04 17:47:34', 2, NULL, 0, NULL),
(275, '976249801107', 'VESTIDO', 'VESTIDO IVORY M.97624 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 1, 5, 14, '2022-04-04 17:48:25', 2, NULL, 0, NULL),
(276, '6613160325370', 'VESTIDO', 'VESTIDO MULT M.012633 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '369.00', '0.00', 1, 5, 14, '2022-04-04 17:49:20', 4, NULL, 0, NULL),
(277, 'V01434.M', 'VESTIDO', 'VESTIDO GRIS M.30792 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 14, '2022-04-04 17:51:04', 32, NULL, 0, NULL),
(278, '997003711104', 'VESTIDO', 'VESTIDO MEZCLILLA M.99700 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '509.00', '0.00', 1, 5, 14, '2022-04-04 17:51:51', 2, NULL, 0, NULL),
(279, '998306901100', 'VESTIDO', 'VESTIDO CEREZA M.99830 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '459.00', '0.00', 1, 5, 14, '2022-04-04 17:52:22', 2, NULL, 0, NULL),
(280, '887658756998', 'VESTIDO', 'VESTIDO INDIGO M.45565 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '489.00', '0.00', 1, 5, 14, '2022-04-04 17:53:10', 6, NULL, 0, NULL),
(281, '5639906776464', 'VESTIDO', 'VESTIDO VERDE M.56399 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 14, '2022-04-04 17:54:04', 5, NULL, 0, NULL),
(282, 'VRCT34', 'VESTIDO', 'VESTIDO M.870 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 14, '2022-04-04 17:54:52', 9, NULL, 0, NULL),
(283, 'CH001CG', 'VESTIDO', 'VESTIDO M.001 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '570.00', '0.00', 1, 5, 14, '2022-04-04 17:55:49', 30, NULL, 0, NULL),
(284, '990633271109', 'VESTIDO', 'VESTIDO TINTO M.99063 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '519.00', '0.00', 1, 5, 14, '2022-04-04 17:56:28', 2, NULL, 0, NULL),
(285, '992108611106', 'VESTIDO', 'VESTIDO MULTI M.99210 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 14, '2022-04-04 17:59:01', 2, NULL, 0, NULL),
(286, '20137512', 'VESTIDO', 'VESTIDO TURQUESA M.ZURIA T.M\r\n', NULL, 'lib/Productos/img/blitz_SN.png', '580.00', '0.00', 1, 5, 14, '2022-04-04 17:59:53', 8, NULL, 0, NULL),
(287, '513436', 'VESTIDO', 'VESTIDO RUTH M.5134RL T.36', NULL, 'lib/Productos/img/blitz_SN.png', '630.00', '0.00', 1, 5, 14, '2022-04-04 18:00:58', 18, NULL, 0, NULL),
(288, '981689801303', 'SALIDA DE BAÑO', 'SALIDA DE BAÑO M.98168 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '624.00', '0.00', 1, 5, 14, '2022-04-04 18:02:44', 2, NULL, 0, NULL),
(289, '981689801204', 'SALIDA DE BAÑO ', 'SALIDA DE BAÑO M.98168 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '624.00', '0.00', 1, 5, 14, '2022-04-04 18:04:07', 2, NULL, 0, NULL),
(290, '887658824949', 'VESTIDO', 'VESTIDO ANIMAL PRINT M.45619 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 14, '2022-04-04 18:04:56', 6, NULL, 0, NULL),
(291, '004241', 'VESTIDO', 'VESTIDO ROJO M. VIERA T.UNITALLA', NULL, 'lib/Productos/img/blitz_SN.png', '750.00', '0.00', 1, 5, 14, '2022-04-04 18:05:53', 31, NULL, 0, NULL),
(292, 'C2521T', 'VESTIDO', 'VESTIDO CRISTEL T.G', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 14, '2022-04-04 18:07:23', 15, NULL, 0, NULL),
(293, '18730623', 'VESTIDO', 'VESTIDO DALY T.G', NULL, 'lib/Productos/img/blitz_SN.png', '500.00', '0.00', 1, 5, 14, '2022-04-04 18:08:04', 8, NULL, 0, NULL);
INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `Marca`, `Foto`, `PrecioVenta`, `PrecioCompra`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `can`) VALUES
(294, '5131R', 'VESTIDO', 'VESTIDO M.5131 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '660.00', '0.00', 1, 5, 14, '2022-04-04 18:09:33', 18, NULL, 0, NULL),
(295, 'SOPHIARAYAS', 'VESTIDO', 'VESTIDO RALLAS T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 14, '2022-04-04 18:11:21', 9, NULL, 0, NULL),
(296, '5162RL', 'VESTIDO', 'VESTIDO M.5162 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '730.00', '0.00', 1, 5, 14, '2022-04-04 18:11:57', 18, NULL, 0, NULL),
(297, '17736015', 'VESTIDO', 'VESTIDO VINO T.38 ', NULL, 'lib/Productos/img/blitz_SN.png', '540.00', '0.00', 1, 5, 14, '2022-04-04 18:12:28', 8, NULL, 0, NULL),
(298, 'VS023', 'VESTIDO', 'VESTIDO VERDE M.023 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '590.00', '0.00', 1, 5, 14, '2022-04-04 18:13:19', 30, NULL, 0, NULL),
(299, '17121C', 'VESTIDO', 'VESTIDO MULTI M.17121C T.38', NULL, 'lib/Productos/img/blitz_SN.png', '540.00', '0.00', 1, 5, 14, '2022-04-04 18:14:12', 15, NULL, 0, NULL),
(300, 'GNT38', 'VESTIDO', 'VESTIDO NEGRO T.38', NULL, 'lib/Productos/img/blitz_SN.png', '580.00', '0.00', 1, 5, 14, '2022-04-04 18:14:56', 31, NULL, 0, NULL),
(301, '7742', 'VESTIDO', 'VESTIDO AMARILLO M.742 T.42', NULL, 'lib/Productos/img/blitz_SN.png', '570.00', '0.00', 1, 5, 14, '2022-04-04 18:18:00', 31, NULL, 0, NULL),
(302, '18333717', 'VESTIDO', 'VESTIDO VINO SHANDU T.42', NULL, 'lib/Productos/img/blitz_SN.png', '580.00', '0.00', 1, 5, 14, '2022-04-04 18:18:36', 8, NULL, 0, NULL),
(303, '04421C', 'VESTIDO', 'VESTIDO PRAGA ', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 14, '2022-04-04 18:19:20', 15, NULL, 0, NULL),
(304, 'VNLT3X', 'VESTIDO', 'VESTIDO NEGRO T.3XG', NULL, 'lib/Productos/img/blitz_SN.png', '740.00', '0.00', 1, 5, 14, '2022-04-04 18:20:18', 31, NULL, 0, NULL),
(305, '6613160374503', 'VESTIDO', 'VESTIDO ROJO M.026199 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '599.00', '0.00', 1, 5, 14, '2022-04-04 18:21:45', 4, NULL, 0, NULL),
(306, '6613160374501', 'VESTIDO', 'VESTIDO ROJO M.026199 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '599.00', '0.00', 1, 5, 14, '2022-04-04 18:22:19', 4, NULL, 0, NULL),
(307, 'VS003', 'VESTIDO', 'VESTIDO VERDE Y AMARILLO M.003 T. M Y G', NULL, 'lib/Productos/img/blitz_SN.png', '575.00', '0.00', 2, 5, 14, '2022-04-04 18:24:18', 30, NULL, 0, NULL),
(308, '10922', 'VESTIDO', 'VESTIDO RAYAS M.10922 T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '470.00', '0.00', 3, 5, 14, '2022-04-04 18:25:13', 15, NULL, 0, NULL),
(309, '05722', 'VESTIDO', 'VESTIDO URBAN M.05722 T. UNI', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 2, 5, 14, '2022-04-04 18:26:14', 15, NULL, 0, NULL),
(310, '13722', 'VESTIDO', 'VESTIDO HAMTON M.13722 T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 2, 5, 14, '2022-04-04 18:27:46', 15, NULL, 0, NULL),
(311, '500071353086', 'VESTIDO', 'VESTIDO MULTI T.G', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 14, '2022-04-04 18:29:03', 33, NULL, 0, NULL),
(312, '07722T', 'VESTIDO', 'VESTIDO TAYLA M.07722T T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 1, 5, 14, '2022-04-04 18:29:49', 15, NULL, 0, NULL),
(313, '03122C', 'VESTIDO', 'VESTIDO TAYLA CURVY M.03122C', NULL, 'lib/Productos/img/blitz_SN.png', '520.00', '0.00', 2, 5, 14, '2022-04-04 18:30:55', 15, NULL, 0, NULL),
(314, '72121T', 'VESTIDO', 'VESTIDO SOPHIA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '510.00', '0.00', 3, 5, 14, '2022-04-04 18:32:00', 15, NULL, 0, NULL),
(315, '140920218267', 'VESTIDO', 'VESTIDO M.826 T.38 Y 36', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 4, 5, 14, '2022-04-04 18:33:05', 9, NULL, 0, NULL),
(316, '01622C', 'VESTIDO', 'VESTIDO DARINKA M.01622C CURVY', NULL, 'lib/Productos/img/blitz_SN.png', '530.00', '0.00', 1, 5, 14, '2022-04-04 18:34:10', 15, NULL, 0, NULL),
(317, '02222C', 'VESTIDO', 'VESTIDO BICHI M.02222C T.CURVY', NULL, 'lib/Productos/img/blitz_SN.png', '520.00', '0.00', 2, 5, 14, '2022-04-04 18:35:15', 15, NULL, 0, NULL),
(318, '35921T', 'VESTIDO', 'VESTIDO ATENAS M.35921T', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 3, 5, 14, '2022-04-04 18:37:16', 15, NULL, 0, NULL),
(319, '100820218132', 'VESTIDO', 'VESTIDO M.813 T.38, 36 Y 34', NULL, 'lib/Productos/img/blitz_SN.png', '535.00', '0.00', 3, 5, 14, '2022-04-04 18:39:45', 9, NULL, 0, NULL),
(320, '220620218139', 'VESTIDO', 'VESTIDO M.813 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '535.00', '0.00', 2, 5, 14, '2022-04-04 18:40:36', 9, NULL, 0, NULL),
(321, '71421T', 'VESTIDO', 'VESTIDO ARIANE T.G', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 2, 5, 14, '2022-04-04 18:41:34', 15, NULL, 0, NULL),
(322, '38821', 'VESTIDO', 'VESTIDO ESCOTE CORAZON T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '470.00', '0.00', 2, 5, 14, '2022-04-04 18:42:29', 15, NULL, 0, NULL),
(323, 'VS049', 'VESTIDO', 'VESTIDO AMARILO, VERDE, NARANJA M.VS049 ', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 5, 5, 14, '2022-04-04 18:43:52', 30, NULL, 0, NULL),
(324, '20421C', 'VESTIDO', 'VESTIDO SAHARA CURVY M.20421C', NULL, 'lib/Productos/img/blitz_SN.png', '530.00', '0.00', 2, 5, 14, '2022-04-04 18:44:57', 15, NULL, 0, NULL),
(325, '21734813', 'VESTIDO', 'VESTIDO TEFY T.G', NULL, 'lib/Productos/img/blitz_SN.png', '460.00', '0.00', 2, 5, 14, '2022-04-04 18:46:07', 8, NULL, 0, NULL),
(326, '21734811', 'VESTIDO', 'VESTIDO TEFY T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '460.00', '0.00', 1, 5, 14, '2022-04-04 18:47:05', 8, NULL, 0, NULL),
(327, '02622', 'VESTIDO', 'VESTIDO BARBARA T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 3, 5, 14, '2022-04-04 18:50:07', 15, NULL, 0, NULL),
(328, 'VS019', 'VESTIDO', 'VESTIDO LINO M.019', NULL, 'lib/Productos/img/blitz_SN.png', '590.00', '0.00', 4, 5, 14, '2022-04-04 18:52:30', 30, NULL, 0, NULL),
(329, 'VS011', 'VESTIDO', 'VESTIDO ENCAJE M.011', NULL, 'lib/Productos/img/blitz_SN.png', '520.00', '0.00', 4, 5, 14, '2022-04-04 18:53:49', 30, NULL, 0, NULL),
(330, 'VS031', 'VESTIDO', 'VESTIDO CIRCULOS M.031 ', NULL, 'lib/Productos/img/blitz_SN.png', '520.00', '0.00', 3, 5, 14, '2022-04-04 18:55:07', 30, NULL, 0, NULL),
(331, '20021C', 'VESTIDO', 'VESTIDO BLAIR CURVY', NULL, 'lib/Productos/img/blitz_SN.png', '560.00', '0.00', 4, 5, 14, '2022-04-04 18:56:37', 15, NULL, 0, NULL),
(332, 'SANDRA ', 'VESTIDO', 'VESTIDO VERDE Y SHEDRON T. CH Y M', NULL, 'lib/Productos/img/blitz_SN.png', '500.00', '0.00', 3, 5, 14, '2022-04-04 18:59:00', 34, NULL, 0, NULL),
(333, '03022C', 'VESTIDO', 'VESTIDO0 MIRANDA CURVY', NULL, 'lib/Productos/img/blitz_SN.png', '620.00', '0.00', 3, 5, 14, '2022-04-04 19:00:07', 15, NULL, 0, NULL),
(334, '07022', 'VESTIDO', 'VESTIDO CRUZADO M.07022', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 14, '2022-04-04 19:01:05', 15, NULL, 0, NULL),
(335, '08022T', 'VESTIDO', 'VESTIDO BETSEY T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '500.00', '0.00', 0, 5, 14, '2022-04-04 19:01:46', 15, NULL, 0, NULL),
(336, '00222', 'PALAZZO', 'PALAZZO TABLONES T. UNI ', NULL, 'lib/Productos/img/blitz_SN.png', '500.00', '0.00', 1, 5, 26, '2022-04-04 19:06:01', 15, NULL, 0, NULL),
(337, '980520781200', 'PALAZZO', 'PALAZZO NEGRO M.98052 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 26, '2022-04-04 19:11:32', 2, NULL, 0, NULL),
(338, '01121C', 'PALAZZO ', 'PALAZZO ', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 26, '2022-04-04 19:12:14', 15, NULL, 0, NULL),
(339, '75921T', 'PALAZZO', 'PALAZZO VIRGINIA ', NULL, 'lib/Productos/img/blitz_SN.png', '530.00', '0.00', 0, 5, 26, '2022-04-04 19:13:27', 15, NULL, 0, NULL),
(340, '0306197005', 'PALAZZO', 'PALAZZO MOSTAZA M.705 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '625.00', '0.00', 1, 5, 26, '2022-04-04 19:15:01', 9, NULL, 0, NULL),
(341, '65021T', 'PALAZZO', 'PALAZZO ANIMAL PRINT', NULL, 'lib/Productos/img/blitz_SN.png', '510.00', '0.00', 0, 5, 26, '2022-04-04 19:15:42', 15, NULL, 0, NULL),
(342, '19784712', 'PALAZZO', 'PALAZZO NEGRO T.M', NULL, 'lib/Productos/img/blitz_SN.png', '650.00', '0.00', 1, 5, 26, '2022-04-04 19:17:16', 8, NULL, 0, NULL),
(343, '45221T', 'PALAZZO', 'PALAZZO NEGRO T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 26, '2022-04-04 19:17:48', 15, NULL, 0, NULL),
(344, '19821C', 'PALAZZO', 'PALAZZO ANIMAL PRINT CURVY', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 26, '2022-04-04 19:18:30', 15, NULL, 0, NULL),
(345, '49977', 'CREMA PROTECTORA PARA MUEBLES DE MADERA', 'CREMA PROTECTORA PARA MUEBLES DE MADERA', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 27, '2022-04-05 16:57:08', 12, NULL, 0, NULL),
(346, '30890', 'ROSAS', 'CREMA PARA MANOS ROSAS', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 28, '2022-04-05 17:06:01', 12, NULL, 0, NULL),
(347, '977990331103', 'BLUSA', 'BLUSA BLANCO M.97799 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '539.00', '0.00', 0, 5, 1, '2022-04-05 17:25:47', 2, NULL, 0, NULL),
(348, '6613160386945', 'VESTIDO', 'VESTIDO BLANCO M.026421 T. CH', NULL, 'lib/Productos/img/blitz_SN.png', '799.00', '0.00', 1, 5, 14, '2022-04-05 17:26:51', 4, NULL, 0, NULL),
(349, '972781011202', 'VESTIDO', 'VESTIDO VERDE M.97278 T. G', NULL, 'lib/Productos/img/blitz_SN.png', '499.00', '0.00', 0, 5, 14, '2022-04-05 17:28:53', 2, NULL, 0, NULL),
(350, '980951011303', 'BLUSA', 'BLUSA VERDE M.98095 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '439.00', '0.00', 1, 5, 1, '2022-04-05 17:30:34', 2, NULL, 0, NULL),
(351, '887658920399', 'BLUSA', 'BLUSA MALVA M.7561 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '229.00', '0.00', 1, 5, 1, '2022-04-05 17:31:54', 6, NULL, 0, NULL),
(352, '887658920405', 'BLUSA', 'BLUSA MALVA M.6561 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '229.00', '0.00', 1, 5, 1, '2022-04-05 17:32:33', 6, NULL, 0, NULL),
(353, '990702971107', 'BLUSA', 'BLUSA MAQUILLAJE M.99070 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '369.00', '0.00', 1, 5, 1, '2022-04-05 17:33:17', 2, NULL, 0, NULL),
(354, '998850951002', 'SALIDA DE BAÑO', 'SALIDA DE BAÑO M.99885 T.CH M', NULL, 'lib/Productos/img/blitz_SN.png', '599.00', '0.00', 1, 5, 14, '2022-04-05 17:34:33', 2, NULL, 0, NULL),
(355, '809251011205', 'BLUSA', 'BLUSA VERDE M.80925 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '419.00', '0.00', 1, 5, 1, '2022-04-05 17:35:36', 2, NULL, 0, NULL),
(356, '809320751209', 'BLUSA', 'BLUSA MOSTAZA M.80932 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 1, 5, 1, '2022-04-05 17:37:00', 2, NULL, 0, NULL),
(357, '575549801208', 'SALIDA DE BAÑO', 'SALIDA DE BAÑO IVORY M.57554 T.XG ', NULL, 'lib/Productos/img/blitz_SN.png', '589.00', '0.00', 0, 5, 14, '2022-04-05 17:37:41', 2, NULL, 0, NULL),
(358, '809320751308', 'BLUSA', 'BLUSA MOSTAZA M.80932 T.XG ', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 1, 5, 1, '2022-04-05 17:38:31', 2, NULL, 0, NULL),
(359, '977990331004', 'BLUSA', 'BLUSA BLANCO M.97799 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '499.00', '0.00', 1, 5, 1, '2022-04-05 17:39:04', 2, NULL, 0, NULL),
(360, '990898611306', 'BLUSA', 'BLUSA MULTI M.99089 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 1, 5, 1, '2022-04-05 17:39:45', 2, NULL, 0, NULL),
(361, '990898611207', 'BLUSA', 'BLUSA MULTI M.99089 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 1, 5, 1, '2022-04-05 17:40:17', 2, NULL, 0, NULL),
(362, '004199', 'BLUSA', 'BLUSA BORDADO T.32, 34, 28', NULL, 'lib/Productos/img/blitz_SN.png', '750.00', '0.00', 3, 5, 1, '2022-04-05 17:43:06', 29, NULL, 0, NULL),
(363, 'NC634M', 'BLUSA', 'BLUSA NEGRO CADENA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 0, 5, 1, '2022-04-05 17:44:58', 30, NULL, 0, NULL),
(364, '181958', 'BLUSA', 'BLUSA VERDE Y NEGRO T.3XL', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 2, 5, 1, '2022-04-05 17:49:48', 30, NULL, 0, NULL),
(365, 'TM8601', 'BLUSA', 'BLUSA CUADROS T.CH, M Y G', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 6, 5, 1, '2022-04-05 17:51:46', 34, NULL, 0, NULL),
(366, 'BL081', 'BLUSA', 'BLUSA CUELLO HAMACA M.081 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 1, 5, 1, '2022-04-05 17:55:40', 30, NULL, 0, NULL),
(367, 'BL069', 'BLUSA', 'BLUSA TIRANTES, ROJO, AZUL, FUSHIA M.069', NULL, 'lib/Productos/img/blitz_SN.png', '395.00', '0.00', 6, 5, 1, '2022-04-05 17:57:18', 30, NULL, 0, NULL),
(368, 'BL121', 'BLUSA', 'BLUSA M.121 T.CH, M, G, XG', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 10, 5, 1, '2022-04-05 17:59:16', 30, NULL, 0, NULL),
(369, 'BL133', 'BLUSA', 'BLUSA M.133 T.CH, M, G', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 9, 5, 1, '2022-04-05 17:59:57', 30, NULL, 0, NULL),
(370, '7703', 'BLUSA', 'BLUSA MOSTAZA Y MARINO M.7303 T.32 Y 34', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 2, 5, 1, '2022-04-05 18:00:45', 31, NULL, 0, NULL),
(371, '21123031', 'BLUSA', 'BLUSA ISABELLA MOSTAZA T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 0, 5, 1, '2022-04-05 18:02:05', 8, NULL, 0, NULL),
(372, '21123033', 'BLUSA', 'BLUSA ISABELLA MOSTAZA T.G', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 1, '2022-04-05 18:02:38', 8, NULL, 0, NULL),
(373, '887658770376', 'BLUSA', 'BLUSA VERDE M.43959', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-05 18:04:12', 6, NULL, 0, NULL),
(374, '887658641027', 'BLUSA', 'BLUSA VINO M.43959 T.XL', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-05 18:04:52', 6, NULL, 0, NULL),
(375, '887658641010', 'BLUSA', 'BLUSA GRIS M.43959 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-05 18:05:28', 6, NULL, 0, NULL),
(376, '887658640990', 'BLUSA', 'BLUSA GRIS M.43959 T. M', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-05 18:05:57', 6, NULL, 0, NULL),
(377, '270820214103', 'BLUSA', 'BLUSA M.410 T.32, 34, 36, 38', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 6, 5, 1, '2022-04-05 18:07:19', 9, NULL, 0, NULL),
(378, '5021235493790', 'BLUSA', 'BLUSA M.1666 T.34, 36, 38', NULL, 'lib/Productos/img/blitz_SN.png', '438.00', '0.00', 2, 5, 1, '2022-04-05 18:08:51', 18, NULL, 0, NULL),
(379, '21728916', 'BLUSA', 'BLUSA SIGRID VERDE T.40', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 0, 5, 1, '2022-04-05 18:09:55', 8, NULL, 0, NULL),
(380, '21728917', 'BLUSA', 'BLUSA SIGRID T.42', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 1, '2022-04-05 18:10:29', 8, NULL, 0, NULL),
(381, '21728915', 'BLUSA', 'BLUSA SIGRID VERDE T.38', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 1, '2022-04-05 18:11:06', 8, NULL, 0, NULL),
(382, '21126615', 'BLUSA', 'BLUSA HIANA T.38', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 1, '2022-04-05 18:11:45', 8, NULL, 0, NULL),
(383, '21126617', 'BLUSA', 'BLUSA HIANA T.42', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 1, '2022-04-05 18:12:08', 8, NULL, 0, NULL),
(384, '21126616', 'BLUSA', 'BLUSA HIANA T.40', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 1, '2022-04-29 14:16:37', 8, NULL, 0, NULL),
(385, '21722847', 'BLUSA', 'BLUSA CINTHYA T.42', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 1, 5, 1, '2022-04-05 18:13:12', 8, NULL, 0, NULL),
(386, '21722846', 'BLUSA', 'BLUSA CINTHYA T.40', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 1, 5, 1, '2022-04-05 18:13:36', 8, NULL, 0, NULL),
(387, '5058', 'BLUSA', 'BLUSA LILIAN T. 1X Y 2X', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 2, 5, 1, '2022-04-05 18:14:41', 30, NULL, 0, NULL),
(388, '191539', 'BLUSA', 'BLUSA KLAXON T.1X, 2X, 3X', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 3, 5, 1, '2022-04-05 18:15:39', 30, NULL, 0, NULL),
(389, 'LINDA608', 'BLUSA', 'BLUSA CUADROS TIRANTES M.608', NULL, 'lib/Productos/img/blitz_SN.png', '235.00', '0.00', 3, 5, 1, '2022-04-05 18:18:36', 30, NULL, 0, NULL),
(390, 'LINDA591', 'BLUSA', 'BLUSA CUADROS T.CH, M ', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 3, 5, 1, '2022-04-05 18:19:50', 30, NULL, 0, NULL),
(391, '130109', 'BLUSA', 'BLUSA CARAMELO T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 2, 5, 1, '2022-04-05 18:20:38', 8, NULL, 0, NULL),
(392, '20125436', 'BLUSA', 'BLUSA PUNTOS T.38 Y 40', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 1, '2022-04-05 18:21:22', 8, NULL, 0, NULL),
(393, '20125435', 'BLUSA', 'BLUSA PUNTOS T.38', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 1, '2022-04-05 18:21:52', 8, NULL, 0, NULL),
(394, '00000001', 'BLUSA', 'BLUSA URSULA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 1, '2022-04-05 18:22:38', 8, NULL, 0, NULL),
(395, '21121832', 'BLUSA', 'BLUSA URSULA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 1, '2022-04-05 18:23:04', 8, NULL, 0, NULL),
(396, '191160', 'BLUSA', 'BLUSA RAYAS T.1X, 2X', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 2, 5, 1, '2022-04-05 18:24:10', 30, NULL, 0, NULL),
(397, '887658221151', 'BLUSA', 'BLUSA GRIS M.4382 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '155.00', '0.00', 1, 5, 1, '2022-04-05 18:25:07', 6, NULL, 0, NULL),
(398, '612140996299', 'BLUSA', 'BLUSA FUSHIA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '155.00', '0.00', 1, 5, 1, '2022-04-05 18:25:35', 6, NULL, 0, NULL),
(399, 'SANDRABLANCO', 'BLUSA', ' BLUSA BLANCO ', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 3, 5, 1, '2022-04-05 18:30:42', 34, NULL, 0, NULL),
(400, 'SANDRANEGRO', 'BLUSA', 'BLUSA NEGRA ', NULL, 'lib/Productos/img/blitz_SN.png', '375.00', '0.00', 2, 5, 1, '2022-04-05 18:31:55', 34, NULL, 0, NULL),
(402, '990759801204', 'BLUSA', 'BLUSA IVORI M.99075 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '539.00', '0.00', 1, 5, 1, '2022-04-06 10:59:13', 2, NULL, 0, NULL),
(403, '201268NM ', 'BLUSA', 'BLUSA NEGRA  LISA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 1, 5, 1, '2022-04-06 11:01:50', 8, NULL, 0, NULL),
(404, '201268RCH', 'BLUSA', 'BLUSA ROJA LISA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 1, 5, 1, '2022-04-06 11:03:15', 8, NULL, 0, NULL),
(405, '20126824', 'BLUSA', 'BLUSA ROJA LISA T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 0, 5, 1, '2022-04-06 11:04:07', 8, NULL, 0, NULL),
(406, 'BEMTM', 'BLUSA', 'BLUSA CORAL T.M', NULL, 'lib/Productos/img/blitz_SN.png', '435.00', '0.00', 1, 5, 1, '2022-04-06 11:54:44', 34, NULL, 0, NULL),
(407, '1675', 'BLUSA', 'BLUSA CIRCULOS M.1675 T.32', NULL, 'lib/Productos/img/blitz_SN.png', '458.00', '0.00', 2, 5, 1, '2022-04-06 11:56:44', 18, NULL, 0, NULL),
(408, '769259203', 'BLUSA', 'BLUSA ANIMAL PRINT T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '410.00', '0.00', 2, 5, 1, '2022-04-06 11:59:56', 31, NULL, 0, NULL),
(409, '6613160374573', 'BLUSA', 'BLUSA AQUA M.026294 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 1, '2022-04-06 12:10:00', 4, NULL, 0, NULL),
(410, '6613160368336', 'BLUSA', 'BLUSA BLANCO M.028071 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '379.00', '0.00', 1, 5, 1, '2022-04-06 12:10:59', 4, NULL, 0, NULL),
(411, '21725031', 'BLUSA', 'BLUSA ANA SARGA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 1, '2022-04-06 12:11:50', 8, NULL, 0, NULL),
(412, '21725033', 'BLUSA', 'BLUSA ANA SARGA T.G', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 1, '2022-04-06 12:12:32', 8, NULL, 0, NULL),
(413, '887658865416', 'BLUSA', 'BLUSA TIRANTES M.4494 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '169.00', '0.00', 1, 5, 1, '2022-04-19 12:16:27', 6, NULL, 0, NULL),
(414, '887658865447', 'BLUSA', 'BLUSA TIRANTES M.4494 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '169.00', '0.00', 1, 5, 1, '2022-04-19 12:16:00', 6, NULL, 0, NULL),
(415, '19729245', 'BLUSA', 'BLUSA MARINO M.ALEXA LISA T.38', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 0, 5, 1, '2022-04-06 12:17:34', 8, NULL, 0, NULL),
(416, '070819479', 'BLUSA', 'BLUSA MOSTAZA M.478 T.32', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 1, '2022-04-06 12:18:17', 9, NULL, 0, NULL),
(417, '21120725', 'BLUSA', 'BLUSA ROJO M.LITZY FLOR T.38', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 1, '2022-04-06 12:19:24', 8, NULL, 0, NULL),
(418, 'BL033RG', 'BLUSA', 'BLUSA FLOREADA M.033 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '345.00', '0.00', 1, 5, 1, '2022-04-06 12:20:47', 30, NULL, 0, NULL),
(419, 'A01508M', 'BLUSA', 'BLUSA AZUL MARINO M.21351 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 1, '2022-04-06 12:22:38', 32, NULL, 0, NULL),
(420, 'LINDA634', 'BLUSA', 'BLUSA ANIMAL PRINT M.634 T. M Y G', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 3, 5, 1, '2022-04-06 12:24:59', 30, NULL, 0, NULL),
(421, '000002', 'BLUSA', 'BLUSA PLATA T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 1, '2022-04-06 12:27:03', 8, NULL, 0, NULL),
(422, '887658909462', 'BLUSA', 'BLUSA ANIMAL PRINT M.4572001 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 1, '2022-04-06 12:28:06', 6, NULL, 0, NULL),
(423, '982391571102', 'BLUSA', 'BLUSA BLANCA M.98239 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '489.00', '0.00', 1, 5, 1, '2022-04-06 12:29:12', 2, NULL, 0, NULL),
(424, '21186232', 'BLUSA', 'BLUSA MOSTAZA M.CERISE T.M', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 1, '2022-04-06 12:30:07', 8, NULL, 0, NULL),
(425, 'BPLTG', 'BLUSA', 'BLUSA SHAKIRA PLATA T.G', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 1, 5, 1, '2022-04-06 12:32:21', 34, NULL, 0, NULL),
(426, '24667', 'BLUSA', 'BLUSA ROJO M.24667 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 1, '2022-04-06 12:33:30', 2, NULL, 0, NULL),
(427, '190719322', 'BLUSA', 'BLUSA FLOREADA M.322 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 1, '2022-04-06 12:35:34', 9, NULL, 0, NULL),
(428, '809320751001', 'BLUSA', 'BLUSA MOSTAZA M.80932 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 1, 5, 1, '2022-04-06 12:36:47', 2, NULL, 0, NULL),
(429, '998668611006', 'BLUSA', 'BLUSA MULTI M.99866 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '319.00', '0.00', 1, 5, 1, '2022-04-06 12:37:40', 2, NULL, 0, NULL),
(430, '976940761106', 'BLUSA', 'BLUSA NARANJA M.97694 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '419.00', '0.00', 1, 5, 1, '2022-04-06 12:38:41', 2, NULL, 0, NULL),
(431, '300819260', 'BLUSA', 'BLUSA MARINO M.260 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 1, '2022-04-06 12:39:27', 9, NULL, 0, NULL),
(432, '7399', 'BLUSA', 'BLUSA MARINO M.7399 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 1, '2022-04-06 12:44:28', 31, NULL, 0, NULL),
(433, '786436R', 'BLUSA', 'BLUSA ROJO BORDADO M.7864 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 1, 5, 1, '2022-04-06 12:46:09', 31, NULL, 0, NULL),
(434, '964060951002', 'BLUSA', 'BLUSA ROJO M.96406 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '319.00', '0.00', 1, 5, 1, '2022-04-06 12:47:14', 2, NULL, 0, NULL),
(435, '6613160361871', 'BLUSA', 'BLUSA VERDE M.024212 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '489.00', '0.00', 1, 5, 1, '2022-04-06 12:48:50', 4, NULL, 0, NULL),
(436, 'BL001BM', 'BLUSA', 'BLUSA BLANCA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '390.00', '0.00', 0, 5, 1, '2022-04-06 12:49:56', 30, NULL, 0, NULL),
(437, '817560331006', 'BLUSA', 'BLUSA BLANCO M.81756 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '459.00', '0.00', 1, 5, 1, '2022-04-06 12:50:58', 2, NULL, 0, NULL),
(438, '964182971209', 'BLUSA', 'BLUSA MAQUILLAJE M.96418 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '359.00', '0.00', 0, 5, 1, '2022-04-06 12:52:05', 2, NULL, 0, NULL),
(439, '13036', 'BLUSA', 'BLUSA ORO M.130 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '328.00', '0.00', 1, 5, 1, '2022-04-06 12:53:23', 9, NULL, 0, NULL),
(440, '21721933', 'BLUSA', 'BLUSA ROJO M.21621972 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 1, '2022-04-06 12:54:22', 8, NULL, 0, NULL),
(441, '887658743639', 'BLUSA', 'BLUSA ACUARELA M.43337 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '329.00', '0.00', 1, 5, 1, '2022-04-06 12:56:43', 6, NULL, 0, NULL),
(442, '7826', 'BLUSA', 'BLUSA ROJO M.7826 T.40', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 1, '2022-04-06 12:57:34', 31, NULL, 0, NULL),
(443, '809303351204', 'BLUSA', 'BLUSA LAVANDA M.80930 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '319.00', '0.00', 1, 5, 1, '2022-04-06 12:58:19', 2, NULL, 0, NULL),
(444, 'A02186.CH', 'BLUSA', 'BLUSA VERDE M.25483 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 1, '2022-04-06 12:59:31', 32, NULL, 0, NULL),
(445, '800690671104', 'BLUSA', 'BLUSA GRIS M.80069 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '339.00', '0.00', 1, 5, 1, '2022-04-06 13:00:23', 2, NULL, 0, NULL),
(446, '887658792118', 'BLUSA', 'BLUSA JASPE GRIS M.43355 T.2XG', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-06 13:01:27', 6, NULL, 0, NULL),
(447, '977830331102', 'BLUSA', 'BLUSA BLANCO M.97783 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '499.00', '0.00', 1, 5, 1, '2022-04-06 13:02:26', 2, NULL, 0, NULL),
(448, '217203CH', 'BLUSA', 'BLUSA BLANCA M.217203 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 1, '2022-04-06 13:04:54', 8, NULL, 0, NULL),
(449, '966387871001', 'BLUSA', 'BLUSA OCRE M.96638 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '419.00', '0.00', 1, 5, 1, '2022-04-06 13:05:51', 2, NULL, 0, NULL),
(450, '19724521', 'BLUSA', 'BLUSA NEGRA M.SANDY ANIMAL T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 0, 5, 1, '2022-04-06 13:06:42', 8, NULL, 0, NULL),
(451, '980951011006', 'BLUSA', 'BLUSA VERDE M.98095 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '439.00', '0.00', 1, 5, 1, '2022-04-06 13:07:45', 2, NULL, 0, NULL),
(452, '887658966731', 'BLUSA', 'BLUSA VIOLETA M.8101701', NULL, 'lib/Productos/img/blitz_SN.png', '229.00', '0.00', 1, 5, 1, '2022-04-06 13:10:16', 6, NULL, 0, NULL),
(453, '436770331004', 'BLUSA', 'BLUSA BLANCO M.43677 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '269.00', '0.00', 1, 5, 1, '2022-04-06 13:11:30', 2, NULL, 0, NULL),
(454, '887658911120', 'BLUSA', 'BLUSA BLANCO M.4572901 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-06 13:17:39', 6, NULL, 0, NULL),
(455, '19724811', 'BLUSA', 'BLUSA NEGRO M.LILIANA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 1, '2022-04-06 13:18:16', 8, NULL, 0, NULL),
(456, 'SANDRAH', 'BLUSA', 'BLUSA HOMBRERAS AZUL, SEHDRON, VERDE Y VINO T.CH, M, G', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 7, 5, 1, '2022-04-06 13:27:34', 34, NULL, 0, NULL),
(457, '21725511', 'BODY', 'BODY ROJO VINOY AZUL M.217255 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '390.00', '0.00', 2, 5, 30, '2022-04-06 14:00:32', 8, NULL, 0, NULL),
(458, '21725512', 'BODY', 'BODY MARINO Y VINO M.217255 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '390.00', '0.00', 2, 5, 30, '2022-04-06 14:01:16', 8, NULL, 0, NULL),
(459, '21725513', 'BODY', 'BODY VINO Y MARINO M.217255 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '390.00', '0.00', 2, 5, 30, '2022-04-06 14:02:15', 8, NULL, 0, NULL),
(460, 'SANDRABP', 'BODY', 'BODY PLATA SHAKIRAS T.CH, M, G', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 3, 5, 30, '2022-04-06 13:55:56', 34, NULL, 0, NULL),
(461, 'SANDRAPLATAD', 'BODY', 'BODY PLATA SHAKIRAS T.G Y M', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 2, 5, 30, '2022-04-06 14:04:32', 34, NULL, 0, NULL),
(462, '817817001003', 'BODY', 'BODY VERDE M.81781 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '419.00', '0.00', 1, 5, 30, '2022-04-06 14:08:45', 2, NULL, 0, NULL),
(463, 'LINDA629', 'BODY', 'BODY MOSTAZA M.629T. CH,M , G', NULL, 'lib/Productos/img/blitz_SN.png', '410.00', '0.00', 3, 5, 30, '2022-04-06 16:08:59', 30, NULL, 0, NULL),
(464, 'A2012', 'BLUSA', 'BLUSA CAMEL T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 1, '2022-04-06 16:11:39', 30, NULL, 0, NULL),
(465, '6613160368290', 'BLUSA', 'BLUSA FUSHIA M.028048 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '489.00', '0.00', 1, 5, 1, '2022-04-06 16:13:03', 4, NULL, 0, NULL),
(466, 'EJ02221', 'BLUSA', 'BLUSA ESTANPADA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 1, '2022-04-06 16:25:26', 15, NULL, 0, NULL),
(467, '21724712', 'BLUSA', 'BLUSA INGRID T.M', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 1, 5, 1, '2022-04-06 16:26:01', 30, NULL, 0, NULL),
(468, '7837', 'BLUSA', 'BLUSA AZUL MARINO M.7837 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 1, '2022-04-06 16:26:48', 31, NULL, 0, NULL),
(469, 'SOPHIA407', 'BLUSA', 'BLUSA SOPHIA M.407 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 2, 5, 1, '2022-04-06 16:31:01', 9, NULL, 0, NULL),
(470, '887658657400', 'BLUSA', 'BLUSA PLUMBAGO M.43954 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 1, '2022-04-06 16:31:52', 6, NULL, 0, NULL),
(471, '5580920566466', 'BLUSA', 'BLUSA MULTI M.1453836 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 1, '2022-04-06 16:32:54', 5, NULL, 0, NULL),
(472, '6901688190288', 'BLUSA', 'BLUSA CORAL T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '255.00', '0.00', 1, 5, 1, '2022-04-06 16:33:38', 30, NULL, 0, NULL),
(473, 'SOPHIA421', 'BLUSA', 'BLUSA MOSTAZA Y VINO M.421 T.32 Y 36', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 2, 5, 1, '2022-04-06 16:39:11', 9, NULL, 0, NULL),
(474, 'EM4109', 'BLUSA', 'BLUSA MARINO T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 1, '2022-04-06 16:43:50', 30, NULL, 0, NULL),
(475, '300CH', 'BLUSA', 'BLUSA MULTI T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 1, '2022-04-06 16:44:36', 30, NULL, 0, NULL),
(476, '090819725', 'BLUSA', 'BLUSA VINO M.725 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 1, '2022-04-06 16:45:18', 9, NULL, 0, NULL),
(477, 'LINDA664', 'BLUSA', 'BLUSA ROJO M.664 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 1, 5, 1, '2022-04-06 16:46:25', 30, NULL, 0, NULL),
(478, '120919714', 'BLUSA', 'BLUSA VERDE M.714 T.32 Y 38', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 2, 5, 1, '2022-04-06 16:47:37', 9, NULL, 0, NULL),
(479, 'LINDA658', 'BLUSA', 'BLUSA ROSA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 1, 5, 1, '2022-04-06 16:48:30', 30, NULL, 0, NULL),
(480, 'LINDA637', 'BLUSA', 'BLUSA VINO Y ROSA T.CH,M,G,XG', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 5, 5, 1, '2022-04-06 16:49:56', 30, NULL, 0, NULL),
(481, 'LINDA621', 'BLUSA', 'BLUSA VINO M.621 T.XG Y G', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 2, 5, 1, '2022-04-06 16:51:37', 30, NULL, 0, NULL),
(482, '080919433', 'BLUSA', 'BLUSA ROSA Y AZUL', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 2, 5, 1, '2022-04-06 16:53:15', 9, NULL, 0, NULL),
(483, '180219407', 'BLUSA', 'BLUSA MOSTAZA M.407 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '396.00', '0.00', 1, 5, 1, '2022-04-06 16:54:23', 9, NULL, 0, NULL),
(484, '130919713', 'BLUSA', 'BLUSA AZUL M.713 T.32', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 1, '2022-04-06 16:55:04', 9, NULL, 0, NULL),
(485, 'SANDRAENCAJE', 'BLUSA', 'BLUSA VERDE CORTA T.CH Y G ', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 2, 5, 1, '2022-04-06 16:56:11', 34, NULL, 0, NULL),
(486, 'SANDRASACO', 'SACOS', 'SACO ANIMAL PRINT ', NULL, 'lib/Productos/img/blitz_SN.png', '520.00', '0.00', 4, 5, 31, '2022-04-06 17:01:55', 34, NULL, 0, NULL),
(487, '1907198000', 'SACOS', 'SACO NEGRO M.8000 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '560.00', '0.00', 1, 5, 31, '2022-04-06 17:03:39', 9, NULL, 0, NULL),
(488, '109202180050', 'SACOS', 'SACO NEGRO M.8005 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 2, 5, 31, '2022-04-06 17:04:29', 9, NULL, 0, NULL),
(489, '2010198035', 'SACOS', 'SACO NEGRO M.8035 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '560.00', '0.00', 1, 5, 31, '2022-04-06 17:05:15', 9, NULL, 0, NULL),
(490, '67421', 'BODY', 'DUO BODY SHORT CELINA T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 0, 5, 30, '2022-04-06 17:16:36', 15, NULL, 0, NULL),
(491, '00422', 'SHORT ', 'DUO FAJO FORRADO T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '530.00', '0.00', 1, 5, 15, '2022-04-06 17:17:47', 15, NULL, 0, NULL),
(492, '00422C', 'SHORT ', 'DUO FAJO FORRADO CURVY', NULL, 'lib/Productos/img/blitz_SN.png', '580.00', '0.00', 4, 5, 15, '2022-04-06 17:18:41', 15, NULL, 0, NULL),
(493, '08221C', 'PANTALON', 'DUO YEVES CURVY ', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 26, '2022-04-06 17:25:24', 15, NULL, 0, NULL),
(494, '14822', 'SHORT ', 'DUO ZURY T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '510.00', '0.00', 2, 5, 15, '2022-04-06 17:26:29', 15, NULL, 0, NULL),
(495, '07522C', 'PALAZZO ', 'DUO ROLT CURVY ', NULL, 'lib/Productos/img/blitz_SN.png', '610.00', '0.00', 1, 5, 26, '2022-04-06 17:27:17', 15, NULL, 0, NULL),
(496, '14022', 'PALAZZO ', 'DUO HONOR T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '520.00', '0.00', 2, 5, 26, '2022-04-06 17:28:11', 15, NULL, 0, NULL),
(497, 'TERRABLANCO', 'BLUSA', 'BLUSA BLANCO T.M', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 1, '2022-04-06 17:43:32', 4, NULL, 0, NULL),
(498, '55121T', 'CONJUNTO', 'DUO CHIARA T.G', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 15, '2022-04-06 17:45:11', 15, NULL, 0, NULL),
(499, '12822', 'VESTIDO', 'VESTIDO ZORY T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 14, '2022-04-06 17:46:40', 15, NULL, 0, NULL),
(500, 'SH007', 'SHORT ', 'SHORT ROJO.VERDE,ROSA M.007 T.CH,M,G,XG', NULL, 'lib/Productos/img/blitz_SN.png', '410.00', '0.00', 8, 5, 15, '2022-04-15 10:06:41', 30, NULL, 0, NULL),
(501, '983900951002', 'SHORT ', 'SHORT ROJO M.98390 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '339.00', '0.00', 1, 5, 15, '2022-04-06 17:56:21', 2, NULL, 0, NULL),
(502, 'RUTH1105', 'SHORT ', 'SHORT AZUL M.1105 T.32', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 15, '2022-04-06 17:59:53', 18, NULL, 0, NULL),
(503, '941155681105', 'SHORT ', 'SHORT OLIVO M.94115 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '319.00', '0.00', 1, 5, 15, '2022-04-06 18:00:49', 2, NULL, 0, NULL),
(504, '980811451003', 'SHORT ', 'SHORT MARINO M.98081 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '429.00', '0.00', 1, 5, 15, '2022-04-06 18:01:28', 2, NULL, 0, NULL),
(505, '980291651009', 'SHORT ', 'SHORT AMARILLO M.98029 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '339.00', '0.00', 1, 5, 15, '2022-04-06 18:01:57', 2, NULL, 0, NULL),
(506, '941155681204', 'SHORT ', 'SHORT OLIVO 94115 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '319.00', '0.00', 1, 5, 15, '2022-04-06 18:02:28', 2, NULL, 0, NULL),
(507, '980825061205', 'SHORT ', 'SHORT PALO DE ROSA M.98082 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '439.00', '0.00', 2, 5, 15, '2022-04-06 18:03:05', 2, NULL, 0, NULL),
(508, '980793491202', 'SHORT ', 'SHORT AZUL M.98079 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '269.00', '0.00', 1, 5, 15, '2022-04-06 18:03:49', 2, NULL, 0, NULL),
(509, '984418611105', 'SHORT ', 'SHORT MULTI M.98441 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 15, '2022-04-06 18:04:25', 2, NULL, 0, NULL),
(510, '887658687742', 'SALIDA DE BAÑO', 'SALIDA DE BANIO T.CH M.6978', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 26, '2022-04-06 18:06:18', 6, NULL, 0, NULL),
(511, '67221', 'CHAMARRA', 'CHAMARRA MAGALI T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 2, 5, 31, '2022-04-06 18:15:52', 15, NULL, 0, NULL),
(512, '192114962838', 'SHORT ', 'SHORT KAKI OLD NAVY', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 15, '2022-04-07 10:13:26', 33, NULL, 0, NULL),
(513, 'SM53144L09', 'FALDA', 'FALDA M. 53144 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 32, '2022-04-07 10:21:40', 20, NULL, 0, NULL),
(514, 'M33201L07', 'FALDA', 'FALDA M.33201 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 32, '2022-04-07 10:23:49', 17, NULL, 0, NULL),
(515, 'M33201L09', 'FALDA', 'FALDA M.33201 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 32, '2022-04-07 10:25:05', 17, NULL, 0, NULL),
(516, 'M33202L09', 'FALDA', 'FALDA MEZCILLA M.33202 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 3, 5, 32, '2022-04-07 10:26:24', 17, NULL, 0, NULL),
(517, 'M33202L07', 'FALDA', 'FALDA MEZCLILLA  M.33202 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 32, '2022-04-07 10:27:42', 17, NULL, 0, NULL),
(518, 'MS33272LFXI13', 'FALDA', 'FALDA MEZCLILLA M.33272 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 0, 5, 32, '2022-04-07 10:28:33', 17, NULL, 0, NULL),
(519, 'MA53158TAPI15', 'FALDA', 'FALDA MEZCLILLA M.53158 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 0, 5, 32, '2022-04-07 10:29:24', 20, NULL, 0, NULL),
(520, 'MA53158TDSM15', 'FALDA', 'FALDA MEZCLILLA M.53158 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 32, '2022-04-07 10:30:18', 20, NULL, 0, NULL),
(521, 'MS33240TAEI15', 'FALDA', 'FALDA MEZCLILLA M.33240 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 0, 5, 32, '2022-04-07 10:31:03', 17, NULL, 0, NULL),
(522, 'MM33257LAPI11', 'FALDA', 'FALDA MEZCLILLA M.33257 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 1, 5, 32, '2022-04-07 10:31:46', 17, NULL, 0, NULL),
(523, 'MM33257LAPI09', 'FALDA', 'FALDA MEZCLILLA .M33257 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 1, 5, 32, '2022-04-07 10:32:28', 17, NULL, 0, NULL),
(524, 'MM33257LAPI13', 'FALDA', 'FALDA MEZCLILLA M.33257 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 0, 5, 32, '2022-04-07 10:33:08', 17, NULL, 0, NULL),
(525, 'MA53158TAPI15', 'FALDA', 'FALDA MEZCLILLA M.53158 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 32, '2022-04-07 10:33:53', 20, NULL, 0, NULL),
(526, 'MN33177L09', 'FALDA', 'FALDA NEGRA M.33177 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 32, '2022-04-07 10:34:37', 17, NULL, 0, NULL),
(527, 'NS33260LAHM15', 'FALDA', 'FALDA NEGRA M.33260 T.15', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 32, '2022-04-07 10:35:15', 17, NULL, 0, NULL),
(528, 'MS53160CAEI11', 'FALDA', 'FALDA MEZCLILLA M.53160 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 32, '2022-04-07 10:36:29', 20, NULL, 0, NULL),
(529, 'MS53162LFXI13', 'FALDA', 'FALDA MEZCLILLA M.53162 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 1, 5, 32, '2022-04-07 10:37:28', 20, NULL, 0, NULL),
(530, 'AM33214T11', 'FALDA', 'FALDA MEZCLILLA M.33214 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 0, 5, 32, '2022-04-07 10:38:39', 17, NULL, 0, NULL),
(531, 'MS33240TAAI11', 'FALDA', 'FALDA MEZCLILLA M.33240 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 32, '2022-04-07 10:39:39', 17, NULL, 0, NULL),
(532, 'MS53160CAEI09', 'FALDA', 'FALDA MEZCLILLA M.53160 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 32, '2022-04-07 10:40:24', 20, NULL, 0, NULL),
(533, 'MS53160CAEI07', 'FALDA', 'FALDA MEZCLILLA M.53160 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 32, '2022-04-07 10:41:04', 20, NULL, 0, NULL),
(534, 'MS33272LAEI13', 'FALDA', 'FALDA MEZCLILLA M.33272 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 0, 5, 32, '2022-04-07 10:41:50', 17, NULL, 0, NULL),
(535, 'MS33272LAEI17', 'FALDA', 'FALDA MEZCLILLA M.33272 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 0, 5, 32, '2022-04-07 10:43:16', 17, NULL, 0, NULL),
(536, 'SM33210L11', 'FALDA', 'FALDA MEZCLILLA M.33210 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 0, 5, 32, '2022-04-07 10:44:07', 17, NULL, 0, NULL),
(537, 'MS33238LAIAM11', 'FALDA', 'FALDA MEZCLILLA M.33238 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 32, '2022-04-07 10:44:43', 17, NULL, 0, NULL),
(538, '7557MM33219L09', 'FALDA', 'FALDA MEZCLILLA M.33219 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 32, '2022-04-07 10:45:33', 17, NULL, 0, NULL),
(539, 'M33191L09', 'FALDA', 'FALDA MEZCLILLA M.33191 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 32, '2022-04-07 10:46:31', 17, NULL, 0, NULL),
(540, 'MA53158TDSM11', 'FALDA', 'FALDA MEZCLILLA M.53158 T.11', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 2, 5, 32, '2022-04-07 10:47:24', 20, NULL, 0, NULL),
(541, '887658967400', 'BLUSA', 'BLUSA FRAMBUESA M.81003 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 1, '2022-04-07 10:48:48', 6, NULL, 0, NULL),
(542, '8765895032', 'PANTI', 'PANTI ESTRELLAS  M.31343 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '229.00', '0.00', 0, 5, 17, '2022-04-07 11:00:25', 6, NULL, 0, NULL),
(543, '887658967424', 'BLUSA', 'BLUSA FRAMBUESA M.81003 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 1, '2022-04-07 11:06:49', 6, NULL, 0, NULL),
(544, '887658967295', 'BLUSA', 'BLUSA VERDE M.81002 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 1, '2022-04-07 11:09:04', 6, NULL, 0, NULL),
(545, '887658964935', 'BLUSA', 'BLUSA RAYAS XIX M.81010 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 0, 5, 1, '2022-04-07 11:09:59', 6, NULL, 0, NULL),
(546, '887658965116', 'VESTIDO', 'VESTIDO PUNTOS M.82001 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '469.00', '0.00', 1, 5, 14, '2022-04-07 11:11:57', 6, NULL, 0, NULL),
(547, '887658967318', 'BLUSA', 'BLUSA VERDE M.81002 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 0, 5, 1, '2022-04-07 11:13:27', 6, NULL, 0, NULL),
(548, '612140642189', 'CORCEL', 'CORCEL BLANO M.7187 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '449.00', '0.00', 0, 5, 33, '2022-04-07 11:16:10', 6, NULL, 0, NULL),
(549, '887658966069', 'VESTIDO', 'VESTIDO DE NIÑA FLORAL M.11033 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 14, '2022-04-07 11:18:25', 6, NULL, 0, NULL),
(550, '887658966052', 'VESTIDO', 'VESTIDO FLORAL M.11033 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 14, '2022-04-07 11:19:14', 6, NULL, 0, NULL),
(551, '887658966076', 'VESTIDO', 'VESTIDO FLORAL M.11033 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 14, '2022-04-07 11:19:55', 6, NULL, 0, NULL),
(552, '887658972367', 'PANTI', 'PANTI ROSA M.1910 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-07 11:21:01', 6, NULL, 0, NULL),
(553, '887658972404', 'PANTI', 'PANTI ROSAS M.1910 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-07 11:22:31', 6, NULL, 0, NULL),
(554, '887658966205', 'JUMPER', 'JUMPER ESTRELLAS M.14000 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '269.00', '0.00', 0, 5, 25, '2022-04-07 11:24:42', 6, NULL, 0, NULL),
(555, '887658966199', 'JUMPER', 'JUMPER ESTRELLAS M.14000M T.4', NULL, 'lib/Productos/img/blitz_SN.png', '269.00', '0.00', 0, 5, 25, '2022-04-07 11:25:19', 6, NULL, 0, NULL),
(556, '612140461384', 'PANTI', 'PANTI NUDE M.1410 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 2, 5, 17, '2022-04-12 13:30:58', 6, NULL, 0, NULL),
(557, '612140461452', 'PANTI', 'PANTI NUDE M.1410 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 0, 5, 17, '2022-04-07 11:27:17', 6, NULL, 0, NULL),
(558, '887658734965', 'PANTI', 'PANTI NUDE NEGRO M.31348 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 17, '2022-04-07 11:29:18', 6, NULL, 0, NULL),
(559, '887658734989', 'PANTI', 'PANTI NUDE NEGRO M.31348 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 17, '2022-04-07 11:30:48', 6, NULL, 0, NULL),
(560, '887658734972', 'PANTI', 'PANTI NUDE NEGRO M.31348 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 17, '2022-04-07 11:31:52', 6, NULL, 0, NULL),
(561, '887658934235', 'BRASIER', 'BRASIER NUDE M.70018 T.34B', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 0, 5, 34, '2022-04-07 11:33:56', 6, NULL, 0, NULL),
(562, '887658319629', 'BLUMER', 'BLUMER TABACO M.2056 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '139.00', '0.00', 0, 5, 35, '2022-04-07 11:35:51', 6, NULL, 0, NULL),
(563, '887658975382', 'PANTI', 'PANTI 3 PACK HOJAS M.31344 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 17, '2022-04-07 11:38:23', 6, NULL, 0, NULL),
(564, '887658972350', 'PANTI', 'PANTI TIE & DIE M.1910 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-07 11:39:49', 6, NULL, 0, NULL),
(565, '887658605074', 'PANTI', 'PANTI ROSA SUAVE M.1410 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-07 11:40:37', 6, NULL, 0, NULL),
(566, '887658075174', 'PANTI', 'SEMANARIO MULTI M.73304 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '459.00', '0.00', 0, 5, 17, '2022-04-08 12:12:59', 6, NULL, 0, NULL),
(567, '887658976556', 'TRUSAS', 'SEMANARIO DIGITAL M.73103 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '429.00', '0.00', 1, 5, 36, '2022-04-07 11:50:29', 6, NULL, 0, NULL),
(568, '887658976563', 'TRUSAS', 'SEMANARIO DIGITAL M.73103 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '429.00', '0.00', 1, 5, 36, '2022-04-07 11:49:56', 6, NULL, 0, NULL),
(569, '887658972237', 'PANTI', 'PANTI 3 PACK HOJAS M.31386 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '229.00', '0.00', 1, 5, 17, '2022-04-07 11:52:05', 6, NULL, 0, NULL),
(570, '887658975375', 'PANTI', 'PANTI 3 PACK M.31344 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 17, '2022-04-07 11:53:41', 6, NULL, 0, NULL),
(571, '941148611003', 'SHORT', 'SHORT MULTI M.04114 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '389.00', '0.00', 0, 5, 15, '2022-04-07 16:18:33', 2, NULL, 0, NULL),
(572, '966824321007', 'FALDA', 'FALDA SHEDRON M.96682 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 32, '2022-04-07 16:58:19', 2, NULL, 0, NULL),
(573, '141469152', 'FALDA', 'FALDA ANIMAL PRINT T.M', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 32, '2022-04-07 17:00:08', 8, NULL, 0, NULL),
(574, '21746732', 'F', 'FALDA ORLANDO T.M', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 1, 5, 32, '2022-04-07 17:01:07', 8, NULL, 0, NULL),
(575, '21746731', 'FALDA', 'FALDA ORLANDO TCH', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 1, 5, 32, '2022-04-07 17:02:28', 8, NULL, 0, NULL),
(576, 'EB13321', 'FALDA', 'FALDA CADENAS UNI', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 32, '2022-04-07 17:03:57', 15, NULL, 0, NULL),
(577, '1208202111114', 'FALDA', 'FALDA VINO M.1111 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 32, '2022-04-07 17:05:09', 9, NULL, 0, NULL),
(578, '511202111031', 'FALDA', 'FALDA VERDE Y MOSTAZA M.1103 T.36 Y38', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 32, '2022-04-07 17:06:51', 9, NULL, 0, NULL),
(579, '300820211038', 'FALDA', 'FALDA MOSTAZA M.1109 T.36,38,40', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 32, '2022-04-07 17:13:59', 9, NULL, 0, NULL),
(580, '1910202110010', 'FALDA', 'FALDA M.1001 T34,36.38', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 3, 5, 32, '2022-04-14 17:37:45', 9, NULL, 0, NULL),
(581, '17744213', 'FALDA', 'FALDA MEL MOSTAZA T.G', NULL, 'lib/Productos/img/blitz_SN.png', '460.00', '0.00', 1, 5, 32, '2022-04-07 17:16:34', 8, NULL, 0, NULL),
(582, '14743046', 'FALDA', 'FALDA MONET T.40', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 1, 5, 32, '2022-04-07 17:18:45', 9, NULL, 0, NULL),
(583, '17744212', 'FALDA', 'FALDA NEGRO MEL T.M', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 32, '2022-04-07 17:20:20', 8, NULL, 0, NULL),
(584, '17744211', 'FALDA', 'FALDA NEGRO MEL T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 32, '2022-04-07 17:21:17', 8, NULL, 0, NULL),
(585, '101211', 'FALDA', 'FALDA CAFE VENECIA T.CH,M,G ,XG', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 4, 5, 32, '2022-04-07 17:23:46', 8, NULL, 0, NULL),
(586, '07222T', 'FALDA', 'FALDA KATERI UNITALLA', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 4, 5, 32, '2022-04-07 17:26:31', 15, NULL, 0, NULL),
(587, '2206202111201', 'F', 'FALDA VINIL M.1120 T.32,36.38', NULL, 'lib/Productos/img/blitz_SN.png', '418.00', '0.00', 7, 5, 32, '2022-04-07 17:28:23', 9, NULL, 0, NULL),
(588, '342038', 'CAPRI', 'CAPRI ROSA M.3420 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 21, '2022-04-07 17:29:57', 9, NULL, 0, NULL),
(589, '21111214', 'CAPRI', 'CAPRI CHARLY T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '385.00', '0.00', 1, 5, 21, '2022-04-07 17:30:56', 8, NULL, 0, NULL),
(590, '21111434', 'CAPRI', 'CAPRI CHARLY T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '385.00', '0.00', 1, 5, 21, '2022-04-07 17:31:47', 8, NULL, 0, NULL),
(591, 'GONAY 40', 'CAPRI', 'CAPRI BLANCO Y KAKI T.40', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 21, '2022-04-07 18:04:33', 35, NULL, 0, NULL),
(592, 'GONAY42', 'CAPRI', 'CAPRI BLANCO,CAFE,MARINO,MORADO,KAKI T.42', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 5, 5, 21, '2022-04-07 18:06:34', 35, NULL, 0, NULL),
(593, 'GONAY36', 'CAPRI', 'CAPRI ROJO,MORADO.KAKI T.36', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 3, 5, 21, '2022-04-07 18:24:35', 35, NULL, 0, NULL),
(594, '20112312', 'CAPRI', 'CAPRI MAX NEGRO, BLANCO,BEIGE T.M', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 3, 5, 21, '2022-04-08 10:54:59', 8, NULL, 0, NULL),
(595, '20112313', 'CAPRI', 'CAPRI MAX BEIGE T.G', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 21, '2022-04-08 10:55:42', 8, NULL, 0, NULL);
INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `Marca`, `Foto`, `PrecioVenta`, `PrecioCompra`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `can`) VALUES
(596, '21111525', 'CAPRI', 'CAPRI MAX CORAL Y BLANCO T.38', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 2, 5, 21, '2022-04-08 10:56:33', 8, NULL, 0, NULL),
(597, '21111526', 'CAPRI', 'CAPRI MAX NEGRO,BLANCO,CORAL T.40', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 3, 5, 21, '2022-04-08 10:57:33', 8, NULL, 0, NULL),
(598, '112202130710', 'PANTALON', 'PANTALON MARINO M.3071', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 3, 5, 2, '2022-04-08 11:05:02', 9, NULL, 0, NULL),
(599, '360442', 'PANTALON', 'PANTALON KAKI M.3604 T.42', NULL, 'lib/Productos/img/blitz_SN.png', '455.00', '0.00', 1, 5, 2, '2022-04-08 11:06:59', 9, NULL, 0, NULL),
(600, '1611202130816', 'PANTALON', 'PANTALON VINO MALLA M.3081 ', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 3, 5, 2, '2022-04-08 11:08:19', 9, NULL, 0, NULL),
(601, '000220620217', 'PANTALON', 'PANTALON NEGRO M.3014 T.34 Y 36', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 2, 5, 2, '2022-04-08 11:15:28', 9, NULL, 0, NULL),
(602, '081631', 'PANTALON', 'PANTALON BRANDO MARINO T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 1, 5, 2, '2022-04-08 11:17:39', 8, NULL, 0, NULL),
(603, '008042030146', 'PANTALON', 'PANTALON MARINO M.3014 T.40', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 1, 5, 2, '2022-04-08 11:18:48', 9, NULL, 0, NULL),
(604, '121361', 'PANTALON', 'PANTALON NEGRO TONY T.42', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 1, 5, 2, '2022-04-08 11:21:52', 8, NULL, 0, NULL),
(605, '15511212', 'PANTALON', 'PANTALON ADAM ARENA,NEGRO,BEIGE T.M', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 3, 5, 2, '2022-04-08 11:56:13', 8, NULL, 0, NULL),
(606, '15511211', 'PANTALON', 'PANTALON ADAM BEIGE,ARENA,CAMEL T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 3, 5, 2, '2022-04-08 11:34:40', 8, NULL, 0, NULL),
(607, '15511214', 'PANTALON', 'PANTALON ADAM CAMEL T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 1, 5, 2, '2022-04-08 11:36:45', 8, NULL, 0, NULL),
(608, '15511213', 'PANTALON', 'PANTALON ADAM ARENA T.G', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 1, 5, 2, '2022-04-08 11:37:55', 8, NULL, 0, NULL),
(609, '887658206257', 'COPAS DE SILICON', 'COPAS DE SILICON', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 0, 5, 34, '2022-04-08 11:44:38', 6, NULL, 0, NULL),
(610, '19713312', 'PANTALON', 'PANTALON JADE BRINGHT T.M', NULL, 'lib/Productos/img/blitz_SN.png', '398.00', '0.00', 2, 5, 2, '2022-04-08 11:46:57', 8, NULL, 0, NULL),
(611, '19713314', 'PANTALON', 'PANTALON JADE BRIGHT T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '398.00', '0.00', 1, 5, 2, '2022-04-08 11:47:53', 8, NULL, 0, NULL),
(612, 'ADAMXG', 'PANTALON', 'PANTALON ADAM LISO NEGRO T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '398.00', '0.00', 1, 5, 2, '2022-04-08 12:20:46', 8, NULL, 0, NULL),
(613, 'PANTALONG36', 'PANTALON', 'PANTALON GONAY T.36', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 2, '2022-04-08 12:23:01', 35, NULL, 0, NULL),
(614, 'PANTALONG38', 'PANTALON', 'PANTALON GONAY T.38 ', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 1, 5, 2, '2022-04-08 12:24:19', 35, NULL, 0, NULL),
(615, '18711438', 'PANTALON', 'PANTALON NEGRO YONI LISO T.44', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 1, 5, 2, '2022-04-08 12:25:25', 8, NULL, 0, NULL),
(616, 'PANTALONG40', 'PANTALON', 'PANTALON VINO Y KAKI GONAY T.40', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 2, '2022-04-08 12:27:41', 35, NULL, 0, NULL),
(617, '011022030142', 'PANTALON', 'PANTALON GRIS M.3014 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 2, 5, 2, '2022-04-08 12:29:07', 9, NULL, 0, NULL),
(618, '19321C', 'PANTALON', 'PANTALON PATRICE CURVY ', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 2, '2022-04-08 12:33:33', 15, NULL, 0, NULL),
(619, '13321C', 'PANTALON', 'PANTALON PATRICE CURVY', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 2, 5, 2, '2022-04-08 12:34:24', 15, NULL, 0, NULL),
(620, '71921T', 'PANTALON', 'PANTALON PATRICE T.M', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 2, '2022-04-08 12:35:15', 15, NULL, 0, NULL),
(621, '70021T', 'PANTALON', 'PANTALON MEZCLILLA PATA DE ELEFANTE ', NULL, 'lib/Productos/img/blitz_SN.png', '460.00', '0.00', 2, 5, 2, '2022-04-08 13:16:47', 15, NULL, 0, NULL),
(622, 'TBMLILA', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO LILA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 37, '2022-04-08 13:37:02', 33, NULL, 0, NULL),
(623, 'SHORTBAÑO', 'TRAJE DE BAÑO', 'SHORT NEGRO TRAJE DE BAÑO T.M', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 37, '2022-04-08 13:49:49', 33, NULL, 0, NULL),
(624, '887658281827', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO ROSA MEXICANO T.M', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 37, '2022-04-08 13:52:08', 6, NULL, 0, NULL),
(625, '887658618234', 'TRAJE DE BAÑO', 'TRAJE BAÑO MULT M.6959 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 37, '2022-04-08 13:54:01', 6, NULL, 0, NULL),
(626, '887658615233', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO MOSAICO M.6961 TXG', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 37, '2022-04-08 13:55:55', 6, NULL, 0, NULL),
(627, '887658576992', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO BEGONIA M.6941 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 37, '2022-04-08 13:57:49', 6, NULL, 0, NULL),
(628, '887658737478', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO TROPICAL M.6984 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 37, '2022-04-08 14:00:15', 6, NULL, 0, NULL),
(629, '582541171130', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO ROSA MUL DE NIÑA M.58254 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 0, 5, 37, '2022-04-08 14:02:05', 2, NULL, 0, NULL),
(630, '582541171178', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO ROSA MUL M.58254 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 0, 5, 37, '2022-04-08 14:05:18', 2, NULL, 0, NULL),
(631, '582541171215', 'TRAJE DE BAÑO', 'TRAJE  DE BAÑO ROSA MUL M.58254 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 37, '2022-04-08 14:06:56', 2, NULL, 0, NULL),
(632, '887658857206', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO MULTI M.6495 T.10', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 37, '2022-04-08 14:09:02', 6, NULL, 0, NULL),
(633, '458030161442', 'TRAJE DE BAÑO', 'TRAJE DE BAÑO MOHANA T.4', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 37, '2022-04-08 14:11:26', 33, NULL, 0, NULL),
(634, '8818610432508', 'CALZADO DAMA', 'CALZADO NEGRO SIN LISO M. 88186 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 0, 5, 9, '2022-04-09 10:12:04', 5, NULL, 0, NULL),
(635, 'FE0014140ML', 'AROMATIZANTE', 'AROMATIZANTE MANZANA CANELA', NULL, 'lib/Productos/img/blitz_SN.png', '165.00', '0.00', 0, 5, 12, '2022-04-09 12:39:53', 28, NULL, 0, NULL),
(636, '982524921101', 'VESTIDO', 'VESTIDO IVORI M.98252 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '559.00', '0.00', 0, 5, 14, '2022-04-09 15:52:45', 2, NULL, 0, NULL),
(637, '709538612500', 'CALZADO DAMA', 'CALZADO MULTI M.70953 #5', NULL, 'lib/Productos/img/blitz_SN.png', '509.00', '0.00', 1, 5, 9, '2022-04-09 15:54:46', 2, NULL, 0, NULL),
(638, '037728612208', 'CALZADO', 'DUO PACK M.03772 #.22', NULL, 'lib/Productos/img/blitz_SN.png', '679.00', '0.00', 0, 5, 11, '2022-04-09 15:55:32', 2, NULL, 0, NULL),
(639, '3645653472308', 'CALZADO', 'CALZADO ORO  M.2704043 #3', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 0, 5, 9, '2022-04-09 15:56:52', 5, NULL, 0, NULL),
(640, '6495303262301', 'CALZADO', 'CALZADO CAFE M.2658803 #3', NULL, 'lib/Productos/img/blitz_SN.png', '630.00', '0.00', 1, 5, 9, '2022-04-09 15:58:00', 5, NULL, 0, NULL),
(641, '8369965192505', 'CALZADO', 'CALZADO ROSA PINK M.3046323 #5', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 0, 5, 9, '2022-04-09 15:59:05', 5, NULL, 0, NULL),
(642, '713223592305', 'CALZADO', 'CALZADO ROSA M.71322 #3', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 0, 5, 9, '2022-04-09 16:00:09', 2, NULL, 0, NULL),
(643, '280218326', 'BLUSA', 'BLUSA AZUL M.326 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 1, '2022-04-11 11:29:03', 9, NULL, 0, NULL),
(644, 'PIXL01', 'BLUSA', 'BLUSA FLOREADA PERCH T.XL', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 1, '2022-04-11 11:31:10', 36, NULL, 0, NULL),
(645, '887658304793', 'BLUSA', 'BLUSA LILA OBSCURO M.43839 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 1, '2022-04-11 11:32:17', 6, NULL, 0, NULL),
(646, '887658705743', 'BLUSA', 'BLUSA MOSTAZA M.43933 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 1, '2022-04-11 11:33:25', 6, NULL, 0, NULL),
(647, '2XL23', 'BLUSA', 'BLUSA VINO PERCH T.XXL', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 1, '2022-04-11 11:34:44', 36, NULL, 0, NULL),
(648, '887658576930', 'BLUSA', 'BLUSA GRIS M.24391 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 1, '2022-04-11 11:35:41', 6, NULL, 0, NULL),
(649, 'A00235.M', 'BLUSA', 'BLUSA DE TIRANTES FUSHIA M.15808 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 1, '2022-04-11 11:37:07', 32, NULL, 0, NULL),
(650, '887658666594', 'BLUSA', 'BLUSA NEGRO M.43998 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 1, '2022-04-11 11:37:53', 6, NULL, 0, NULL),
(651, '887658190686', 'BLUSA', 'BLUSA GRIS CLARO M.45103 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 1, '2022-04-11 11:38:55', 6, NULL, 0, NULL),
(652, '887658664699', 'BLUSA', 'BLUSA AZUL NOCTURNO M.1756 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 1, '2022-04-11 11:39:54', 6, NULL, 0, NULL),
(653, '004189', 'BLUSA', 'BLUSA NUHI BORDADO T.34 ', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 1, '2022-04-11 11:41:24', 29, NULL, 0, NULL),
(654, 'M34114CP13', 'OVEROL', 'OVEROL SVDO M.34114 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 38, '2022-04-11 11:45:02', 17, NULL, 0, NULL),
(655, '3405F', 'OVEROL', 'OVEROL SVDO M.34075 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '160.00', '0.00', 1, 5, 38, '2022-04-11 11:45:50', 17, NULL, 0, NULL),
(656, '34075', 'OVEROL', 'OVEROL MEZCLILLA M.34075 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '160.00', '0.00', 1, 5, 39, '2022-04-11 11:49:14', 17, NULL, 0, NULL),
(657, '887658603070', 'BLUSA', 'BLUSA VIOLETA M.45424 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 11:54:54', 6, NULL, 0, NULL),
(658, '887658664705', 'BLUSA', 'BLUSA BUGA,MBILIA M.1756 T.G ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 39, '2022-04-11 11:58:06', 6, NULL, 0, NULL),
(659, '350038', 'CAPRI', 'CAPRI ROJO M.3500 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 39, '2022-04-11 11:58:52', 9, NULL, 0, NULL),
(660, '004250', 'CONJUNTO', 'CONJUNTO FALDA CADENAS T.UNI ', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 11:59:45', 30, NULL, 0, NULL),
(661, 'LINDA005', 'SHORT ', 'SHORT MULTICOLOR M.005 T.CH,M Y G ', NULL, 'lib/Productos/img/blitz_SN.png', '208.00', '0.00', 6, 5, 39, '2022-04-11 12:04:33', 30, NULL, 0, NULL),
(662, '887658586427', 'BLUSA', 'BLUSA MOSTAZA M.43860 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '140.00', '0.00', 1, 5, 39, '2022-04-11 12:07:27', 6, NULL, 0, NULL),
(663, '004247', 'VESTIDO', 'VSTIDO RAYAS MARINO T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 39, '2022-04-11 12:08:49', 4, NULL, 0, NULL),
(664, '004237', 'VESTIDO', 'VSTIDO KANISHKA FUSHIA T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 39, '2022-04-11 12:09:40', 30, NULL, 0, NULL),
(665, '0905197001', 'PALAZZO', 'PALAZZO VERDE M.7001 T.32', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 39, '2022-04-11 12:10:20', 9, NULL, 0, NULL),
(666, '004224', 'PALAZZO', 'PALAZZO AMARILLO T.UNI ', NULL, 'lib/Productos/img/blitz_SN.png', '190.00', '0.00', 1, 5, 39, '2022-04-11 12:11:03', 30, NULL, 0, NULL),
(667, '887658440583', 'PALAZZO', 'PALAZZO INDIGO M.43902 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 12:11:43', 6, NULL, 0, NULL),
(668, '18783413', 'PALAZZO', 'PALAZZO ANDRIK T.G', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 39, '2022-04-11 12:12:16', 8, NULL, 0, NULL),
(669, '7670AM101068E17', 'PANTALON', 'PANTALON M.101068 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '252.00', '0.00', 1, 5, 39, '2022-04-11 12:12:59', 17, NULL, 0, NULL),
(670, '370138', 'PANTALON', 'PANTALON CORAL M.3701 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 12:13:48', 9, NULL, 0, NULL),
(671, 'M51693ESVDO', 'PANTALON', 'PANTALON BLANCO M.51693 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 39, '2022-04-11 12:15:11', 20, NULL, 0, NULL),
(672, '887658502717', 'PLAYERA', 'PLAYERA VINO M.8263 T.14', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 39, '2022-04-11 12:16:10', 6, NULL, 0, NULL),
(673, '887658426761', 'VESTIDO', 'VESTIDO MEZCLILLA M.45206 T.G ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 39, '2022-04-11 12:17:17', 6, NULL, 0, NULL),
(674, '004229', 'PALAZZO ', 'PALAZZO MEZCLILLA T.G ', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 39, '2022-04-11 12:17:57', 4, NULL, 0, NULL),
(675, '887658426693', 'VESTIDO', 'VESTIDO ROSA M.45200 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 39, '2022-04-11 12:18:37', 6, NULL, 0, NULL),
(676, 'OFERTA4', 'PLAYERA ', 'PLAYERA MANGA LARGA T.4 ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 39, '2022-04-11 12:24:38', 27, NULL, 0, NULL),
(677, 'OFERTA6', 'PLAYERA ', 'PLAYERA MANGA LARGA T.6', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 39, '2022-04-11 12:25:14', 27, NULL, 0, NULL),
(678, 'M22013SVDO07', 'PESQUERO', 'PESQUERO SVDO M.22013 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 1, 5, 39, '2022-04-11 12:27:08', 17, NULL, 0, NULL),
(679, 'M22013SWEA07', 'PESQUERO', 'PESQUERO SWEA M.22013 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '213.00', '0.00', 1, 5, 39, '2022-04-11 12:28:17', 17, NULL, 0, NULL),
(680, 'M2202313', 'PESQUERO', 'PESQUERO SVDO M.22023 T.13 ', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 1, 5, 39, '2022-04-11 12:29:59', 17, NULL, 0, NULL),
(681, 'MN21063E09', 'PANTALON', 'PANTALON NEGRO M.21063 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 39, '2022-04-11 12:30:48', 17, NULL, 0, NULL),
(682, 'M21070E13', 'PANTALON', 'PANTALON SVDO M.21070 T.13', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 39, '2022-04-11 12:32:41', 17, NULL, 0, NULL),
(683, 'M21029ESWENCH', 'PANTALON', 'PANTALON SWEN M.21029 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 12:33:26', 17, NULL, 0, NULL),
(684, 'M21029ESWENGD', 'PANTALON', 'PANTALON SWEN M.21029 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 12:34:06', 17, NULL, 0, NULL),
(685, 'M21029ESWENMD', 'PANTALON', 'PANTALON SWEN M.21029 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 12:36:09', 17, NULL, 0, NULL),
(686, '2332', 'PLAYERA', 'PLAYERA ROJO T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 39, '2022-04-11 12:36:49', 8, NULL, 0, NULL),
(687, '004188', 'BLUSA', 'BLUSA SHULHAN T.G Y XG', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 2, 5, 39, '2022-04-11 12:37:55', 30, NULL, 0, NULL),
(688, '004231', 'VESTIDO', 'VESTIDO FLORES T.UNI ', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 2, 5, 39, '2022-04-11 12:38:40', 30, NULL, 0, NULL),
(689, 'M24001SVDOCH', 'SHORT ', 'SHORT MATERNIDAD M.24001 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 2, 5, 39, '2022-04-11 12:39:20', 17, NULL, 0, NULL),
(690, 'M33200ML07', 'FALDA', 'FALDA LARGA M.33200 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '247.00', '0.00', 2, 5, 39, '2022-04-11 12:40:42', 17, NULL, 0, NULL),
(691, '004249', 'CONJUNTO', 'CONJUNTO FALDA FLORES T.UNI ', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 39, '2022-04-11 12:41:32', 8, NULL, 0, NULL),
(692, 'OFERTA14', 'PLAYERA', 'PLAYERA MANGA LARGA T.14 ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 2, 5, 39, '2022-04-11 12:42:26', 8, NULL, 0, NULL),
(693, '004230', 'JUMPER', 'JUMPER FLORES T.UNI ', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 3, 5, 39, '2022-04-11 12:44:01', 30, NULL, 0, NULL),
(694, 'BL01', 'BLUSA', 'BLUSA ESTANPADO ', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 3, 5, 39, '2022-04-11 12:45:05', 9, NULL, 0, NULL),
(695, '7007038', 'PLAYERA ', 'PLAYERA JR T.UNI ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 4, 5, 39, '2022-04-11 12:46:38', 30, NULL, 0, NULL),
(696, '3657657692606', 'CALZADO DAMA', 'CALZADO BEIGE M.2725925 #6', NULL, 'lib/Productos/img/blitz_SN.png', '140.00', '0.00', 1, 5, 9, '2022-04-11 13:07:05', 5, NULL, 0, NULL),
(697, '3750383452305', 'CALZADO DAMA', 'CALZADO CAFE CLARO M.2719542 #3 ', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 9, '2022-04-11 13:10:45', 5, NULL, 0, NULL),
(698, '3750383462403', 'CALZADO DAMA', 'CALZADO TURQUESA M.3047767 #4', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 9, '2022-04-11 13:11:29', 5, NULL, 0, NULL),
(699, '614220782303', 'CALZADO', 'CALZADO NEGRO M.61422 #3', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 9, '2022-04-11 13:12:52', 2, NULL, 0, NULL),
(700, '8847372512500', 'CALZADO', 'CALZADO BLANCO M.2850788 #5 ', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 1, 5, 9, '2022-04-11 13:13:48', 5, NULL, 0, NULL),
(701, '128546400105', 'CALZADO', 'CALZADO BEIGE #10', NULL, 'lib/Productos/img/blitz_SN.png', '160.00', '0.00', 1, 5, 9, '2022-04-11 13:15:10', 33, NULL, 0, NULL),
(702, '205000324523', 'CALZADO', 'CALZADO ROJO M.198 #5', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-11 13:21:23', 3, NULL, 0, NULL),
(703, '205000324522', 'CALZADO', 'CALZADO ROJO M.198 #4 ', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-11 13:22:15', 3, NULL, 0, NULL),
(704, '205000324511', 'CALZADO', 'CALZADO NEGRO M.198 #4', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 0, 5, 9, '2022-04-11 13:22:53', 3, NULL, 0, NULL),
(705, '701100952403', 'CALZADO', 'CALZADO ROJO M.70110 #4', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 9, '2022-04-11 13:23:25', 2, NULL, 0, NULL),
(706, '701100952502', 'CALZADO', 'CALZADO ROJO M.70110 #5', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 9, '2022-04-11 13:24:03', 2, NULL, 0, NULL),
(707, '90027', 'CALZADO', 'CALZADO MIEL M.90027 #5', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 9, '2022-04-11 13:28:45', 2, NULL, 0, NULL),
(708, '038000332609', 'CALZADO', 'CALZADO BLANCO M.03800 #6', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 0, 5, 9, '2022-04-11 13:30:09', 2, NULL, 0, NULL),
(709, '8920857752001', 'CALZADO', 'CALZADO ROJO M.2949086 #20', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 11, '2022-04-11 13:30:49', 5, NULL, 0, NULL),
(710, '205000324510', 'CALZADO', 'CALZADO NEGRO M.198 #3', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 2, 5, 9, '2022-04-11 13:31:52', 3, NULL, 0, NULL),
(711, '205000324521', 'CALZADO', 'CALZADO ROJO M.198 #3 ', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 2, 5, 9, '2022-04-11 13:32:27', 3, NULL, 0, NULL),
(712, '708306632306', 'CALZADO', 'CALZADO MENTA M.70830 #3', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 0, 5, 9, '2022-04-11 13:35:33', 2, NULL, 0, NULL),
(713, '708300762306', 'CALZADO', 'CALZADO NARANJA M.70830 #3', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 0, 5, 9, '2022-04-11 13:36:20', 2, NULL, 0, NULL),
(714, '708301722309', 'CALZADO', 'CALZADO LILA M.70830 #3', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 0, 5, 9, '2022-04-11 13:36:53', 2, NULL, 0, NULL),
(715, '205000324499', 'CALZADO', 'CALZADO LATE M.198 #3 ', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-11 13:37:46', 3, NULL, 0, NULL),
(716, '8941953472501', 'CALZADO', 'CALZADO ORO M.2959528 #5', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 9, '2022-04-11 13:40:04', 5, NULL, 0, NULL),
(717, '2882780652505', 'CALZADO', 'CALZADO MARINO M.2668321 #5', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 9, '2022-04-11 13:40:52', 5, NULL, 0, NULL),
(718, '268683', 'CALZADO', 'CALZADO BEIGE M.2638683 #4', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 9, '2022-04-11 13:42:41', 5, NULL, 0, NULL),
(719, '110534200095', 'CALZADO', 'CALZADO BLANCO #9', NULL, 'lib/Productos/img/blitz_SN.png', '160.00', '0.00', 1, 5, 9, '2022-04-11 13:43:35', 33, NULL, 0, NULL),
(720, '6613160386381', 'CALZADO', 'CALZADO ORO M.029591 #3', NULL, 'lib/Productos/img/blitz_SN.png', '599.00', '0.00', 1, 5, 9, '2022-04-11 13:47:54', 4, NULL, 0, NULL),
(721, '8869850922205', 'CALZADO', 'CALZADO NERO M.2907765 #2 ', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 9, '2022-04-11 13:51:34', 5, NULL, 0, NULL),
(722, '8869850922403', 'CALZADO', 'CALZADO NEGRO M.2907765 #4', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 9, '2022-04-11 13:52:02', 5, NULL, 0, NULL),
(723, '3937610432501', 'CALZADO', 'CALZADO NEGRO M.2750866 #5', NULL, 'lib/Productos/img/blitz_SN.png', '430.00', '0.00', 1, 5, 9, '2022-04-11 13:52:40', 5, NULL, 0, NULL),
(724, '8896521472301', 'CALZADO', 'CALZADO NEGRO M.2938004 #3', NULL, 'lib/Productos/img/blitz_SN.png', '380.00', '0.00', 0, 5, 9, '2022-04-11 13:53:11', 5, NULL, 0, NULL),
(725, '8844814752500', 'CALZADO', 'CALZADO ROSA M.2840826 #5', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 9, '2022-04-11 13:53:46', 5, NULL, 0, NULL),
(726, '222150922302', 'CALZADO', 'CALZADO NEGRO M.2582382 #3', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 9, '2022-04-11 13:54:22', 5, NULL, 0, NULL),
(727, '3691184112503', 'CALZADO', 'CALZADO PLATA NEGRO M.2724904 #5', NULL, 'lib/Productos/img/blitz_SN.png', '270.00', '0.00', 1, 5, 9, '2022-04-11 13:55:35', 5, NULL, 0, NULL),
(728, '3691184112602', 'CALZADO', 'CALZADO PLATA M.2724904 #6', NULL, 'lib/Productos/img/blitz_SN.png', '270.00', '0.00', 1, 5, 9, '2022-04-11 13:56:16', 5, NULL, 0, NULL),
(729, '8845900022309', 'CALZADO', 'CALZADO ROSA M.2841182 #3', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 9, '2022-04-11 13:56:58', 5, NULL, 0, NULL),
(730, '3767057752401', 'CALZADO', 'CALZADO ROJO M.2732503 #4', NULL, 'lib/Productos/img/blitz_SN.png', '110.00', '0.00', 1, 5, 9, '2022-04-11 13:57:43', 5, NULL, 0, NULL),
(731, '3750383462502', 'CALZADO', 'CALZADO TURQUESA M.3047767 #5', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 9, '2022-04-11 13:58:45', 5, NULL, 0, NULL),
(732, '3750383462304', 'CALZADO', 'CALZADO TURQUESA M.3047767 #3', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 9, '2022-04-11 13:59:20', 5, NULL, 0, NULL),
(733, '8845900022507', 'CALZADO', 'CALZADO ROSA M.2841182 #5', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 9, '2022-04-11 13:59:52', 5, NULL, 0, NULL),
(734, '8824457752204', 'CALZADO', 'CALZADO ROJO M.2982120 #2', NULL, 'lib/Productos/img/blitz_SN.png', '230.00', '0.00', 1, 5, 9, '2022-04-11 14:00:25', 5, NULL, 0, NULL),
(735, '8307102012309', 'CALZADO', 'CALZADO BLANCO M.3017425 #3', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 0, 5, 9, '2022-04-11 14:00:59', 5, NULL, 0, NULL),
(736, '8307102012606', 'CALZADO', 'CALZADO BLANCO M.3017425 #6', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 9, '2022-04-11 14:01:29', 5, NULL, 0, NULL),
(737, '8307102012408', 'CALZADO', 'CALZADO BLANCO M.3017425 #4', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 9, '2022-04-11 14:02:00', 5, NULL, 0, NULL),
(738, '3750357762508', 'CALZADO', 'CALZADO VINO M.2982144 #5', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 9, '2022-04-11 14:02:29', 5, NULL, 0, NULL),
(739, '3750357762409', 'CALZADO', 'CALZADO VINO M.2982144 #4', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 9, '2022-04-11 14:02:59', 5, NULL, 0, NULL),
(740, '3750357762300', 'CALZADO', 'CALZADO VINO M.2982144 #3', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 9, '2022-04-11 14:03:35', 5, NULL, 0, NULL),
(741, '047173972307', 'CALZADO', 'CALZADO CORAL M.04717 #3', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-12 11:40:34', 2, NULL, 0, NULL),
(742, '047170782305', 'CALZADO', 'CALZADO NEGRO M.04717 #3', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-12 11:41:21', 2, NULL, 0, NULL),
(743, '047171662309', 'CALZADO', 'CALZADO HUESO M.04717 #3', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-12 11:41:53', 2, NULL, 0, NULL),
(744, '047173972505', 'CALZADO', 'CALZADO CORAL M.04717 #5', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-12 11:42:19', 2, NULL, 0, NULL),
(745, '047173972406', 'CALZADO', 'CALZADO CORAL M.04717 #4', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 9, '2022-04-12 11:43:05', 2, NULL, 0, NULL),
(746, '3691184112305', 'CALZADO', 'CALZADO PLATA M.2724904 #3', NULL, 'lib/Productos/img/blitz_SN.png', '270.00', '0.00', 1, 5, 9, '2022-04-12 11:43:47', 5, NULL, 0, NULL),
(747, 'EVAALTOLISO', 'CALZADO', 'CALZADO WISS ALTO LISO #2,3,4,5,6 Y 7', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 6, 5, 9, '2022-04-12 11:46:19', 16, NULL, 0, NULL),
(748, 'EVABAJOLISO', 'CALZADO', 'CALZADO WISS BAJO LISO #3,4,5,6 Y 7', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 8, 5, 9, '2022-04-12 11:48:17', 16, NULL, 0, NULL),
(749, 'EVAALTOPIEDRA', 'CALZADO', 'CALZADO WISS ALTO PIEDRA #3,4,5,6 Y 7', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 20, 5, 9, '2022-04-12 11:49:47', 16, NULL, 0, NULL),
(750, 'EVABAJOPIEDRA', 'CALZADO', 'CALZADO WISS BAJO PIEDRA #3,4,5,6 Y 7 ', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 29, 5, 9, '2022-04-12 11:52:08', 16, NULL, 0, NULL),
(751, '887658605043', 'PANTI', 'PANTI ROSA SUAVE M.1410 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:41:07', 6, NULL, 0, NULL),
(752, '887658741574', 'PANTI', 'PANTI LILA OBSCURO M.1410 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:42:53', 6, NULL, 0, NULL),
(753, '887658891514', 'PANTI', 'PANTI ROSA M.1410 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:43:30', 6, NULL, 0, NULL),
(754, '887658373089', 'PANTI', 'PANTI ROSA M.1244 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 17, '2022-04-12 12:44:47', 6, NULL, 0, NULL),
(755, '887658407623', 'PANTI', 'PANTI NEGRO M.3418 T.XCH', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 12:46:00', 6, NULL, 0, NULL),
(756, '887658457628', 'PANTI', 'PANTI VINO M.3418 T.XCH ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 12:46:37', 6, NULL, 0, NULL),
(757, '887658900292', 'PANTI', 'PANTI TABACO M.3418 T.XCH ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 12:47:19', 6, NULL, 0, NULL),
(758, '887658604022', 'PANTI', 'PANTI PLUMBABO M.3418 T.XCH ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 12:48:07', 6, NULL, 0, NULL),
(759, '887658893273', 'PANTI', 'PANTI RUBI M.1224 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '109.00', '0.00', 1, 5, 17, '2022-04-12 12:48:46', 6, NULL, 0, NULL),
(760, '612140976680', 'PANTI', 'TANGA GEOMETRICO M.1985 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:49:23', 6, NULL, 0, NULL),
(761, '887658696386', 'PANTI', 'TANGA JASPE GRIS M.1162 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '79.00', '0.00', 1, 5, 17, '2022-04-12 12:50:46', 6, NULL, 0, NULL),
(762, '887658643649', 'PANTI', 'PANTI NUDE M.1145 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:51:21', 6, NULL, 0, NULL),
(763, '887658946078', 'PANTI', 'PANTI VERDE M.1290 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 12:51:58', 6, NULL, 0, NULL),
(764, '887658811161', 'PANTI', 'TANGA MAGNOLIA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '69.00', '0.00', 1, 5, 17, '2022-04-12 12:52:37', 6, NULL, 0, NULL),
(765, '887658893815', 'PANTI', 'PANTI ANIMAL PRINT M.1910 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:53:22', 6, NULL, 0, NULL),
(766, '887658221922', 'PANTI', 'PANTI VINO M.1410 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:54:01', 6, NULL, 0, NULL),
(767, '887658639505', 'PANTI', 'PANTI ANIMAL PRINT T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:54:50', 6, NULL, 0, NULL),
(768, '887658639321', 'PANTI', 'PANTI NUDE M.1551 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '139.00', '0.00', 1, 5, 17, '2022-04-12 12:55:35', 6, NULL, 0, NULL),
(769, '887658822891', 'PANTI', 'PANTI FLORES M.1910 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:56:41', 6, NULL, 0, NULL),
(770, '887658811208', 'PANTI', 'TANGA TRIBAL', NULL, 'lib/Productos/img/blitz_SN.png', '69.00', '0.00', 1, 5, 17, '2022-04-12 12:57:37', 6, NULL, 0, NULL),
(771, '887658842752', 'PANTI', 'PANTI FOLLAGE T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 12:58:17', 6, NULL, 0, NULL),
(772, '887658324753', 'PANTI', 'PANTI LILA OBSCURO M.1924 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 17, '2022-04-12 12:59:14', 6, NULL, 0, NULL),
(773, '887658373096', 'PANTI', 'PANTI INDIGO M.1244 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 17, '2022-04-12 12:59:55', 6, NULL, 0, NULL),
(774, '887658172354', 'PANTI', 'PANTI ROMBOS M.1548 T.CH  ', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 17, '2022-04-12 13:00:50', 6, NULL, 0, NULL),
(775, '612140897183', 'PANTI', 'PANTI ANIMAL PRINT M.1935 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 13:04:21', 6, NULL, 0, NULL),
(776, '887658014746', 'PANTI', 'PANTI TABACO M.1410 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 13:05:53', 6, NULL, 0, NULL),
(777, '887658653235', 'PANTI', 'PANTI BOTANICA M.1126 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 17, '2022-04-12 13:06:52', 6, NULL, 0, NULL),
(778, '887658895369', 'PANTI', 'TANGA ANIMAL PRINT M.1935 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 13:07:46', 6, NULL, 0, NULL),
(779, '887658949383', 'PANTI', 'PANTI VINO M.1291 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 17, '2022-04-12 13:11:22', 6, NULL, 0, NULL),
(780, '887658862811', 'PANTI', 'PANTI INDIGA M.1538 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '139.00', '0.00', 1, 5, 17, '2022-04-12 13:12:13', 6, NULL, 0, NULL),
(781, '612140240927', 'PANTI', 'PANTI BEIGE M.1372 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:13:10', 6, NULL, 0, NULL),
(782, '612140943828', 'PANTI', 'PANTI BLANCO M.1407 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 2, 5, 17, '2022-04-12 13:15:05', 6, NULL, 0, NULL),
(783, '887658605050', 'PANTI', 'PANTI ROSA SUAVE M.1410 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 2, 5, 17, '2022-04-12 13:18:57', 6, NULL, 0, NULL),
(784, '887658553344', 'PANTI', 'PANTI NUDE M.7158 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 2, 5, 17, '2022-04-12 13:23:32', 6, NULL, 0, NULL),
(785, '887658958101', 'PANTI', 'PANTI GARDENIAS M.1295 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:24:18', 6, NULL, 0, NULL),
(786, '887658777580', 'PANTI', 'PANTI LILA OBSCURO M.2155 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:25:02', 6, NULL, 0, NULL),
(787, '887658639529', 'PANTI', 'PANTI ANIMAL PRINT NUDE M.1910 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 13:26:15', 6, NULL, 0, NULL),
(788, '887658811178', 'PANTI', 'PANTI MAGNOLIA M.1162 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '69.00', '0.00', 1, 5, 17, '2022-04-12 13:26:46', 6, NULL, 0, NULL),
(789, '887658949390', 'PANTI', 'PANTI VINO M.1291 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 17, '2022-04-12 13:27:20', 6, NULL, 0, NULL),
(790, '887658944067', 'PANTI', 'PANTI VERDE M.1288 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:28:10', 6, NULL, 0, NULL),
(791, '887658553337', 'PANTI', 'PANTI NEGRO M.7158 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 17, '2022-04-12 13:28:42', 6, NULL, 0, NULL),
(792, '887658113807', 'PANTI', 'PANTI TABACO M.3418 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:29:13', 6, NULL, 0, NULL),
(793, '887658946092', 'PANTI', 'PANTI VERDE M.1290 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:29:35', 6, NULL, 0, NULL),
(794, '887658930497', 'PANTI', 'PANTI ANIMAL PRINT M.1205 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:30:07', 6, NULL, 0, NULL),
(795, '887658748801', 'PANTI', 'PANTI FLORES M.3418 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:31:40', 6, NULL, 0, NULL),
(796, '612140039293', 'PANTI', 'PANTI ARENA M.2155 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:32:24', 6, NULL, 0, NULL),
(797, '612140039279', 'PANTI', 'PANTI BLANCO M.2155 T.M ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:33:06', 6, NULL, 0, NULL),
(798, '887658639895', 'PANTI', 'PANTI NUDE M.2152 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 1, 5, 17, '2022-04-12 13:34:08', 6, NULL, 0, NULL),
(799, '887658949475', 'PANTI', 'PANTI PEONIAS M.1192 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 17, '2022-04-12 13:34:50', 6, NULL, 0, NULL),
(800, '887658958118', 'PANTI', 'PANTI GARDENIAS M.1295 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:35:27', 6, NULL, 0, NULL),
(801, '887658748818', 'PANTI', 'PANTI FLORES M.3418 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:35:52', 6, NULL, 0, NULL),
(802, '888328147047', 'PANTI', 'PANTI NEGRO M.1284 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:36:37', 6, NULL, 0, NULL),
(803, '612140241023', 'PANTI', 'PANTI BEIGE M.1372 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:37:33', 6, NULL, 0, NULL),
(804, '612140039392', 'PANTI', 'PANTI BLANCO M.2155 T.G ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:38:00', 6, NULL, 0, NULL),
(805, '612140342072', 'PANTI', 'PANTI NEGRO M.1410 T.G ', NULL, 'lib/Productos/img/blitz_SN.png', '89.00', '0.00', 0, 5, 17, '2022-04-12 13:38:31', 6, NULL, 0, NULL),
(806, '612140039408', 'PANTI', 'PANTI BEIGE M.2155 T.G ', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:38:57', 6, NULL, 0, NULL),
(807, '887658363141', 'PANTI', 'PANTI BLANCO M.1945 T.XXG', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 17, '2022-04-12 13:40:25', 6, NULL, 0, NULL),
(808, '887658839189', 'PANTI', 'PANTI HOJAS M.3418 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:43:16', 6, NULL, 0, NULL),
(809, '887658858098', 'PANTI', 'PANTI NEGRO M.2155 T.XXL', NULL, 'lib/Productos/img/blitz_SN.png', '99.00', '0.00', 1, 5, 17, '2022-04-12 13:43:53', 6, NULL, 0, NULL),
(810, '070194', 'DESMAQUILLANTE', 'LOCION DESMAQUILLANTE PARA OJOS, LABIOS LIBRE DE ACEITE.', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 1, 5, 8, '2022-04-23 13:50:06', 1, NULL, 0, 1),
(811, '19520', 'PELADOR', 'PELADOR 5 EN 1', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 0, 5, 27, '2022-04-13 12:47:10', 11, NULL, 0, NULL),
(812, '612140873422', 'TOP', 'TOP NUDE M.4411 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 40, '2022-04-13 13:42:05', 6, NULL, 0, NULL),
(813, '887658072890', 'TOP', 'TOP NUDE M.4245 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '125.00', '0.00', 2, 5, 40, '2022-04-13 13:43:47', 6, NULL, 0, NULL),
(814, '612140338327', 'TOP', 'TOP NEGRO M.4411 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 2, 5, 40, '2022-04-13 13:45:19', 6, NULL, 0, NULL),
(815, '887658940113', 'TOP', 'DUO BLANCO NUDE M.24303 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 1, 5, 40, '2022-04-13 13:46:34', 6, NULL, 0, NULL),
(816, '887658344591', 'DUO', 'DUO MINI FLORES M.24303 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 2, 5, 40, '2022-04-13 13:47:58', 6, NULL, 0, NULL),
(817, '887658072906', 'TOP', 'TOP NUDE NUDE M.4245 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '125.00', '0.00', 1, 5, 40, '2022-04-13 13:49:06', 6, NULL, 0, NULL),
(818, '887658644868', 'TOP', 'TOP NUDE M.4496 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '159.00', '0.00', 1, 5, 40, '2022-04-13 13:50:25', 6, NULL, 0, NULL),
(819, '612140873460', 'TOP', 'TOP NUDE M.4411 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 40, '2022-04-13 13:55:53', 6, NULL, 0, NULL),
(820, '121140791528', 'TOP', 'DUO NEGRO JASPE GRIS M.24303 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 1, 5, 40, '2022-04-13 13:57:18', 6, NULL, 0, NULL),
(821, '612140338303', 'TOP', 'TOP BLANCO M.4411 T.CH ', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 40, '2022-04-13 13:57:59', 6, NULL, 0, NULL),
(822, '612140338426', 'TOP', 'TOP BLANCO M.4411 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 0, 5, 40, '2022-04-13 14:01:03', 6, NULL, 0, NULL),
(823, '612140873507', 'TOP', 'TOP NUDE M.4411 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 0, 5, 40, '2022-04-13 14:01:46', 6, NULL, 0, NULL),
(824, '887658963549', 'BRASIER', 'BRASIER ROSAS M.70031 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 14:02:47', 6, NULL, 0, NULL),
(825, '887658859514', 'BRASIER', 'BRASIER NUDE M.7976 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 34, '2022-04-13 14:08:08', 6, NULL, 0, NULL),
(826, '887658962061', 'BRASIER', 'BRASIER NEGRO ROSA M.70026 T.34B', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 34, '2022-04-13 14:09:06', 6, NULL, 0, NULL),
(827, '887658431840', 'BRASIER', 'BRASIER FLORES ZIGZAG M.965 T.34B', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 34, '2022-04-13 14:10:11', 6, NULL, 0, NULL),
(828, '887658507880', 'BRASIER', 'BRASIER RUBI M.7282 T.34C\r\n', NULL, 'lib/Productos/img/blitz_SN.png', '270.00', '0.00', 1, 5, 34, '2022-04-13 14:11:47', 6, NULL, 0, NULL),
(829, '887658964645', 'BRASIER', 'BRA NEGRO M.70028 T.34B', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 15:53:45', 6, NULL, 0, NULL),
(830, '887658114309', 'BRASIER', 'BRA NEGRO M.7218 T.34C', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 15:54:26', 6, NULL, 0, NULL),
(831, '887658544557', 'BRASIER', 'BRA NUDE M.7365 T.36C', NULL, 'lib/Productos/img/blitz_SN.png', '215.00', '0.00', 1, 5, 34, '2022-04-13 15:55:14', 6, NULL, 0, NULL),
(832, '887658459752', 'BRASIER', 'BRA FLORES M.7499 T.334C', NULL, 'lib/Productos/img/blitz_SN.png', '240.00', '0.00', 1, 5, 34, '2022-04-13 15:55:55', 6, NULL, 0, NULL),
(833, '887658248905', 'BRASIER', 'BRA ROSAS M.7331 T.34B', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 34, '2022-04-13 15:56:37', 6, NULL, 0, NULL),
(834, '887658201153', 'BRASIER', 'CORCEL BLANCO M.7315 T.34B', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 33, '2022-04-13 15:58:02', 6, NULL, 0, NULL),
(835, '887658949741', 'BRASIER', 'BRA PEONIAS M.7944 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 34, '2022-04-13 16:01:05', 6, NULL, 0, NULL),
(836, '887658964584', 'BRASIER', 'BRA VINO M.70030 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 16:01:55', 6, NULL, 0, NULL),
(837, '887658826455', 'BRASIER', 'BRA NEGRO M.7956N T.38B', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 16:02:34', 6, NULL, 0, NULL),
(838, '887658964690', 'BRASIER', 'BRA VERDE M.70028 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 16:03:44', 6, NULL, 0, NULL),
(839, '887658650401', 'BRASIER', 'BRA BUGAMBILIA M.7282 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '270.00', '0.00', 1, 5, 34, '2022-04-13 16:04:39', 6, NULL, 0, NULL),
(840, '888328158364', 'BRASIER', 'BRA PEONIAS M.7218 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 16:05:32', 6, NULL, 0, NULL),
(841, '887658962139', 'BRASIER', 'BRA NUDE M.70026 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 34, '2022-04-13 16:06:03', 6, NULL, 0, NULL),
(842, '887658362250', 'BRASIER', 'BRA NEGRO M.70005 T.34B', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 34, '2022-04-13 16:06:47', 6, NULL, 0, NULL),
(843, '887658669632', 'BRASIER', 'BRA ACERO M.7449 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 34, '2022-04-13 16:07:28', 6, NULL, 0, NULL),
(844, '887658771717', 'BRASIER', 'BRA RUBI M.7218 T.36B', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 16:14:42', 6, NULL, 0, NULL),
(845, '612140025340', 'BLUMER', 'BLUMER BLANCO M.2039 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 35, '2022-04-13 16:15:27', 6, NULL, 0, NULL),
(846, '612140018762', 'BLUMER', 'BLUMER ARENA M.2037 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 35, '2022-04-13 16:16:05', 6, NULL, 0, NULL),
(847, '612140383440', 'BLUMER', 'BLUMER NEGRO M.2057 T.4XG', NULL, 'lib/Productos/img/blitz_SN.png', '159.00', '0.00', 1, 5, 35, '2022-04-13 16:16:54', 6, NULL, 0, NULL),
(848, '612140340641', 'BLUMER', 'BLUMER NEGRO M.2637 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 35, '2022-04-13 16:21:37', 6, NULL, 0, NULL),
(849, '31386ESTRELLAS', 'PANTI', '3 PACK ESTRELLAS M.31386 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '239.00', '0.00', 2, 5, 17, '2022-04-13 16:31:46', 6, NULL, 0, NULL),
(850, '887658804101', 'PANTI', 'DUO PACK  MAGNOLIA M.24312 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '140.00', '0.00', 1, 5, 17, '2022-04-13 16:32:24', 6, NULL, 0, NULL),
(851, '887658462516', 'PANTI', '3 PACK JASPE GRIS M.34575 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '229.00', '0.00', 1, 5, 17, '2022-04-13 16:33:06', 6, NULL, 0, NULL),
(852, '87658948256', 'PANTI', '3 PACK ESTRELLAS M.31386 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '239.00', '0.00', 1, 5, 17, '2022-04-13 16:33:51', 6, NULL, 0, NULL),
(853, '887658667850', 'BRASIER', 'BRA NUDE M.7395 T.40B', NULL, 'lib/Productos/img/blitz_SN.png', '449.00', '0.00', 1, 5, 34, '2022-04-13 16:34:41', 6, NULL, 0, NULL),
(854, '887658200965', 'BRASIER', 'BRA NEGRO M.7305 T.38B', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 34, '2022-04-13 16:38:00', 6, NULL, 0, NULL),
(855, '887658079172', 'BODY', 'BODY NEGRO M.7127 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 30, '2022-04-13 16:38:40', 6, NULL, 0, NULL),
(856, '887658038018', 'BRASIER', 'BRA NEGRO M.7247 T.38B', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 2, 5, 34, '2022-04-13 16:39:20', 6, NULL, 0, NULL),
(857, '887658883489', 'BABYDOLL', 'BABYDOLL OLIVO M.42199 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 41, '2022-04-13 16:40:36', 6, NULL, 0, NULL),
(858, '887658326894', 'BRASIER', 'BRA GRIS M.7345 T.38B', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 34, '2022-04-13 16:41:20', 6, NULL, 0, NULL),
(859, '887658762760', 'BODY', 'BODY NEGRO M.7174 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 1, 5, 30, '2022-04-13 16:42:06', 6, NULL, 0, NULL),
(860, '887658762753', 'BODY', 'BODY BLANCO M.7174 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 2, 5, 30, '2022-04-13 16:42:52', 6, NULL, 0, NULL),
(861, '887658762722', 'BODY', 'BODY BLANCO M.7174 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 1, 5, 30, '2022-04-13 16:43:37', 6, NULL, 0, NULL),
(862, '887658945910', 'BODY', 'BODY BORBONIA M.7174 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 1, 5, 30, '2022-04-13 16:44:21', 6, NULL, 0, NULL),
(863, '887658945903', 'BODY', 'BODY BORGONIA M.7174 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 1, 5, 30, '2022-04-13 16:45:22', 6, NULL, 0, NULL),
(864, '887658762746', 'BODY', 'BODY TABACO M.7174 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 2, 5, 30, '2022-04-13 16:46:36', 6, NULL, 0, NULL),
(865, '887658963341', 'BRASIER', 'BRA GARDENIAS M.70032 T.34', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 34, '2022-04-13 16:47:49', 6, NULL, 0, NULL),
(866, 'MUTUALISTAILU', 'MUTUALISTA', 'MUTUALISTA DE ILUSION 1500', NULL, 'lib/Productos/img/blitz_SN.png', '1500.00', '0.00', 100, 5, 42, '2022-04-14 09:33:13', 6, NULL, 0, NULL),
(867, '887658874043', 'PANTI', '3 PACK NUBES M.23989 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '169.00', '0.00', 1, 5, 17, '2022-04-14 11:49:23', 6, NULL, 0, NULL),
(868, '887658878447', 'PANTI', '3 PACK NUBES M.23991 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '189.00', '0.00', 1, 5, 17, '2022-04-14 11:50:16', 6, NULL, 0, NULL),
(869, '887658078885', 'PANTI', 'SEMANARIO CUPCKAKES M.73101 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 17, '2022-04-14 11:52:01', 6, NULL, 0, NULL),
(870, '887658018645', 'PANTI', '3 PACK BLANCO FRESA M.33100 T.2', NULL, 'lib/Productos/img/blitz_SN.png', '159.00', '0.00', 1, 5, 17, '2022-04-14 12:04:12', 6, NULL, 0, NULL),
(871, '887658178387', 'PANTI', '3 PACK CORZONES FLORALES M.23875 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 17, '2022-04-14 12:05:02', 6, NULL, 0, NULL),
(872, '887658870755', 'PANTI', '3 PACK GLOBOS M.23873 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '169.00', '0.00', 1, 5, 17, '2022-04-14 12:05:57', 6, NULL, 0, NULL),
(873, '887658647203', 'PANTI', '3 PACK MULTI M.23989 T.12', NULL, 'lib/Productos/img/blitz_SN.png', '169.00', '0.00', 1, 5, 17, '2022-04-14 12:06:42', 6, NULL, 0, NULL),
(874, '887658078892', 'PANTI', 'SEMANARIO CUPCKAKES', NULL, 'lib/Productos/img/blitz_SN.png', '349.00', '0.00', 1, 5, 17, '2022-04-14 12:16:23', 6, NULL, 0, NULL),
(875, '887658948492', 'DIADEMA SPA', 'DIADEMA SPA FACIAL', NULL, 'lib/Productos/img/blitz_SN.png', '109.00', '0.00', 2, 5, 8, '2022-04-14 12:19:01', 6, NULL, 0, NULL),
(876, '887658992921', 'BLUSA', 'DDUO BLUSA BLANCO ROSA M.19000 T.10', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 1, '2022-04-14 12:19:47', 6, NULL, 0, NULL),
(877, '887658992907', 'BLUSA', 'DUO BLUSA BLANCO ROSA M.19000 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 1, '2022-04-14 12:20:25', 6, NULL, 0, NULL),
(878, '887658749235', 'BLUSA', 'DUO BLUSA BLANCO INDIGO M.23996 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-14 12:21:32', 6, NULL, 0, NULL),
(879, '887658857763', 'SHORT ', 'SORT JASPE GRIS /INDIGO M.23888 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '149.00', '0.00', 1, 5, 44, '2022-04-14 13:15:32', 6, NULL, 0, NULL),
(880, '887658651170', 'MAYON', 'MAYON BUGAMBILIA M.8224 T.10', NULL, 'lib/Productos/img/blitz_SN.png', '149.00', '0.00', 1, 5, 45, '2022-04-14 13:17:47', 6, NULL, 0, NULL),
(881, '887658651187', 'MAYON', 'MAYON BUGAMBILIA M.8224 T.14', NULL, 'lib/Productos/img/blitz_SN.png', '149.00', '0.00', 1, 5, 45, '2022-04-14 13:19:38', 6, NULL, 0, NULL),
(882, '22128', 'CEPILLO ', 'CEPILLO FLEX', NULL, 'lib/Productos/img/blitz_SN.png', '90.00', '0.00', 0, 5, 27, '2022-04-14 16:18:53', 11, NULL, 0, NULL),
(883, '21033', 'TRASTE', 'GUADA  REFRI DUO', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 0, 5, 27, '2022-04-14 16:20:09', 11, NULL, 0, NULL),
(884, '21721', 'UTENCILIO HOGAR', 'CUBRE SOL ', NULL, 'lib/Productos/img/blitz_SN.png', '90.00', '0.00', 0, 5, 27, '2022-04-14 16:20:43', 11, NULL, 0, NULL),
(885, '060146', 'BASE', 'MAQUILAJE DE LARGA DURACION A PRUEVA DE AGUA ', NULL, 'lib/Productos/img/blitz_SN.png', '380.00', '0.00', 0, 5, 8, '2022-04-14 18:20:39', 1, NULL, 0, NULL),
(886, '887658477282', 'MAYON', 'MAYON VINO M.23984 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '145.00', '0.00', 2, 5, 45, '2022-04-18 13:33:21', 6, NULL, 0, NULL),
(887, '887658346489', 'MAYON', 'MAYON MORADO M.23984 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '145.00', '0.00', 1, 5, 45, '2022-04-18 13:24:27', 6, NULL, 0, NULL),
(888, '887658346441', 'MAYON', 'MAYO MORADO M.23984 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '145.00', '0.00', 1, 5, 45, '2022-04-18 13:28:06', 6, NULL, 0, NULL),
(889, '887658375083', 'PES', 'PESCADOR DEPORTIVO PUNTOS POP M.1810 TCH', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 23, '2022-04-18 13:36:19', 6, NULL, 0, NULL);
INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `Marca`, `Foto`, `PrecioVenta`, `PrecioCompra`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `can`) VALUES
(890, '887658641508', 'TOP', 'TOP DUO \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nTOP DUO M.23987 T.10\r\n\r\n\r\n', NULL, 'lib/Productos/img/blitz_SN.png', '140.00', '0.00', 1, 5, 40, '2022-04-18 13:39:09', 6, NULL, 0, NULL),
(891, 'MOD\'21\'043', 'BLUSA', 'BLUS VINO ,ROSA,MOSTAZA T.M', NULL, 'lib/Productos/img/blitz_SN.png', '195.00', '0.00', 3, 5, 1, '2022-04-18 13:42:13', 23, NULL, 0, NULL),
(892, 'BK1SV130', 'VESTIDO', 'VESTIDO SMAK', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 14, '2022-04-18 13:47:22', 23, NULL, 0, NULL),
(893, '887658749228', 'BLUSA', 'BLUSA DUO/PAK M.23996 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 1, '2022-04-18 13:49:06', 6, NULL, 0, NULL),
(894, '887658285016', 'JUMPER', 'VESTIDO FLORES M.45675 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '269.00', '0.00', 1, 5, 25, '2022-04-18 13:52:15', 6, NULL, 0, NULL),
(895, '887658285672', 'VESTIDO', 'VESTIDO FLORES M.45673 T.14', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 0, 5, 14, '2022-04-18 13:53:33', 6, NULL, 0, NULL),
(896, '300650041133', 'VESTIDO', 'VESTIDO AZUL M.30065 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 14, '2022-04-18 13:55:28', 2, NULL, 0, NULL),
(897, 'MOD\'21\'050', 'VESTIDO', 'VESTIDO MULTI T.M', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 14, '2022-04-18 13:57:19', 23, NULL, 0, NULL),
(898, 'MOD\'21\'044', 'VESTIDO', 'VESTIDO ROSA  T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 14, '2022-04-18 14:00:02', 23, NULL, 0, NULL),
(899, '46A9MA4', 'BLUSA', 'BLUSA XIMENITAS M/L T.G', NULL, 'lib/Productos/img/blitz_SN.png', '235.00', '0.00', 1, 5, 1, '2022-04-18 14:02:37', 23, NULL, 0, NULL),
(900, 'HMTO2', 'OVEROL', 'OVEROL  MINNIE T.2', NULL, 'lib/Productos/img/blitz_SN.png', '245.00', '0.00', 1, 5, 38, '2022-04-18 14:04:27', 23, NULL, 0, NULL),
(901, '887658992914', 'BLUSA', 'DUO/PAK BLACO/ROSA M.19000 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '249.00', '0.00', 1, 5, 1, '2022-04-18 14:06:23', 6, NULL, 0, NULL),
(902, '5903000017342', 'VESTIDO', 'VESTIDO CEREZA M.59030  T.12', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 14, '2022-04-18 14:07:50', 5, NULL, 0, NULL),
(903, '25A73MA2', 'VESTIDO', 'VESTIDO CARAMELLA  VINO,ROSA T,CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '445.00', '0.00', 4, 5, 14, '2022-04-18 14:10:38', 23, NULL, 0, NULL),
(904, '004182', 'BLUSA', 'BLUSA BLANCO MINN IUNITALLA', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 1, '2022-04-18 14:15:20', 30, NULL, 0, NULL),
(905, '004181', 'BLUSA', 'BLUSA BLANCO UNITALLA', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 1, '2022-04-18 14:16:24', 30, NULL, 0, NULL),
(906, '887658966373', 'VESTIDO', 'VESTIDO ROSA M.11034 T.14', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 14, '2022-04-18 14:17:24', 6, NULL, 0, NULL),
(907, '887658966366', 'VESTIDO', 'VESTIDO ROSA M.11034 T.12 ', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 14, '2022-04-18 14:18:29', 6, NULL, 0, NULL),
(908, '10A47MA2', 'PANTALON', 'PANTALON CONECTION T.8', NULL, 'lib/Productos/img/blitz_SN.png', '318.00', '0.00', 2, 5, 47, '2022-04-18 14:21:42', 23, NULL, 0, NULL),
(909, '76A47MA1', 'PANTALON', 'PANTALON KINNERETH T,8', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 3, 5, 47, '2022-04-18 14:25:52', 23, NULL, 0, NULL),
(910, '290012', 'PANTALON', 'PANTALON MARGO T.12', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 1, 5, 47, '2022-04-18 14:28:32', 23, NULL, 0, NULL),
(911, '295014', 'PANTALON', 'PANTALON MARGO T.14', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 47, '2022-04-18 14:29:53', 23, NULL, 0, NULL),
(912, '29508', 'PANTALON', 'PANTALON MARGO T,8', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 47, '2022-04-18 14:31:41', 23, NULL, 0, NULL),
(913, 'BMT08', 'BERMUDA ', 'BERMUDA  NIÑO MEZCLILLA T.8', NULL, 'lib/Productos/img/blitz_SN.png', '230.00', '0.00', 1, 5, 22, '2022-04-18 17:04:37', 23, NULL, 0, NULL),
(914, '00000002', 'BERMUDA', 'BERMUDA  GABARDINA FOSIL T.14', NULL, 'lib/Productos/img/blitz_SN.png', '255.00', '0.00', 2, 5, 22, '2022-04-18 17:11:33', 23, NULL, 0, NULL),
(915, '153052412182', 'SHORT ', 'SHORT NIÑO MARINO T.12-18', NULL, 'lib/Productos/img/blitz_SN.png', '240.00', '0.00', 1, 5, 44, '2022-04-18 17:14:00', 33, NULL, 0, NULL),
(916, '153052418245', 'SHORT ', 'SHORT MARINO T.18-24', NULL, 'lib/Productos/img/blitz_SN.png', '240.00', '0.00', 1, 5, 44, '2022-04-18 17:15:09', 33, NULL, 0, NULL),
(917, '887658665702', 'SHORT ', 'SHORT GRIS OXFORD T.4', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 2, 5, 44, '2022-04-18 17:18:44', 6, NULL, 0, NULL),
(918, 'BK1PBSG416', 'BERMUDA', 'BERMUDA GABARDINA PB T.10', NULL, 'lib/Productos/img/blitz_SN.png', '240.00', '0.00', 2, 5, 22, '2022-04-18 17:27:38', 23, NULL, 0, NULL),
(919, '500032212919', 'PANTALON', 'PANTA KAKI T.12-18', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 47, '2022-04-18 17:31:42', 33, NULL, 0, NULL),
(920, '536291451172', 'CONJUNTO', 'CONJUNTO MARINO M.53629 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '329.00', '0.00', 1, 5, 49, '2022-04-18 17:37:04', 2, NULL, 0, NULL),
(921, '536280321219', 'CONJUNTO', 'CONJUNTO GRIS M.53628 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '319.00', '0.00', 1, 5, 49, '2022-04-18 17:39:55', 2, NULL, 0, NULL),
(922, '887658533629', 'PLAYERA', 'PLAYERA  AZUL REY M.8199 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 39, '2022-04-18 17:43:35', 6, NULL, 0, NULL),
(923, '19CK150', 'PLAYERA', 'CAMISA BLANCO T,G', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 50, '2022-04-18 17:44:29', 26, NULL, 0, NULL),
(924, '20BK148', 'CAMISA', 'CAMISA CUADROS T.G', NULL, 'lib/Productos/img/blitz_SN.png', '215.00', '0.00', 1, 5, 50, '2022-04-18 17:45:31', 26, NULL, 0, NULL),
(925, '00000003', 'PLAYERA', 'PLAYERA CUELLO POLO OFERTA NIÑO', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 8, 5, 48, '2022-04-18 17:51:33', 27, NULL, 0, NULL),
(926, '00000004', 'PLAYERA', 'PLAYERA CUELLO REDONDO KALUZ', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 20, 5, 48, '2022-04-18 18:05:06', 27, NULL, 0, NULL),
(927, '00000005', 'CONJUNTO', 'CONJUNTO ESPORT NIÑO  OFERTA', NULL, 'lib/Productos/img/blitz_SN.png', '105.00', '0.00', 43, 5, 39, '2022-04-19 11:07:03', 27, NULL, 0, NULL),
(928, 'OOOOOOO6', 'CONJUNTO', 'CONJUTOS DINOSAURIO DE LA 2 A LA 10', NULL, 'lib/Productos/img/blitz_SN.png', '195.00', '0.00', 11, 5, 49, '2022-04-19 12:05:27', 27, NULL, 0, NULL),
(929, '00000007', 'CONJUNTO', 'CONJUNTO  CON MANGA OFERTA', NULL, 'lib/Productos/img/blitz_SN.png', '112.00', '0.00', 15, 5, 39, '2022-04-19 12:14:09', 27, NULL, 0, NULL),
(930, '887658782867', 'BOXER', 'BOXER LETRAS M.33770 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '219.00', '0.00', 1, 5, 51, '2022-04-19 12:35:24', 6, NULL, 0, NULL),
(931, '887658712345', 'TRUSAS', 'SEMANARIO TRUZA LEONES M.73103 T.14', NULL, 'lib/Productos/img/blitz_SN.png', '459.00', '0.00', 1, 5, 36, '2022-04-19 12:37:15', 6, NULL, 0, NULL),
(932, 'TRUZAOFERTA', 'TRUSAS', 'TRUZA MULTI OFERTA T,2', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 36, '2022-04-19 12:39:24', 6, NULL, 0, NULL),
(933, '887658705842', 'SPORT', 'SPORT MULTI M.34770 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '219.00', '0.00', 1, 5, 52, '2022-04-19 12:40:59', 6, NULL, 0, NULL),
(934, '887658797915', 'SPORT', 'SPORT BURBUJAS M34770 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '219.00', '0.00', 1, 5, 52, '2022-04-19 12:42:07', 6, NULL, 0, NULL),
(935, '887658523064', 'SPORT', 'SPORT INDIGO M.34770 T.6', NULL, 'lib/Productos/img/blitz_SN.png', '21.00', '0.00', 1, 5, 52, '2022-04-19 12:43:16', 6, NULL, 0, NULL),
(936, '887658891224', 'PIJAMA', 'PIJAMA INDIGO M.8360 T.8', NULL, 'lib/Productos/img/blitz_SN.png', '329.00', '0.00', 1, 5, 53, '2022-04-19 12:44:28', 6, NULL, 0, NULL),
(937, '00000008', 'CALZADO', 'CALZADO LAZO NIÑA #18 OFERTA', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 3, 5, 39, '2022-04-19 13:44:23', 4, NULL, 0, NULL),
(938, '18444', 'PASTILLAS', 'CLORITAS PASTILLAS', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 4, 5, 27, '2022-04-19 17:05:51', 11, NULL, 0, NULL),
(939, '22800', 'LONCHERA', 'LONCHERA ESTILO ', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 0, 5, 27, '2022-04-19 17:11:47', 11, NULL, 0, NULL),
(940, '22318', 'ORGANISADOR', 'ORGANI GORRA', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-19 17:13:22', 11, NULL, 0, NULL),
(941, '887658976549', 'TRUSAS', 'SEMANARIO DIJITAL M.73103 T.4', NULL, 'lib/Productos/img/blitz_SN.png', '429.00', '0.00', 1, 5, 36, '2022-04-19 17:18:44', 11, NULL, 0, NULL),
(942, '21106', 'LIMPIA GAMUSA', 'CEPILLO LIMPIA GAMUSA', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-19 17:22:19', 11, NULL, 0, NULL),
(943, '21030', 'SANDWICHERA', 'DOBLE SANDWICHERA', NULL, 'lib/Productos/img/blitz_SN.png', '109.00', '0.00', 0, 5, 27, '2022-04-19 17:23:53', 11, NULL, 0, NULL),
(944, '16102', 'TRAPIADOR CON BALDE', 'FACIL MOP', NULL, 'lib/Productos/img/blitz_SN.png', '499.00', '0.00', 1, 5, 27, '2022-04-19 17:25:27', 11, NULL, 0, NULL),
(945, '993386511003', 'CAMISA', 'CAMISA IVORI M.99338 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '389.00', '0.00', 1, 5, 50, '2022-04-19 17:45:50', 2, NULL, 0, NULL),
(946, '993386511102', 'CAMISA', 'CAMISA IVORI M.99338 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '389.00', '0.00', 0, 5, 50, '2022-04-19 17:46:53', 2, NULL, 0, NULL),
(947, '22B30XL', 'CAMISA', 'CAMISA CUADROS T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 50, '2022-04-19 18:06:09', 26, NULL, 0, NULL),
(948, '946731491208', 'CAMISA', 'CAMISA  AZUL  M/L M.94673 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 1, 5, 50, '2022-04-19 18:10:23', 2, NULL, 0, NULL),
(949, '00000009', 'CAMISA', 'CAMISA RAYAS T.G', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 50, '2022-04-19 18:17:50', 33, NULL, 0, NULL),
(950, '21CM602', 'CAMISA', 'CAMISA  21CM602 T.CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 6, 5, 50, '2022-04-19 18:22:19', 26, NULL, 0, NULL),
(951, '22B30', 'CAMISA', 'CAMISA CUADROS M.22B30 T.CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 6, 5, 50, '2022-04-19 18:29:56', 26, NULL, 0, NULL),
(952, '21CM543', 'CAMISA', 'CAMISA M.21CM543 T.CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 50, '2022-04-19 18:31:13', 26, NULL, 0, NULL),
(953, '21PG122XL', 'PLAYERA', 'PLAYERA CUELLO POLO M.21PG122 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 48, '2022-04-19 18:32:41', 26, NULL, 0, NULL),
(954, '22PG5', 'PLAYERA', 'PLAYERA C/R M.22PG5 T.CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 6, 5, 48, '2022-04-19 18:34:08', 26, NULL, 0, NULL),
(955, '21PG122', 'PLAYERA', 'PLAYERA C/P M.21PG122 T.CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 4, 5, 48, '2022-04-19 18:36:11', 26, NULL, 0, NULL),
(956, '22PG8XL', 'PLAYERA', 'PLAYERA C/P M.22PG8 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 48, '2022-04-19 18:37:27', 26, NULL, 0, NULL),
(957, '22PG5XL', 'PLAYERA', 'PLAYERA C/ M.R  M.22PG5 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 2, 5, 48, '2022-04-19 18:38:47', 26, NULL, 0, NULL),
(958, '22PG8', 'PLAYERA', 'PLAYERA  C/P M.22PG8 T.CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 5, 5, 48, '2022-04-19 18:41:16', 26, NULL, 0, 3),
(959, '800833521006', 'PLAYERA', 'PLAYERA MAJENTA M.80083 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 48, '2022-04-20 11:03:34', 2, NULL, 0, NULL),
(960, '00000013', 'PLAYERA', 'PLAYERA CUELLO POLO T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '255.00', '0.00', 4, 5, 48, '2022-04-20 11:22:30', 37, NULL, 0, NULL),
(961, '00000012', 'PLAYERA', 'PLAYERA  C/R  T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '215.00', '0.00', 2, 5, 48, '2022-04-20 11:24:32', 37, NULL, 0, NULL),
(962, '00000011', 'PLAYERA', 'PLAYERA CUELLO POLO T.G', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 3, 5, 48, '2022-04-20 11:25:37', 37, NULL, 0, NULL),
(963, '800811491208', 'PLAYERA', 'PLAYERA AZUL MARINO M.80081 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '359.00', '0.00', 1, 5, 48, '2022-04-20 11:26:55', 2, NULL, 0, NULL),
(964, '290669161307', 'PLAYERA', 'PLAYERA  TEAL M.29066 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '229.00', '0.00', 1, 5, 48, '2022-04-20 11:28:14', 2, NULL, 0, NULL),
(965, '988810671002', 'PLAYERA', 'PLAYERA CUELLO POLO GRIS M.98881 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 48, '2022-04-20 11:29:18', 2, NULL, 0, NULL),
(966, '004253', 'CAMISA', 'HUAYAVERA BLANCO T.38', NULL, 'lib/Productos/img/blitz_SN.png', '195.00', '0.00', 1, 5, 50, '2022-04-20 11:30:42', 37, NULL, 0, NULL),
(967, '00000015', 'PLAYERA', 'PLAYERA JR ', NULL, 'lib/Productos/img/blitz_SN.png', '160.00', '0.00', 2, 5, 48, '2022-04-20 11:31:51', 37, NULL, 0, NULL),
(968, '00000014', 'PLAYERA', 'PLAYERA C/R TXG', NULL, 'lib/Productos/img/blitz_SN.png', '215.00', '0.00', 2, 5, 48, '2022-04-20 11:33:04', 37, NULL, 0, NULL),
(969, '00000016', 'PLAYERA ', 'PLAYERA C/R T.M', NULL, 'lib/Productos/img/blitz_SN.png', '215.00', '0.00', 1, 5, 48, '2022-04-20 11:38:17', 37, NULL, 0, NULL),
(970, '00000017', 'PLAYERA', 'PLAYERA AZUL CIELO SCOTT JAMES T.M', NULL, 'lib/Productos/img/blitz_SN.png', '600.00', '0.00', 1, 5, 48, '2022-04-20 11:41:16', 33, NULL, 0, NULL),
(971, '00000018', 'PLAYERA', 'PLAYERA CUELLO POLO KAKI T.M', NULL, 'lib/Productos/img/blitz_SN.png', '235.00', '0.00', 1, 5, 48, '2022-04-20 11:42:29', 37, NULL, 0, NULL),
(972, 'DUBAIMK', 'CHAMARRA', 'CHAMARRA K AZUL MARINO T.CH,M,G', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 3, 5, 56, '2022-04-20 12:20:37', 26, NULL, 0, NULL),
(973, 'CROACIAV', 'CHAMARRA', 'CHAMARRA NEGRO T.M', NULL, 'lib/Productos/img/blitz_SN.png', '520.00', '0.00', 2, 5, 56, '2022-04-20 12:21:58', 26, NULL, 0, NULL),
(974, '192042501567', 'SUDADERA', 'SUDADERA  NIÑOJADE M/L M.342 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 55, '2022-04-20 12:23:42', 33, NULL, 0, NULL),
(975, '193579428402', 'SUDADERA', 'SUDADERA NIÑO GRIS  CALVIN KLEIN T.4', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 55, '2022-04-20 12:26:26', 33, NULL, 0, NULL),
(976, '7486066416482', 'PESQUERO', 'PESQUERO CABALLERO AZUL M.74860 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 23, '2022-04-20 12:29:54', 37, NULL, 0, NULL),
(977, '987233491006', 'PESQUERO', 'PESQUERO AZUL M.98723 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '369.00', '0.00', 1, 5, 23, '2022-04-20 12:31:10', 2, NULL, 0, NULL),
(978, 'PLAYBOY', 'BOXER', 'BOXER PLAYBOY T.M', NULL, 'lib/Productos/img/blitz_SN.png', '95.00', '0.00', 1, 5, 51, '2022-04-20 12:35:07', 37, NULL, 0, NULL),
(979, '00000019', 'SUDADERA', 'SUDADERA  ARENA, GRIS, ROJO. T. M Y G', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 9, 5, 55, '2022-04-20 12:57:06', 38, NULL, 0, NULL),
(980, '708300762504', 'CALZADO DAMA', 'CALZADO NARANJA M.70830 T.5', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 0, 5, 46, '2022-04-20 13:03:08', 4, NULL, 0, NULL),
(981, '708300762405', 'CALZADO', 'CALZADO NARANGA M.70830 #4', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 46, '2022-04-20 13:07:18', 2, NULL, 0, NULL),
(982, '708301722408', 'CALZADO', 'CALZADO LILA M.70830 #4', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 46, '2022-04-20 13:08:23', 2, NULL, 0, NULL),
(983, '708306632405', 'CALZADO', 'CALZADO MENTA M.70830 #4', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 46, '2022-04-20 13:09:32', 2, NULL, 0, NULL),
(984, 'MD13001ESM30', 'BERMUDA', 'BERMUDA TNNG  M.13001 T.30', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 1, 5, 22, '2022-04-20 13:12:00', 20, NULL, 0, NULL),
(985, 'M1300136', 'BERMUDA', 'BERMUDA SVDO M.13001T.36', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 22, '2022-04-20 13:13:28', 20, NULL, 0, NULL),
(986, 'M1100136', 'BERMUDA', 'BERMUDA DKSW M.11001 T.36', NULL, 'lib/Productos/img/blitz_SN.png', '280.00', '0.00', 1, 5, 22, '2022-04-20 13:14:32', 20, NULL, 0, NULL),
(987, 'M1300138', 'BERMUDA', 'BERMUDA SVDO M.13001 T.38', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 3, 5, 22, '2022-04-20 13:16:36', 20, NULL, 0, NULL),
(988, '00000006', 'SUDADERA', 'SUDADERA NIÑO NEGRO MICKEY T.7', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 55, '2022-04-20 13:22:48', 33, NULL, 0, NULL),
(989, '00000010', 'CONJUNTO', 'CONJUNTO NIÑO KALU M/L  T.2-10', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 17, 5, 49, '2022-04-20 13:30:30', 27, NULL, 0, NULL),
(990, '00000020', 'PANTALON', 'PANTALON GABARDINA NIÑO T.8Y6', NULL, 'lib/Productos/img/blitz_SN.png', '345.00', '0.00', 4, 5, 47, '2022-04-20 13:57:01', 23, NULL, 0, NULL),
(991, '00000021', 'PANTALON', 'PANTALON GABARDINA  NIÑO T.6,8,10', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 6, 5, 47, '2022-04-20 13:59:41', 23, NULL, 0, NULL),
(992, '00000022', 'PANTALON', 'PANTALON NIÑO GABARDINA T.8Y10', NULL, 'lib/Productos/img/blitz_SN.png', '325.00', '0.00', 2, 5, 47, '2022-04-20 14:03:34', 23, NULL, 0, NULL),
(993, '00000023', 'PANTALON', 'PANTALON GABARDINA  NIÑO T.12Y16', NULL, 'lib/Productos/img/blitz_SN.png', '355.00', '0.00', 6, 5, 47, '2022-04-20 14:06:42', 23, NULL, 0, NULL),
(994, '00000024', 'PANTALON', 'PANTALON GABARDINA NIÑO T,12-16', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 6, 5, 47, '2022-04-20 14:08:47', 23, NULL, 0, NULL),
(995, '45A24MA29', 'CONJUNTO', 'CONJUNTO  FALDA SHORT  M/L T.CHYG', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 2, 5, 49, '2022-04-20 16:32:54', 23, NULL, 0, NULL),
(996, '46A29MA1', 'CONJUNTO', 'CONJUNTO FALDA SHORT T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '395.00', '0.00', 1, 5, 49, '2022-04-20 16:34:26', 23, NULL, 0, NULL),
(997, '45A24MA30', 'CONJUNTO', 'CONJUNTO DE PANTALON T.3', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 3, 5, 49, '2022-04-20 16:36:26', 23, NULL, 0, NULL),
(998, '734\'21', 'CHAMARRA', 'CHAMARRA MAFER SHEDRON UNITALLA', NULL, 'lib/Productos/img/blitz_SN.png', '440.00', '0.00', 2, 5, 56, '2022-04-20 16:53:38', 15, NULL, 0, NULL),
(999, '6613160386523', 'CHALECO', 'CHALECO GRIS M.026489 T.XG', NULL, 'lib/Productos/img/blitz_SN.png', '449.00', '0.00', 1, 5, 55, '2022-04-20 16:56:12', 4, NULL, 0, NULL),
(1000, '887658721064', 'SUETER', 'SUETER INDIGO  OFERTA M.45543 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '230.00', '0.00', 1, 5, 39, '2022-04-20 16:57:26', 6, NULL, 0, NULL),
(1001, '620\'21', 'CHAMARRA', 'CHAMARRA CUADROS M.UNAI T.UNI', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 2, 5, 56, '2022-04-20 16:58:41', 15, NULL, 0, NULL),
(1002, '887658603001', 'CHALECO', 'CHALECO PLNUBANGO M.45421 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '550.00', '0.00', 1, 5, 56, '2022-04-20 17:00:02', 6, NULL, 0, NULL),
(1003, '57A21MA1', 'CHAMARRA', 'CHAMARRA DE NIÑA SIGMA T.4-12', NULL, 'lib/Productos/img/blitz_SN.png', '325.00', '0.00', 4, 5, 56, '2022-04-20 17:05:58', 23, NULL, 0, NULL),
(1004, '13A21MA1', 'CHAMARRA', 'CHAMARRA NIÑA VERDE OLIVO  T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 56, '2022-04-20 17:08:12', 23, NULL, 0, NULL),
(1005, '00000025', 'CONJUNTO', 'CONJUNTO NIÑA M/L  UNISEX T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '345.00', '0.00', 1, 5, 49, '2022-04-20 17:11:38', 23, NULL, 0, NULL),
(1006, '00000026', 'CHALECO', 'CHALECO MEZCLILLA TERRA T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '500.00', '0.00', 1, 5, 56, '2022-04-20 17:18:03', 4, NULL, 0, NULL),
(1007, 'MS39009APSCH', 'CHALECO', 'CHALECO  STBL  M.39009 T.CH', NULL, 'lib/Productos/img/blitz_SN.png', '345.00', '0.00', 1, 5, 56, '2022-04-20 17:20:44', 17, NULL, 0, NULL),
(1008, '13A24MA2', 'CONJUNTO', 'CONJUNTO NIÑA M/L  ANIMAL PRINT T.G', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 49, '2022-04-20 17:22:52', 23, NULL, 0, NULL),
(1009, '72421', 'CONJUNTO', 'CONJUNTO DAMA M/L T. UNI VINO,VERDE,SDRON', NULL, 'lib/Productos/img/blitz_SN.png', '590.00', '0.00', 3, 5, 49, '2022-04-20 17:26:04', 15, NULL, 0, NULL),
(1010, '00000028', 'PANTALON', 'PANTALON EXTREME ZONE Y PETROL 30-40', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 9, 5, 18, '2022-04-21 11:39:37', 37, NULL, 0, NULL),
(1011, '00000027', 'PANTALON', 'PANTALO PETROL  T.28', NULL, 'lib/Productos/img/blitz_SN.png', '380.00', '0.00', 1, 5, 47, '2022-04-21 11:43:02', 37, NULL, 0, NULL),
(1012, '00000029', 'PANTALON', 'PANTALON PETROL T.28-38', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 8, 5, 18, '2022-04-21 12:06:22', 37, NULL, 0, NULL),
(1013, '00000030', 'PANTALON', 'PANTALON PETROL 28-36', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 7, 5, 18, '2022-04-21 12:08:13', 37, NULL, 0, NULL),
(1015, '6613160403876', 'CALZADO', 'CALZADO  CABALLERO M.033397 #8', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 10, '2022-04-21 12:34:06', 4, NULL, 0, NULL),
(1016, '6613160403875', 'CALZADO', 'CALZADO CABALLERO M.033397 T.7', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 3, 5, 10, '2022-04-21 12:42:25', 4, NULL, 0, NULL),
(1017, '6613160392129', 'CALZADO', 'CALZADO CABALLERO M.031255 #7', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 3, 5, 10, '2022-04-21 12:44:12', 4, NULL, 0, NULL),
(1018, '6613160403880', 'CALZADO', 'CALZADO  CABALLERO M.033403 #6', NULL, 'lib/Productos/img/blitz_SN.png', '129.00', '0.00', 1, 5, 10, '2022-04-21 12:45:49', 4, NULL, 0, NULL),
(1019, '6613160372652', 'CALZADO', 'CALZADO CALLERO NEGRO M.029429 #8', NULL, 'lib/Productos/img/blitz_SN.png', '299.00', '0.00', 1, 5, 10, '2022-04-21 12:46:46', 4, NULL, 0, NULL),
(1020, '8870280652501', 'CALZADO', 'CALZADO AZUL M.2909387 #5', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 10, '2022-04-21 12:47:41', 4, NULL, 0, NULL),
(1021, '1619150922507', 'CALZADO', 'CALZADO NEGRO M.2550527 #5', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 10, '2022-04-21 12:49:34', 5, NULL, 0, NULL),
(1022, '6613160392128', 'CALZADO', 'CALZADO MULTI M.031255 #6', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 4, 5, 10, '2022-04-21 12:50:40', 4, NULL, 0, NULL),
(1023, '1619172502503', 'CALZADO', 'CALZADO CAFE M.2950228 #5', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 10, '2022-04-21 12:52:08', 5, NULL, 0, NULL),
(1024, '8871127882501', 'CALZADO', 'CALZADO AZUL MEZCLILLA M.2909646 #5', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 10, '2022-04-21 12:53:45', 5, NULL, 0, NULL),
(1025, '6613160392127', 'CALZADO', 'CALZADO MULTI M.031255 #5', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 3, 5, 10, '2022-04-21 12:55:11', 4, NULL, 0, NULL),
(1026, '266618611100', 'SHORT ', 'SHORT MULTI M.26661 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '259.00', '0.00', 1, 5, 44, '2022-04-21 12:58:06', 2, NULL, 0, NULL),
(1027, '00000031', 'PLAYERA', 'PLAYERA M/L T.2-12', NULL, 'lib/Productos/img/blitz_SN.png', '160.00', '0.00', 19, 5, 48, '2022-04-22 12:46:32', 27, NULL, 0, NULL),
(1028, '00000032', 'PLAYERA', 'PLAYERA M/L T.14Y16', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 5, 5, 48, '2022-04-22 12:47:44', 27, NULL, 0, NULL),
(1029, '070276', 'MASCARILLA', 'MASCARILLA INTENSIVA PARA CABELLO 200G', NULL, 'lib/Productos/img/blitz_SN.png', '395.00', '0.00', 5, 5, 58, '2022-04-22 13:44:47', 1, NULL, 0, NULL),
(1030, '070496', 'EXFOLIANTE', 'EXFOLIANTE CAPILAR CON ALGAS MARINAS Y ACIDO FRUTALES Y SEMILLAS DE FRESAS 140G.', NULL, 'lib/Productos/img/blitz_SN.png', '490.00', '0.00', 5, 5, 4, '2022-04-23 13:47:13', 1, NULL, 0, NULL),
(1031, '160001', 'EXFOLIANTE', 'POLVO MICRO-EXFOLIANTE DE PERLA DE ARROZ Y FRUTAS.', NULL, 'lib/Productos/img/blitz_SN.png', '590.00', '0.00', 4, 5, 4, '2022-04-23 13:46:00', 1, NULL, 0, NULL),
(1032, '070344', 'SPRAY', 'SPRAY BIFASICO PARA EL CABELLO 250ML', NULL, 'lib/Productos/img/blitz_SN.png', '480.00', '0.00', 3, 5, 60, '2022-04-23 13:48:16', 1, NULL, 0, NULL),
(1033, '070132', 'ACEITE', 'ACEITE EN GEL CORPORAL CON EXTRACTOS DE ALMENDRAS 245ML.', NULL, 'lib/Productos/img/blitz_SN.png', '525.00', '0.00', 2, 5, 5, '2022-04-23 13:48:51', 1, NULL, 0, NULL),
(1034, '070457', 'CREMA', 'CREMA PARA MOLDEAR RIZOS 230G.', NULL, 'lib/Productos/img/blitz_SN.png', '420.00', '0.00', 5, 5, 28, '2022-04-22 13:56:31', 1, NULL, 0, NULL),
(1035, '60725', 'SHAPOO MATIZADOR ', 'SHAPOO MATIZADOR CABELLO TEÑIDO 250ML.', NULL, 'lib/Productos/img/blitz_SN.png', '385.00', '0.00', 3, 5, 67, '2022-04-22 14:03:21', 1, NULL, 0, NULL),
(1036, '070333', 'ACEITE', 'ACEITE PROTECTOR DEL SOL 120ML.', NULL, 'lib/Productos/img/blitz_SN.png', '620.00', '0.00', 3, 5, 5, '2022-04-22 14:05:56', 1, NULL, 0, NULL),
(1037, '070479', 'MASCARILLA', 'MASCARILLA INTENSIVA PARA CABELLO JUMBO 500G', NULL, 'lib/Productos/img/blitz_SN.png', '559.00', '0.00', 2, 5, 58, '2022-04-22 14:12:04', 1, NULL, 0, NULL),
(1038, '070323', 'SHAMPOO', 'SHAMPOO PARA CABELLO CON EXTRACTOS OLEOSOS DE ARGAN 250ML.', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 6, 5, 68, '2022-04-23 16:11:05', 1, NULL, 0, NULL),
(1039, '070474', 'ACONDICIONADOR', 'ACONDICIONADOR EN CREMA PARA EL CABELLO CON EXTRACTOS DE SEDA Y LECHE 235G.', NULL, 'lib/Productos/img/blitz_SN.png', '340.00', '0.00', 3, 5, 69, '2022-04-22 14:18:08', 1, NULL, 0, NULL),
(1040, '070329', 'TONICO', 'TONICO HIDRATATE PARA EL CUTIS ', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 64, '2022-04-22 15:24:04', 1, NULL, 0, NULL),
(1041, '070330', 'TONICO', 'TONICO FACIAL CONTORNO DE GRASA ', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 64, '2022-04-22 15:27:18', 1, NULL, 0, NULL),
(1042, '03100', 'MISERAL', 'AGUA MICELAR GLACIAR DESMAQUILLANTE PARA CUTIS 240M.L', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 6, '2022-04-22 15:42:54', 1, NULL, 0, NULL),
(1043, '17200', 'LINPIADORA IDRATANTE', 'CREMA  LIMPIADORA FACIAL IDRATANTE 130M.L', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 28, '2022-04-22 15:47:35', 1, NULL, 0, NULL),
(1044, '160022', 'GEL LIMPIADORA', 'GEL LIMPIADORA FACIAL PARA CONTORNO DE GRASA.', NULL, 'lib/Productos/img/blitz_SN.png', '320.00', '0.00', 2, 5, 28, '2022-04-23 16:14:00', 1, NULL, 0, NULL),
(1045, 'CREMADEMANTEQUILLA', 'CREMA', 'CRAMA DE MANTEQUILLA 80G', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 28, '2022-04-22 15:54:28', 1, NULL, 0, NULL),
(1046, '15001', 'ACEITE', 'ACEITE FACIAL PARA TODO TIPO DE PIEL 30M.L', NULL, 'lib/Productos/img/blitz_SN.png', '610.00', '0.00', 3, 5, 28, '2022-04-22 16:06:03', 1, NULL, 0, NULL),
(1047, '160019', 'GEL', 'GEL HUMECTANTE PARA PIES  CON EXTRACTO DE MENTE.', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 28, '2022-04-22 16:20:25', 1, NULL, 0, NULL),
(1048, '060172', 'SUERO', 'SUERO CONSENTRADO PARA PUNTAS MALTRATADAS', NULL, 'lib/Productos/img/blitz_SN.png', '380.00', '0.00', 3, 5, 70, '2022-04-22 17:11:06', 1, NULL, 0, NULL),
(1049, '060101', 'GEL', 'GEL PARA CONTORNO DE HOJOS', NULL, 'lib/Productos/img/blitz_SN.png', '610.00', '0.00', 2, 5, 71, '2022-04-22 17:24:05', 1, NULL, 0, NULL),
(1050, '960090', 'CREMA', 'CREMA CON CELULAS MADRES CON MANZANA', NULL, 'lib/Productos/img/blitz_SN.png', '1550.00', '0.00', 1, 5, 28, '2022-04-22 17:27:12', 1, NULL, 0, NULL),
(1051, 'MAXIMIZADOR', 'LAPIZ', 'LAPIZ DELINADOR MAXIMISADOR PARA HOJOS', NULL, 'lib/Productos/img/blitz_SN.png', '190.00', '0.00', 5, 5, 63, '2022-04-22 17:29:56', 1, NULL, 0, NULL),
(1052, 'MILAN', 'RIMEL', 'MASCARA  EFECTO  AMPLIFICADOR PARA PESTAÑA', NULL, 'lib/Productos/img/blitz_SN.png', '510.00', '0.00', 1, 5, 7, '2022-04-23 14:06:06', 1, NULL, 0, NULL),
(1053, '160038', 'CREMA', 'EXFOLIANTE REPARADOR NOCTURNO PARA  MANOS', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 4, '2022-04-23 13:53:06', 1, NULL, 0, NULL),
(1054, '160037', 'BALSAMO', 'BALSAMO NOCTURNO ACLARADOR IDRATANTE PARA MANOS', NULL, 'lib/Productos/img/blitz_SN.png', '380.00', '0.00', 1, 5, 28, '2022-04-23 13:51:55', 1, NULL, 0, NULL),
(1055, '060084', 'DESODORATE', 'DESODORANTE TROPICAL FANTACY ', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 4, 5, 65, '2022-04-22 19:05:41', 1, NULL, 0, NULL),
(1057, '060085', 'DESODORATE', 'DESODORANTE AQUA MARINE CABALLERO', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 3, 5, 65, '2022-04-22 19:23:42', 1, NULL, 0, NULL),
(1058, '070303', 'PROTECTOR', 'SPRAY PROTECTOR SOLAR CORPORAL FPS50+ PROTECTOR MUY ALTA', NULL, 'lib/Productos/img/blitz_SN.png', '510.00', '0.00', 2, 5, 23, '2022-04-22 19:33:32', 1, NULL, 0, NULL),
(1059, '060203', 'PROTECTOR FACIAL', 'PROTECTOR FACIAL ULTRA LIGERO FPS 50+ PROTECSION MUY ALTA', NULL, 'lib/Productos/img/blitz_SN.png', '400.00', '0.00', 1, 5, 28, '2022-04-22 19:41:12', 1, NULL, 0, NULL),
(1060, 'SYNERGEX', 'CREMA', 'CREMA FACIAL DE DIA DE EFECTO REESTRUCTURANTE  FPS 15', NULL, 'lib/Productos/img/blitz_SN.png', '1000.00', '0.00', 2, 5, 28, '2022-04-22 20:06:19', 1, NULL, 0, NULL),
(1061, '060106', 'CREMA', 'CREMA FACIAL IDRATANTE 5 CAPAS', NULL, 'lib/Productos/img/blitz_SN.png', '660.00', '0.00', 1, 5, 28, '2022-04-23 14:08:49', 1, NULL, 0, NULL),
(1062, '160128', 'CREMA', 'CREMA CORECTOR FOCALIZADA', NULL, 'lib/Productos/img/blitz_SN.png', '330.00', '0.00', 1, 5, 28, '2022-04-23 10:31:39', 1, NULL, 0, NULL),
(1063, '060163', 'CAPSULAS', 'CAPSULAS DE SERAMIDAS  PARA OJOSY ROSTRO', NULL, 'lib/Productos/img/blitz_SN.png', '1100.00', '0.00', 1, 5, 28, '2022-04-23 10:34:50', 1, NULL, 0, NULL),
(1064, '060034', 'CREMA', 'GEL ESPECIALIZADO PARA ROSTRO Y CUELLO BEYOD', NULL, 'lib/Productos/img/blitz_SN.png', '810.00', '0.00', 2, 5, 28, '2022-04-23 10:40:01', 1, NULL, 0, NULL),
(1065, '11006', 'CREMA', 'CREMA PARA CONTORNO DE HOJOS SYNERGEX', NULL, 'lib/Productos/img/blitz_SN.png', '655.00', '0.00', 1, 5, 28, '2022-04-23 10:42:16', 1, NULL, 0, NULL),
(1066, '12008', 'CRAMA', 'LOCION FACIAL ACLARADORA TOTALLY RADIANT PLUS', NULL, 'lib/Productos/img/blitz_SN.png', '770.00', '0.00', 1, 5, 28, '2022-04-23 10:45:06', 1, NULL, 0, NULL),
(1067, '39007', 'ALARGADORA', 'CELLULAR LASH SISTEM LOCION ALARGADORA PARA PESTAÑA', NULL, 'lib/Productos/img/blitz_SN.png', '740.00', '0.00', 1, 5, 7, '2022-04-23 11:05:25', 1, NULL, 0, NULL),
(1068, '18002', 'EXFOLIANTE', 'GEL EXFOLIANTE DE DOBLE ACCION', NULL, 'lib/Productos/img/blitz_SN.png', '360.00', '0.00', 1, 5, 71, '2022-04-23 11:50:31', 1, NULL, 0, NULL),
(1069, '18001', 'MASCARILLA', 'MASCARRILLA FACIAL REFINADORA DE POROS', NULL, 'lib/Productos/img/blitz_SN.png', '310.00', '0.00', 1, 5, 28, '2022-04-23 11:53:10', 1, NULL, 0, NULL),
(1070, '21GQ06', 'MAQUILLAJE', 'MAQUILLAJE  COMPACTO NEUTRAL', NULL, 'lib/Productos/img/blitz_SN.png', '580.00', '0.00', 2, 5, 8, '2022-04-23 12:02:34', 1, NULL, 0, NULL),
(1071, '21HQ12', 'MAQUILLAJE', 'MAQUILLAJE CONPACTO CARAMEL', NULL, 'lib/Productos/img/blitz_SN.png', '580.00', '0.00', 1, 5, 8, '2022-04-23 11:58:08', 1, NULL, 0, NULL),
(1072, '070280', 'OLEO 245M.L', 'ACEITE TRATAMIENTO OLEO 3 EN 1- 245M.L', NULL, 'lib/Productos/img/blitz_SN.png', '620.00', '0.00', 6, 5, 72, '2022-04-23 13:25:51', 1, NULL, 0, NULL),
(1073, '070225', 'OLEO 120M.L', 'ACEITE TRATAMIENTO DE CABELLO 3 EN 1 -120M.L', NULL, 'lib/Productos/img/blitz_SN.png', '570.00', '0.00', 6, 5, 72, '2022-04-23 13:27:24', 1, NULL, 0, NULL),
(1074, '070421', 'OLEO 500M.L', 'ACEITE TRATAMIENTO PARA CABELLO- 3 EN 1 500M.L', NULL, 'lib/Productos/img/blitz_SN.png', '2280.00', '0.00', 1, 5, 72, '2022-04-23 13:44:16', 1, NULL, 0, NULL),
(1075, 'PLATINUM', 'PERFUME CABALLERO', 'PERFUME ESTILO PLATINUM ', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 2, 5, 3, '2022-04-23 15:29:25', 12, NULL, 0, NULL),
(1076, '43392', 'PERFUME CABALLERO', 'PERFUME KIOTIS ICE', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 4, 5, 3, '2022-04-23 15:32:42', 12, NULL, 0, NULL),
(1077, '01260', 'BODY', 'SPLASH REPRESCANTE DARED', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 30, '2022-04-23 15:34:33', 12, NULL, 0, NULL),
(1078, '01502', 'BODY', 'SPLASH REFRESCANTE RACE', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 30, '2022-04-23 15:36:20', 12, NULL, 0, NULL),
(1079, '67346', 'CREMA', 'POMADA MAGICA CREMA REPARADORA', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 1, 5, 28, '2022-04-23 15:59:38', 12, NULL, 0, NULL),
(1080, '52838', 'CREMA', 'POMADA MAGICA ALOE VERA', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 1, 5, 28, '2022-04-23 15:42:44', 12, NULL, 0, NULL),
(1081, '20349', 'CREMA', 'POMADA MAGICA ACEITE DE COCO', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 0, 5, 28, '2022-04-23 15:43:58', 12, NULL, 0, NULL),
(1082, '02406', 'CREMA', 'POMADA MAGICA EXTRACTO DE JALEA REAL', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 2, 5, 28, '2022-04-23 15:45:07', 12, NULL, 0, NULL),
(1083, '02344', 'CREMA', 'POMADA MAGICA ROSA MOSQUETA', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 2, 5, 28, '2022-04-23 15:46:08', 12, NULL, 0, NULL),
(1084, '13687', 'REPELENTE', 'GEL REPELENTE DE INSECTOS', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 0, 5, 71, '2022-04-23 15:51:44', 12, NULL, 0, NULL),
(1085, '19149', 'FRESCAPIE', 'FRESCAPIE CASTAÑA DE INDIA ', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 28, '2022-04-23 15:53:29', 12, NULL, 0, NULL),
(1086, '79409', 'LIMPIADOR', 'LIMPIADOR DE CRISTALES', NULL, 'lib/Productos/img/blitz_SN.png', '90.00', '0.00', 1, 5, 27, '2022-04-23 15:54:58', 12, NULL, 0, NULL),
(1087, '07556', 'ESPONJA', 'ESPONJA DOBLE CARA', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 6, 5, 27, '2022-04-23 15:57:37', 12, NULL, 0, NULL),
(1088, '070437', 'VITAOLEO', 'VITAOLEO FACIAL CORPORAL', NULL, 'lib/Productos/img/blitz_SN.png', '660.00', '0.00', 1, 5, 5, '2022-04-23 16:17:01', 1, NULL, 0, NULL),
(1089, '02559', 'GEL EFECTO TERMICO', 'GEL EFECTO TERMICO ANTI TENSION', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 2, 5, 71, '2022-04-23 16:38:06', 12, NULL, 0, NULL),
(1090, '34896', 'GEL INTIMO', 'INTIMATE GEL HIDRATANTE', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 71, '2022-04-23 16:40:27', 12, NULL, 0, NULL),
(1091, '52923', 'GEL INTIMO', 'GEL INTIMO ALOE VERA', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 71, '2022-04-23 16:41:27', 12, NULL, 0, NULL),
(1092, '52996', 'GEL INTIMO', 'GEL INTIMO MANZANILLA', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 71, '2022-04-23 16:42:25', 12, NULL, 0, NULL),
(1093, '59657', 'SPRAY REPELENTE', 'REPELENTE DE INSECTO EN SPRAY', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 3, 5, 73, '2022-04-23 16:46:04', 11, NULL, 0, NULL),
(1094, '24866', 'DESODORANTE', 'DESODORANTE AMBIENTAL  COCO VAINILLA', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 2, 5, 27, '2022-04-23 16:48:30', 12, NULL, 0, NULL),
(1095, '24994', 'DESODORANTE', 'DESODORANTE ANBIENTAL FRUTOS ROJOS', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-23 16:49:48', 12, NULL, 0, NULL),
(1096, '19055', 'ESPONJA', 'ESPONJA MULTIUSOS ', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 2, 5, 27, '2022-04-23 16:50:57', 12, NULL, 0, NULL),
(1097, '71394', 'GEL REPARADOR PIES', 'GEL RAPARADOR PARA PIES', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 3, 5, 27, '2022-04-23 16:52:58', 12, NULL, 0, NULL),
(1098, '61623', 'GEL PICADURAS', 'GEL CALMANTE PARA PICADURAS', NULL, 'lib/Productos/img/blitz_SN.png', '40.00', '0.00', 1, 5, 27, '2022-04-23 16:56:08', 12, NULL, 0, NULL),
(1099, '41702', 'BODY', 'KIOTIS FRIENDLINESS', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 2, 5, 30, '2022-04-23 16:57:50', 12, NULL, 0, NULL),
(1100, '99070', 'BODY', 'KIOTIS HOPEFULNESS', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 2, 5, 30, '2022-04-23 16:59:31', 12, NULL, 0, NULL),
(1101, '41873', 'BODY', 'KIOTIS LIKEABLE', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 30, '2022-04-23 17:00:42', 12, NULL, 0, NULL),
(1102, '32292', 'BODY', 'KIOTIS PLEASURE', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 30, '2022-04-23 17:01:40', 12, NULL, 0, NULL),
(1103, '53016', 'CREMA CALLOS', 'CREMA ABLANDADORA DE CALLOS', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 3, 5, 28, '2022-04-23 17:03:48', 12, NULL, 0, NULL),
(1104, '21123', 'REPELENTE', 'REPELENTE DE INSECTOS ROLL ON', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 73, '2022-04-23 17:06:03', 12, NULL, 0, NULL),
(1105, '75651', 'DESMANCHADOR ', 'DESMANCHADOR EXPRES', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 27, '2022-04-23 17:07:23', 12, NULL, 0, NULL),
(1106, '47512', 'EXFOLIANTE', 'CREMA EXFOLIANTE CORPORAL', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 2, 5, 28, '2022-04-23 17:09:29', 12, NULL, 0, NULL),
(1107, '33492', 'EXFOLIANTE PARA MANOS', 'CREMA EXFOLIANTE PARA MANOS', NULL, 'lib/Productos/img/blitz_SN.png', '110.00', '0.00', 2, 5, 4, '2022-04-23 17:10:40', 12, NULL, 0, NULL),
(1108, '42697', 'REPELENTE PARA PISOS', 'REPELENTE PARA INSECTOS PARA PISOS', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 27, '2022-04-23 17:12:39', 12, NULL, 0, NULL),
(1109, '03816', 'ENJUAGUE BUCAL', 'PAQUETE ENJUAGUE BUCAL', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 27, '2022-04-23 17:14:20', 12, NULL, 0, NULL),
(1110, '19307', 'LIMPIADOR', 'LIMPIADOR CONSENTRADO PARA SANITARIOS', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 2, 5, 27, '2022-04-23 17:17:22', 12, NULL, 0, NULL),
(1111, '19495', 'LIMPIADOR', 'LIMPIADOR CONSENTRADO PARA SANITARIOS', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 27, '2022-04-23 17:20:20', 12, NULL, 0, NULL),
(1112, '75120', 'LIMPIADOR', 'LIMPIADOR BLANQUEADOR ANTI MOHO', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 27, '2022-04-23 17:23:08', 12, NULL, 0, NULL),
(1113, '19680', 'LIMPIADOR', 'LIMPIADOR Y PROTECTOR PARA SUPERFICIES DE BAÑO', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 2, 5, 27, '2022-04-23 17:25:24', 12, NULL, 0, NULL),
(1114, '51361', 'EXFOLIANTE', 'CREMA EXFOLIANTE CORPORAL', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 28, '2022-04-23 17:28:15', 12, NULL, 0, NULL),
(1115, '69128', 'SHAMPOO', 'SHAMPOO CON ACEITE DE ARGAN', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-23 17:29:45', 12, NULL, 0, NULL),
(1116, '35395', 'EXFOLIANTE', 'EXFOLIANTE PIELES MIXTAS Y GRASAS', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-23 17:31:07', 12, NULL, 0, NULL),
(1117, '86854', 'EXFOLIANTE', 'EXFOLIANTE INTENSIVO PARA PIES', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 4, '2022-04-23 17:32:50', 12, NULL, 0, NULL),
(1118, '49426', 'AROMATIZANTE', 'NEUTRALIZADOR DE OLORES MANZANA CANELA', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-23 17:34:32', 12, NULL, 0, NULL),
(1119, '20365', 'AROMATIZANTE', 'NEUTRALIZADOR DE OLORES EXOTIC', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 2, 5, 27, '2022-04-23 17:35:33', 12, NULL, 0, NULL),
(1120, '85402', 'TRATAMIENTO', 'TRATAMIENTO PARA UÑAS', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 2, 5, 27, '2022-04-23 17:36:46', 12, NULL, 0, NULL),
(1121, '32101', 'BRILLO', 'ESPIRAL PARA COSINA', NULL, 'lib/Productos/img/blitz_SN.png', '40.00', '0.00', 1, 5, 27, '2022-04-23 17:39:54', 12, NULL, 0, NULL),
(1122, '15754', 'LIMPIADOR', 'LIMPIADOR CONSENTRADO  QUITA GRASA', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 27, '2022-04-23 17:41:51', 12, NULL, 0, NULL),
(1123, '36901', 'LIMPIADOR', 'LIMPIADOR DESINCRUSTNTE', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-23 17:44:42', 12, NULL, 0, NULL),
(1124, '33294', 'CONSERVADOR', 'CONSERVADOR DE FRUTAS Y VERDURAS', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-23 17:46:00', 12, NULL, 0, NULL),
(1125, '26863', 'DESODORATE', 'DESODORANTE PARA REFRIJERADOR', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-23 17:48:45', 12, NULL, 0, NULL),
(1126, '49497', 'GEL', 'GEL REPELENTE DE INSECTOS', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 71, '2022-04-23 17:50:18', 12, NULL, 0, NULL),
(1127, '67240', 'GEL REPELENTE', 'GEL REPELINTE DE INSECTO BANBU Y PEPINO', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-23 17:51:37', 12, NULL, 0, NULL),
(1128, '76282', 'GEL BUCAL', 'ENJUAGUE BUCAL', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-23 17:53:18', 12, NULL, 0, NULL),
(1129, '79529', 'SPRAY', 'SPRAY PARA PIES CANSADO', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 1, 5, 27, '2022-04-23 17:54:48', 12, NULL, 0, NULL),
(1130, '68622', 'CREMA', 'CREMA REAFIRMAN PARA CUERPO', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-23 17:56:47', 12, NULL, 0, NULL),
(1132, '50466', 'CREMA', 'CREMA EXFOLIANTE CORPORAL SUAVE', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-23 18:05:43', 12, NULL, 0, NULL),
(1133, '31767', 'GEL QUITA GRASA', 'GEL CONTRA LA GRASA', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-23 18:08:35', 12, NULL, 0, NULL),
(1134, 'Y9302', 'ALICATE', 'ALICATE ACERO INOXSIDABLE', NULL, 'lib/Productos/img/blitz_SN.png', '90.00', '0.00', 1, 5, 27, '2022-04-23 18:09:57', 12, NULL, 0, NULL),
(1135, '86204', 'CEPILLO ', 'SET DE CEPILLO Y PEINE CAPILAR', NULL, 'lib/Productos/img/blitz_SN.png', '90.00', '0.00', 1, 5, 27, '2022-04-23 18:11:01', 12, NULL, 0, NULL),
(1136, '34188', 'CEPILLO DE BAÑO', 'CEPILLO PARA SANITARIO', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 27, '2022-04-23 18:12:41', 12, NULL, 0, NULL),
(1137, '15407', 'CEPILLO ', 'SET DE CEIPILLO Y PEINE CAPILAR', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 27, '2022-04-23 18:14:09', 12, NULL, 0, NULL),
(1138, '31708', 'GUANTES', 'GUANTES DE LACTEX PARA COSINA', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-23 18:16:32', 12, NULL, 0, NULL),
(1139, '59775', 'PERFUME DAMA', 'PERFUME PLUS DE AMOUR', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 2, 5, 3, '2022-04-23 18:17:58', 12, NULL, 0, NULL),
(1140, '322322', 'ESPIRALES', 'ESPIRALES DE 4 PIEZAS', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-23 18:20:48', 12, NULL, 0, NULL),
(1141, '71062', 'GEL DE CEJAS', 'GEL PARA PESTAÑAS Y CEJAS', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 3, 5, 71, '2022-04-23 18:32:32', 12, NULL, 0, NULL),
(1142, '8690604613021', 'LABIAL', 'LABIAL 09 FABULOS WINE', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 8, '2022-04-23 18:35:30', 12, NULL, 0, NULL),
(1143, 'AM13200109', 'PESQUERO', 'PESQUERO STAN M.132001 T.9', NULL, 'lib/Productos/img/blitz_SN.png', '295.00', '0.00', 1, 5, 23, '2022-04-25 14:24:41', 17, NULL, 0, NULL),
(1144, 'AM13200117', 'PESQUERO', 'PESQUERO SVDO M.132001 T.17', NULL, 'lib/Productos/img/blitz_SN.png', '305.00', '0.00', 1, 5, 23, '2022-04-25 14:26:13', 17, NULL, 0, NULL),
(1145, '41680', 'BALSAMO', 'BALSAMO SEMILLAS DE FRESA', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 4, 5, 28, '2022-04-25 17:02:12', 39, NULL, 0, NULL),
(1146, '715722', 'BALSAMO', 'BALSAMO ROSA ', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 28, '2022-04-25 17:04:56', 39, NULL, 0, NULL),
(1147, '725865', 'BALSAMO', 'BALSAMO ROJO', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 28, '2022-04-25 17:05:50', 39, NULL, 0, NULL),
(1148, '48827', 'ESPONJA', 'ESONJA MULTIUSOS PARA BAÑO', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 27, '2022-04-25 17:07:34', 39, NULL, 0, NULL),
(1149, '35923', 'JABON', 'JABON FAIRNESS', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 4, 5, 74, '2022-04-25 17:10:31', 39, NULL, 0, NULL),
(1150, '43909', 'JABON', 'JABON GLOW', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 4, 5, 74, '2022-04-25 17:13:04', 39, NULL, 0, NULL),
(1151, '32647', 'GEL EXFOLIANTE', 'GEL FACIAL EXFOLIANTE', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 5, 5, 71, '2022-04-25 17:16:15', 39, NULL, 0, NULL),
(1152, '32619', 'ACONDISIONADOR', 'ACONDISIONADOR PARA EL CABELLO', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 69, '2022-04-25 17:17:29', 39, NULL, 0, NULL),
(1153, '31586', 'DELINIADOR DE OJO', 'DELINIADOR LIQUIDO NEGRO', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 66, '2022-04-27 11:08:32', 39, NULL, 0, NULL),
(1154, '790VIOLETA', 'LABIAL', 'LABIAL VIOLETA', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 8, '2022-04-25 17:24:07', 6, NULL, 0, NULL),
(1155, '32480', 'CREMA', 'CREMA FACIAL DESPICMENTANTE DE NOCHE', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 2, 5, 28, '2022-04-25 17:25:21', 39, NULL, 0, NULL),
(1156, '32474', 'CREMA DE DIA', 'CREMA FACIAL MULTIBENEFICIOS DE DIA', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 4, 5, 28, '2022-04-25 17:27:38', 39, NULL, 0, NULL),
(1157, '34608', 'CREMA', 'MASCARRILLA FACIAL HIDRATANTE', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 28, '2022-04-25 17:32:35', 39, NULL, 0, NULL),
(1158, '31347', 'CREMA', 'CREMA HIDRATANTE PARA MANOS Y UÑAS', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 2, 5, 28, '2022-04-25 17:34:55', 39, NULL, 0, NULL),
(1159, '32477', 'SUERO', 'SUERO FACIAL MULTIBENEFICIOS', NULL, 'lib/Productos/img/blitz_SN.png', '490.00', '0.00', 5, 5, 28, '2022-04-25 17:39:37', 39, NULL, 0, NULL),
(1160, '33108', 'SUERO', 'SUERO FACIAL ACLARANTE ', NULL, 'lib/Productos/img/blitz_SN.png', '490.00', '0.00', 5, 5, 28, '2022-04-25 17:40:31', 39, NULL, 0, NULL),
(1161, '31804', 'MAQUILLAJE LIQUIDO', 'BASE DE MAQUILLAJE LIGHT IVORY', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 8, '2022-04-25 17:42:51', 39, NULL, 0, NULL),
(1162, '34858', 'AGUA MISELAR', 'AGUA MISELAR', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 8, '2022-04-25 17:44:04', 39, NULL, 0, NULL),
(1163, '30137', 'DESODORATE', 'DESODORANTE ANTITRASPIRANTE', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 65, '2022-04-25 17:46:22', 39, NULL, 0, NULL),
(1164, '34098', 'ACEITE HIDRATANTE', 'ACEITE MULTIBENEFICIOS HIDRATANTE', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 5, '2022-04-25 17:48:25', 39, NULL, 0, NULL),
(1165, '33034', 'DESODORANTE DE PIE', 'DESODORANTE ANTITRASPIRANTE DE PIES', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 65, '2022-04-25 17:58:30', 39, NULL, 0, NULL),
(1166, '25448', 'DESODORANTE DE PIE', 'DESODORAN NEUTRALISADOR DE OLOR DE PIES', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 65, '2022-04-25 18:00:13', 39, NULL, 0, NULL),
(1167, '34175', 'ACEITE HIDRATANTE', 'ACEITE CORPORAL PERFUMADO', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 5, '2022-04-25 18:02:38', 39, NULL, 0, NULL),
(1168, '39371', 'LAPIZ', 'CRAYOLA NEGRO DELINIADOR PARA HOJOS', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 63, '2022-04-25 18:05:56', 39, NULL, 0, NULL),
(1169, '30610', 'PEINE', 'PEINE PARA CABELLO', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 2, 5, 63, '2022-04-25 18:07:50', 39, NULL, 0, NULL),
(1170, '32081', 'RUBOR', 'RUBOR EN PERLA NATURAL RADIANSE', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 8, '2022-04-25 18:10:22', 39, NULL, 0, NULL),
(1171, '31808', 'MAQUILLAJE', 'POLVO CONPACTO CABADO MATE LIGHT', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 8, '2022-04-25 18:12:06', 39, NULL, 0, NULL),
(1172, 'CORCLARO', 'CORECTOR', 'CORECTOR  CORCLARO', NULL, 'lib/Productos/img/blitz_SN.png', '168.00', '0.00', 1, 5, 8, '2022-04-25 18:15:18', 39, NULL, 0, NULL),
(1173, '33115', 'MAQUILLAJE', 'MAQUILLAJE CONPACTOPOWDER', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 8, '2022-04-25 18:18:21', 39, NULL, 0, NULL),
(1174, '30613', 'MAQUILLAJE', 'MAQUILLAJE FACIAL CONPACTO ACABADO MATE', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 8, '2022-04-25 18:19:48', 39, NULL, 0, NULL),
(1175, '35164', 'LABIAL', 'LABIAL CHERRI', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 8, '2022-04-25 18:21:07', 39, NULL, 0, NULL),
(1176, '32031', 'DEFINADOR DE CEJAS', 'ESTUCHE DE CEJAS', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 1, 5, 8, '2022-04-25 18:23:19', 39, NULL, 0, NULL),
(1177, '43143', 'PROTECTOR', 'PROTECTOR SOLAR ', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 8, '2022-04-25 18:29:13', 39, NULL, 0, NULL),
(1178, '33300', 'PRE BACE', 'PREBACE DE MAQUILLAJE ', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 2, 5, 28, '2022-04-25 18:31:02', 39, NULL, 0, NULL),
(1179, '33988', 'CREMA', 'CREMA FACIAL EXFOLIANTE', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 1, 5, 28, '2022-04-25 18:32:24', 39, NULL, 0, NULL),
(1180, '35156', 'LABIAL', 'LABIAL  EFECTO EXPLOSIVO TONOS MAS INTENSOS', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 8, '2022-04-25 19:21:04', 39, NULL, 0, NULL),
(1181, '33226', 'CREMA PARA CONTORNO', 'CREMA PARA EL CONTORNO DE LOS HOJOS', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 1, 5, 28, '2022-04-25 19:22:37', 39, NULL, 0, NULL),
(1182, '22815', 'CREMA REAFIRMANTE', 'CREMA PARA EL CONTORNO DE LOS HOJOS REAFIRMANTE', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 28, '2022-04-25 19:24:16', 39, NULL, 0, NULL);
INSERT INTO `Productos` (`ID_Producto`, `Codigo`, `Nombre`, `Descripcion`, `Marca`, `Foto`, `PrecioVenta`, `PrecioCompra`, `Existencia`, `ID_Sucursal`, `ID_Categoria`, `Fecha_Ingreso`, `ID_Proveedor`, `Importado`, `visto`, `can`) VALUES
(1183, '32576', 'RIMEL', 'MASCARA PARA PESTAÑAS', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 7, '2022-04-25 19:25:28', 39, NULL, 0, NULL),
(1184, '37751', 'LAPIZ', 'LAPIZ DELINIADOR DE HOJOS CAFE', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 2, 5, 63, '2022-04-25 20:07:37', 39, NULL, 0, NULL),
(1185, '36554', 'LAPIZ PARA OJO', 'LAPIZ DELINIADOR DE OJOS  CAFE', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 2, 5, 63, '2022-04-26 10:43:57', 39, NULL, 0, NULL),
(1186, '32664', 'DESMAQUILLANTE', 'GEL DESMAQUILALNTE PARA HOJOS', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 62, '2022-04-25 19:32:25', 39, NULL, 0, NULL),
(1187, '29599', 'PINCEL', 'PINCEL PLANO Y LIGERO', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 3, 5, 8, '2022-04-25 19:35:38', 39, NULL, 0, NULL),
(1188, '29458', 'CEPILLO DE BAÑO', 'CEPILLO DUAL PARA ROSTRO', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 75, '2022-04-25 19:38:15', 39, NULL, 0, NULL),
(1189, '29594', 'BROCHA MAQUILLAJE LIQUIDO', 'BROCHA ANGULAR MAQUILLAJE LIQUDO', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 1, 5, 8, '2022-04-25 19:40:07', 39, NULL, 0, NULL),
(1190, '9588', 'LIMA PARA PIES', 'LIMA PARA PIES', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 4, '2022-04-25 19:43:00', 39, NULL, 0, NULL),
(1191, '28433', 'CORTA CUTICULAS', 'CORTA CUTICULAS', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 76, '2022-04-25 19:48:19', 39, NULL, 0, NULL),
(1192, '335189', 'LABIAL INTENCITY', 'LABIAL INTENCITY', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 8, '2022-04-25 19:52:24', 39, NULL, 0, NULL),
(1193, '29597', 'PEINE PARA CEJAS', 'PEINE PARA CEJAS', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 1, 5, 75, '2022-04-25 19:54:57', 39, NULL, 0, NULL),
(1194, '21144', 'BROCHA PARA PARPADO', 'BROCHA PARA PARPADO', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 8, '2022-04-25 19:57:11', 39, NULL, 0, NULL),
(1195, 'SPF30', 'MAQUILLAJE LIQUIDO', 'MAQUILLAJE LIQUIDONATURAL NUDE', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 1, 5, 8, '2022-04-25 19:59:37', 39, NULL, 0, NULL),
(1196, '36553', 'LAPIZ', 'LAPIZ DELINADOR DE HOJO AZUL', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 63, '2022-04-25 20:00:42', 39, NULL, 0, NULL),
(1197, '33707', 'CORECTOR FACIAL', 'CORECTOR FACIAL', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 8, '2022-04-25 20:02:44', 39, NULL, 0, NULL),
(1198, '32291', 'LAPIZ', 'LAPIZ NEGRO', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 63, '2022-04-25 20:04:02', 39, NULL, 0, NULL),
(1199, '33670', 'DELINIADOR DE OJO', 'LAPIZ DELINIADOR NEGRO', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 63, '2022-04-27 11:09:01', 39, NULL, 0, NULL),
(1200, 'EX1118', 'RIMEL CAFE', 'RIMEL CAFE GIORDANI', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 7, '2022-04-25 20:14:49', 38, NULL, 0, NULL),
(1201, '30772', 'DELINIADOR DE OJO', 'DELINIADOR NEGRO GIORDANI', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 63, '2022-04-27 11:09:48', 39, NULL, 0, NULL),
(1202, '33667', 'SOMBRA LIQUIDO', 'SOMBRA LIQUIDO', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 8, '2022-04-25 20:17:58', 39, NULL, 0, NULL),
(1203, 'HAPPYDISIAC', 'PERFUME DE CABALLERO', 'PERFUME CABALLERO HAPPYDISIAC', NULL, 'lib/Productos/img/blitz_SN.png', '500.00', '0.00', 1, 5, 3, '2022-04-25 20:20:53', 39, NULL, 0, NULL),
(1204, '25261', 'CREMA LIMPIEZA FACIAL', 'CREMA LIMPIEZA  FACIAL', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 28, '2022-04-25 20:22:45', 39, NULL, 0, NULL),
(1205, '28618', 'LIMPIEZA PARA CALZADO', 'LIMPIEZA PARA CALZADO', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-25 20:25:10', 39, NULL, 0, NULL),
(1206, 'EX1021', 'ACEITE HIDRATANTE', 'SWEDISH SPA', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 5, '2022-04-25 20:27:42', 39, NULL, 0, NULL),
(1207, '33386', 'LABIAL', 'LABIAL GORDANI NUDE', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 8, '2022-04-26 10:45:34', 39, NULL, 0, NULL),
(1208, '24144', 'BROCHA DE SOMBRA', 'BROCHA  PARA SOMBRA', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 8, '2022-04-26 10:47:12', 39, NULL, 0, NULL),
(1209, '24148', 'BROCHA', 'BROCHA PARA MAQUILLAJE  LIQUIDO', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 2, 5, 8, '2022-04-26 10:51:37', 39, NULL, 0, NULL),
(1210, 'MONEDERONGO', 'MONEDERO', 'MONEDERO', NULL, 'lib/Productos/img/blitz_SN.png', '35.00', '0.00', 1, 5, 27, '2022-04-26 10:53:21', 37, NULL, 0, NULL),
(1211, 'CARTERAZERMAT', 'CARTERA ', 'CARTERA ZERMAT', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-26 10:55:41', 13, NULL, 0, NULL),
(1212, '001', 'ESPONJA MORADO', 'ESPONJA MORADA PARA MAQUILLAJE', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 27, '2022-04-26 10:58:30', 39, NULL, 0, NULL),
(1213, '36547', 'LAPIZ', 'LAPIZ DELINIADOR DE OJOS NEGRO', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 2, 5, 63, '2022-04-26 11:01:03', 39, NULL, 0, NULL),
(1214, '3660005170923', 'CREMA DE MANCHAS', 'CREMA DE MANOS ANTI MANCHAS', NULL, 'lib/Productos/img/blitz_SN.png', '290.00', '0.00', 3, 5, 28, '2022-04-26 11:10:37', 40, NULL, 0, NULL),
(1215, '3660005627991', 'DESMAQUILLANTE', 'DESMAQUILLANTE EXPRES', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 2, 5, 62, '2022-04-26 11:12:29', 40, NULL, 0, NULL),
(1216, '3660005567921', 'BODY', 'BODY BRUME FRANBUESA', NULL, 'lib/Productos/img/blitz_SN.png', '179.00', '0.00', 1, 5, 30, '2022-04-26 11:14:09', 40, NULL, 0, NULL),
(1217, '3660005797922', 'ACEITE HIDRATANTE', 'ACEITE TRADISIONAL NUTRITIVO MONOI DE TAHITI', NULL, 'lib/Productos/img/blitz_SN.png', '165.00', '0.00', 2, 5, 5, '2022-04-26 11:16:13', 40, NULL, 0, NULL),
(1218, '7012345632337', 'JABON', 'JABON ARTESANAL CON ACEITE VEJETALES TEPEZCOHUITE', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 74, '2022-04-26 11:18:04', 19, NULL, 0, NULL),
(1219, '7012345632344', 'JABON', 'JABON ARTESANAL RUDA Y JENGIBRE', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 74, '2022-04-26 11:20:12', 19, NULL, 0, NULL),
(1220, '887658678474', 'EXTENSIONES', 'PAQUETE DE EXTENSION MULT M.89187', NULL, 'lib/Productos/img/blitz_SN.png', '119.00', '0.00', 1, 5, 34, '2022-04-26 11:22:29', 6, NULL, 0, NULL),
(1221, '7501853804638', 'COLAGENO', 'COLAGENO HIDROLIZADO SUPLEMENTO  ALIMENTICIO', NULL, 'lib/Productos/img/blitz_SN.png', '759.00', '0.00', 1, 5, 19, '2022-04-26 11:25:51', 14, NULL, 0, NULL),
(1222, '7502255790239', 'TE', 'VENTRA TEA', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 6, 5, 19, '2022-04-26 11:27:15', 14, NULL, 0, NULL),
(1223, '12705202', 'SUERO FACIAL', 'SERUM FACIAL RENAISS', NULL, 'lib/Productos/img/blitz_SN.png', '661.00', '0.00', 1, 5, 70, '2022-04-26 11:29:10', 14, NULL, 0, NULL),
(1224, '7502255790314', 'FORBLEX', 'POLVO  FORBLEX ', NULL, 'lib/Productos/img/blitz_SN.png', '1097.00', '0.00', 1, 5, 19, '2022-04-26 11:31:01', 14, NULL, 0, NULL),
(1225, '7502255790130', 'EUCABEE', 'JARABE EUCABE', NULL, 'lib/Productos/img/blitz_SN.png', '399.00', '0.00', 1, 5, 19, '2022-04-26 11:32:53', 14, NULL, 0, NULL),
(1226, '7502255790246', 'CLORI', 'CLOORI MENTA HIERBABUENA', NULL, 'lib/Productos/img/blitz_SN.png', '403.00', '0.00', 1, 5, 19, '2022-04-26 11:35:09', 14, NULL, 0, NULL),
(1227, '7502255790574', 'REVIV', 'RESVIV  ', NULL, 'lib/Productos/img/blitz_SN.png', '799.00', '0.00', 1, 5, 19, '2022-04-26 11:38:27', 14, NULL, 0, NULL),
(1228, '7501853805154', 'CAPSULAS', 'KTO CAPS', NULL, 'lib/Productos/img/blitz_SN.png', '561.00', '0.00', 1, 5, 19, '2022-04-26 11:40:41', 14, NULL, 0, NULL),
(1229, '7502255790093', 'CAPSULAS', ' CAPSULAS SERANTRA', NULL, 'lib/Productos/img/blitz_SN.png', '549.00', '0.00', 2, 5, 19, '2022-04-26 11:43:35', 14, NULL, 0, NULL),
(1230, '7502255790116', 'CAPSULAS', 'CAPSULA BLEX', NULL, 'lib/Productos/img/blitz_SN.png', '433.00', '0.00', 1, 5, 19, '2022-04-26 11:49:39', 14, NULL, 0, NULL),
(1231, '7501853804799', 'CAPSULAS', 'CAPSULA DIALEGRI', NULL, 'lib/Productos/img/blitz_SN.png', '495.00', '0.00', 1, 5, 19, '2022-04-26 11:53:17', 14, NULL, 0, NULL),
(1232, '7908132265355', 'SHAMPOO', 'SHAMPOO NUTRITIVO', NULL, 'lib/Productos/img/blitz_SN.png', '126.00', '0.00', 2, 5, 68, '2022-04-26 12:06:13', 20, NULL, 0, NULL),
(1233, '7899846037126', 'COLONIA', 'COLONIA MARACUJA', NULL, 'lib/Productos/img/blitz_SN.png', '408.00', '0.00', 2, 5, 3, '2022-04-26 12:08:28', 10, NULL, 0, NULL),
(1234, '7908016692499', 'COLONIA', 'COLONIA MADEIRA FRESCOR', NULL, 'lib/Productos/img/blitz_SN.png', '408.00', '0.00', 2, 5, 3, '2022-04-26 12:09:32', 10, NULL, 0, NULL),
(1235, '7899846037140', 'COLONIA', 'COLONIA PITANGA  FRESCOR', NULL, 'lib/Productos/img/blitz_SN.png', '408.00', '0.00', 1, 5, 3, '2022-04-26 12:21:17', 10, NULL, 0, NULL),
(1236, '7908132218672', 'PERFUME', 'COLONIA HUMOR DE MINHA VIDA', NULL, 'lib/Productos/img/blitz_SN.png', '489.00', '0.00', 2, 5, 26, '2022-04-26 12:25:47', 10, NULL, 0, NULL),
(1237, '7908016600388', 'COLONIA', ' COLONIA AGUAS DIAS DEL VERAO', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 3, '2022-04-26 12:28:49', 10, NULL, 0, NULL),
(1238, '7908132223744', 'COLONIA', 'COLONIA AGUAS ENCANTO', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 3, '2022-04-26 12:30:20', 10, NULL, 0, NULL),
(1239, '7899563225080', 'COLONIA', 'COLONIA AGUAS POMAR DE CITRICOS', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 3, '2022-04-26 12:38:47', 10, NULL, 0, NULL),
(1240, '7899563225004', 'COLONIA', 'COLONIA AGUAS JABUTICABA', NULL, 'lib/Productos/img/blitz_SN.png', '285.00', '0.00', 1, 5, 3, '2022-04-26 13:04:13', 10, NULL, 0, NULL),
(1241, 'E04', 'MAQUILLAJE', 'POLVO Y BACE DE MAQUILLAJE ', NULL, 'lib/Productos/img/blitz_SN.png', '396.00', '0.00', 1, 5, 8, '2022-04-26 13:12:29', 10, NULL, 0, NULL),
(1242, '7899563271865', 'ESTUCHE DE MAQUILLAJE', 'ESTUCHE DE MAQUILLAJE', NULL, 'lib/Productos/img/blitz_SN.png', '396.00', '0.00', 1, 5, 8, '2022-04-26 13:14:29', 10, NULL, 0, NULL),
(1243, 'LENTES', 'LENTES DE SOL', 'LENTES DE SOL', NULL, 'lib/Productos/img/blitz_SN.png', '130.00', '0.00', 2, 5, 27, '2022-04-26 13:16:00', 37, NULL, 0, NULL),
(1244, '09741', 'PERFUME', 'PEFUME CABALLERO TRUEMAN', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 3, '2022-04-26 13:20:52', 12, NULL, 0, NULL),
(1245, '9517508', 'LABIAL', 'LABIAL LARGA DURACION ATACAMA', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 8, '2022-04-26 13:27:13', 21, NULL, 0, NULL),
(1246, '9517507', 'LABIAL', 'LABIAL LARGA DURACION SAHARA', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 8, '2022-04-26 13:28:35', 21, NULL, 0, NULL),
(1247, '9501082', 'GEL', 'CREMA GEL OMIPLUS', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 1, 5, 28, '2022-04-26 13:30:17', 21, NULL, 0, NULL),
(1248, '9514062', 'SOMBRA', 'SOMBRA PARA OJOS COLOR I LARGA DURACION', NULL, 'lib/Productos/img/blitz_SN.png', '255.00', '0.00', 1, 5, 8, '2022-04-26 13:31:45', 21, NULL, 0, NULL),
(1249, '9506012', 'DELINIADOR', 'DELINIADOR PARA OJOS NEGRO', NULL, 'lib/Productos/img/blitz_SN.png', '165.00', '0.00', 1, 5, 63, '2022-04-26 13:33:38', 21, NULL, 0, NULL),
(1250, '6A12', 'SOMBRA', 'SOBRA  CINNABAR', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 5, 5, 8, '2022-04-26 13:36:10', 22, NULL, 0, NULL),
(1251, '6A20', 'SOMBRA', 'SOMBRA CHARBON NEGRO', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 2, 5, 8, '2022-04-26 13:37:50', 22, NULL, 0, NULL),
(1252, '5V19', 'SOMBRA', 'SOMBRA COTE', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-26 13:39:14', 22, NULL, 0, NULL),
(1253, '5V27', 'SOMBRA', 'SOMBRA MOIRE LILAS', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-26 13:40:29', 22, NULL, 0, NULL),
(1254, '5X15', 'SOMBRA', 'SOMBRA  ROSE MIGNON', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-26 13:42:28', 22, NULL, 0, NULL),
(1255, '4B24', 'SOMBRA', 'SOMBRA CRISTALLIN', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-26 13:43:43', 22, NULL, 0, NULL),
(1256, '4P23', 'SOMBRA', 'SOMBRA ROSE BALLERINE', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-26 13:46:50', 22, NULL, 0, NULL),
(1257, '8C06', 'SOMBRA', 'SOMBRA ESPRESSO', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-26 13:48:09', 22, NULL, 0, NULL),
(1258, '5V23', 'SOMBRA', 'SOBRA JADE', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-26 13:49:01', 22, NULL, 0, NULL),
(1259, '120416', 'RUBOR', 'RUBOR PAPAYE', NULL, 'lib/Productos/img/blitz_SN.png', '110.00', '0.00', 1, 5, 8, '2022-04-26 13:50:42', 22, NULL, 0, NULL),
(1260, '37B47MA3', 'PANTALON', 'PANTALON NIÑO MEZCLILLA T.10-16', NULL, 'lib/Productos/img/blitz_SN.png', '270.00', '0.00', 8, 5, 47, '2022-04-26 18:03:56', 23, NULL, 0, NULL),
(1261, 'PB10', 'PANTALON', 'PANTALON DE NIÑO MEZCLILLA T.10', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 2, 5, 47, '2022-04-26 18:07:40', 23, NULL, 0, NULL),
(1262, 'PB06', 'PANTALON', 'PANTALON NIÑO MESCLILLA T.6', NULL, 'lib/Productos/img/blitz_SN.png', '275.00', '0.00', 1, 5, 47, '2022-04-26 18:09:22', 23, NULL, 0, NULL),
(1263, 'MARGO8', 'PANTALON', 'PANTALON NIÑO MEZCLILLA T.8', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 47, '2022-04-26 18:11:14', 23, NULL, 0, NULL),
(1264, 'MARGO12', 'PANTALON', 'PANTALON NIÑO MEZCLILLA T.12', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 47, '2022-04-26 18:12:48', 23, NULL, 0, NULL),
(1265, 'REBELNEGRO', 'PANTALON', 'PANTALON MEZCLILLA NIÑO T.12-16', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 2, 5, 47, '2022-04-26 18:14:35', 23, NULL, 0, NULL),
(1266, 'REBELK6', 'PANTALON', 'PANTALON NIÑO MEZCLILLA', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 47, '2022-04-26 18:17:19', 23, NULL, 0, NULL),
(1267, '029726', 'DESMAQUILLANTE', 'DESMAQUILLANTE', NULL, 'lib/Productos/img/blitz_SN.png', '269.00', '0.00', 4, 5, 62, '2022-04-26 19:12:39', 42, NULL, 0, NULL),
(1268, '143194', 'LABIAL', 'SET LABIAL PARA LABIOS CHERRI/CERISE', NULL, 'lib/Productos/img/blitz_SN.png', '549.00', '0.00', 1, 5, 8, '2022-04-26 19:18:26', 22, NULL, 0, NULL),
(1269, '143196', 'LABIAL', 'SET LABIAL PLUM/PRUNE', NULL, 'lib/Productos/img/blitz_SN.png', '549.00', '0.00', 1, 5, 8, '2022-04-26 19:20:39', 22, NULL, 0, NULL),
(1270, '051535', 'BASE PARA MAQUILLAJE', 'BASE PARA MAQUILLAJE  SPF15', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 28, '2022-04-26 19:24:54', 22, NULL, 0, NULL),
(1271, '120566', 'CREMA DE DIA', 'CREMA FACIAL DE DIA EFECTO REPARADOR FPS30', NULL, 'lib/Productos/img/blitz_SN.png', '572.00', '0.00', 1, 5, 28, '2022-04-26 19:29:16', 22, NULL, 0, NULL),
(1273, 'BOTANICAL', 'GEL LIMPIADORA', 'GEL LIMPIADOR BOTANICAL', NULL, 'lib/Productos/img/blitz_SN.png', '213.00', '0.00', 1, 5, 71, '2022-04-26 19:43:48', 22, NULL, 0, NULL),
(1274, '088998', 'LIMPIADORA FACIAL', 'LIMPIADORA FACIAL TIMEWISE', NULL, 'lib/Productos/img/blitz_SN.png', '337.00', '0.00', 1, 5, 71, '2022-04-26 19:46:55', 22, NULL, 0, NULL),
(1275, '02414430', 'MAQUILLAJE LIQUIDO', 'MAQUILLAJE LIQUIDO VERY LIGHT', NULL, 'lib/Productos/img/blitz_SN.png', '278.00', '0.00', 1, 5, 8, '2022-04-26 19:51:03', 22, NULL, 0, NULL),
(1276, '131348', 'ESTUCHE COSMETICO', 'ESTUCHE COSMETICO', NULL, 'lib/Productos/img/blitz_SN.png', '150.00', '0.00', 1, 5, 8, '2022-04-26 19:52:37', 22, NULL, 0, NULL),
(1277, '050795', 'POLVO', 'POLVO DIMENSION', NULL, 'lib/Productos/img/blitz_SN.png', '510.00', '0.00', 1, 5, 8, '2022-04-26 19:57:31', 42, NULL, 0, NULL),
(1279, '141481', 'LABIAL', 'LABIAL ENGEL SEMI MATE CORAL SEDUISANT', NULL, 'lib/Productos/img/blitz_SN.png', '194.00', '0.00', 1, 5, 8, '2022-04-26 20:08:43', 22, NULL, 0, NULL),
(1280, '044465', 'RIMEL', 'MASCARA PARA PESTAÑA APRUEVA DE AGUA', NULL, 'lib/Productos/img/blitz_SN.png', '233.00', '0.00', 1, 5, 8, '2022-04-26 20:10:35', 22, NULL, 0, NULL),
(1281, '125032', 'LVOLUMINIZADOR', 'VOLUMINIZADOR PARA CEJAS BLONDE', NULL, 'lib/Productos/img/blitz_SN.png', '190.00', '0.00', 1, 5, 63, '2022-04-26 20:14:30', 22, NULL, 0, NULL),
(1282, '041758', 'PAPELILLOS', 'PAPELILLOS ABSORVENTES', NULL, 'lib/Productos/img/blitz_SN.png', '79.00', '0.00', 3, 5, 8, '2022-04-27 11:13:30', 22, NULL, 0, NULL),
(1283, '095856', 'DELINIADOR DE OJO', 'DELINEADOR LIQUIDO EN PLUMON', NULL, 'lib/Productos/img/blitz_SN.png', '259.00', '0.00', 1, 5, 66, '2022-04-27 11:16:04', 42, NULL, 0, NULL),
(1284, 'TAJADOR', 'TAJADOR', 'TAJADOR', NULL, 'lib/Productos/img/blitz_SN.png', '19.00', '0.00', 1, 5, 77, '2022-04-27 11:17:22', 22, NULL, 0, NULL),
(1285, 'Y9280', 'ANILLO PARA ESMALTE', 'ANILLO PARA ESMALTE FLOR MAR', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 27, '2022-04-27 11:25:49', 12, NULL, 0, NULL),
(1286, '077877', 'MAQUILLAJE', 'MAQUILLAJE EN CREMA ACABADO EN POLVO', NULL, 'lib/Productos/img/blitz_SN.png', '203.00', '0.00', 1, 5, 8, '2022-04-27 11:33:51', 22, NULL, 0, NULL),
(1287, '5B12', 'RUBOR', 'RUBOR MINERAL CONPACTO CORAL', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-27 11:34:44', 22, NULL, 0, NULL),
(1288, '120411', 'RUBOR', 'RUBOR CONPACTO PINK ROSE', NULL, 'lib/Productos/img/blitz_SN.png', '110.00', '0.00', 1, 5, 8, '2022-04-27 11:37:08', 22, NULL, 0, NULL),
(1289, '9H14', 'RUBOR', 'RUBOR CONPACTO BLUSH', NULL, 'lib/Productos/img/blitz_SN.png', '110.00', '0.00', 1, 5, 8, '2022-04-27 11:38:11', 22, NULL, 0, NULL),
(1290, '6C22', 'RUBOR', 'RUBOR MINERAL CONPACTO BRONZE', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-27 11:42:48', 22, NULL, 0, NULL),
(1291, '5K02', 'SOMBRA', 'SOMBRA MINERAL CONPACTO JADE', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-27 11:45:58', 22, NULL, 0, NULL),
(1292, '4F08', 'SOMBRA', 'SOMBRA MINERAL CONPACTO GRIS', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-27 11:48:17', 22, NULL, 0, NULL),
(1293, '8A18', 'SOMBRA', 'SOMBRA CONPACTO BISCOTTI', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-27 11:49:22', 22, NULL, 0, NULL),
(1294, '9A03', 'SOMBRA', 'SOMBRA CONPACTO ROSE', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 8, '2022-04-27 11:50:32', 22, NULL, 0, NULL),
(1295, '21013', 'GIRA LLAVE', 'GIRA LLAVE PRO', NULL, 'lib/Productos/img/blitz_SN.png', '109.00', '0.00', 0, 5, 27, '2022-04-27 11:51:35', 11, NULL, 0, NULL),
(1296, '22712', 'FUNDA', 'FOSFO FUNDA', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 0, 5, 27, '2022-04-27 11:52:50', 11, NULL, 0, NULL),
(1297, '21536', 'ABRELATA', 'FACIL  ABRELATA', NULL, 'lib/Productos/img/blitz_SN.png', '129.00', '0.00', 0, 5, 27, '2022-04-27 11:54:25', 11, NULL, 0, NULL),
(1298, '16104', 'ABSORBE', 'ABSORBE  HUMEDAD', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 100, 5, 27, '2022-04-27 11:56:58', 11, NULL, 0, NULL),
(1299, '21018', 'CONTENEDOR DE AGUA', 'AGUA FRESH', NULL, 'lib/Productos/img/blitz_SN.png', '219.00', '0.00', 1, 5, 27, '2022-04-27 11:59:11', 11, NULL, 0, NULL),
(1300, '40775', 'SET MANZANA', 'SET MANZANA ', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 3, 5, 74, '2022-04-27 12:04:57', 39, NULL, 0, NULL),
(1301, '40844', 'SET FRESA', 'SET FRESA', NULL, 'lib/Productos/img/blitz_SN.png', '200.00', '0.00', 2, 5, 74, '2022-04-27 12:06:33', 39, NULL, 0, NULL),
(1302, '693235424927', 'PERFUME DAMA', 'PERFUME PARA DAMA FEELINGS', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 3, 5, 3, '2022-04-27 12:13:37', 13, NULL, 0, NULL),
(1303, '693235433066', 'PERFUME DAMA', 'PERFUME PARA DAMA SENZUAL ', NULL, 'lib/Productos/img/blitz_SN.png', '410.00', '0.00', 1, 5, 3, '2022-04-27 12:46:44', 13, NULL, 0, NULL),
(1304, '693235860107', 'PERFUME', 'PERFUME UNISEX KIWI', NULL, 'lib/Productos/img/blitz_SN.png', '450.00', '0.00', 1, 5, 3, '2022-04-27 12:48:35', 13, NULL, 0, NULL),
(1305, '693235423159', 'PERFUME DAMA', 'FRAGANCIA MINNIE', NULL, 'lib/Productos/img/blitz_SN.png', '260.00', '0.00', 1, 5, 3, '2022-04-27 12:51:06', 13, NULL, 0, NULL),
(1306, '693235351360', 'DELINIADOR', 'DELINIADOR PARA OJOS LARGA DURACION NEGRO', NULL, 'lib/Productos/img/blitz_SN.png', '105.00', '0.00', 5, 5, 66, '2022-04-27 12:52:50', 13, NULL, 0, NULL),
(1307, '693235420165', 'PERFUME', 'PERFUME PARA BEBE MICHELLE', NULL, 'lib/Productos/img/blitz_SN.png', '220.00', '0.00', 3, 5, 3, '2022-04-27 13:01:59', 13, NULL, 0, NULL),
(1308, '7908016636493', 'LAPIZ DE LABIO', 'LAPIZ LABIO COLOR VINO', NULL, 'lib/Productos/img/blitz_SN.png', '106.00', '0.00', 1, 5, 63, '2022-04-27 13:03:18', 10, NULL, 0, NULL),
(1309, '693235425412', 'PERFUME DAMA', 'PERFUME PARA DAMA WN', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 3, '2022-04-27 13:04:41', 13, NULL, 0, NULL),
(1310, '693235940311', 'SPRAY', 'SPRAY FIJADOR PARA CABELLO KIWI', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 2, 5, 71, '2022-04-27 14:06:55', 13, NULL, 0, NULL),
(1311, '693235850023', 'DESODORATE', 'DESODORANTE ANTI TRANSPIRANTE KIWI', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 2, 5, 65, '2022-04-27 14:15:40', 13, NULL, 0, NULL),
(1312, '693235452784', 'DESODORATE', 'DESODORANTE ANTITRASPIRANTE GISELLE', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 2, 5, 65, '2022-04-27 14:17:10', 13, NULL, 0, NULL),
(1313, '93235452722', 'DESODORATE', 'DESODORANTE ANTITRASPIRANTE TRENDY', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 3, 5, 65, '2022-04-27 14:18:12', 13, NULL, 0, NULL),
(1314, '693235430423', 'PERFUME DAMA', 'PERFUME PARA DAMA SHARON', NULL, 'lib/Productos/img/blitz_SN.png', '410.00', '0.00', 2, 5, 3, '2022-04-27 14:22:46', 13, NULL, 0, NULL),
(1315, 'BLOSSOM', 'PERFUME DAMA', 'PERFUME PARA DAMA BLOSSOM', NULL, 'lib/Productos/img/blitz_SN.png', '410.00', '0.00', 1, 5, 3, '2022-04-27 14:25:39', 13, NULL, 0, NULL),
(1316, '693235432281', 'PERFUME DAMA', 'PERFUME DAMA JOY', NULL, 'lib/Productos/img/blitz_SN.png', '410.00', '0.00', 1, 5, 3, '2022-04-27 14:27:30', 13, NULL, 0, NULL),
(1317, '693235953274', 'BODY', 'BODY VAINILLA', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 3, 5, 30, '2022-04-27 14:41:46', 13, NULL, 0, NULL),
(1318, '693235372808', 'JABON', 'JABON LIQUIDO PARA MANOS', NULL, 'lib/Productos/img/blitz_SN.png', '115.00', '0.00', 3, 5, 74, '2022-04-27 14:43:07', 13, NULL, 0, NULL),
(1319, '693235920610', 'TALCO', 'TALCO PERFUMADO SIBLIME', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 1, 5, 3, '2022-04-27 14:48:15', 13, NULL, 0, NULL),
(1320, '693235411484', 'PERFUME DAMA', 'PERFUME DE DAMA FEELINGS', NULL, 'lib/Productos/img/blitz_SN.png', '350.00', '0.00', 1, 5, 3, '2022-04-27 16:54:16', 13, NULL, 0, NULL),
(1321, '693233981323', 'DELINIADOR', 'DELINIADOR TINTERO NEGRO  REFLEX', NULL, 'lib/Productos/img/blitz_SN.png', '190.00', '0.00', 1, 5, 66, '2022-04-27 16:59:49', 13, NULL, 0, NULL),
(1322, '38N', 'SOMBRA', 'SOMBRA 38N', NULL, 'lib/Productos/img/blitz_SN.png', '75.00', '0.00', 1, 5, 8, '2022-04-27 17:01:05', 13, NULL, 0, NULL),
(1323, '693235980416', 'POLVO TRASLUSIDO', 'POLVO TRASLUSIDO SOLEIL', NULL, 'lib/Productos/img/blitz_SN.png', '120.00', '0.00', 1, 5, 8, '2022-04-27 17:02:59', 13, NULL, 0, NULL),
(1324, '693235982113', 'RUBOR', 'RUBOR EN PERLA LOTUS PINK', NULL, 'lib/Productos/img/blitz_SN.png', '270.00', '0.00', 1, 5, 8, '2022-04-27 17:04:40', 13, NULL, 0, NULL),
(1325, 'VERDE5DN', 'ESMALTE', 'ESMALTE VERDE', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 8, '2022-04-27 17:06:09', 13, NULL, 0, NULL),
(1326, '693235372785', 'GEL', 'GEL LIMPIADOR DE MANOS', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 53, '2022-04-27 17:08:53', 13, NULL, 0, NULL),
(1327, '693235373041', 'SANITIZANTE', 'SANITISANTE MULTI USOS', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-27 17:10:35', 13, NULL, 0, NULL),
(1328, '693235941257', 'GEL', 'GEL LIMPIADOR DE MANOS 195M.L', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 1, 5, 71, '2022-04-27 17:11:46', 13, NULL, 0, NULL),
(1329, '693235426334', 'PERFUME', 'PERFUME NIÑA CENISIENTA', NULL, 'lib/Productos/img/blitz_SN.png', '370.00', '0.00', 1, 5, 3, '2022-04-27 17:16:28', 13, NULL, 0, NULL),
(1330, '693235904269', 'BODY', 'BODY KIWI', NULL, 'lib/Productos/img/blitz_SN.png', '170.00', '0.00', 1, 5, 30, '2022-04-27 17:17:27', 13, NULL, 0, NULL),
(1331, '80140', 'FIBRA INOXIDABLE', 'FIBRA INOXSIDABLE', NULL, 'lib/Productos/img/blitz_SN.png', '60.00', '0.00', 4, 5, 27, '2022-04-27 17:34:46', 11, NULL, 0, NULL),
(1332, '21766', 'SORPORTE', 'SOPORTE ULTRA SLIM', NULL, 'lib/Productos/img/blitz_SN.png', '65.00', '0.00', 2, 5, 27, '2022-04-27 17:35:55', 11, NULL, 0, NULL),
(1333, '18813', 'DECORADOR', 'DECO SENEFA', NULL, 'lib/Productos/img/blitz_SN.png', '55.00', '0.00', 4, 5, 27, '2022-04-27 17:36:51', 11, NULL, 0, NULL),
(1334, '18026', 'FUNDA', 'FUNDA CUBIERTO', NULL, 'lib/Productos/img/blitz_SN.png', '40.00', '0.00', 1, 5, 27, '2022-04-27 17:38:37', 11, NULL, 0, NULL),
(1335, '21743', 'CINTA', 'CINTA REFLEX', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-27 17:39:51', 11, NULL, 0, NULL),
(1336, '21701', 'SEPARAUDIFONOS', 'SEPARAUDIFONOS', NULL, 'lib/Productos/img/blitz_SN.png', '25.00', '0.00', 2, 5, 27, '2022-04-27 17:52:42', 11, NULL, 0, NULL),
(1337, '20761', 'AUTO LUZ', 'AUTO LUZ', NULL, 'lib/Productos/img/blitz_SN.png', '109.00', '0.00', 2, 5, 27, '2022-04-27 17:53:24', 11, NULL, 0, NULL),
(1338, '20119', 'LIMPIADOR', 'SET LIMPIA REGADERA', NULL, 'lib/Productos/img/blitz_SN.png', '25.00', '0.00', 3, 5, 27, '2022-04-27 17:54:19', 11, NULL, 0, NULL),
(1339, '19412', 'PRACTI SOMBRIA', 'PRACTI SOMBRIA', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-27 17:55:22', 11, NULL, 0, NULL),
(1340, '21521', 'MOLDE', 'DIVERTI EGGIES', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 2, 5, 27, '2022-04-27 17:56:37', 11, NULL, 0, NULL),
(1341, '20763', 'FOTO CLIP', 'FOTO CLIP', NULL, 'lib/Productos/img/blitz_SN.png', '129.00', '0.00', 1, 5, 27, '2022-04-27 17:57:34', 11, NULL, 0, NULL),
(1342, '20777', 'DIFUSOR', 'DIFUSOR AROMATIZANTE', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 27, '2022-04-27 17:58:56', 11, NULL, 0, NULL),
(1343, '21413', 'PORTA CEPILLO', 'CAPSULA PORTA CEPILLO', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 27, '2022-04-27 18:00:19', 11, NULL, 0, NULL),
(1344, '17021', 'PRACTI LUNCH', 'PRACTI  LUNCH\r\n', NULL, 'lib/Productos/img/blitz_SN.png', '180.00', '0.00', 1, 5, 27, '2022-04-27 18:02:06', 11, NULL, 0, NULL),
(1345, '20556', 'PORTA MANTEQUILLA', 'PORTA MANTEQUILLA', NULL, 'lib/Productos/img/blitz_SN.png', '70.00', '0.00', 1, 5, 27, '2022-04-27 18:03:03', 11, NULL, 0, NULL),
(1346, '20527', 'ESPATULA', 'ESPATULA RINDE MAX', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 27, '2022-04-27 18:03:52', 11, NULL, 0, NULL),
(1347, '21010', 'CUCHARA', 'CUCHARA POPOTE', NULL, 'lib/Productos/img/blitz_SN.png', '35.00', '0.00', 1, 5, 27, '2022-04-27 18:04:38', 11, NULL, 0, NULL),
(1348, '21011', 'CUCHARA', 'CUCHARA POPOTE', NULL, 'lib/Productos/img/blitz_SN.png', '35.00', '0.00', 5, 5, 27, '2022-04-27 18:05:56', 11, NULL, 0, NULL),
(1349, '21503', 'CENTRIFUGA', 'PRACTI  CENTRIFIGA', NULL, 'lib/Productos/img/blitz_SN.png', '159.00', '0.00', 1, 5, 27, '2022-04-27 18:07:48', 11, NULL, 0, NULL),
(1350, '12733', 'MOSQUITERO', 'MOSQUITERO MAGNETICO', NULL, 'lib/Productos/img/blitz_SN.png', '239.00', '0.00', 1, 5, 27, '2022-04-27 18:09:22', 11, NULL, 0, NULL),
(1351, '21728', 'SUJETADOR', 'SUJETA CUBREBOCA KIDS', NULL, 'lib/Productos/img/blitz_SN.png', '30.00', '0.00', 2, 5, 27, '2022-04-27 18:11:11', 11, NULL, 0, NULL),
(1352, '12203', 'ALMUADILLA', 'ALMUADILLA PARA PIES', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-27 18:12:27', 11, NULL, 0, NULL),
(1353, '21600', 'LAVA RED', 'LAVA RED', NULL, 'lib/Productos/img/blitz_SN.png', '85.00', '0.00', 1, 5, 27, '2022-04-27 18:13:38', 11, NULL, 0, NULL),
(1354, '21738', 'SUJETADOR', 'SUJETA CUBREBOCA', NULL, 'lib/Productos/img/blitz_SN.png', '40.00', '0.00', 1, 5, 27, '2022-04-27 18:14:34', 11, NULL, 0, NULL),
(1355, '20353', 'CLIP SUJETA SABANAS', 'CLIP SUJETA SABANAS', NULL, 'lib/Productos/img/blitz_SN.png', '50.00', '0.00', 1, 5, 27, '2022-04-27 18:15:32', 11, NULL, 0, NULL),
(1356, '18738', 'SOPORTE', 'SOPORTE DE METAL PARA MANGUERA', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-27 18:16:47', 11, NULL, 0, NULL),
(1357, '20038', 'TRASTE', 'CIRCULOCK ', NULL, 'lib/Productos/img/blitz_SN.png', '199.00', '0.00', 1, 5, 27, '2022-04-27 18:18:43', 11, NULL, 0, NULL),
(1358, '19077', 'AGUA CLIK', 'AGUA CLIK', NULL, 'lib/Productos/img/blitz_SN.png', '329.00', '0.00', 3, 5, 27, '2022-04-27 18:19:47', 11, NULL, 0, NULL),
(1359, '17431', 'SET DE BAÑO', 'SET DE BAÑO', NULL, 'lib/Productos/img/blitz_SN.png', '250.00', '0.00', 1, 5, 27, '2022-04-27 18:20:37', 11, NULL, 0, NULL),
(1360, '19404', 'ILUMINARIO LET', 'ILUMINARIO LET', NULL, 'lib/Productos/img/blitz_SN.png', '300.00', '0.00', 1, 5, 27, '2022-04-27 18:21:37', 11, NULL, 0, NULL),
(1361, '17527', 'SARTEN', 'SARTEN SONRISA', NULL, 'lib/Productos/img/blitz_SN.png', '100.00', '0.00', 1, 5, 27, '2022-04-27 18:22:28', 11, NULL, 0, NULL),
(1362, '15207', 'PROTECTOR', 'PROTECTOR PARA ZAPATOS', NULL, 'lib/Productos/img/blitz_SN.png', '80.00', '0.00', 1, 5, 27, '2022-04-27 18:23:25', 11, NULL, 0, NULL),
(1363, '993386511201', 'CAMISA', 'CAMISA IVORY M.99338 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '389.00', '0.00', 1, 5, 50, '2022-04-28 19:34:20', 2, NULL, 0, NULL),
(1364, '273388611100', 'CAMISA', 'CAMISA MULTICOLOR M.27338 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 0, 5, 50, '2022-04-28 19:36:09', 2, NULL, 0, NULL),
(1365, '273388611209', 'CAMISA', 'CAMISA MULTICOLOR M.27338 T.G', NULL, 'lib/Productos/img/blitz_SN.png', '409.00', '0.00', 1, 5, 50, '2022-04-28 19:37:53', 2, NULL, 0, NULL),
(1366, '982574311105', 'VESTIDO', 'VESTIDO LARGO ROSA VIE M.98257 T.M', NULL, 'lib/Productos/img/blitz_SN.png', '709.00', '0.00', 0, 5, 14, '2022-04-29 09:30:53', 2, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `ID_Proveedor` int NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Telefono` varchar(40) DEFAULT NULL,
  `Foto` varchar(254) DEFAULT NULL,
  `NEmpresa` varchar(25) DEFAULT NULL,
  `NCorreo` varchar(30) DEFAULT NULL,
  `NDireccion` varchar(80) DEFAULT NULL,
  `NTel` varchar(13) DEFAULT NULL,
  `NCiudad` varchar(40) DEFAULT NULL,
  `NCP` varchar(10) DEFAULT NULL,
  `NLogo` varchar(254) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  `Beneficiario` varchar(60) DEFAULT NULL,
  `Clabe` varchar(30) DEFAULT NULL,
  `Banco` varchar(50) DEFAULT NULL,
  `Bio` varchar(300) DEFAULT NULL,
  `NBio` varchar(300) DEFAULT NULL,
  `Importado` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Proveedores`
--

INSERT INTO `Proveedores` (`ID_Proveedor`, `Nombre`, `Correo`, `Telefono`, `Foto`, `NEmpresa`, `NCorreo`, `NDireccion`, `NTel`, `NCiudad`, `NCP`, `NLogo`, `Fecha_Registro`, `Beneficiario`, `Clabe`, `Banco`, `Bio`, `NBio`, `Importado`) VALUES
(1, '', '', '', 'lib/Productos/img/blitz_SN.png', 'TERRAMAR', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(2, '', '', '', 'lib/Productos/img/blitz_SN.png', 'CKLASS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(3, '', '', '', 'lib/Productos/img/blitz_SN.png', 'IMPULS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(4, '', '', '', 'lib/Productos/img/blitz_SN.png', 'TERRA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(5, '', '', '', 'lib/Productos/img/blitz_SN.png', 'ANDREA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(6, '', '', '', 'lib/Productos/img/blitz_SN.png', 'ILUSION', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(7, '', '', '', 'lib/Productos/img/blitz_SN.png', 'VIANEY', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(8, '', '', '', 'lib/Productos/img/blitz_SN.png', 'ONLY FASHION', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(9, '', '', '', 'lib/Productos/img/blitz_SN.png', 'SOPHIA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(10, '', '', '', 'lib/Productos/img/blitz_SN.png', 'NATURA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(11, '', '', '', 'lib/Productos/img/blitz_SN.png', 'BETTERWARE', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(12, '', '', '', 'lib/Productos/img/blitz_SN.png', 'STANHOME', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(13, '', '', '', 'lib/Productos/img/blitz_SN.png', 'ZERMAT', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(14, '', '', '', 'lib/Productos/img/blitz_SN.png', 'REDNATURA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(15, '', '', '', 'lib/Productos/img/blitz_SN.png', 'EVA VERRY', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(16, '', '', '', 'lib/Productos/img/blitz_SN.png', 'WISS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(17, '', '', '', 'lib/Productos/img/blitz_SN.png', 'D\'ROS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(18, '', '', '', 'lib/Productos/img/blitz_SN.png', 'RUTH', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(19, '', '', '', 'lib/Productos/img/blitz_SN.png', 'BLEM', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(20, '', '', '', 'lib/Productos/img/blitz_SN.png', 'SOFTSILVER', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(21, '', '', '', 'lib/Productos/img/blitz_SN.png', 'SEYTÚ', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(22, '', '', '', 'lib/Productos/img/blitz_SN.png', 'MARY KAY', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(23, '', '', '', 'lib/Productos/img/blitz_SN.png', 'BALUMBA ', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(24, '', '', '', 'lib/Productos/img/blitz_SN.png', 'PAOLA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(25, '', '', '', 'lib/Productos/img/blitz_SN.png', 'ZULE', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(26, '', '', '', 'lib/Productos/img/blitz_SN.png', 'YUGO', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(27, '', '', '', 'lib/Productos/img/blitz_SN.png', 'KA&LUS', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(28, '', '', '', 'lib/Productos/img/blitz_SN.png', 'FRAICHE', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-03-30', '', '', '', NULL, NULL, NULL),
(29, '', '', '', 'lib/Productos/img/blitz_SN.png', 'BORDADO PUNTO DE CRUZ', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-04', '', '', '', NULL, NULL, NULL),
(30, '', '', '', 'lib/Productos/img/blitz_SN.png', 'LINDA', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-04', '', '', '', NULL, NULL, NULL),
(31, '', '', '', 'lib/Productos/img/blitz_SN.png', 'GAVINI', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-04', '', '', '', NULL, NULL, NULL),
(32, '', '', '', 'lib/Productos/img/blitz_SN.png', 'MODA CLUB', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-04', '', '', '', NULL, NULL, NULL),
(33, '', '', '', 'lib/Productos/img/blitz_SN.png', 'OLD NAVY', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-04', '', '', '', NULL, NULL, NULL),
(34, '', '', '', 'lib/Productos/img/blitz_SN.png', 'SANDRA RENTERIA ', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-04', '', '', '', NULL, NULL, NULL),
(35, '', '', '', 'lib/Productos/img/blitz_SN.png', 'GONAY', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-07', '', '', '', NULL, NULL, NULL),
(36, '', '', '', 'lib/Productos/img/blitz_SN.png', 'PERCH', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-11', '', '', '', NULL, NULL, NULL),
(37, 'MODA MIRIAM', '', '', 'lib/Productos/img/blitz_SN.png', 'MODA MIRIAM', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-20', '', '', '', NULL, NULL, NULL),
(38, 'COTTON', '', '', 'lib/Productos/img/blitz_SN.png', 'COTTON', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-20', '', '', '', NULL, NULL, NULL),
(39, '', '', '', 'lib/Productos/img/blitz_SN.png', 'ORIFLAME', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-25', '', '', '', NULL, NULL, NULL),
(40, 'YVES ROCHER', '', '', 'lib/Productos/img/blitz_SN.png', 'YVES ROCHER', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-26', '', '', '', NULL, NULL, NULL),
(41, 'SEYTU', '', '', 'lib/Productos/img/blitz_SN.png', 'SEYTU', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-26', '', '', '', NULL, NULL, NULL),
(42, 'MARY KAY', '', '', 'lib/Productos/img/blitz_SN.png', 'MARY KAY', '', '', '', '', '', 'lib/Productos/img/blitz_SN.png', '2022-04-26', '', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Puestos`
--

CREATE TABLE `Puestos` (
  `ID_Puesto` int NOT NULL,
  `Cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Puestos`
--

INSERT INTO `Puestos` (`ID_Puesto`, `Cargo`) VALUES
(1, 'Gerente'),
(2, 'Administrador'),
(3, 'Encargado'),
(4, 'Vendedor'),
(5, 'Cliente'),
(6, 'Proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sucursales`
--

CREATE TABLE `Sucursales` (
  `ID_Sucursal` int NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `RFC` varchar(40) DEFAULT NULL,
  `Municipio` varchar(90) DEFAULT NULL,
  `Estado` varchar(40) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Colonia` varchar(65) DEFAULT NULL,
  `Cp` int DEFAULT NULL,
  `Latitud` varchar(40) DEFAULT NULL,
  `Longitud` varchar(40) DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Logo` varchar(254) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL,
  `Gerente` varchar(35) DEFAULT NULL,
  `Whats` varchar(13) DEFAULT NULL,
  `Clabe` varchar(50) DEFAULT NULL,
  `Banco` varchar(50) DEFAULT NULL,
  `Beneficiario` varchar(50) DEFAULT NULL,
  `visible` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Sucursales`
--

INSERT INTO `Sucursales` (`ID_Sucursal`, `Nombre`, `RFC`, `Municipio`, `Estado`, `Direccion`, `Correo`, `Colonia`, `Cp`, `Latitud`, `Longitud`, `Telefono`, `Logo`, `Tipo`, `Gerente`, `Whats`, `Clabe`, `Banco`, `Beneficiario`, `visible`) VALUES
(3, 'Blitzc0de', 'sapm900328cg9', 'Ticul, Yucatan', NULL, 'C 43 x 24 y 26', 'app-support@blitzc0de.com', 'Vivah 1, Santiago', 97864, NULL, NULL, '9971135089', 'lib/Empresa/img/blitzc0de.jpg', NULL, 'Mariel Santos', NULL, '659802027000697980', 'ASP INTEGRA', 'Mariel Santos Paredes', 0),
(5, 'Moda Miriam', 'CICM730603AE7', 'Ticul', 'Yucatan', 'C-21 x 30 y 32 # 212', '', 'Centro', 97864, NULL, NULL, '9971052743', 'lib/Empresa/img/mm2.jpg', NULL, 'Miriam del Rocio Chi', '9971052743', '', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `ID_Venta` bigint UNSIGNED NOT NULL,
  `ID_Personal` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `Caja` int NOT NULL,
  `ID_Medio` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Descuento_efect` decimal(8,2) DEFAULT NULL,
  `Descuento_porcent` double DEFAULT NULL,
  `Subtotal` decimal(8,2) DEFAULT NULL,
  `IVA` double DEFAULT NULL,
  `Total` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Cambio` decimal(8,2) DEFAULT NULL,
  `ID_Destino` int NOT NULL,
  `Comentarios` varchar(200) DEFAULT NULL,
  `Cort` int DEFAULT NULL,
  `idcorte` int DEFAULT NULL,
  `Liquidar` int DEFAULT '0' COMMENT 'si ya liquido la deuda lleva "1" de valor	',
  `Fecha_Fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Ventas`
--

INSERT INTO `Ventas` (`ID_Venta`, `ID_Personal`, `ID_Cliente`, `Caja`, `ID_Medio`, `Cantidad`, `Fecha`, `Hora`, `Descuento_efect`, `Descuento_porcent`, `Subtotal`, `IVA`, `Total`, `Efectivo`, `Cambio`, `ID_Destino`, `Comentarios`, `Cort`, `idcorte`, `Liquidar`, `Fecha_Fin`) VALUES
(1, 5, 3, 3, 1, 1, '2022-03-30', '18:13:01', '0.00', 0, '633.00', 101.28, '633.00', '0.00', '-633.00', 2, '', 1, 2, 0, '2022-05-02'),
(2, 5, 5, 3, 1, 1, '2022-04-02', '18:18:22', '0.00', 0, '679.00', 108.64, '679.00', '700.00', '21.00', 1, 'ARACELI UICAB', 1, 2, 0, NULL),
(3, 5, 6, 4, 1, 1, '2022-04-06', '09:51:31', '0.00', 0, '330.00', 52.8, '330.00', '0.00', '-330.00', 2, '', 1, 5, 0, '2022-05-09'),
(4, 5, 6, 4, 1, 1, '2022-04-06', '10:27:36', '217.00', 35, '620.00', 64.48, '403.00', '0.00', '-620.00', 2, '', 1, 5, 0, '2022-05-09'),
(5, 5, 7, 4, 1, 3, '2022-04-06', '10:46:59', '0.00', 0, '1169.00', 187.04, '1169.00', '100.00', '-1069.00', 3, '', 1, 5, 1, '2022-05-06'),
(7, 4, 5, 3, 1, 2, '2022-04-07', '11:01:54', '0.00', 0, '670.00', 107.2, '670.00', '670.00', '0.00', 1, '', 1, 7, 0, NULL),
(8, 4, 8, 3, 1, 1, '2022-04-07', '11:04:23', '0.00', 0, '229.00', 36.64, '229.00', '0.00', '-229.00', 2, 'MTRA MANUELA SOSA ', 1, 7, 0, '2022-05-10'),
(9, 4, 9, 3, 1, 1, '2022-04-07', '16:19:07', '0.00', 0, '389.00', 62.24, '389.00', '0.00', '-389.00', 2, '', 1, 7, 0, '2022-05-10'),
(10, 5, 5, 3, 1, 1, '2022-04-07', '17:58:00', '0.00', 0, '450.00', 72, '450.00', '450.00', '0.00', 1, 'GEORGINA (HIJA DE ILIANA SIERRA)', 1, 7, 0, NULL),
(11, 5, 5, 3, 1, 1, '2022-04-07', '18:11:18', '75.00', 20, '375.00', 48, '300.00', '300.00', '0.00', 1, '', 1, 7, 0, NULL),
(12, 5, 5, 3, 1, 1, '2022-04-07', '18:12:27', '0.00', 0, '430.00', 68.8, '430.00', '430.00', '0.00', 1, '', 1, 7, 0, NULL),
(13, 5, 5, 3, 1, 1, '2022-04-07', '18:59:45', '0.00', 0, '450.00', 72, '450.00', '500.00', '50.00', 1, '', 1, 7, 0, NULL),
(14, 4, 10, 3, 1, 2, '2022-04-08', '12:00:21', '0.00', 0, '748.00', 119.68, '748.00', '0.00', '-748.00', 2, '', 1, 9, 0, '2022-05-11'),
(15, 4, 5, 3, 1, 1, '2022-04-08', '14:25:20', '0.00', 0, '350.00', 56, '350.00', '500.00', '150.00', 1, '', 1, 9, 0, NULL),
(16, 4, 11, 3, 1, 1, '2022-04-08', '14:29:02', '0.00', 0, '360.00', 57.6, '360.00', '0.00', '-360.00', 3, '', 1, 9, 1, '2022-05-08'),
(17, 4, 12, 4, 1, 1, '2022-04-09', '10:12:35', '0.00', 0, '480.00', 76.8, '480.00', '0.00', '-480.00', 2, '', 1, 13, 0, '2022-05-12'),
(18, 4, 13, 4, 1, 1, '2022-04-09', '12:43:03', '0.00', 0, '165.00', 26.4, '165.00', '0.00', '-165.00', 2, '', 1, 13, 0, '2022-05-12'),
(19, 5, 14, 4, 1, 1, '2022-04-09', '15:49:07', '0.00', 0, '390.00', 62.4, '390.00', '390.00', '0.00', 1, ' MIRIAM AGARRO UNA BLUSA BLANCA\r\n*TERRAMAR', 1, 13, 0, NULL),
(20, 4, 15, 4, 1, 1, '2022-04-09', '16:17:02', '0.00', 0, '679.00', 108.64, '679.00', '0.00', '-679.00', 2, '', 1, 13, 0, '2022-05-12'),
(21, 4, 16, 4, 1, 2, '2022-04-09', '16:32:11', '0.00', 0, '619.00', 99.04, '619.00', '0.00', '-619.00', 2, '', 1, 13, 0, '2022-05-12'),
(22, 5, 5, 4, 1, 1, '2022-04-09', '18:17:37', '0.00', 0, '559.00', 89.44, '559.00', '559.00', '0.00', 1, 'ALMA GUERRERO', 1, 13, 0, NULL),
(23, 5, 5, 4, 1, 1, '2022-04-09', '20:04:02', '75.00', 20, '375.00', 48, '300.00', '300.00', '0.00', 1, '', 1, 13, 0, NULL),
(24, 4, 5, 4, 1, 3, '2022-04-10', '11:56:24', '0.00', 0, '1110.00', 177.6, '1110.00', '1110.00', '0.00', 1, '', 1, 15, 0, NULL),
(25, 4, 5, 4, 1, 1, '2022-04-10', '12:23:00', '0.00', 0, '220.00', 35.2, '220.00', '220.00', '0.00', 1, 'CARMEN BASS', 1, 15, 0, NULL),
(26, 4, 5, 4, 1, 1, '2022-04-10', '12:31:51', '0.00', 0, '290.00', 46.4, '290.00', '290.00', '0.00', 1, '', 1, 15, 0, NULL),
(28, 4, 20, 4, 1, 2, '2022-04-11', '16:26:06', '0.00', 0, '625.00', 100, '625.00', '0.00', '-625.00', 2, 'MIRNA MATA', 1, 20, 0, '2022-05-14'),
(29, 5, 21, 4, 1, 1, '2022-04-11', '18:06:48', '0.00', 0, '360.00', 57.6, '360.00', '0.00', '-360.00', 2, 'ANITA PACHECO', 1, 20, 0, '2022-05-14'),
(30, 4, 5, 4, 1, 3, '2022-04-12', '10:57:55', '0.00', 0, '1060.00', 169.6, '1060.00', '1060.00', '0.00', 1, '', 1, 24, 0, NULL),
(31, 4, 5, 3, 1, 2, '2022-04-12', '12:04:44', '0.00', 0, '640.00', 102.4, '640.00', '1000.00', '360.00', 1, '', 1, 24, 0, NULL),
(32, 4, 5, 3, 1, 1, '2022-04-12', '13:02:41', '0.00', 0, '330.00', 52.8, '330.00', '330.00', '0.00', 1, '', 1, 24, 0, NULL),
(33, 4, 5, 4, 1, 1, '2022-04-12', '16:48:17', '0.00', 0, '349.00', 55.84, '349.00', '500.00', '151.00', 1, 'CARMEN BASS', 1, 24, 0, NULL),
(34, 4, 17, 4, 1, 3, '2022-04-12', '17:54:23', '0.00', 0, '777.00', 124.32, '777.00', '0.00', '-777.00', 2, 'PATY GONZALEZ', 1, 24, 0, '2022-05-15'),
(35, 4, 5, 3, 1, 1, '2022-04-13', '09:55:40', '0.00', 0, '530.00', 84.8, '530.00', '550.00', '20.00', 1, '', 1, 26, 0, NULL),
(36, 4, 5, 3, 1, 1, '2022-04-13', '11:08:35', '0.00', 0, '320.00', 51.2, '320.00', '500.00', '180.00', 1, 'vero gamboa', 1, 26, 0, NULL),
(37, 4, 22, 3, 1, 1, '2022-04-13', '11:13:03', '0.00', 0, '400.00', 64, '400.00', '0.00', '-400.00', 3, 'VERO GAMBOA CHAN', 1, 26, 1, '2022-05-13'),
(38, 4, 23, 3, 1, 2, '2022-04-13', '12:47:55', '0.00', 0, '310.00', 49.6, '310.00', '0.00', '-310.00', 2, 'YAZMIN DZAN', 1, 26, 0, '2022-05-16'),
(39, 4, 5, 3, 1, 1, '2022-04-13', '14:03:53', '0.00', 0, '320.00', 51.2, '320.00', '500.00', '180.00', 1, '', 1, 26, 0, NULL),
(40, 5, 5, 3, 1, 3, '2022-04-13', '19:19:56', '0.00', 0, '1387.00', 221.92, '1387.00', '0.00', '-1387.00', 2, '', 1, 26, 0, '2022-05-16'),
(41, 5, 24, 3, 1, 5, '2022-04-13', '19:29:15', '0.00', 0, '1533.00', 245.28, '1533.00', '0.00', '-1533.00', 2, '', 1, 26, 0, '2022-05-16'),
(42, 5, 24, 3, 1, 3, '2022-04-13', '19:44:30', '0.00', 0, '1387.00', 221.92, '1387.00', '0.00', '-1387.00', 2, '', 1, 26, 0, '2022-05-16'),
(44, 4, 25, 3, 1, 1, '2022-04-14', '09:35:00', '0.00', 0, '1500.00', 240, '1500.00', '0.00', '-1500.00', 2, '', 1, 33, 0, '2022-05-17'),
(45, 4, 26, 4, 1, 2, '2022-04-14', '11:09:09', '0.00', 0, '630.00', 100.8, '630.00', '0.00', '-630.00', 2, 'ROSARIO SANCHEZ', 1, 33, 0, '2022-05-17'),
(46, 4, 5, 4, 1, 2, '2022-04-14', '12:28:35', '0.00', 0, '178.00', 28.48, '178.00', '500.00', '322.00', 1, '', 1, 33, 0, NULL),
(47, 4, 5, 4, 1, 1, '2022-04-14', '13:22:19', '0.00', 0, '280.00', 44.8, '280.00', '500.00', '220.00', 1, 'VENTA', 1, 33, 0, NULL),
(48, 4, 27, 4, 1, 1, '2022-04-14', '15:41:11', '0.00', 0, '530.00', 84.8, '530.00', '0.00', '-530.00', 3, 'URIS DEL CARMEN', 1, 33, 1, '2022-05-14'),
(49, 4, 17, 4, 1, 3, '2022-04-14', '16:21:23', '0.00', 0, '250.00', 40, '250.00', '0.00', '-250.00', 2, 'PATY GONZALEZ', 1, 33, 0, '2022-05-17'),
(50, 4, 5, 4, 1, 2, '2022-04-14', '17:30:48', '0.00', 0, '665.00', 106.4, '665.00', '700.00', '35.00', 1, '', 1, 33, 0, NULL),
(51, 4, 28, 3, 1, 4, '2022-04-14', '18:22:25', '0.00', 0, '1295.00', 207.2, '1295.00', '0.00', '-1295.00', 2, 'SUSANA', 1, 33, 0, '2022-05-17'),
(52, 4, 28, 3, 1, 1, '2022-04-14', '18:35:00', '0.00', 0, '380.00', 60.8, '380.00', '0.00', '-380.00', 2, 'SUSANA', 1, 33, 0, '2022-05-17'),
(53, 4, 28, 3, 1, 1, '2022-04-14', '18:37:48', '114.00', 30, '380.00', 42.56, '266.00', '0.00', '-266.00', 2, 'SUSANA QUINTAL ', 1, 33, 0, '2022-05-17'),
(54, 5, 5, 3, 1, 1, '2022-04-14', '19:08:03', '0.00', 0, '330.00', 52.8, '330.00', '330.00', '0.00', 1, 'SALDO CON VALE SALDO:25', 1, 33, 0, NULL),
(55, 5, 5, 3, 1, 1, '2022-04-14', '20:00:58', '0.00', 0, '290.00', 46.4, '290.00', '300.00', '10.00', 1, '', 1, 33, 0, NULL),
(56, 4, 29, 3, 1, 1, '2022-04-15', '11:41:54', '0.00', 0, '340.00', 54.4, '340.00', '0.00', '-340.00', 3, 'ABONO 100', 1, 35, 1, '2022-05-15'),
(57, 4, 13, 3, 1, 1, '2022-04-15', '11:44:38', '0.00', 0, '119.00', 19.04, '119.00', '120.00', '1.00', 1, '', 1, 35, 0, NULL),
(58, 4, 13, 3, 1, 1, '2022-04-15', '11:45:38', '0.00', 0, '119.00', 19.04, '119.00', '0.00', '-119.00', 2, '', 1, 35, 0, '2022-05-18'),
(59, 4, 5, 4, 1, 1, '2022-04-16', '11:25:51', '0.00', 0, '320.00', 51.2, '320.00', '500.00', '180.00', 1, 'CALZADO ROJO T.5 EVA GALAXIA BAJO', 1, 41, 0, NULL),
(60, 4, 5, 4, 1, 2, '2022-04-16', '12:15:57', '0.00', 0, '480.00', 76.8, '480.00', '500.00', '20.00', 1, '', 1, 41, 0, NULL),
(61, 4, 5, 4, 1, 1, '2022-04-16', '15:08:14', '0.00', 0, '310.00', 49.6, '310.00', '320.00', '10.00', 1, '', 1, 41, 0, NULL),
(62, 5, 30, 4, 1, 3, '2022-04-16', '18:25:46', '0.00', 0, '1255.00', 200.8, '1255.00', '0.00', '-1255.00', 2, '', 1, 41, 0, '2022-05-19'),
(63, 4, 5, 4, 1, 3, '2022-04-17', '09:58:17', '66.30', 17, '390.00', 51.792, '323.70', '324.00', '0.30', 1, 'Six pack calzado #3 Cklass.', 1, 45, 0, NULL),
(64, 5, 31, 4, 1, 3, '2022-04-17', '10:27:43', '0.00', 0, '1160.00', 185.6, '1160.00', '0.00', '-1160.00', 2, 'LUCY POOT', 1, 45, 0, '2022-05-20'),
(65, 4, 5, 4, 1, 1, '2022-04-17', '11:45:13', '0.00', 0, '400.00', 64, '400.00', '400.00', '0.00', 1, '', 1, 45, 0, NULL),
(66, 4, 15, 4, 1, 1, '2022-04-17', '12:48:39', '0.00', 0, '350.00', 56, '350.00', '0.00', '-350.00', 2, '', 1, 45, 0, '2022-05-20'),
(67, 4, 33, 4, 1, 2, '2022-04-18', '09:26:52', '0.00', 0, '830.00', 132.8, '830.00', '0.00', '-830.00', 3, 'KARLA CANUL', 1, 48, 1, '2022-05-18'),
(68, 4, 5, 4, 1, 1, '2022-04-19', '09:37:21', '0.00', 0, '590.00', 94.4, '590.00', '700.00', '110.00', 1, '', 1, 53, 0, NULL),
(69, 4, 35, 4, 1, 4, '2022-04-19', '11:48:00', '0.00', 0, '2090.00', 334.4, '2090.00', '0.00', '-2090.00', 2, 'ABI CEJIN ', 1, 53, 0, '2022-05-22'),
(70, 4, 35, 4, 1, 1, '2022-04-19', '11:56:58', '55.00', 20, '275.00', 35.2, '220.00', '0.00', '-220.00', 2, '', 1, 53, 0, '2022-05-22'),
(71, 5, 36, 3, 1, 3, '2022-04-19', '12:57:48', '0.00', 0, '1160.00', 185.6, '1160.00', '0.00', '-1160.00', 2, '', 1, 53, 0, '2022-05-22'),
(72, 5, 37, 3, 1, 5, '2022-04-19', '13:32:28', '0.00', 0, '1960.00', 313.6, '1960.00', '0.00', '-1960.00', 2, '', 1, 53, 0, '2022-05-22'),
(73, 4, 5, 4, 1, 1, '2022-04-19', '13:47:20', '0.00', 0, '220.00', 35.2, '220.00', '220.00', '0.00', 1, '', 1, 53, 0, NULL),
(74, 4, 30, 4, 1, 1, '2022-04-19', '18:54:59', '0.00', 0, '500.00', 80, '500.00', '0.00', '-500.00', 2, '', 1, 53, 0, '2022-05-22'),
(75, 5, 30, 4, 1, 1, '2022-04-19', '18:57:30', '0.00', 0, '520.00', 83.2, '520.00', '0.00', '-520.00', 2, '', 1, 53, 0, '2022-05-22'),
(76, 4, 5, 4, 1, 1, '2022-04-20', '11:15:54', '0.00', 0, '112.00', 17.92, '112.00', '112.00', '0.00', 1, 'MARIELA MAGAÑA', 1, 55, 0, NULL),
(77, 4, 5, 3, 1, 1, '2022-04-20', '12:52:54', '0.00', 0, '85.00', 13.6, '85.00', '200.00', '115.00', 1, '', 1, 55, 0, NULL),
(78, 5, 5, 3, 1, 1, '2022-04-20', '13:04:04', '0.00', 0, '130.00', 20.8, '130.00', '150.00', '20.00', 1, '', 1, 55, 0, NULL),
(79, 4, 5, 4, 1, 1, '2022-04-20', '18:18:18', '0.00', 0, '299.00', 47.84, '299.00', '500.00', '201.00', 1, 'NANCY', 1, 55, 0, NULL),
(80, 5, 5, 4, 1, 1, '2022-04-20', '18:25:31', '0.00', 0, '330.00', 52.8, '330.00', '400.00', '70.00', 1, '', 1, 55, 0, NULL),
(81, 4, 5, 3, 1, 1, '2022-04-21', '12:40:16', '0.00', 0, '285.00', 45.6, '285.00', '300.00', '15.00', 1, '', 1, 58, 0, NULL),
(82, 5, 38, 3, 1, 2, '2022-04-21', '13:04:01', '0.00', 0, '680.00', 108.8, '680.00', '0.00', '-680.00', 3, 'SANDRA CHAN DURAN', 1, 58, 1, '2022-05-21'),
(83, 4, 10, 4, 1, 1, '2022-04-22', '11:58:22', '0.00', 0, '400.00', 64, '400.00', '0.00', '-400.00', 2, '', 1, 63, 0, '2022-05-25'),
(84, 4, 5, 4, 1, 1, '2022-04-22', '13:51:26', '0.00', 0, '499.00', 79.84, '499.00', '500.00', '1.00', 1, '', 1, 63, 0, NULL),
(85, 5, 5, 4, 1, 2, '2022-04-22', '16:45:21', '0.00', 0, '625.00', 100, '625.00', '1000.00', '375.00', 1, '', 1, 63, 0, NULL),
(86, 5, 5, 4, 1, 1, '2022-04-23', '10:49:49', '0.00', 0, '550.00', 88, '550.00', '600.00', '50.00', 1, '', 1, 65, 0, NULL),
(87, 5, 5, 4, 1, 2, '2022-04-23', '11:40:22', '0.00', 0, '989.00', 158.24, '989.00', '1000.00', '11.00', 1, 'NIDIA (FRUTERIA)', 1, 65, 0, NULL),
(88, 5, 5, 3, 1, 1, '2022-04-23', '12:23:47', '0.00', 0, '330.00', 52.8, '330.00', '500.00', '170.00', 1, 'FALDA MEZCLILLA NEGRO', 1, 65, 0, NULL),
(89, 5, 5, 4, 1, 1, '2022-04-23', '12:48:18', '0.00', 0, '550.00', 88, '550.00', '600.00', '50.00', 1, 'HIJAS DE NIDIA FRUTERIA ', 1, 65, 0, NULL),
(90, 4, 40, 4, 1, 2, '2022-04-24', '11:40:08', '0.00', 0, '800.00', 128, '800.00', '1000.00', '200.00', 1, 'LEYDI JIMENEZ', 1, 67, 0, NULL),
(91, 4, 40, 4, 1, 1, '2022-04-24', '11:42:30', '0.00', 0, '360.00', 57.6, '360.00', '0.00', '-360.00', 3, 'LEYDI JIMENEZ', 1, 67, 1, '2022-05-24'),
(92, 5, 41, 4, 1, 2, '2022-04-24', '11:45:20', '0.00', 0, '798.00', 127.68, '798.00', '0.00', '-798.00', 2, 'MTRA ANA ', 1, 67, 0, '2022-05-27'),
(93, 5, 5, 4, 1, 1, '2022-04-24', '13:53:22', '0.00', 0, '349.00', 55.84, '349.00', '349.00', '0.00', 1, 'AMIRA AVILA', 1, 67, 0, NULL),
(94, 4, 41, 4, 1, 1, '2022-04-25', '10:33:23', '0.00', 0, '438.00', 70.08, '438.00', '0.00', '-438.00', 2, 'ANA', 1, 69, 0, '2022-05-28'),
(95, 4, 5, 4, 1, 1, '2022-04-25', '10:46:07', '0.00', 0, '295.00', 47.2, '295.00', '300.00', '5.00', 1, '', 1, 69, 0, NULL),
(96, 4, 5, 4, 1, 1, '2022-04-25', '14:34:16', '0.00', 0, '500.00', 80, '500.00', '500.00', '0.00', 1, 'VESTDO BETSEY ', 1, 69, 0, NULL),
(97, 5, 14, 4, 1, 1, '2022-04-26', '15:15:09', '0.00', 0, '70.00', 11.2, '70.00', '70.00', '0.00', 1, 'MIRIAM CHI', 1, 71, 0, NULL),
(98, 4, 17, 4, 1, 1, '2022-04-26', '17:14:59', '0.00', 0, '249.00', 39.84, '249.00', '0.00', '-249.00', 1, 'PATY', 1, 71, 0, NULL),
(99, 5, 5, 4, 1, 1, '2022-04-26', '17:47:05', '0.00', 0, '365.00', 58.4, '365.00', '400.00', '35.00', 1, '', 1, 71, 0, NULL),
(100, 4, 42, 4, 1, 1, '2022-04-27', '10:32:33', '0.00', 0, '350.00', 56, '350.00', '0.00', '-350.00', 3, '', 1, 75, 1, '2022-05-27'),
(101, 5, 5, 4, 1, 2, '2022-04-27', '12:43:44', '0.00', 0, '110.00', 17.6, '110.00', '110.00', '0.00', 1, 'ADELA HERRERA', 1, 75, 0, NULL),
(102, 5, 5, 4, 1, 1, '2022-04-27', '18:26:11', '0.00', 0, '109.00', 17.44, '109.00', '200.00', '91.00', 1, '', 1, 75, 0, NULL),
(103, 5, 5, 4, 1, 1, '2022-04-27', '18:40:03', '0.00', 0, '299.00', 47.84, '299.00', '300.00', '1.00', 1, '', 1, 75, 0, NULL),
(105, 4, 5, 4, 1, 1, '2022-04-29', '09:31:38', '0.00', 0, '709.00', 113.44, '709.00', '1000.00', '291.00', 1, '', 0, NULL, 0, NULL),
(106, 4, 5, 4, 1, 1, '2022-04-29', '11:04:16', '0.00', 0, '450.00', 72, '450.00', '500.00', '50.00', 1, '', 0, NULL, 0, NULL),
(107, 4, 5, 4, 1, 1, '2022-04-29', '11:15:59', '0.00', 0, '285.00', 45.6, '285.00', '300.00', '15.00', 1, '', 0, NULL, 0, NULL),
(108, 4, 5, 4, 1, 1, '2022-04-29', '11:18:07', '0.00', 0, '285.00', 45.6, '285.00', '0.00', '-285.00', 3, '', 0, NULL, 1, '2022-05-29'),
(109, 5, 41, 3, 1, 4, '2022-04-29', '11:43:15', '0.00', 0, '358.00', 57.28, '358.00', '358.00', '0.00', 1, '', 0, NULL, 0, NULL),
(111, 4, 5, 3, 1, 1, '2022-04-29', '13:54:53', '0.00', 0, '360.00', 57.6, '360.00', '360.00', '0.00', 1, '', 0, NULL, 0, NULL),
(112, 4, 44, 3, 1, 1, '2022-04-29', '14:12:30', '0.00', 0, '285.00', 45.6, '285.00', '0.00', '-285.00', 3, '', 0, NULL, 1, '2022-05-29'),
(113, 4, 5, 3, 1, 1, '2022-04-29', '14:15:47', '0.00', 0, '350.00', 56, '350.00', '500.00', '150.00', 1, '', 0, NULL, 0, NULL),
(114, 4, 30, 3, 1, 1, '2022-04-29', '14:24:10', '0.00', 0, '430.00', 68.8, '430.00', '0.00', '-430.00', 2, '', 0, NULL, 0, '2022-06-01'),
(115, 5, 43, 3, 1, 2, '2022-04-29', '14:34:42', '0.00', 0, '798.00', 127.68, '798.00', '0.00', '-798.00', 2, '', 0, NULL, 0, '2022-06-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta_Detalle`
--

CREATE TABLE `Venta_Detalle` (
  `ID_Detalle` bigint UNSIGNED NOT NULL,
  `ID_Producto` bigint UNSIGNED NOT NULL,
  `Cantidad` bigint UNSIGNED NOT NULL,
  `ID_Venta` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Venta_Detalle`
--

INSERT INTO `Venta_Detalle` (`ID_Detalle`, `ID_Producto`, `Cantidad`, `ID_Venta`) VALUES
(1, 1, 1, 1),
(2, 124, 1, 2),
(3, 118, 1, 3),
(5, 127, 1, 5),
(6, 112, 1, 5),
(7, 347, 1, 5),
(9, 519, 1, 7),
(10, 518, 1, 7),
(11, 542, 1, 8),
(12, 571, 1, 9),
(13, 310, 1, 10),
(14, 399, 1, 11),
(15, 368, 1, 12),
(16, 490, 1, 13),
(17, 548, 1, 14),
(18, 609, 1, 14),
(19, 579, 1, 15),
(20, 415, 1, 16),
(21, 634, 1, 17),
(22, 635, 1, 18),
(23, 436, 1, 19),
(24, 638, 1, 20),
(25, 642, 1, 21),
(26, 112, 1, 21),
(27, 636, 1, 22),
(28, 400, 1, 23),
(29, 377, 1, 24),
(30, 199, 1, 24),
(31, 210, 1, 24),
(32, 639, 1, 25),
(33, 405, 1, 26),
(35, 206, 1, 28),
(36, 130, 1, 28),
(37, 196, 1, 29),
(38, 202, 1, 30),
(39, 138, 1, 30),
(40, 194, 1, 30),
(41, 129, 1, 31),
(42, 194, 1, 31),
(43, 530, 1, 32),
(44, 561, 1, 33),
(45, 569, 1, 34),
(46, 562, 1, 34),
(47, 262, 1, 34),
(48, 339, 1, 35),
(49, 750, 1, 36),
(50, 747, 1, 37),
(51, 810, 1, 38),
(52, 811, 1, 38),
(53, 113, 1, 39),
(57, 113, 1, 41),
(58, 128, 1, 41),
(59, 137, 1, 41),
(60, 554, 1, 41),
(61, 555, 1, 41),
(62, 630, 1, 42),
(63, 629, 1, 42),
(64, 357, 1, 42),
(67, 228, 1, 45),
(68, 130, 1, 45),
(69, 557, 1, 46),
(70, 805, 1, 46),
(71, 85, 1, 47),
(72, 339, 1, 48),
(73, 884, 1, 49),
(74, 882, 1, 49),
(75, 883, 1, 49),
(76, 580, 1, 50),
(77, 244, 1, 50),
(78, 171, 1, 51),
(79, 52, 1, 51),
(80, 127, 1, 51),
(83, 885, 1, 53),
(84, 234, 1, 54),
(85, 450, 1, 55),
(86, 521, 1, 56),
(87, 822, 1, 57),
(88, 823, 1, 58),
(89, 750, 1, 59),
(90, 536, 1, 60),
(91, 691, 1, 60),
(92, 140, 1, 61),
(93, 368, 2, 62),
(94, 367, 1, 62),
(95, 713, 1, 63),
(96, 712, 1, 63),
(97, 714, 1, 63),
(98, 749, 2, 64),
(99, 750, 1, 64),
(100, 260, 1, 65),
(102, 735, 1, 67),
(103, 724, 1, 67),
(104, 328, 1, 68),
(106, 316, 1, 69),
(107, 341, 1, 69),
(108, 708, 1, 70),
(109, 749, 2, 71),
(110, 750, 1, 71),
(111, 749, 2, 72),
(112, 750, 1, 72),
(113, 747, 2, 72),
(114, 632, 1, 73),
(115, 336, 1, 74),
(116, 496, 1, 75),
(117, 929, 1, 76),
(118, 925, 1, 77),
(119, 980, 1, 78),
(120, 939, 1, 79),
(121, 118, 1, 80),
(122, 109, 1, 81),
(123, 524, 1, 82),
(124, 534, 1, 82),
(125, 704, 1, 83),
(126, 349, 1, 84),
(127, 184, 1, 85),
(128, 129, 1, 85),
(129, 323, 1, 86),
(130, 318, 1, 87),
(131, 274, 1, 87),
(132, 120, 1, 88),
(133, 323, 1, 89),
(134, 371, 1, 90),
(135, 312, 1, 90),
(136, 363, 1, 91),
(138, 438, 1, 92),
(139, 547, 1, 93),
(140, 378, 1, 94),
(141, 162, 1, 95),
(142, 335, 1, 96),
(143, 1087, 1, 97),
(144, 895, 1, 98),
(145, 135, 1, 99),
(146, 535, 1, 100),
(147, 1081, 1, 101),
(148, 1084, 1, 101),
(149, 943, 1, 102),
(150, 545, 1, 103),
(153, 1366, 1, 105),
(154, 490, 1, 106),
(155, 64, 1, 107),
(157, 1297, 1, 109),
(158, 1295, 1, 109),
(159, 1296, 2, 109),
(161, 215, 1, 111),
(162, 61, 1, 112),
(163, 379, 1, 113),
(164, 368, 1, 114),
(165, 946, 1, 115),
(166, 1364, 1, 115);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta_T`
--

CREATE TABLE `Venta_T` (
  `ID_Destino` int NOT NULL,
  `Destino` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Venta_T`
--

INSERT INTO `Venta_T` (`ID_Destino`, `Destino`) VALUES
(1, 'Venta'),
(2, 'Credito'),
(3, 'Apartado'),
(4, 'Cambio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ZMisc`
--

CREATE TABLE `ZMisc` (
  `ID_Misc` int NOT NULL,
  `ID_Sucursal` int NOT NULL,
  `ID_Personal` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `ZMisc`
--

INSERT INTO `ZMisc` (`ID_Misc`, `ID_Sucursal`, `ID_Personal`, `Fecha`, `Corte`) VALUES
(1, 5, 1, '2022-03-01', 0),
(5, 5, 3, '2022-03-21', 0),
(6, 5, 3, '2022-03-23', 0),
(7, 5, 3, '2022-03-24', 0),
(8, 5, 3, '2022-03-27', 0),
(9, 5, 3, '2022-03-28', 0),
(10, 5, 3, '2022-03-29', 0),
(11, 5, 4, '2022-03-30', 0),
(12, 5, 3, '2022-03-31', 0),
(13, 5, 3, '2022-04-02', 0),
(14, 5, 3, '2022-04-03', 0),
(15, 5, 3, '2022-04-04', 0),
(16, 5, 4, '2022-04-05', 0),
(17, 5, 4, '2022-04-06', 0),
(18, 5, 3, '2022-04-07', 0),
(19, 5, 4, '2022-04-08', 0),
(20, 5, 4, '2022-04-09', 0),
(21, 5, 3, '2022-04-10', 0),
(22, 5, 4, '2022-04-11', 0),
(23, 5, 4, '2022-04-12', 0),
(24, 5, 3, '2022-04-13', 0),
(25, 5, 3, '2022-04-14', 0),
(26, 5, 3, '2022-04-15', 0),
(27, 5, 3, '2022-04-16', 0),
(28, 5, 4, '2022-04-17', 0),
(29, 5, 4, '2022-04-18', 0),
(30, 5, 4, '2022-04-19', 0),
(31, 5, 4, '2022-04-20', 0),
(32, 5, 4, '2022-04-21', 0),
(33, 5, 4, '2022-04-22', 0),
(34, 5, 4, '2022-04-23', 0),
(35, 5, 4, '2022-04-24', 0),
(36, 5, 4, '2022-04-25', 0),
(37, 5, 4, '2022-04-26', 0),
(38, 5, 4, '2022-04-27', 0),
(39, 5, 4, '2022-04-28', 0),
(40, 5, 4, '2022-04-29', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Abonos`
--
ALTER TABLE `Abonos`
  ADD PRIMARY KEY (`ID_Abono`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- Indices de la tabla `Caja`
--
ALTER TABLE `Caja`
  ADD PRIMARY KEY (`ID_Caja`),
  ADD KEY `ID_Caja_T` (`ID_Caja_T`),
  ADD KEY `ID_Personal` (`ID_Personal`);

--
-- Indices de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  ADD PRIMARY KEY (`ID_Caja_T`);

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  ADD PRIMARY KEY (`ID_Cuentas`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `Cupon`
--
ALTER TABLE `Cupon`
  ADD PRIMARY KEY (`ID_Cupon`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- Indices de la tabla `Deudas`
--
ALTER TABLE `Deudas`
  ADD PRIMARY KEY (`ID_Deuda`);

--
-- Indices de la tabla `Medio_Pago`
--
ALTER TABLE `Medio_Pago`
  ADD PRIMARY KEY (`ID_Medio`);

--
-- Indices de la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD PRIMARY KEY (`ID_Personal`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`),
  ADD KEY `ID_Puesto` (`ID_Puesto`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`,`ID_Categoria`),
  ADD KEY `ID_Categoria` (`ID_Categoria`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Proveedor_2` (`ID_Proveedor`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  ADD PRIMARY KEY (`ID_Puesto`);

--
-- Indices de la tabla `Sucursales`
--
ALTER TABLE `Sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Personal` (`ID_Personal`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `Caja` (`Caja`),
  ADD KEY `ID_Medio` (`ID_Medio`),
  ADD KEY `ID_Venta_T` (`ID_Destino`);

--
-- Indices de la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- Indices de la tabla `Venta_T`
--
ALTER TABLE `Venta_T`
  ADD PRIMARY KEY (`ID_Destino`);

--
-- Indices de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  ADD PRIMARY KEY (`ID_Misc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Abonos`
--
ALTER TABLE `Abonos`
  MODIFY `ID_Abono` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `Caja`
--
ALTER TABLE `Caja`
  MODIFY `ID_Caja` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  MODIFY `ID_Caja_T` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `ID_Categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `ID_Cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  MODIFY `ID_Cuentas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cupon`
--
ALTER TABLE `Cupon`
  MODIFY `ID_Cupon` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Deudas`
--
ALTER TABLE `Deudas`
  MODIFY `ID_Deuda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `Medio_Pago`
--
ALTER TABLE `Medio_Pago`
  MODIFY `ID_Medio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Personal`
--
ALTER TABLE `Personal`
  MODIFY `ID_Personal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `ID_Producto` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1367;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `ID_Proveedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  MODIFY `ID_Puesto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Sucursales`
--
ALTER TABLE `Sucursales`
  MODIFY `ID_Sucursal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `ID_Venta` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  MODIFY `ID_Detalle` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de la tabla `Venta_T`
--
ALTER TABLE `Venta_T`
  MODIFY `ID_Destino` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Caja`
--
ALTER TABLE `Caja`
  ADD CONSTRAINT `Caja_ibfk_2` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Caja_ibfk_3` FOREIGN KEY (`ID_Caja_T`) REFERENCES `Caja_T` (`ID_Caja_T`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  ADD CONSTRAINT `Cuentas_Prove_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `Proveedores` (`ID_Proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Cupon`
--
ALTER TABLE `Cupon`
  ADD CONSTRAINT `cupon_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD CONSTRAINT `Personal_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Personal_ibfk_2` FOREIGN KEY (`ID_Puesto`) REFERENCES `Puestos` (`ID_Puesto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Productos_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categorias` (`ID_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes` (`ID_Cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`ID_Personal`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_3` FOREIGN KEY (`ID_Medio`) REFERENCES `Medio_Pago` (`ID_Medio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_4` FOREIGN KEY (`ID_Destino`) REFERENCES `Venta_T` (`ID_Destino`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_5` FOREIGN KEY (`Caja`) REFERENCES `Personal` (`ID_Personal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  ADD CONSTRAINT `Venta_Detalle_ibfk_2` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`) ON DELETE CASCADE,
  ADD CONSTRAINT `Venta_Detalle_ibfk_3` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
