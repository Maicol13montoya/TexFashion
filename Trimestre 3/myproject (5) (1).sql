-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2024 a las 15:51:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myproject`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceder`
--

CREATE TABLE `acceder` (
  `idIniciar_Sesion` int(11) NOT NULL COMMENT 'PK Es una la identificacion para la tabla Iniciar Sesion',
  `Usuario` varchar(45) NOT NULL COMMENT 'En este apartado esta el nombre del Usuario registrado',
  `Contraseña` varchar(45) NOT NULL COMMENT 'En este apartado esta la contraseña del usuario',
  `Usuario_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `acceder`
--

INSERT INTO `acceder` (`idIniciar_Sesion`, `Usuario`, `Contraseña`, `Usuario_idCliente`) VALUES
(200, 'AidaVictoriaMerlano@ejemplo.com', 'micontraseña123', 113),
(201, 'maria.lopez@ejemplo.com', 'miClaveSecreta', 100),
(202, 'BellaPorsh@ejemplo.com', 'micontraseña123', 112),
(203, 'LautaroMartinez@ejemplo.com', 'micontraseña123', 111),
(204, 'SinadinZidan@ejemplo.com', 'micontraseña123', 110),
(205, 'RichardRioz@ejemplo.com', 'micontraseña123', 109),
(206, 'JamesRodriguez@ejemplo.com', 'micontraseña123', 108),
(207, 'RodrigoDePaul@ejemplo.com', 'micontraseña123', 107),
(208, 'EduardoCamavinga@ejemplo.com', 'claveSegura2024', 106),
(209, 'AristobuloJasinto@ejemplo.com', 'miPass2023', 105),
(210, 'JulianitaSutanita@ejemplo.com', 'miClaveSecreta', 104),
(211, 'pedro.rodriguez@ejemplo.com', 'micontraseña123', 103),
(213, 'ana.martinez@ejemplo.com', 'claveSegura2024', 102),
(214, 'david.gomez@ejemplo.com', 'miPass2023', 101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `idComprobante` int(11) NOT NULL COMMENT 'PK. Codigo el cual tiene el comprobante',
  `Cantidad` int(11) NOT NULL COMMENT 'Cantidad la cual el usuario solicito',
  `Fecha_de_Emisión` date NOT NULL COMMENT 'Fecha en la que se hizo la compra',
  `Precio_Total` float NOT NULL COMMENT 'Precio total que el usuario va a pagar',
  `Número_Factura` varchar(100) NOT NULL,
  `Nombre_Cliente` varchar(45) NOT NULL,
  `Dirección_Facturación` varchar(45) NOT NULL,
  `Estado_Comprobante` varchar(45) NOT NULL,
  `Fecha_Pago` date NOT NULL,
  `Referencia_Pago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`idComprobante`, `Cantidad`, `Fecha_de_Emisión`, `Precio_Total`, `Número_Factura`, `Nombre_Cliente`, `Dirección_Facturación`, `Estado_Comprobante`, `Fecha_Pago`, `Referencia_Pago`) VALUES
