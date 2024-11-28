-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2024 a las 15:09:30
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
-- Base de datos: `texfashion`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarFactura` (IN `p_idFactura` INT)   BEGIN
    -- Seleccionar información detallada de la factura con el id proporcionado
    SELECT *
    FROM facturas
    WHERE idFacturas = p_idFactura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Descripcion` (IN `p_Descripcion` VARCHAR(255))   BEGIN 
    SELECT Descripcion  FROM productos_terminados WHERE Descripcion = p_Descripcion;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `total_ventas_por_mes` (`anio` INT, `mes` INT) RETURNS DECIMAL(12,2) DETERMINISTIC BEGIN
    DECLARE total DECIMAL(12,2) DEFAULT 0;

    SELECT SUM(Precio_Total) INTO total
    FROM facturas
    WHERE YEAR(Fecha_de_Emision) = anio
    AND MONTH(Fecha_de_Emision) = mes;

    RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `Categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `Categoria`) VALUES
(1, 'Algodón'),
(2, 'Lana'),
(3, 'Seda'),
(4, 'Lino'),
(5, 'Poliéster'),
(6, 'Nylon'),
(7, 'Acrílico'),
(8, 'Rayón'),
(9, 'Algodón/Poliéster'),
(10, 'Lana/Acrílico'),
(11, 'Plástico'),
(12, 'Cuero'),
(13, 'Tejido Plano'),
(14, 'Tejido de Punto'),
(15, 'Tela para Ropa de Trabajo'),
(16, 'Tela para Moda'),
(17, 'Tela para Decoración');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `IdDocumento` int(11) NOT NULL,
  `TipoDocumento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`IdDocumento`, `TipoDocumento`) VALUES
