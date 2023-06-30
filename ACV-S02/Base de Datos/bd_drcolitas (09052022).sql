-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2022 a las 06:39:45
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
(3, 'DNI', '52321525', 'SANTIAGO', 'GOMEZ DAVILA', '4654654', 'GOMEZ@HOTMAIL.COM', 1);

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
(1, 1, 'BRUNO', 'PAULLO MOLINA', '2000-05-03 00:00:00', '2022-01-04 00:00:00', 'VETERINARIO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `codigoHistoria` int(11) NOT NULL,
  `codigoMascota` int(11) NOT NULL,
  `fechaApertura` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 'RENTON 2', '2022-05-10 00:00:00', 'CANINO', 'CRIOLLO', 'Hembra', 1),
(2, 2, 'MANCHAS', '2021-05-01 00:00:00', 'FELINO', 'CRIOLLO', 'Hembra', 1);

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
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `codigoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `codigoHistoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `codigoMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`codigoCliente`) REFERENCES `cliente` (`codigoCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
