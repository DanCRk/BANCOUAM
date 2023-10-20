-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2023 a las 04:42:25
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS bancouam;
-- Crear la base de datos "bancouam" si no existe
CREATE DATABASE IF NOT EXISTS bancouam;

USE bancouam;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bancouam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` int(11) NOT NULL,
  `numero_cuenta` varchar(20) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `numero_cuenta`, `saldo`, `fecha_apertura`, `id_usuario`) VALUES
(31, '87202220070235884596', 1264576.00, '2023-10-08', 33),
(32, '15960706894002615987', 760000.00, '2023-10-08', 34),
(33, '57107920980164841016', 1000000.00, '2023-10-08', 35),
(34, '78435993822747589374', 824000.00, '2023-10-09', 36),
(36, '88088745305182603191', 982435.00, '2023-10-09', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `tasa_interes` decimal(5,2) NOT NULL,
  `plazo` int(11) NOT NULL,
  `fecha_desembolso` date NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `pago_mensual` decimal(10,2) NOT NULL,
  `pagos_realizados` int(11) NOT NULL,
  `atraso` tinyint(1) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `monto`, `tasa_interes`, `plazo`, `fecha_desembolso`, `fecha_pago`, `pago_mensual`, `pagos_realizados`, `atraso`, `id_usuario`) VALUES
(55, 60000.00, 0.05, 12, '2023-10-08', NULL, 5000.00, 0, 0, 33),
(56, 60000.00, 0.05, 12, '2023-10-08', '2023-10-08', 5000.00, 4, 0, 34),
(61, 60000.00, 0.05, 12, '2023-10-09', NULL, 5000.00, 0, 0, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta_credito`
--

CREATE TABLE `tarjeta_credito` (
  `id_tarjeta_credito` int(11) NOT NULL,
  `numero_tarjeta` varchar(16) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `limite_credito` decimal(10,2) NOT NULL,
  `saldo_actual` decimal(10,2) NOT NULL,
  `fecha_corte` date NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjeta_credito`
--

INSERT INTO `tarjeta_credito` (`id_tarjeta_credito`, `numero_tarjeta`, `fecha_vencimiento`, `limite_credito`, `saldo_actual`, `fecha_corte`, `id_usuario`) VALUES
(32, '00114366142549', '2027-04-08', 22000.00, 0.00, '2023-11-08', 33),
(33, '15757075475686', '2027-04-08', 40100.00, 0.00, '2023-11-08', 34),
(34, '23160581233245', '2027-04-09', 60000.00, 0.00, '2023-11-09', 36),
(36, '37695703118099', '2027-04-09', 20021.00, 0.00, '2023-11-09', 38),
(38, '64678514975501', '2027-04-09', 20000.00, 0.00, '2023-11-09', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transaccion` int(11) NOT NULL,
  `fecha_transaccion` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  `cuenta_remitente_id` int(11) DEFAULT NULL,
  `cuenta_destinataria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id_transaccion`, `fecha_transaccion`, `monto`, `concepto`, `descripcion`, `tipo`, `cuenta_remitente_id`, `cuenta_destinataria_id`) VALUES
