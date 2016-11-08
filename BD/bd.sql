-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2016 a las 15:59:54
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sccn`
--
--
CREATE DATABASE IF NOT EXISTS `sccn` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `sccn`;

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `cedula_alumno` int(11) NOT NULL,
  `primer_nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `id_seccion_alumno` int(11) NOT NULL,
  `nombre_representante` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_representante` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `cedula_alumno`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `id_seccion_alumno`, `nombre_representante`, `apellido_representante`) VALUES
(1, 242424, 'Daniel', 'Augusto', 'Perez', 'Melendez', 1, 'Ramón José', 'Perez Molina'),
(29, 11244555, 'Jose', '', 'Medina', '', 3, 'Carlos', 'Huerta'),
(30, 12444555, 'Juan', '', 'Mendez', '', 2, 'Carla', 'Mendez'),
(31, 14444455, 'Rodolfo', '', 'Ramirez', '', 2, 'Roberto', 'Ramirez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `a_escolar` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id`, `nombre`, `a_escolar`) VALUES
(1, 'Quinto', '2015-2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_usuarios`
--

CREATE TABLE `info_usuarios` (
  `id` int(11) NOT NULL,
  `cedula_usuario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_movil` int(11) NOT NULL,
  `telefono_local` int(11) NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `info_usuarios`
--

INSERT INTO `info_usuarios` (`id`, `cedula_usuario`, `fecha_nac`, `correo`, `telefono_movil`, `telefono_local`, `direccion`) VALUES
(9, '23333', '2016-06-09', 'juamanuel@gmail.com', 42424, 24242, 'Ffs Fssfsfsf Sfsfsfsf Sfsfsfsfsf'),
(18, '12555632', '2016-06-01', 'jorge.perez@gmail.com', 313131, 31313, 'Sector Catia La Mar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_mat` int(11) NOT NULL,
  `nombre_materia` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_mat`, `nombre_materia`) VALUES
(1, 'Castellano'),
(2, 'Matematica'),
(3, 'Quimica'),
(4, 'Fisica'),
(5, 'Hist. Venezuela'),
(6, 'Biologia'),
(7, 'Geometria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_notas` int(11) NOT NULL,
  `cedula_estudiante` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `def_uno` int(2) NOT NULL,
  `def_dos` int(2) NOT NULL,
  `def_tres` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_notas`, `cedula_estudiante`, `id_seccion`, `id_materia`, `def_uno`, `def_dos`, `def_tres`) VALUES
(22, 242424, 1, 1, 14, 17, 16),
(23, 242424, 1, 2, 6, 10, 11),
(24, 242424, 1, 3, 12, 14, 14),
(25, 242424, 1, 4, 13, 11, 14),
(26, 242424, 1, 5, 14, 15, 16),
(27, 242424, 1, 6, 11, 13, 13),
(28, 242424, 1, 7, 11, 12, 11),
(29, 123, 1, 1, 12, 13, 13),
(30, 11244555, 3, 2, 13, 10, 6),
(31, 11244555, 3, 4, 11, 9, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id_secc` int(11) NOT NULL,
  `nombre_seccion` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_prof_guia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id_secc`, `nombre_seccion`, `id_grado`, `id_prof_guia`) VALUES
(1, 'A', 1, 0),
(2, 'B', 1, 14),
(3, 'C', 1, 6),
(4, 'D', 1, 0),
(5, 'E', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `cedula` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `primer_nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_nombre` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primer_apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_sistema` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `rol` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `usuario_sistema`, `password`, `rol`, `activo`) VALUES
(1, '15166525', 'Alberto', 'Alexander', 'Perez', 'Gomez', 'aperez', '1234', 'Admin', 1),
(14, '23333', 'Juan', 'Manuel', 'Oropeza', 'Cartalla', 'juan32', '1234', 'Profesor', 1),
(24, '12555632', 'Jorge', 'Manuel', 'Perez', '', 'jorge123', '1234', 'Profesor', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_materias`
--

CREATE TABLE `usuario_materias` (
  `id` int(11) NOT NULL,
  `cedula_profesor` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_materias`
--

INSERT INTO `usuario_materias` (`id`, `cedula_profesor`, `id_materia`, `id_seccion`) VALUES
(1, '23333', 1, 1),
(2, '23333', 2, 1),
(3, '23333', 3, 1),
(4, '23333', 4, 1),
(5, '23333', 5, 1),
(6, '23333', 6, 1),
(7, '23333', 7, 1),
(17, '12555632', 4, 3),
(18, '12555632', 2, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula_alumno` (`cedula_alumno`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `info_usuarios`
--
ALTER TABLE `info_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula_usuario` (`cedula_usuario`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_mat`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_notas`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id_secc`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `usuario_sistema` (`usuario_sistema`);

--
-- Indices de la tabla `usuario_materias`
--
ALTER TABLE `usuario_materias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `info_usuarios`
--
ALTER TABLE `info_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_mat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_notas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id_secc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `usuario_materias`
--
ALTER TABLE `usuario_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