(1, 'Cedula Ciudadania'),
(2, 'Cedula Extranjera'),
(3, 'RUT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstados` int(11) NOT NULL,
  `Estados` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstados`, `Estados`) VALUES
(1, 'Disponible'),
(2, 'No_Disponible'),
(3, 'Habilitada'),
(4, 'No_Habilitada'),
(5, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Informacion_del_Producto` int(11) DEFAULT NULL,
  `Fecha_de_Emision` date DEFAULT NULL,
  `Precio_Total` decimal(10,2) DEFAULT NULL,
  `Numero_Factura` varchar(255) DEFAULT NULL,
  `idCliente` bigint(20) DEFAULT NULL,
  `Direccion_Facturacion` varchar(255) DEFAULT NULL,
  `Estado_Factura` int(11) DEFAULT NULL,
  `Fecha_Pago` date DEFAULT NULL,
  `Referencia_Pago` varchar(255) DEFAULT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFacturas`, `Cantidad`, `Informacion_del_Producto`, `Fecha_de_Emision`, `Precio_Total`, `Numero_Factura`, `idCliente`, `Direccion_Facturacion`, `Estado_Factura`, `Fecha_Pago`, `Referencia_Pago`, `status`) VALUES
(100, 13, 3, '2024-11-14', 12312.00, 'r1232', 9, 'cra 12 cllae23312', 4, '2024-11-05', 'r232', 'OUT'),
(101, 14, 4, '2024-11-08', 1500.00, '12', 7, 'cra 43 sur 56', 5, '2024-11-15', 'r231', 'IN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_accesos`
--

CREATE TABLE `log_accesos` (
  `id` int(11) NOT NULL,
  `Documento` varchar(20) DEFAULT NULL,
  `Accion` varchar(10) DEFAULT NULL,
  `Detalles` text DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log_accesos`
--

INSERT INTO `log_accesos` (`id`, `Documento`, `Accion`, `Detalles`, `Usuario`, `fecha`) VALUES
(1, '1245687', 'UPDATE', 'Acceso actualizado. Usuario: nicoll castillo, Correo electrónico: nicolvale@gmail.com -> valentinacastillo@gmail.com, Nueva contraseña: 81dc9bdb52d04dc20036dbd8313ed055', 'nicoll castillo', '2024-11-28 13:07:35'),
(2, '1245687', 'UPDATE', 'Correo electrónico actualizado de nicolvale@gmail.com a valentinacastillo@gmail.com', 'Sistema', '2024-11-28 13:07:35'),
(3, '1140915387', 'DELETE', 'Usuario eliminado: carlos fabian', 'Sistema', '2024-11-28 13:13:19'),
(4, '1234567890', 'INSERT', 'Nuevo usuario insertado: Laura Perez', 'Sistema', '2024-11-28 13:15:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `idProducto` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Precio_Unidad` decimal(10,2) DEFAULT NULL,
  `Cantidad_Stock` int(11) DEFAULT NULL,
  `id_Proveedor` bigint(20) DEFAULT NULL,
  `Categoria` int(11) DEFAULT NULL,
  `Unidad_Medida` int(11) DEFAULT NULL,
  `Fecha_Actualizacion` date DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'IN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`idProducto`, `Nombre`, `Descripcion`, `Fecha_Ingreso`, `Precio_Unidad`, `Cantidad_Stock`, `id_Proveedor`, `Categoria`, `Unidad_Medida`, `Fecha_Actualizacion`, `Estado`, `status`) VALUES
(1, 'Prueba', 'Es una prueba en desarrollo', '2024-10-22', 500000.00, 5, 1, 1, 1, '2024-10-22', 1, 'OUT'),
(2, 'Desarrollo', 'Prueba en desarrollo', '2024-10-21', 30000.00, 5, 8, 4, 15, '2024-10-22', 1, 'IN'),
(4, 'medias', 'larga de futbol', '2024-11-23', 123344.00, 12, 8, 3, 14, '2024-11-24', 3, 'IN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `idCliente` bigint(20) DEFAULT NULL,
  `Fecha_Orden` date DEFAULT NULL,
  `Total_Total` decimal(10,2) DEFAULT NULL,
  `Cantidad_Producto` int(11) DEFAULT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `idProductosTerminados` int(11) DEFAULT NULL,
  `idMateriaPrima` int(11) DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`idOrden`, `idCliente`, `Fecha_Orden`, `Total_Total`, `Cantidad_Producto`, `Fecha_Entrega`, `idProductosTerminados`, `idMateriaPrima`, `Estado`, `status`) VALUES
(1, 1, '2024-10-22', 154000.00, 34, '2024-10-29', 2, 4, 5, 'IN'),
(2, 1, '2024-10-24', 450000.00, 4, '2024-11-29', 2, 4, 1, 'IN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_terminados`
--

CREATE TABLE `productos_terminados` (
  `idProductos` int(11) NOT NULL,
  `Nombre_Producto` varchar(255) DEFAULT NULL,
  `Cantidad_Disponible` int(11) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Fecha_Entrada` date DEFAULT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `idmateria_prima` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_terminados`
--

INSERT INTO `productos_terminados` (`idProductos`, `Nombre_Producto`, `Cantidad_Disponible`, `Descripcion`, `Fecha_Entrada`, `Fecha_Salida`, `idmateria_prima`, `idEstado`, `status`) VALUES
(1, 'hola', 500, 'Tapabocas con tela seda estampada de PeppaPig', '2024-08-15', '2024-08-15', 1, 2, 'IN'),
(2, 'Cofias', 300, 'Cofias material sinteticos azul', '2024-08-20', '2024-08-20', 2, 1, 'IN'),
(3, 'ChaquetaProm', 150, 'Tela Algodon perchado', '2024-08-10', '2024-08-25', 1, 2, 'IN'),
(4, 'Uniforme Vigilante', 50, 'Tela de cortina azul oscuro', '2024-08-12', '2024-08-30', 2, 1, 'IN'),
(5, 'Uniforme enfermeria', 55, 'Tela de cortina azul clarito', '2024-08-15', '2024-09-01', 2, 1, 'IN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `Rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `Rol`) VALUES
(1, 'Administrador'),
(2, 'Confeccionista'),
(3, 'Jefe de bodega'),
(4, 'Cliente'),
(5, 'Proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedida`
--

CREATE TABLE `unidadmedida` (
  `MedidaID` int(11) NOT NULL,
  `Uni_Med` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidadmedida`
--

INSERT INTO `unidadmedida` (`MedidaID`, `Uni_Med`) VALUES
(1, 'Metros'),
(2, 'Centímetros'),
(3, 'Pulgadas'),
(4, 'Yardas'),
(5, 'Gramos'),
(6, 'Kilogramos'),
(7, 'Onzas'),
(8, 'Libras'),
(9, 'Hilos por pulgada'),
(10, 'Densidad'),
(11, 'Anchos de tela'),
(12, 'Número de rosca'),
(13, 'Denier'),
(14, 'Tex'),
(15, 'Sacos'),
(16, 'Bobinas'),
(17, 'Rollos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `correo_electronico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '81dc9bdb52d04dc20036dbd8313ed055',
  `tipo_documento` int(11) DEFAULT NULL,
  `documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `correo_electronico`, `contrasena`, `tipo_documento`, `documento`, `direccion`, `fecha_nacimiento`, `telefono`, `rol`) VALUES
(1, 'Brayan', 'Jimenez', 'jimenezbrayan825@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, '1000691523', 'KR 6F ESTE #89C 48 SUR', '2002-01-20', '3194753477', 1),
(7, 'kevin', 'santiago', 'kevin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, '789455', 'cra 6 f sur n34 m', '2024-11-28', '3211140618', 3),
(8, 'juliana', 'gualteros', 'karenjuliana12@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, '12345678', 'cra32 sur 21', '2024-11-30', '30021456', 5),
(9, 'nicoll', 'castillo', 'valentinacastillo@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 3, '1245687', 'nqs calle 38', '2024-11-23', '32145675', 2),
(10, 'Laura', 'Perez', 'laura.perez@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, '1234567890', 'Calle 123', '1995-06-15', '3200000000', 4);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `Auditoria_Actualizacion` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
    -- Verificar si se actualizó el correo electrónico
    IF OLD.correo_electronico != NEW.correo_electronico THEN
        INSERT INTO Log_Accesos (Documento, Accion, Detalles, Usuario)
        VALUES (NEW.documento, 'UPDATE', CONCAT('Correo electrónico actualizado de ', OLD.correo_electronico, ' a ', NEW.correo_electronico), 'Sistema');
    END IF;

    -- Verificar si se actualizó la contraseña
    IF OLD.contrasena != NEW.contrasena THEN
        INSERT INTO Log_Accesos (Documento, Accion, Detalles, Usuario)
        VALUES (NEW.documento, 'UPDATE', CONCAT('Contraseña actualizada'), 'Sistema');
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Auditoria_Eliminacion` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    -- Registrar la eliminación de un usuario
    INSERT INTO Log_Accesos (Documento, Accion, Detalles, Usuario)
    VALUES (OLD.documento, 'DELETE', CONCAT('Usuario eliminado: ', OLD.nombre, ' ', OLD.apellido), 'Sistema');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Auditoria_Insercion` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    -- Registrar la inserción de un nuevo usuario
    INSERT INTO Log_Accesos (Documento, Accion, Detalles, Usuario)
    VALUES (NEW.documento, 'INSERT', CONCAT('Nuevo usuario insertado: ', NEW.nombre, ' ', NEW.apellido), 'Sistema');
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

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
  ADD KEY `FK_AD_LK` (`Estado_Factura`),
  ADD KEY `FK_FACTURAS_DF` (`Informacion_del_Producto`),
  ADD KEY `FK_USU_CLI` (`idCliente`);

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
  ADD KEY `FK_MP_EST` (`Estado`),
  ADD KEY `fk_provedor_mp` (`id_Proveedor`),
  ADD KEY `fk_cat_est` (`Categoria`),
  ADD KEY `fk_um_est` (`Unidad_Medida`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `idProductosTerminados` (`idProductosTerminados`),
  ADD KEY `idMateriaPrima` (`idMateriaPrima`),
  ADD KEY `FK_ORDEN_CLIENTE` (`idCliente`),
  ADD KEY `FK_ORD_ESTA` (`Estado`);

--
-- Indices de la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `idEstado` (`idEstado`),
  ADD KEY `FK_PT_MP` (`idmateria_prima`) USING BTREE;

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD PRIMARY KEY (`MedidaID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_USU_DOC` (`tipo_documento`),
  ADD KEY `FK_USU_ROL` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `IdDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `log_accesos`
--
ALTER TABLE `log_accesos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos_terminados`
--
ALTER TABLE `productos_terminados`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  MODIFY `MedidaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `FK_FACTURAS_ESTADOS` FOREIGN KEY (`Estado_Factura`) REFERENCES `estados` (`idEstados`),
  ADD CONSTRAINT `FK_USU_CLI` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `fk_info_prod` FOREIGN KEY (`Informacion_del_Producto`) REFERENCES `productos_terminados` (`idProductos`);

--
-- Filtros para la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD CONSTRAINT `FK_CATEGORIA` FOREIGN KEY (`Categoria`) REFERENCES `categorias` (`idCategoria`),
  ADD CONSTRAINT `FK_MP_EST` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`),
  ADD CONSTRAINT `FK_UNIDADMEDIDA` FOREIGN KEY (`Unidad_Medida`) REFERENCES `unidadmedida` (`MedidaID`),
  ADD CONSTRAINT `fk_provedor_mp` FOREIGN KEY (`id_Proveedor`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `FK_MP_ORDEN` FOREIGN KEY (`idMateriaPrima`) REFERENCES `materia_prima` (`idProducto`),
  ADD CONSTRAINT `FK_ORDEN_CLIENTE` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_ORDEN_PT` FOREIGN KEY (`idProductosTerminados`) REFERENCES `productos_terminados` (`idProductos`),
  ADD CONSTRAINT `FK_ORD_ESTA` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstados`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USU_DOC` FOREIGN KEY (`tipo_documento`) REFERENCES `documento` (`IdDocumento`),
  ADD CONSTRAINT `FK_USU_ROL` FOREIGN KEY (`rol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
