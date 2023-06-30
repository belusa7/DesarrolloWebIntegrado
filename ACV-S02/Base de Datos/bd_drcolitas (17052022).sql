-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2022 a las 00:58:11
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_drcolitas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `codigoCita` int(11) NOT NULL,
  `codigoMascota` int(11) NOT NULL,
  `codigoServicio` int(11) NOT NULL,
  `codigoUsuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `detalle` mediumtext NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`codigoCita`, `codigoMascota`, `codigoServicio`, `codigoUsuario`, `fecha`, `detalle`, `estado`) VALUES
(4, 15, 1, 1, '2022-05-17 21:00:00', '', 1),
(5, 17, 1, 1, '2022-05-17 15:30:00', '', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codigoCliente` int(11) NOT NULL,
  `tipoDocumento` varchar(100) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codigoCliente`, `tipoDocumento`, `documento`, `nombres`, `apellidos`, `telefono`, `email`, `estado`) VALUES
(1, 'DNI', '85626352', 'MARIA', 'CRUZ TORRES', '963125264', 'maria@hotmail.com', 1),
(2, 'DNI', '52345262', 'MARIO', 'CALDERON RIVAGUERO', '65265323', 'calderon@hotmail.com', 1),
(3, 'DNI', '52321525', 'SANTIAGO', 'GOMEZ DAVILA', '4654654', 'GOMEZ@HOTMAIL.COM', 1),
(4, 'DNI', '86265352', 'JUAN', 'CANDIA RICALDE', '95623523', 'juan@hotmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `codigoEmpleado` int(11) NOT NULL,
  `codigoServicio` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `fechaIngreso` datetime NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`codigoEmpleado`, `codigoServicio`, `nombre`, `apellido`, `fechaNacimiento`, `fechaIngreso`, `cargo`, `estado`) VALUES
(1, 1, 'BRUNO', 'PAULLO MOLINA', '2000-05-03 00:00:00', '2022-01-04 00:00:00', 'VETERINARIO', 1),
(2, 1, 'GIANCARLO', 'PULACHE ZAVALA', '1990-05-01 00:00:00', '2015-05-15 00:00:00', 'VETERINARIO', 1),
(3, 2, 'MANUEL', 'PRIVAT VELASCO', '1990-05-09 00:00:00', '2020-05-01 00:00:00', 'GROOMING', 1),
(4, 1, 'MARTIZA', 'QUISPE ALVARADO', '1995-05-01 00:00:00', '2021-05-01 00:00:00', 'GROOMING', 1),
(5, 2, 'RICHARD', 'REYMUNDO PASQUEL', '1989-05-10 00:00:00', '2020-05-15 00:00:00', 'VETERINANRIO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `codigoHistoria` int(11) NOT NULL,
  `codigoMascota` int(11) NOT NULL,
  `fechaApertura` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historia`
--

