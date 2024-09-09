-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-09-2024 a las 16:49:18
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
-- Base de datos: `texfashion.sql`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `llamar_ID` (IN `id_llamado` INT)   BEGIN SELECT IdIniciar_Sesion FROM acceder WHERE IdIniciar_Sesion = id_llamado; END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `contraseña_repetida` (`contraseña` VARCHAR(50)) RETURNS INT(11)  BEGIN
    DECLARE veces_repetidas INT;
    
    SELECT COUNT(*) INTO veces_repetidas 
    FROM acceder 
    WHERE Contraseña = contraseña;
    
    RETURN veces_repetidas;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceder`
--

CREATE TABLE `acceder` (
  `idUsuario` varchar(45) NOT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) DEFAULT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `acceder`
--

INSERT INTO `acceder` (`idUsuario`, `Usuario`, `Contraseña`, `fecha_inicio`, `ip_address`) VALUES
('1234567890', 'Jefe', 'Jefe1234!', '2024-08-22 12:12:10', NULL),
('3456789021', 'María Estela', '=\r6Ö0®<fkZmÄ8¿', '2024-08-22 12:12:10', NULL),
('4567890123', 'Luna', 'vñ•¾^˜Û@àëˆþBhM', '2024-08-22 12:12:10', NULL),
('4567890132', 'Diana Paola', 'Diana456!', '2024-08-22 12:12:10', NULL),
('5678901243', 'Rubiela', 'Rubiela123!', '2024-08-22 12:12:10', NULL),
('6789012354', 'Hilda', 'Hilda789!', '2024-08-22 12:12:10', NULL),
('7890123465', 'Ana Lucia', 'AnaPass456!', '2024-08-22 12:12:10', NULL);

--
-- Disparadores `acceder`
--
DELIMITER $$
CREATE TRIGGER `Encriptar_Contraseña` BEFORE INSERT ON `acceder` FOR EACH ROW begin 
set new.Contraseña = aes_encrypt (new.Contraseña, 'clave2024');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Encriptar_update` BEFORE UPDATE ON `acceder` FOR EACH ROW begin 
set new.Contraseña = aes_encrypt (new.Contraseña, 'clave2024');
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `IdDocumento` int(11) NOT NULL,
  `TipoDocumento` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`IdDocumento`, `TipoDocumento`) VALUES
(1, 'Cedula ciudadania'),
(2, 'Cedula extranjeria'),
(3, 'RUT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstados` int(15) NOT NULL,
  `Estados` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstados`, `Estados`) VALUES
(1, 'Disponible'),
(2, 'No_Disponible'),
(3, 'Habilitada'),
(4, 'No_habilitada'),
(5, 'Pagado'),
(6, 'No_pagado');

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
  `idCliente` varchar(45) DEFAULT NULL,
  `Direccion_Facturacion` varchar(45) DEFAULT NULL,
  `Estado_Factura` int(10) DEFAULT NULL,
  `Fecha_Pago` date DEFAULT NULL,
  `Referencia_Pago` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFacturas`, `Cantidad`, `Informacion_del_Producto`, `Fecha_de_Emision`, `Precio_Total`, `Numero_Factura`, `idCliente`, `Direccion_Facturacion`, `Estado_Factura`, `Fecha_Pago`, `Referencia_Pago`) VALUES
(1, 500, 1, '2024-08-01', 500000, 'F-1001', '2345678901', 'Calle 45 #23-56, Bogotá', 4, '2024-08-15', 'R-12345'),
(2, 300, 2, '2024-08-05', 450000, 'F-1002', '1234567809', 'Carrera 78 #14-25, Medellín', 5, NULL, NULL),
(3, 150, 3, '2024-08-10', 300000, 'F-1003', '8901234567', 'Avenida 3 #45-12, Cali', 5, '2024-08-20', 'R-12346'),
(4, 100, 4, '2024-08-12', 250000, 'F-1004', '6789012345', 'Calle 10 #20-30, Cartagena', 5, NULL, NULL),
(5, 200, 5, '2024-08-15', 600000, 'F-1005', '3456789012', 'Carrera 12 #34-56, Bucaramanga', 6, '2024-09-01', 'R-12347');

--
-- Disparadores `facturas`
--
DELIMITER $$
CREATE TRIGGER `validar_precio_total_before_insert` BEFORE INSERT ON `facturas` FOR EACH ROW BEGIN
    IF NEW.Precio_Total < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El Precio_Total no puede ser negativo.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_accesos`
--

CREATE TABLE `log_accesos` (
  `id` int(11) NOT NULL,
  `idUsuario` varchar(45) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `id_Proveedor` int(15) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Unidad_Medida` varchar(45) DEFAULT NULL,
  `Fecha_Actualizacion` date DEFAULT NULL,
  `Estado` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`idProducto`, `Nombre`, `Descripcion`, `Fecha_Ingreso`, `Precio_Unidad`, `Cantidad_Stock`, `id_Proveedor`, `Categoria`, `Unidad_Medida`, `Fecha_Actualizacion`, `Estado`) VALUES