(78, '2023-10-08 17:56:13', 5000.00, 'Pago a Prestamo', '1', 3, 31, NULL),
(79, '2023-10-08 17:56:16', 5000.00, 'Pago a Prestamo', '12', 3, 31, NULL),
(80, '2023-10-08 17:56:18', 5000.00, 'Pago a Prestamo', '123', 3, 31, NULL),
(81, '2023-10-08 17:56:19', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(82, '2023-10-08 17:56:20', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(83, '2023-10-08 17:56:21', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(84, '2023-10-08 17:56:23', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(85, '2023-10-08 17:56:24', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(86, '2023-10-08 17:56:25', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(87, '2023-10-08 17:56:26', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(88, '2023-10-08 17:56:28', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(89, '2023-10-08 17:56:29', 5000.00, 'Pago a Prestamo', '1234', 3, 31, NULL),
(90, '2023-10-08 17:56:42', 57000.00, 'Abono a cuenta Prestamo', 'Se abona la cantidad del prestamo solicitado descontando intereses', 0, NULL, 31),
(91, '2023-10-08 19:17:12', 5000.00, 'Pago a Prestamo', 'sdsfdfsd', 3, 31, NULL),
(92, '2023-10-08 19:17:22', 57000.00, 'Abono a cuenta Prestamo', 'Se abona la cantidad del prestamo solicitado descontando intereses', 0, NULL, 31),
(93, '2023-10-08 22:06:12', 100.00, 'pago credito', 'pago credito', 2, 32, NULL),
(94, '2023-10-08 22:21:10', 100000.00, 'carro', 'carro', 0, 32, 31),
(95, '2023-10-08 22:23:52', 99900.00, 'transferencia hipoteca', 'transferencia hipoteca', 0, 32, 31),
(96, '2023-10-08 22:25:05', 5000.00, 'Pago a Prestamo', 'prestamo 2', 3, 32, NULL),
(97, '2023-10-08 22:26:50', 5000.00, 'Pago a Prestamo', 'pago 2 prestamo 2', 3, 32, NULL),
(98, '2023-10-08 22:26:51', 5000.00, 'Pago a Prestamo', 'pago 2 prestamo 2', 3, 32, NULL),
(99, '2023-10-08 22:34:23', 20000.00, 'pago 2', 'pago2', 2, 32, NULL),
(100, '2023-10-08 22:44:17', 5000.00, 'Pago a Prestamo', 'pago 3', 3, 32, NULL),
(101, '2023-10-09 13:26:27', 10000.00, 'pago1', 'pago1', 2, 34, NULL),
(102, '2023-10-09 13:27:56', 5000.00, 'Pago a Prestamo', 'abono de prestamo 1', 3, 34, NULL),
(103, '2023-10-09 13:28:36', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(104, '2023-10-09 13:28:39', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(105, '2023-10-09 13:28:41', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(106, '2023-10-09 13:28:43', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(107, '2023-10-09 13:28:45', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(108, '2023-10-09 13:28:47', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(109, '2023-10-09 13:28:49', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(110, '2023-10-09 13:28:51', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(111, '2023-10-09 13:28:53', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(112, '2023-10-09 13:28:55', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(113, '2023-10-09 13:28:56', 5000.00, 'Pago a Prestamo', 'pago a prestamos', 3, 34, NULL),
(114, '2023-10-09 13:30:13', 10000.00, 'transferencia a daniel', 'tranferencia', 0, 34, 31),
(115, '2023-10-09 13:31:14', 10000.00, 'pago 2 tarjeta de credito', 'pago', 2, 34, NULL),
(116, '2023-10-09 13:32:30', 5000.00, 'Pago a Prestamo', 'pago del prestamo 2', 3, 34, NULL),
(117, '2023-10-09 13:32:33', 5000.00, 'Pago a Prestamo', 'pago del prestamo 2', 3, 34, NULL),
(118, '2023-10-09 13:32:35', 5000.00, 'Pago a Prestamo', 'pago del prestamo 2', 3, 34, NULL),
(119, '2023-10-09 13:32:37', 5000.00, 'Pago a Prestamo', 'pago del prestamo 2', 3, 34, NULL),
(120, '2023-10-09 13:32:39', 5000.00, 'Pago a Prestamo', 'pago del prestamo 2', 3, 34, NULL),
(121, '2023-10-09 13:46:48', 5000.00, 'Pago a Prestamo', 'pago2', 3, 34, NULL),
(122, '2023-10-09 13:46:50', 5000.00, 'Pago a Prestamo', 'pago2', 3, 34, NULL),
(123, '2023-10-09 13:46:52', 5000.00, 'Pago a Prestamo', 'pago2', 3, 34, NULL),
(124, '2023-10-09 13:46:54', 5000.00, 'Pago a Prestamo', 'pago2', 3, 34, NULL),
(125, '2023-10-09 13:46:56', 5000.00, 'Pago a Prestamo', 'pago2', 3, 34, NULL),
(126, '2023-10-09 13:46:57', 5000.00, 'Pago a Prestamo', 'pago2', 3, 34, NULL),
(127, '2023-10-09 13:46:59', 5000.00, 'Pago a Prestamo', 'pago2', 3, 34, NULL),
(128, '2023-10-09 14:05:42', 5000.00, 'Pago a Prestamo', 'pago3', 3, 34, NULL),
(129, '2023-10-09 14:05:46', 5000.00, 'Pago a Prestamo', 'pago3', 3, 34, NULL),
(130, '2023-10-09 14:05:48', 5000.00, 'Pago a Prestamo', 'pago3', 3, 34, NULL),
(131, '2023-10-09 14:05:51', 5000.00, 'Pago a Prestamo', 'pago3', 3, 34, NULL),
(132, '2023-10-09 14:05:53', 5000.00, 'Pago a Prestamo', 'pago3', 3, 34, NULL),
(133, '2023-10-09 14:05:56', 5000.00, 'Pago a Prestamo', 'pago3', 3, 34, NULL),
(134, '2023-10-09 14:05:59', 5000.00, 'Pago a Prestamo', 'pago3', 3, 34, NULL),
(135, '2023-10-09 14:06:17', 5000.00, 'Pago a Prestamo', 'prestamo5pago', 3, 34, NULL),
(136, '2023-10-09 14:06:20', 5000.00, 'Pago a Prestamo', 'prestamo5pago', 3, 34, NULL),
(137, '2023-10-09 14:06:22', 5000.00, 'Pago a Prestamo', 'prestamo5pago', 3, 34, NULL),
(138, '2023-10-09 14:06:24', 5000.00, 'Pago a Prestamo', 'prestamo5pago', 3, 34, NULL),
(139, '2023-10-09 14:06:26', 5000.00, 'Pago a Prestamo', 'prestamo5pago', 3, 34, NULL),
(140, '2023-10-09 14:07:02', 57000.00, 'Abono a cuenta Prestamo', 'Se abona la cantidad del prestamo solicitado descontando intereses', 0, NULL, 34),
(141, '2023-10-09 14:22:20', 10000.00, 'pago tarjeta de credito', 'pago tarjeta de credito', 2, 34, NULL),
(142, '2023-10-09 14:23:23', 10000.00, 'pago a tarjeta de credito1', 'pago a tarjeta de credito', 2, 34, NULL),
(143, '2023-10-09 14:24:08', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(144, '2023-10-09 14:24:12', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(145, '2023-10-09 14:24:14', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(146, '2023-10-09 14:24:16', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(147, '2023-10-09 14:24:18', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(148, '2023-10-09 14:24:20', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(149, '2023-10-09 14:24:23', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(150, '2023-10-09 14:24:25', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(151, '2023-10-09 14:24:28', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(152, '2023-10-09 14:24:30', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(153, '2023-10-09 14:24:32', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(154, '2023-10-09 14:24:34', 5000.00, 'Pago a Prestamo', 'pago prestamo 10', 3, 34, NULL),
(156, '2023-10-09 14:24:55', 57000.00, 'Abono a cuenta Prestamo', 'Se abona la cantidad del prestamo solicitado descontando intereses', 0, NULL, 34),
(158, '2023-10-09 14:24:55', 57000.00, 'Compra con tarjeta credito', 'Compra 2', 4, 31, NULL),
(159, '2023-10-09 16:35:46', 2000.00, 'Pago Tarjeta de credito', 'SDFSFSF', 2, 31, NULL),
(163, '2023-10-09 18:54:36', 7676.00, '676', '67676', 0, 36, 31),
(164, '2023-10-09 18:55:10', 57000.00, 'Abono a cuenta Prestamo', 'Se abona la cantidad del prestamo solicitado descontando intereses', 0, NULL, 36),
(165, '2023-10-09 18:55:42', 5000.00, 'Pago a Prestamo', '7787', 3, 36, NULL),
(166, '2023-10-09 18:55:56', 6868.00, '6868', '868778', 4, 36, NULL),
(167, '2023-10-09 18:57:11', 6889.00, '7897', '787878', 2, 36, NULL),
(168, '2023-10-09 18:58:01', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(169, '2023-10-09 18:58:08', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(170, '2023-10-09 18:58:10', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(171, '2023-10-09 18:58:12', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(172, '2023-10-09 18:58:14', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(173, '2023-10-09 18:58:15', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(174, '2023-10-09 18:58:17', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(175, '2023-10-09 18:58:19', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(176, '2023-10-09 18:58:21', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(177, '2023-10-09 18:58:22', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL),
(178, '2023-10-09 18:58:24', 5000.00, 'Pago a Prestamo', '55555', 3, 36, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(200) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `contraseña`, `direccion`, `fecha_nacimiento`, `fecha_creacion`, `fecha_ultimo_acceso`) VALUES
(33, 'daniel', 'Avila', 'prueba@gmail.com', 'wEiAW4r0ivEk1AsPWzYOJg==', 'calle siempreviva avenida la condesa', '2001-06-13', '2023-10-08 17:50:45', '2023-10-09 19:23:10'),
(34, 'gerardo', 'acevedo', 'gerardo@gmail.com', '7e8xAypfC0wbBZh8l/XNHA==', 'flores magon sin numero', '1986-10-10', '2023-10-08 22:05:03', '2023-10-08 22:08:12'),
(35, 'Alberto', 'rojas', 'alberto@gmail.com', 'FWvZSziSnjhQJ276PC1GUw==', 'calle benito juarez 10', '1999-08-28', '2023-10-08 22:47:40', '2023-10-09 20:28:57'),
(36, 'Usuario', 'prueba prueba', 'usuario@gmail.com', 'kCI053i7xp50KbThp/LV3w==', 'avenida los girasoles privada', '1995-06-07', '2023-10-09 13:24:39', '2023-10-09 20:16:34'),
(38, 'rubi ', 'montoya', 'crisrubi81@gmail.com', 'wEiAW4r0ivEk1AsPWzYOJg==', 'RyuTec rio totolinga mz 33 lote 7', '1981-10-22', '2023-10-09 18:51:56', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD UNIQUE KEY `numero_cuenta` (`numero_cuenta`),
  ADD KEY `FK_usuario` (`id_usuario`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tarjeta_credito`
--
ALTER TABLE `tarjeta_credito`
  ADD PRIMARY KEY (`id_tarjeta_credito`),
  ADD UNIQUE KEY `numero_tarjeta` (`numero_tarjeta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `cuenta_remitente_id` (`cuenta_remitente_id`),
  ADD KEY `cuenta_destinataria_id` (`cuenta_destinataria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `tarjeta_credito`
--
ALTER TABLE `tarjeta_credito`
  MODIFY `id_tarjeta_credito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tarjeta_credito`
--
ALTER TABLE `tarjeta_credito`
  ADD CONSTRAINT `tarjeta_credito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`cuenta_remitente_id`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`cuenta_destinataria_id`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
