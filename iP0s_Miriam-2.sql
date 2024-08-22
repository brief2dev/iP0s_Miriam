-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 29-03-2022 a las 15:12:07
-- Versión del servidor: 5.7.34
-- Versión de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iP0s_Miriam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Abonos`
--

CREATE TABLE `Abonos` (
  `ID_Abono` int(11) NOT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Saldo_Ant` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Saldo_Pend` double DEFAULT NULL,
  `Estatus` int(11) DEFAULT NULL COMMENT '1=Fianlizado, 0 Pendiente',
  `ID_Medio` int(11) DEFAULT NULL COMMENT '1=Venta,2=Credito,3=Apartado',
  `Fecha_Final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja`
--

CREATE TABLE `Caja` (
  `ID_Caja` int(11) NOT NULL,
  `ID_Personal` int(11) DEFAULT NULL,
  `ID_Caja_T` int(11) DEFAULT NULL,
  `Descripcion` varchar(160) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Monto` double NOT NULL,
  `Abono` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Tarjeta` decimal(8,2) DEFAULT NULL,
  `Gastos` decimal(8,2) DEFAULT NULL,
  `S_Inicial` decimal(8,2) DEFAULT NULL,
  `T_Ventas` int(11) DEFAULT NULL,
  `Comprobante` mediumblob,
  `Saldo` decimal(10,0) DEFAULT NULL,
  `Cort` int(11) DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Saldo_Inicial` int(11) DEFAULT '0' COMMENT '0=NO, 1=SI',
  `Tip` int(11) DEFAULT NULL COMMENT '1=efectivo 2=banco',
  `idcorte` int(11) DEFAULT NULL,
  `ms` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caja_T`
--

CREATE TABLE `Caja_T` (
  `ID_Caja_T` int(11) NOT NULL,
  `Motivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `ID_Categoria` int(11) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Descripcion` varchar(750) DEFAULT NULL,
  `Importado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombres` varchar(120) NOT NULL,
  `Apellidos` varchar(120) DEFAULT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `CP` int(6) DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `visible` int(11) DEFAULT '1',
  `Credito` double DEFAULT NULL COMMENT '$$$',
  `Premium` int(11) DEFAULT NULL COMMENT '0=NO,1=SI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuentas_Prove`
--