(1, 'Algodón', 'Tela de algodón, color blanco', '2024-07-20', 5000, 1000, 1, 'Textil', 'kg', '2024-07-30', 1),
(2, 'Mezclilla', 'Tela de mezclilla, color azul', '2024-07-22', 7000, 800, 2, 'Textil', 'kg', '2024-07-31', 1),
(3, 'Cuero Sintético', 'Material sintético, color negro', '2024-07-25', 12000, 500, 3, 'Material', 'm²', '2024-08-01', 1),
(4, 'Seda', 'Tela de seda, color rojo', '2024-07-27', 15000, 300, 4, 'Textil', 'm²', '2024-08-03', 1),
(5, 'Cuero Natural', 'Cuero natural, color marrón', '2024-07-30', 18000, 400, 5, 'Material', 'm²', '2024-08-05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `idCliente` varchar(11) NOT NULL,
  `Fecha_Orden` date DEFAULT NULL,
  `Total_Total` double DEFAULT NULL,
  `Cantidad_Producto` varchar(45) DEFAULT NULL,
  `Estado` int(50) DEFAULT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `idProductosTerminados` int(11) DEFAULT NULL,
  `idMateriaPrima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`idOrden`, `idCliente`, `Fecha_Orden`, `Total_Total`, `Cantidad_Producto`, `Estado`, `Fecha_Entrega`, `idProductosTerminados`, `idMateriaPrima`) VALUES
(3, '5678901234', '2024-08-10', 2000000, '150', 3, '2024-08-25', 3, 1),
(4, '3456789012', '2024-08-12', 2500000, '100', 2, '2024-08-30', 4, 2),
(5, '8901234567', '2024-08-15', 3000000, '200', 1, '2024-09-01', 5, 3),
(17, '1234567809', '2024-08-05', 1500000, '300', 2, '2024-08-20', 2, 4),
(18, '0123456789', '2024-08-01', 1000000, '500', 1, '2024-08-15', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `ID_Produccion` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `ID_MateriaPrima` int(11) DEFAULT NULL,
  `Cantidad_Usada` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Estado` int(15) NOT NULL,
  `idmateria_prima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productos_terminados`
--

INSERT INTO `productos_terminados` (`idProductos`, `Nombre_Producto`, `Cantidad_Disponible`, `Descripcion`, `Fecha_Entrada`, `Fecha_Salida`, `Estado`, `idmateria_prima`) VALUES
(1, 'Camiseta Básica', '500', 'Camiseta de algodón, color blanco', '2024-08-01', '2024-08-15', 1, 1),
(2, 'Jean Slim Fit', '300', 'Jean de mezclilla, color azul', '2024-08-05', '2024-08-20', 1, 2),
(3, 'Chaqueta de Cuero', '150', 'Chaqueta de cuero sintético, color negro', '2024-08-10', '2024-08-25', 2, 3),
(4, 'Vestido de Noche', '100', 'Vestido largo, color rojo', '2024-08-12', '2024-08-30', 1, 4),
(5, 'Zapatos de Cuero', '200', 'Zapatos formales, color marrón', '2024-08-15', '2024-09-01', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `Rol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `Rol`) VALUES
(1, 'Confeccionista'),
(2, 'administrador'),
(3, 'Jefe de bodega'),
(4, 'Cliente'),
(5, 'Proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Documento` varchar(11) NOT NULL,
  `Nombre_Usuario` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Direccion_Usuario` varchar(45) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Rol` int(11) DEFAULT NULL,
  `TipoDoc` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Documento`, `Nombre_Usuario`, `Apellidos`, `Fecha_Nacimiento`, `Direccion_Usuario`, `Telefono`, `Rol`, `TipoDoc`) VALUES
('0123456789', 'Antonio', 'Jiménez Ortega', '1980-05-22', 'Carrera 2 # 12-38, Bogotá D.C., Colombia.', '326 789 0123', 4, 1),
('1234567809', 'Sofía', 'Moreno Álvarez', '1993-08-04', 'Calle 130 # 90-10, Bogotá D.C., Colombia.', '327 890 1234', 4, 1),
('1234567890', 'Yeray', 'Vargas Calderón', '1985-06-15', 'Calle 45 #23-56, Bogotá', '312 345 6789', 2, 1),
('2345678901', 'Ana', 'Martínez López', '1985-04-12', ' Carrera 7 # 27-20, Bogotá D.C., Colombia', '318 901 2345', 4, 1),
('2345678910', 'Carlos', 'Vázquez Fernández', '1986-03-09', 'Carrera 7 # 115-20, Bogotá D.C., Colombia.', '328 901 2345', 4, 1),
('321654987-0', 'Fatisyet', NULL, '1990-02-14', 'Transversal 5 #15-20, Barranquilla', '3115391787', 5, 3),
('3456789012', 'Luis', 'García Fernández', '1990-07-24', 'Avenida el Poblado # 1A-45, Medellín, Antioqu', '320 123 4567', 4, 1),
('3456789021', 'María Estela', 'Calderón', '1975-03-05', 'Avenida 3 #45-12, Cali', '314 567 8901', 1, 1),
('4567890123', 'Luna', 'Camacho Vargas', '1990-08-22', 'Carrera 78 #14-25, Medellín', '313 456 7890', 1, 1),
('4567890132', 'Diana Paola', 'Calderón', '1992-11-30', 'Calle 10 #20-30, Cartagena', '315 678 9012', 1, 1),
('456789123-0', 'Textilia', NULL, '1988-08-22', 'Carrera 10 #10-10, Cali', '3165283828', 5, 3),
('5678901234', 'María', 'Pérez Gómez', '1982-10-05', 'Calle 5 # 6-23, Cali, Valle del Cauca, Colomb', '321 234 5678', 4, 1),
('5678901243', 'Rubiela', 'Paez', '1983-01-17', 'Carrera 12 #34-56, Bucaramanga', '316 789 0123', 3, 1),
('654321987-0', 'Grupo Stone', NULL, '1985-12-25', 'Diagonal 6 #20-25, Cartagena', '3209062693', 5, 3),
('6789012345', 'José', 'Rodríguez Sánchez', '1978-01-19', 'Carrera 50 # 79-138, Barranquilla, Atlántico,', '322 345 6789', 4, 1),
('6789012354 ', 'Hilda', 'Romero', '1978-12-01', 'Calle 22 #45-78, Barranquilla', '317 890 1234', 1, 1),
('7890123456', 'Laura', 'González Martínez', '1995-06-11', 'Calle 26 # 13-19, Bogotá D.C., Colombia.', '323 456 7890', 4, 1),
('7890123465', 'Ana Lucia', 'Forero', '1987-07-09', 'Avenida 9 #67-12, Manizales', '318 901 2345', 3, 1),
('789123456-0', 'Megacaps', NULL, '1992-07-04', 'Avenida del Libertador 789, Bucaramanga', '3134336923', 5, 3),
('8901234567', 'David', 'Hernández Morales', '1988-09-30', 'Carrera 13 # 82-22, Bogotá D.C., Colombia.', '324 567 8901', 4, 1),
('9012345678', 'Elena', 'Ramírez Ruiz', '1992-12-15', ' 7 # 57-23, Bogotá D.C., Colombia.', '325 678 9012', 4, 1),
('987654321-0', 'Pumotex', NULL, '1975-11-30', 'Avenida Siempre Viva 456, Medellín', '3014387768', 5, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceder`
--
ALTER TABLE `acceder`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`IdDocumento`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstados`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFacturas`),
  ADD KEY `fk_facturas_clientes` (`idCliente`),
  ADD KEY `FK_ESTADOS_FACTURAS` (`Estado_Factura`);

--
-- Indices de la tabla `log_accesos`
--
ALTER TABLE `log_accesos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `Estado` (`Estado`),
  ADD KEY `fk_materiaprima_proveedores` (`id_Proveedor`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `idProductosTerminados` (`idProductosTerminados`),
  ADD KEY `Estado` (`Estado`),
  ADD KEY `fk_orden_cliente` (`idCliente`),
  ADD KEY `fk_mp_orden` (`idMateriaPrima`);

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
  ADD KEY `idmateria_prima` (`idmateria_prima`),
  ADD KEY `fk_estado_productosterminados` (`Estado`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Documento`),
  ADD KEY `Rol` (`Rol`),
  ADD KEY `fk_usuario_tipodoc` (`TipoDoc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `IdDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstados` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123456790;

--
-- AUTO_INCREMENT de la tabla `log_accesos`
--
ALTER TABLE `log_accesos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123456790;

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
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `FK_ESTADOS_FACTURAS` FOREIGN KEY (`Estado_Factura`) REFERENCES `estados` (`idEstados`),
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`Documento`);

--
-- Filtros para la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD CONSTRAINT `fk_anio` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`),
  ADD CONSTRAINT `materia_prima_ibfk_1` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `FK_CLIENTE_USUARIO` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`Documento`),
  ADD CONSTRAINT `fk_mp_orden` FOREIGN KEY (`idMateriaPrima`) REFERENCES `materia_prima` (`idProducto`),
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
  ADD CONSTRAINT `fk_estado_productosterminados` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`),
  ADD CONSTRAINT `productos_terminados_ibfk_1` FOREIGN KEY (`idmateria_prima`) REFERENCES `materia_prima` (`idProducto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_DOCUMENTO` FOREIGN KEY (`TipoDoc`) REFERENCES `documento` (`IdDocumento`),
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Rol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