(6, 10, '2024-07-22', 1200, 'FACT20240001', 'Juan Perez Lopez', 'Calle 123 Ciudad X', 'Pagado', '2024-07-22', '1234567890'),
(7, 5, '2024-07-20', 500, 'FACT20240002', 'Maria Garcia Flores', 'Carrera 10 # 50-20', 'Pendiente', '0000-00-00', ''),
(8, 2, '2024-07-15', 250, 'FACT20240003', 'Pedro Sanchez Morales', 'Avenida Central s/n', 'Anulado', '2024-07-18', '1234567890'),
(9, 15, '2024-07-10', 2100, 'FACT20240004', 'Ana Lopez Perez', 'Calle 5 # 30-15', 'Pagado', '2024-07-12', '9876543210'),
(10, 3, '2024-07-05', 375, 'FACT20240005', 'David Gomez Rodriguez', 'Transversal 14 # 65-40', 'Pendiente', '2024-12-15', ''),
(11, 10, '2024-07-22', 1200, 'FACT20240006', 'Juan Perez Lopez', 'Calle 123 Ciudad X', 'Pagado', '2024-07-22', '1234567890'),
(12, 5, '2024-07-20', 500, 'FACT20240007', 'Maria Garcia Flores', 'Carrera 10 # 50-20', 'Pendiente', '2024-07-21', ''),
(13, 2, '2024-07-15', 250, 'FACT20240008', 'Pedro Sanchez Morales', 'Avenida Central s/n', 'Anulado', '2024-07-18', '1234567890'),
(14, 15, '2024-07-10', 2100, 'FACT20240009', 'Ana Lopez Perez', 'Calle 5 # 30-15', 'Pagado', '2024-07-12', '9876543210'),
(15, 3, '2024-07-05', 375, 'FACT20240010', 'David Gomez Rodriguez', 'Transversal 14 # 65-40', 'Pendiente', '2024-07-07', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstados` int(11) NOT NULL,
  `Estados` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `idProducto` int(11) NOT NULL COMMENT 'PK Es una la identificacion para la tabla Producto',
  `Nombre` varchar(45) NOT NULL COMMENT 'Este es el nombre que tiene el producto',
  `Descripcion` varchar(45) NOT NULL COMMENT 'Aqui se guarda la descripcion del Producto',
  `Fecha_Ingreso` date NOT NULL COMMENT 'Aqui se guarda la fecha de ingreso del producto',
  `Precio_Unidad` float NOT NULL COMMENT 'Aqui se guarda el precio que tiene el producto',
  `Cantidad_Stock` int(11) NOT NULL,
  `Proveedor` varchar(45) NOT NULL,
  `Categoria` varchar(45) NOT NULL,
  `Unidad_Medida` varchar(45) NOT NULL,
  `Fecha_Actualización` date NOT NULL,
  `Estado` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`idProducto`, `Nombre`, `Descripcion`, `Fecha_Ingreso`, `Precio_Unidad`, `Cantidad_Stock`, `Proveedor`, `Categoria`, `Unidad_Medida`, `Fecha_Actualización`, `Estado`) VALUES
(101, 'Tela de algodón', 'Tela de algodón 100% natural para confección ', '2024-07-22', 27000, 25, '1', 'Telas', 'Metros', '2024-07-22', 1),
(102, 'Hilo de poliéster', 'Hilo de poliéster de alta resistencia para co', '2024-07-20', 3000, 25, '4', 'Materiales de costura', 'Conos', '2024-08-22', 1),
(103, 'Botones', 'Botones de plástico blanco para camisas', '2024-07-18', 5000, 100, '7', 'Unidades', 'Paquetes', '2024-06-12', 1),
(104, 'Cremalleras', 'Cremalleras de nylon para pantalones y faldas', '2024-07-15', 40000, 30, '8', 'Unidades', 'Paquetes 10 ', '2024-08-31', 2),
(105, 'Tela seda', 'Tela de seda natural para confección de camis', '2024-09-01', 50000, 50, '3', 'Telas', 'Metros', '2024-08-22', 2),
(106, 'Hilo', 'Hilo de  alta resistencia para bordados', '2024-07-20', 6000, 25, '5', 'Materiales de costura', 'Conos', '2024-07-22', 1),
(107, 'Botones', 'Botones para pantalones', '2024-07-18', 5000, 100, '8', 'Unidades', 'Paquetes', '2024-07-26', 2),
(108, 'Cremalleras', 'Agujas', '2024-07-15', 2000, 30, '2', 'Unidades', 'Paquetes', '2024-07-29', 1),
(109, 'Nylon', 'Tela', '2024-07-22', 7000, 50, '6', 'Hilos', 'Metros', '2024-09-22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL COMMENT 'PK Es una la identificacion para la tabla Orden',
  `Fecha_Orden` date NOT NULL COMMENT 'Fecha en la que se hizo la orden',
  `Total_Total` double NOT NULL COMMENT 'Valor bruto de la compra',
  `Documento_Cliente` varchar(45) NOT NULL,
  `Cantidad_Producto` varchar(45) NOT NULL,
  `Estado` int(50) DEFAULT NULL,
  `Fecha_Entrega` date NOT NULL,
  `Comprobante_idComprobante` int(11) NOT NULL,
  `Materia_Prima_idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`idOrden`, `Fecha_Orden`, `Total_Total`, `Documento_Cliente`, `Cantidad_Producto`, `Estado`, `Fecha_Entrega`, `Comprobante_idComprobante`, `Materia_Prima_idProducto`) VALUES