INSERT INTO `historia` (`codigoHistoria`, `codigoMascota`, `fechaApertura`) VALUES
(4, 14, '2022-05-17 00:00:00'),
(5, 15, '2022-05-17 00:00:00'),
(6, 16, '2022-05-17 00:00:00'),
(7, 17, '2022-05-17 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_detalle`
--

CREATE TABLE `historia_detalle` (
  `codigodetalle` int(11) NOT NULL,
  `codigoHistoria` int(11) NOT NULL,
  `codigoCita` int(11) NOT NULL,
  `codigoEmpleado` int(11) NOT NULL,
  `constanciaFisiologica` varchar(100) NOT NULL,
  `anamnesisDescripcion` varchar(100) NOT NULL,
  `hallazgo` varchar(100) NOT NULL,
  `diagnostico` varchar(100) NOT NULL,
  `examenauxiliar` varchar(100) NOT NULL,
  `tratamiento` varchar(100) NOT NULL,
  `proximaAtencion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historia_detalle`
--

INSERT INTO `historia_detalle` (`codigodetalle`, `codigoHistoria`, `codigoCita`, `codigoEmpleado`, `constanciaFisiologica`, `anamnesisDescripcion`, `hallazgo`, `diagnostico`, `examenauxiliar`, `tratamiento`, `proximaAtencion`) VALUES
(1, 5, 4, 2, 'Normal', 'Normal 1', 'Normal 2', 'Normal 3', 'Normal 4', 'Normal 5', '2022-05-18 18:00:00'),
(2, 7, 5, 4, 'Normal', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `codigoMascota` int(11) NOT NULL,
  `codigoCliente` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `especie` varchar(255) NOT NULL,
  `raza` varchar(255) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`codigoMascota`, `codigoCliente`, `nombre`, `fechaNacimiento`, `especie`, `raza`, `sexo`, `estado`) VALUES
(14, 4, 'MILLA', '2021-05-05 00:00:00', 'FELINO', 'SIAMES', 'Hembra', 1),
(15, 1, 'LEO', '2020-05-01 00:00:00', 'CANINO', 'BOXER', 'Macho', 1),
(16, 2, 'ROCKY', '2019-05-03 00:00:00', 'CANINO', 'POODLE', 'Macho', 1),
(17, 3, 'COSMO', '2020-05-01 00:00:00', 'CANINO', 'BULLDOG', 'Macho', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `codigoServicio` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`codigoServicio`, `nombre`) VALUES
(1, 'Veterinaria'),
(2, 'Grooming');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigoUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `contraseniaSalt` mediumtext NOT NULL,
  `rol` varchar(255) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigoUsuario`, `nombreUsuario`, `contrasenia`, `contraseniaSalt`, `rol`, `estado`) VALUES
(1, 'bruno.paullo', 'Q4q60RNDzaJmnYvkGNotbdgLqxJSc1CuSleLSIiCLxc=', 'fdXFlYJoH2QTYKtM9oLLHXcOBgeNN3', 'Administrador', 1),
(2, 'manuel.privat', 'Ggj0uThIqjrYDAreLgfyl8mEO3/RZXZ7YM/Tc+SyKQo=', '9Do3RTyJUiJwYfVEPIWKwkuEIjOb1N', 'Administrador', 1),
(3, 'maritza.quispe', 'i0iDsEAozfmMq85oNspol8452sGNNlfml2IjVevkyhc=', 'q3OMY3VjAv3tZFOpB77LltQkrcLzOj', 'Administrador', 1),
(4, 'giancarlo.pulache', '/NO6A5oHLN+5e11rTiQOcoXZYQ1WITysxpppdD+Lyp4=', '1ixm3Ii01LvQPIeGfLFflxXY2hkVgO', 'Administrador', 0),
(5, 'richard.reymundo', 'iYDA7j6nDILUiVayUv+9MUWAU1juGekdn6vRJM2HB+A=', '4OZAbODRaolRI5yNUFMeEm6SSPrMMP', 'Administrador', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`codigoCita`),
  ADD KEY `codigoMascota` (`codigoMascota`),
  ADD KEY `codigoServicio` (`codigoServicio`),
  ADD KEY `codigoUsuario` (`codigoUsuario`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigoCliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codigoEmpleado`),
  ADD KEY `codigoServicio` (`codigoServicio`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`codigoHistoria`),
  ADD KEY `codigoMascota` (`codigoMascota`);

--
-- Indices de la tabla `historia_detalle`
--
ALTER TABLE `historia_detalle`
  ADD PRIMARY KEY (`codigodetalle`),
  ADD KEY `codigoHistoria` (`codigoHistoria`),
  ADD KEY `codigoCita` (`codigoCita`),
  ADD KEY `codigoEmpleado` (`codigoEmpleado`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`codigoMascota`),
  ADD KEY `codigoCliente` (`codigoCliente`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`codigoServicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `codigoCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `codigoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `codigoHistoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `historia_detalle`
--
ALTER TABLE `historia_detalle`
  MODIFY `codigodetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `codigoMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `codigoServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`codigoMascota`) REFERENCES `mascota` (`codigoMascota`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`codigoServicio`) REFERENCES `servicio` (`codigoServicio`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`codigoUsuario`) REFERENCES `usuario` (`codigoUsuario`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`codigoServicio`) REFERENCES `servicio` (`codigoServicio`);

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `historia_ibfk_1` FOREIGN KEY (`codigoMascota`) REFERENCES `mascota` (`codigoMascota`);

--
-- Filtros para la tabla `historia_detalle`
--
ALTER TABLE `historia_detalle`
  ADD CONSTRAINT `historia_detalle_ibfk_1` FOREIGN KEY (`codigoHistoria`) REFERENCES `historia` (`codigoHistoria`),
  ADD CONSTRAINT `historia_detalle_ibfk_2` FOREIGN KEY (`codigoCita`) REFERENCES `cita` (`codigoCita`),
  ADD CONSTRAINT `historia_detalle_ibfk_3` FOREIGN KEY (`codigoEmpleado`) REFERENCES `empleado` (`codigoEmpleado`);

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`codigoCliente`) REFERENCES `cliente` (`codigoCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