CREATE TABLE `Cuentas_Prove` (
  `ID_Cuentas` int(11) NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `Banco` varchar(30) NOT NULL,
  `Numero` varchar(16) NOT NULL,
  `Targeta` varchar(16) NOT NULL,
  `Clabe` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cupon`
--

CREATE TABLE `Cupon` (
  `ID_Cupon` int(11) NOT NULL,
  `ID_Venta` bigint(20) UNSIGNED NOT NULL,
  `Fecha_Gen` date NOT NULL,
  `Fecha_Exp` date NOT NULL,
  `Valor` int(11) NOT NULL,
  `Usado` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Deudas`
--

CREATE TABLE `Deudas` (
  `ID_Deuda` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Credito` int(11) DEFAULT NULL COMMENT 'ID Abono',
  `ID_Personal` int(11) DEFAULT NULL,
  `Anterior` double DEFAULT NULL,
  `Abono` double DEFAULT NULL,
  `Pendiente` double DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Medio` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL COMMENT '0=deuda, 1=liquidado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medio_Pago`
--

CREATE TABLE `Medio_Pago` (
  `ID_Medio` int(11) NOT NULL,
  `Tipo` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `ID_Personal` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Bio` varchar(80) DEFAULT NULL,
  `Direccion` varchar(90) DEFAULT NULL,
  `Colonia` varchar(90) DEFAULT NULL,
  `CP` int(7) DEFAULT NULL,
  `Correo` varchar(35) DEFAULT NULL,
  `Pass` varchar(10) NOT NULL,
  `Telefono` varchar(13) DEFAULT NULL,
  `Foto` varchar(254) DEFAULT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  `ID_Puesto` int(11) NOT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `Baja` int(11) DEFAULT NULL COMMENT '0=No, 1=Si',
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Personal`
--

INSERT INTO `Personal` (`ID_Personal`, `Nombre`, `Apellido`, `Bio`, `Direccion`, `Colonia`, `CP`, `Correo`, `Pass`, `Telefono`, `Foto`, `ID_Sucursal`, `ID_Puesto`, `Fecha_Registro`, `Baja`, `visible`) VALUES
(3, 'admin', 'sys', NULL, '4434d', NULL, NULL, 'mmd@', 'Blitzc0de', '9971259967', 'lib/Personal/img/blitzc0de_log.png', 5, 2, '2021-10-14', 0, 1),
(4, 'Vendedor1', NULL, NULL, 'c 232 ksd 8836 x 66', NULL, NULL, 'vendedor@mail.com', '12', '999999', 'lib/Personal/img/FB2F7934-4C91-4055-8DBB-493452C6F6B2.jpeg', 5, 4, '2022-03-13', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `ID_Producto` bigint(20) UNSIGNED NOT NULL,
  `Codigo` varchar(255) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `PrecioVenta` decimal(8,2) DEFAULT NULL,
  `PrecioCompra` decimal(8,2) DEFAULT NULL,
  `Existencia` int(11) NOT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  `ID_Categoria` int(11) NOT NULL,
  `Fecha_Ingreso` datetime DEFAULT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `Importado` varchar(50) DEFAULT NULL,
  `visto` int(11) DEFAULT '0',
  `can` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Puestos`
--

CREATE TABLE `Puestos` (
  `ID_Puesto` int(11) NOT NULL,
  `Cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `ID_Sucursal` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `RFC` varchar(40) DEFAULT NULL,
  `Municipio` varchar(90) DEFAULT NULL,
  `Estado` varchar(40) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Colonia` varchar(65) DEFAULT NULL,
  `Cp` int(6) DEFAULT NULL,
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
  `visible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `ID_Venta` bigint(20) UNSIGNED NOT NULL,
  `ID_Personal` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Caja` int(11) NOT NULL,
  `ID_Medio` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Descuento_efect` decimal(8,2) DEFAULT NULL,
  `Descuento_porcent` double DEFAULT NULL,
  `Subtotal` decimal(8,2) DEFAULT NULL,
  `IVA` double DEFAULT NULL,
  `Total` decimal(8,2) DEFAULT NULL,
  `Efectivo` decimal(8,2) DEFAULT NULL,
  `Cambio` decimal(8,2) DEFAULT NULL,
  `ID_Destino` int(11) NOT NULL,
  `Comentarios` varchar(200) DEFAULT NULL,
  `Cort` int(11) DEFAULT NULL,
  `idcorte` int(11) DEFAULT NULL,
  `Liquidar` int(11) DEFAULT '0' COMMENT 'si ya liquido la deuda lleva "1" de valor	',
  `Fecha_Fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta_Detalle`
--

CREATE TABLE `Venta_Detalle` (
  `ID_Detalle` bigint(20) UNSIGNED NOT NULL,
  `ID_Producto` bigint(20) UNSIGNED NOT NULL,
  `Cantidad` bigint(20) UNSIGNED NOT NULL,
  `ID_Venta` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta_T`
--

CREATE TABLE `Venta_T` (
  `ID_Destino` int(11) NOT NULL,
  `Destino` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `ID_Misc` int(11) NOT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  `ID_Personal` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Corte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ZMisc`
--

INSERT INTO `ZMisc` (`ID_Misc`, `ID_Sucursal`, `ID_Personal`, `Fecha`, `Corte`) VALUES
(1, 5, 1, '2022-03-01', 0),
(5, 5, 3, '2022-03-21', 0),
(6, 5, 3, '2022-03-23', 0),
(7, 5, 3, '2022-03-24', 0),
(8, 5, 3, '2022-03-27', 0),
(9, 5, 3, '2022-03-28', 0);

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
  MODIFY `ID_Abono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Caja`
--
ALTER TABLE `Caja`
  MODIFY `ID_Caja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Caja_T`
--
ALTER TABLE `Caja_T`
  MODIFY `ID_Caja_T` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cuentas_Prove`
--
ALTER TABLE `Cuentas_Prove`
  MODIFY `ID_Cuentas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cupon`
--
ALTER TABLE `Cupon`
  MODIFY `ID_Cupon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Deudas`
--
ALTER TABLE `Deudas`
  MODIFY `ID_Deuda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Medio_Pago`
--
ALTER TABLE `Medio_Pago`
  MODIFY `ID_Medio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Personal`
--
ALTER TABLE `Personal`
  MODIFY `ID_Personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `ID_Producto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Puestos`
--
ALTER TABLE `Puestos`
  MODIFY `ID_Puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Sucursales`
--
ALTER TABLE `Sucursales`
  MODIFY `ID_Sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `ID_Venta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Venta_Detalle`
--
ALTER TABLE `Venta_Detalle`
  MODIFY `ID_Detalle` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Venta_T`
--
ALTER TABLE `Venta_T`
  MODIFY `ID_Destino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ZMisc`
--
ALTER TABLE `ZMisc`
  MODIFY `ID_Misc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