(1, '2024-07-23', 50000, '987654321', '1', 3, '2024-07-24', 6, 101),
(2, '2024-07-23', 50000, '987654321', '1', 3, '2024-07-24', 7, 102),
(3, '2024-07-23', 75000, '987654321', '2', 4, '2024-07-26', 8, 103),
(4, '2024-07-22', 90000, '123456789', '4', 4, '2024-07-25', 8, 104),
(5, '2024-07-23', 50000, '987654321', '1', 3, '2024-07-24', 9, 105),
(6, '2024-07-23', 50000, '987654321', '1', 3, '2024-07-24', 10, 106),
(7, '2024-07-23', 75000, '987654321', '2', 4, '2024-07-26', 11, 107),
(8, '2024-07-22', 90000, '123456789', '4', 3, '2024-07-25', 12, 108),
(9, '2024-07-22', 90000, '123456789', '4', 4, '2024-07-25', 13, 109);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_terminados`
--

CREATE TABLE `productos_terminados` (
  `idProductos` int(11) NOT NULL COMMENT 'PK Es una la identificacion para la tabla Productos en Stock',
  `Nombre_Producto` varchar(45) NOT NULL COMMENT 'Aqui se guarda el nombre del producto',
  `Cantidad_Disponible` int(11) NOT NULL COMMENT 'Aqui se guarda la cantidad disponible del producto',
  `Descripcion` varchar(45) NOT NULL COMMENT 'Aqui se guarda la descripcion del producto',
  `Fecha_Entrada` date NOT NULL COMMENT 'Aqui se guarda la fecha de entrada del producto ',
  `Fecha_Salida` date NOT NULL COMMENT 'Aqui se guarda la fecha de salida del producto',
  `Orden_idOrden` int(11) NOT NULL,
  `Usuario_idCliente` int(11) NOT NULL,
  `Estado` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos_terminados`
--

