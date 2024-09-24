-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2024 a las 04:44:45
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `texfashion_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceder`
--

CREATE TABLE `acceder` (
  `idIniciar_Sesion` int(11) NOT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acceder`
--

INSERT INTO `acceder` (`idIniciar_Sesion`, `Usuario`, `Contraseña`, `idUsuario`) VALUES
(1, 'Jefe', 'Jefe1234!', 1),
(2, 'Luna', 'LunaPass1!', 2),
(3, 'María Estela', 'Estela789!', 3),
(4, 'Diana Paola', 'Diana456!', 4),
(5, 'Rubiela', 'Rubiela123!', 5),
(6, 'Hilda', 'Hilda789!', 6),
(7, 'Ana Lucia', 'AnaPass456!', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstados` int(11) NOT NULL,
  `Estados` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstados`, `Estados`) VALUES
(1, 'Disponible'),
(2, 'No_Disponible'),
(3, 'Habilitada'),
(4, 'No_habilitada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Informacion_del_Producto` int(11) DEFAULT NULL,
  `Fecha_de_Emision` date DEFAULT NULL,
  `Precio_Total` float DEFAULT NULL,
  `Numero_Factura` varchar(100) DEFAULT NULL,
  `Nombre_Cliente` varchar(45) DEFAULT NULL,
  `Direccion_Facturacion` varchar(45) DEFAULT NULL,
  `Estado_Factura` varchar(45) DEFAULT NULL,
  `Fecha_Pago` date DEFAULT NULL,
  `Referencia_Pago` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFacturas`, `Cantidad`, `Informacion_del_Producto`, `Fecha_de_Emision`, `Precio_Total`, `Numero_Factura`, `Nombre_Cliente`, `Direccion_Facturacion`, `Estado_Factura`, `Fecha_Pago`, `Referencia_Pago`) VALUES
(1, 500, 1, '2024-08-01', 500000, 'F-1001', 'Yeray Vargas Calderón', 'Calle 45 #23-56, Bogotá', 'Pagado', '2024-08-15', 'R-12345'),
(2, 300, 2, '2024-08-05', 450000, 'F-1002', 'Luna Camacho Vargas', 'Carrera 78 #14-25, Medellín', 'Pendiente', NULL, NULL),
(3, 150, 3, '2024-08-10', 300000, 'F-1003', 'María Estela Calderón', 'Avenida 3 #45-12, Cali', 'Pagado', '2024-08-20', 'R-12346'),
(4, 100, 4, '2024-08-12', 250000, 'F-1004', 'Diana Paola Calderón', 'Calle 10 #20-30, Cartagena', 'Pendiente', NULL, NULL),
(5, 200, 5, '2024-08-15', 600000, 'F-1005', 'Rubiela Paez', 'Carrera 12 #34-56, Bucaramanga', 'Pagado', '2024-09-01', 'R-12347');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `idProducto` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Precio_Unidad` float DEFAULT NULL,
  `Cantidad_Stock` int(7) DEFAULT NULL,
  `id_Proveedor` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Unidad_Medida` varchar(45) DEFAULT NULL,
  `Fecha_Actualizacion` date DEFAULT NULL,
  `Estado` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`idProducto`, `Nombre`, `Descripcion`, `Fecha_Ingreso`, `Precio_Unidad`, `Cantidad_Stock`, `id_Proveedor`, `Categoria`, `Unidad_Medida`, `Fecha_Actualizacion`, `Estado`) VALUES
(1, 'Algodón', 'Tela de algodón, color blanco', '2024-07-20', 5000, 1000, '1', 'Textil', 'kg', '2024-07-30', 1),
(2, 'Mezclilla', 'Tela de mezclilla, color azul', '2024-07-22', 7000, 800, '2', 'Textil', 'kg', '2024-07-31', 1),
(3, 'Cuero Sintético', 'Material sintético, color negro', '2024-07-25', 12000, 500, '3', 'Material', 'm²', '2024-08-01', 1),
(4, 'Seda', 'Tela de seda, color rojo', '2024-07-27', 15000, 300, '4', 'Textil', 'm²', '2024-08-03', 1),
(5, 'Cuero Natural', 'Cuero natural, color marrón', '2024-07-30', 18000, 400, '5', 'Material', 'm²', '2024-08-05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `Fecha_Orden` date DEFAULT NULL,
  `Total_Total` double DEFAULT NULL,
  `Documento_Cliente` varchar(45) DEFAULT NULL,
  `Cantidad_Producto` varchar(45) DEFAULT NULL,
  `Estado` int(50) DEFAULT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `idProductosTerminados` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`idOrden`, `Fecha_Orden`, `Total_Total`, `Documento_Cliente`, `Cantidad_Producto`, `Estado`, `Fecha_Entrega`, `idProductosTerminados`) VALUES
(1, '2024-08-01', 1000000, 'CC 1012345678', '500', 1, '2024-08-15', 1),
(2, '2024-08-05', 1500000, 'CC 1018765432', '300', 2, '2024-08-20', 2),
(3, '2024-08-10', 2000000, 'CC 1023456789', '150', 3, '2024-08-25', 3),
(4, '2024-08-12', 2500000, 'CC 1034567890', '100', 2, '2024-08-30', 4),
(5, '2024-08-15', 3000000, 'CC 1045678901', '200', 1, '2024-09-01', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `ID_Produccion` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `ID_MateriaPrima` int(11) DEFAULT NULL,
  `Cantidad_Usada` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_terminados`
--

CREATE TABLE `productos_terminados` (
  `idProductos` int(11) NOT NULL,
  `Nombre_Producto` varchar(45) DEFAULT NULL,
  `Cantidad_Disponible` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Fecha_Entrada` date DEFAULT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `idmateria_prima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_terminados`
--

INSERT INTO `productos_terminados` (`idProductos`, `Nombre_Producto`, `Cantidad_Disponible`, `Descripcion`, `Fecha_Entrada`, `Fecha_Salida`, `idmateria_prima`) VALUES
(1, 'Camiseta Básica', '500', 'Camiseta de algodón, color blanco', '2024-08-01', '2024-08-15', 1),
(2, 'Jean Slim Fit', '300', 'Jean de mezclilla, color azul', '2024-08-05', '2024-08-20', 2),
(3, 'Chaqueta de Cuero', '150', 'Chaqueta de cuero sintético, color negro', '2024-08-10', '2024-08-25', 3),
(4, 'Vestido de Noche', '100', 'Vestido largo, color rojo', '2024-08-12', '2024-08-30', 4),
(5, 'Zapatos de Cuero', '200', 'Zapatos formales, color marrón', '2024-08-15', '2024-09-01', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedores` int(11) NOT NULL,
  `NombreEmpresa` date DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `NIT` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedores`, `NombreEmpresa`, `Telefono`, `NIT`, `Direccion`, `idProducto`) VALUES
(1, '0000-00-00', '3102067080', '900123456', 'Calle 100 #15-50, Bogotá', 1),
(2, '0000-00-00', '3014387768', '900234567', 'Carrera 20 #13-60, Medellín', 2),
(3, '0000-00-00', '3165283828', '900345678', 'Avenida 33 #45-22, Cali', 3),
(4, '0000-00-00', '3115391787', '900456789', 'Calle 9 #12-34, Bucaramanga', 4),
(5, '0000-00-00', '3209062693', '900567890', 'Carrera 15 #23-45, Cartagena', 5),
(6, '0000-00-00', '3134336923', '900678901', 'Avenida 8 #9-67, Barranquilla', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `Rol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `Rol`) VALUES
(1, 'Confeccionista'),
(2, 'administrador'),
(3, 'jefe de bodega'),
(4, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idCliente` int(11) NOT NULL,
  `Nombre_Usuario` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Direccion_Usuario` varchar(45) DEFAULT NULL,
  `Telefono` int(10) DEFAULT NULL,
  `Rol` int(11) DEFAULT NULL,
  `Cuenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idCliente`, `Nombre_Usuario`, `Apellidos`, `Fecha_Nacimiento`, `Direccion_Usuario`, `Telefono`, `Rol`, `Cuenta`) VALUES
(1, 'Yeray', 'Vargas Calderón', '1985-06-15', 'Calle 45 #23-56, Bogotá', 2147483647, 3, 1234567890),
(2, 'Luna', 'Camacho Vargas', '1990-08-22', 'Carrera 78 #14-25, Medellín', 2147483647, 2, 1234567891),
(3, 'María Estela', 'Calderón', '1975-03-05', 'Avenida 3 #45-12, Cali', 2147483647, 2, 1234567892),
(4, 'Diana Paola', 'Calderón', '1992-11-30', 'Calle 10 #20-30, Cartagena', 2147483647, 2, 1234567893),
(5, 'Rubiela', 'Paez', '1983-01-17', 'Carrera 12 #34-56, Bucaramanga', 2147483647, 1, 1234567894),
(6, 'Hilda', 'Romero', '1978-12-01', 'Calle 22 #45-78, Barranquilla', 2147483647, 1, 1234567895),
(7, 'Ana Lucia', 'Forero', '1987-07-09', 'Avenida 9 #67-12, Manizales', 2147483647, 1, 1234567896);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceder`
--
ALTER TABLE `acceder`
  ADD PRIMARY KEY (`idIniciar_Sesion`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstados`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFacturas`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `Estado` (`Estado`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `idProductosTerminados` (`idProductosTerminados`),
  ADD KEY `Estado` (`Estado`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`ID_Produccion`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_MateriaPrima` (`ID_MateriaPrima`);

--
-- Indices de la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `idmateria_prima` (`idmateria_prima`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedores`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `Rol` (`Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceder`
--
ALTER TABLE `acceder`
  MODIFY `idIniciar_Sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `ID_Produccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceder`
--
ALTER TABLE `acceder`
  ADD CONSTRAINT `acceder_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idCliente`),
  ADD CONSTRAINT `fk_Acceder_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `FK_Facturas_Usuario` FOREIGN KEY (`idFacturas`) REFERENCES `usuario` (`idCliente`),
  ADD CONSTRAINT `fk_facturas_clientes` FOREIGN KEY (`idFacturas`) REFERENCES `usuario` (`idCliente`);

--
-- Filtros para la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD CONSTRAINT `FK_materiaprima_proveedores` FOREIGN KEY (`idProducto`) REFERENCES `proveedores` (`idProveedores`),
  ADD CONSTRAINT `fk_anio` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`),
  ADD CONSTRAINT `materia_prima_ibfk_1` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_orden_clientes` FOREIGN KEY (`idOrden`) REFERENCES `usuario` (`idCliente`),
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`idProductosTerminados`) REFERENCES `productos_terminados` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos_terminados` (`idProductos`),
  ADD CONSTRAINT `produccion_ibfk_2` FOREIGN KEY (`ID_MateriaPrima`) REFERENCES `materia_prima` (`idProducto`);

--
-- Filtros para la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  ADD CONSTRAINT `productos_terminados_ibfk_1` FOREIGN KEY (`idmateria_prima`) REFERENCES `materia_prima` (`idProducto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Rol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