INSERT INTO `productos_terminados` (`idProductos`, `Nombre_Producto`, `Cantidad_Disponible`, `Descripcion`, `Fecha_Entrada`, `Fecha_Salida`, `Orden_idOrden`, `Usuario_idCliente`, `Estado`) VALUES
(106, 'Camiseta deportiva', 15, 'Camiseta de algodón para hombre, color azul, ', '2024-07-23', '2024-08-15', 1, 100, 1),
(107, 'Pantalón jeans', 12, 'Pantalón jeans para mujer, color azul oscuro,', '2024-06-14', '2024-07-25', 2, 101, 2),
(108, 'Vestido floreado', 8, 'Vestido de verano para mujer, estampado flora', '2024-07-11', '2024-09-27', 3, 102, 1),
(109, 'Zapatos deportivos', 10, 'Zapatos deportivos para hombre, color negro, ', '2024-07-25', '2024-07-23', 4, 103, 2),
(110, 'Camiseta deportiva', 15, 'Camiseta de algodón para hombre, color azul, ', '2024-07-23', '2024-07-27', 5, 106, 1),
(111, 'Pantalón jeans', 12, 'Pantalón jeans para mujer, color azul oscuro,', '2024-05-17', '2024-07-14', 6, 107, 2),
(112, 'Vestido floreado', 8, 'Vestido de verano para mujer, estampado flora', '2024-07-21', '2024-07-01', 7, 108, 1),
(113, 'Zapatos deportivos', 10, 'Zapatos deportivos para hombre, color negro, ', '2024-07-20', '2024-07-23', 8, 109, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedores` int(11) NOT NULL COMMENT 'PK Es una la identificacion para la tabla Proveedores',
  `NombreEmpresa` varchar(45) NOT NULL COMMENT 'Aqui se guarda el nombre de la empresa',
  `Telefono` varchar(45) NOT NULL COMMENT 'Aqui se guarda el numero de contacto de la empresa',
  `NIT` int(11) NOT NULL COMMENT 'Aqui se guarda el NIT de la empresa correspondiente',
  `Direccion` varchar(45) NOT NULL COMMENT 'Aqui se guarda la direccion de la empresa correspondiente',
  `Producto_idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedores`, `NombreEmpresa`, `Telefono`, `NIT`, `Direccion`, `Producto_idProducto`) VALUES
(1, 'Telasnorma', '3214911633', 1, 'Calle 10 No. 9 - 78  Centro', 101),
(2, 'telasfabrica', '3133310303', 2, 'Carrera 56A No. 51 - 81', 102),
(3, 'Telasnew', '3214915698', 3, 'Carrera 22 No. 17-31', 103),
(4, 'Confecion', '3214915645', 4, 'Carrera 54 No. 68 - 80 Barrio el Prado', 104),
(5, 'TextilOn', '32435633', 5, 'Calle 10 No. 9 - 78  Centro', 105),
(6, 'TelasAlgo', '335410303', 6, 'Carrera 56A No. 51 - 81', 106),
(7, 'HilosYtexy', '3265615698', 7, 'Carrera 22 No. 17-31', 107),
(8, 'LONAD', '32146878', 8, 'Carrera 22 No. 17-31', 107),
(9, 'LOGT', '3214567676', 9, 'Carrera 54 No. 68 - 80 Barrio el Prado', 108);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL COMMENT 'PK Es una la identificacion para la tablan Rol',
  `Rol` varchar(45) NOT NULL COMMENT 'Aqui se encuantra el rol del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `idCliente` int(11) NOT NULL COMMENT 'PK Es una la identificacion para la tabla Cliente',
  `Nombre_usuario` varchar(45) NOT NULL COMMENT 'Aqui se guarda el nombre del usuario que se registre',
  `Apellidos` varchar(45) NOT NULL COMMENT 'Aqui se guardan los apellidos del usuario que registro',
  `Fecha_Nacimiento` date NOT NULL COMMENT 'Aqui se guarda la fecha de nacimiento para verificar la mayoria de edad del usuario regitrado',
  `Direccion_usuario` varchar(45) NOT NULL COMMENT 'Aqui se guarda la direccion del usuario para saber donde enviar la orden que hace el usuario',
  `Telefono` int(10) NOT NULL COMMENT 'Aqui se guarda el telefono de contacto registrado por el usuario',
  `Rol_idRol` int(11) NOT NULL,
  `Cuenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idCliente`, `Nombre_usuario`, `Apellidos`, `Fecha_Nacimiento`, `Direccion_usuario`, `Telefono`, `Rol_idRol`, `Cuenta`) VALUES
(100, 'Maria Lopez', 'Garcia', '1985-07-20', 'Carrera 10 # 50-20', 2147483647, 4, 201),
(101, 'David Gomez', 'Perez', '2005-08-06', 'Transversal 14 # 65-40', 2147483647, 4, 214),
(102, 'Ana Martinez', 'Flores', '2000-11-12', 'Calle 5 # 30-15', 2147483647, 4, 213),
(103, 'Pedro Rodriguez', 'Sanchez', '1995-03-15', 'Avenida Central s/n', 2147483647, 4, 211),
(104, 'Juliana Sutana', 'Gualteros', '2024-07-11', 'Carrera #89-90 sur', 231320194, 4, 210),
(105, 'Aristobulo', 'Rodriguez', '2024-07-11', 'Carrera #60-90 sur', 231451194, 4, 209),
(106, 'Edwardo', 'Camavingo', '2024-07-27', 'Carrera #81-95 sur', 2147483647, 4, 208),
(107, 'Rodrigo', 'Depaul', '2024-07-03', 'Carrera #20 sur', 235655194, 4, 207),
(108, 'James', 'Rodriguez', '2015-01-23', 'Carrera #6590 sur', 25510194, 4, 206),
(109, 'Richard', 'Rios', '2000-12-01', 'Carrera #20', 2147483647, 4, 205),
(110, 'Sinadin', 'Zindan', '1999-12-02', 'Carrera #54 sur', 23512094, 4, 204),
(111, 'Lautora', 'Martinez', '2000-11-23', 'Carrera #290 sur', 55200194, 3, 203),
(112, 'Bella', 'Porsh', '1985-05-23', 'Carrera #89-92 sur', 25820094, 2, 202),
(113, 'Aida', 'Merlano', '1995-02-26', 'Carrera #8-90 sur', 2147483647, 1, 200);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceder`
--
ALTER TABLE `acceder`
  ADD PRIMARY KEY (`idIniciar_Sesion`),
  ADD KEY `fk_Acceder_Usuario1_idx` (`Usuario_idCliente`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`idComprobante`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstados`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_anio` (`Estado`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `fk_Orden_Comprobante1_idx` (`Comprobante_idComprobante`),
  ADD KEY `fk_Orden_Materia_Prima1_idx` (`Materia_Prima_idProducto`),
  ADD KEY `fk_anios` (`Estado`);

--
-- Indices de la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `fk_Productos_Terminados_Orden1_idx` (`Orden_idOrden`),
  ADD KEY `fk_Productos_Terminados_Usuario1_idx` (`Usuario_idCliente`),
  ADD KEY `fk_ani` (`Estado`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedores`),
  ADD KEY `fk_Proveedores_Producto1_idx` (`Producto_idProducto`);

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
  ADD UNIQUE KEY `idCliente_UNIQUE` (`idCliente`),
  ADD KEY `fk_Usuario_Rol1_idx` (`Rol_idRol`),
  ADD KEY `fk_a` (`Cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceder`
--
ALTER TABLE `acceder`
  MODIFY `idIniciar_Sesion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK Es una la identificacion para la tabla Iniciar Sesion', AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `idComprobante` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK. Codigo el cual tiene el comprobante', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK Es una la identificacion para la tabla Producto', AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK Es una la identificacion para la tabla Orden', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK Es una la identificacion para la tabla Productos en Stock', AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedores` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK Es una la identificacion para la tabla Proveedores', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK Es una la identificacion para la tablan Rol', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK Es una la identificacion para la tabla Cliente', AUTO_INCREMENT=114;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceder`
--
ALTER TABLE `acceder`
  ADD CONSTRAINT `fk_Acceder_Usuario1` FOREIGN KEY (`Usuario_idCliente`) REFERENCES `usuario` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD CONSTRAINT `fk_anio` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_Orden_Comprobante1` FOREIGN KEY (`Comprobante_idComprobante`) REFERENCES `comprobante` (`idComprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orden_Materia_Prima1` FOREIGN KEY (`Materia_Prima_idProducto`) REFERENCES `materia_prima` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_anios` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`);

--
-- Filtros para la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  ADD CONSTRAINT `fk_Productos_Terminados_Orden1` FOREIGN KEY (`Orden_idOrden`) REFERENCES `orden` (`idOrden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Terminados_Usuario1` FOREIGN KEY (`Usuario_idCliente`) REFERENCES `usuario` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ani` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `fk_Proveedores_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `materia_prima` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_a` FOREIGN KEY (`Cuenta`) REFERENCES `acceder` (`idIniciar_Sesion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
