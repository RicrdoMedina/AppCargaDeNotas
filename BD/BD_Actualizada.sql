-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2016 a las 12:11:12
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catsecurity`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_empleados`
--

CREATE TABLE IF NOT EXISTS `asistencia_empleados` (
  `id_asistencia_emp` int(11) NOT NULL,
  `id_empleado_asistencia` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salidad` time NOT NULL,
  `asistente` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_empleados`
--

CREATE TABLE IF NOT EXISTS `banco_empleados` (
  `id_emp_banco` int(11) NOT NULL,
  `id_banco_emp` int(11) NOT NULL,
  `id_tipo_cuenta` int(11) NOT NULL,
  `nombre_cuenta` varchar(20) NOT NULL,
  `id_nombre_banco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE IF NOT EXISTS `bancos` (
  `id_banco` int(11) NOT NULL,
  `nombre_banco` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id_banco`, `nombre_banco`) VALUES
(1, 'Industrial de Venezuela'),
(2, 'Mercantil'),
(3, 'Fondo Común'),
(4, 'Banesco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidad_descuentos_empleados`
--

CREATE TABLE IF NOT EXISTS `cantidad_descuentos_empleados` (
  `id_cantidad_descuentos` int(11) NOT NULL,
  `cantidad_horas` decimal(2,0) NOT NULL,
  `id_cantidad_nombre_descuento` int(11) NOT NULL,
  `id_cantidad_descuento_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_empleados`
--

CREATE TABLE IF NOT EXISTS `cargo_empleados` (
  `id_cargo` int(11) NOT NULL,
  `id_nivel_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion_descuentos`
--

CREATE TABLE IF NOT EXISTS `descripcion_descuentos` (
  `id_descripcion_descuento` int(11) NOT NULL,
  `descripcion_descuento` varchar(255) NOT NULL,
  `id_cantidad_descuento_descripcion_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_empleados`
--

CREATE TABLE IF NOT EXISTS `direccion_empleados` (
  `id_direccion` int(11) NOT NULL,
  `id_direcc_emp` int(11) NOT NULL,
  `id_estado_emp` int(11) NOT NULL,
  `id_municipio_emp` int(11) NOT NULL,
  `id_parroquia_emp` int(11) NOT NULL,
  `calle_avenida_emp` varchar(100) NOT NULL,
  `esquina` varchar(100) NOT NULL,
  `edif_casa` varchar(100) NOT NULL,
  `piso_edif` varchar(30) NOT NULL,
  `apto_edif` varchar(30) NOT NULL,
  `punto_referencia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_empresas`
--

CREATE TABLE IF NOT EXISTS `direccion_empresas` (
  `id_direccion_empresa` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL,
  `id_estado_empresa` int(11) NOT NULL,
  `id_municipio_empresa` int(11) NOT NULL,
  `id_parroquia_empresa` int(11) NOT NULL,
  `calle_avenida_empresa` varchar(100) NOT NULL,
  `esquina_referencia` varchar(100) NOT NULL,
  `edificio_empresa` varchar(100) NOT NULL,
  `piso_edificio` varchar(15) NOT NULL,
  `oficina` varchar(15) NOT NULL,
  `punto_referencia_empresa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dotacion_empleados`
--

CREATE TABLE IF NOT EXISTS `dotacion_empleados` (
  `id_dotacion_emp` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_dotacion_empleado` int(11) NOT NULL,
  `talla` varchar(2) NOT NULL,
  `cantidad` varchar(2) NOT NULL,
  `fecha_recibio_dotacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `id_emp` int(11) NOT NULL,
  `cod_emp` int(11) NOT NULL,
  `cedula_emp` int(11) NOT NULL,
  `fecha_venc_ced` date NOT NULL,
  `rif_emp` int(11) NOT NULL,
  `fecha_venc_rif` int(11) NOT NULL,
  `nombres_emp` varchar(100) NOT NULL,
  `apellidos_emp` varchar(100) NOT NULL,
  `num_patronal_emp` int(11) NOT NULL,
  `fecha_sso` date NOT NULL,
  `fecha_nac_emp` date NOT NULL,
  `foto_emp` varchar(200) NOT NULL,
  `id_sexo_emp` int(11) NOT NULL,
  `id_cargo_emp` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date NOT NULL,
  `cod_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `id_empresa` int(11) NOT NULL,
  `codigo_empresa` int(11) NOT NULL,
  `rif_empresa` int(11) NOT NULL,
  `nit_empresa` int(11) NOT NULL,
  `nombre_empresa` varchar(60) NOT NULL,
  `fecha_ingreso_empresa` date NOT NULL,
  `monto_cobrar_empresa` int(11) NOT NULL,
  `tiempo_empresa` int(11) NOT NULL,
  `fecha_retiro_empresa` date NOT NULL,
  `descripcion_retiro` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `id_municipio` int(11) NOT NULL,
  `nombre_municipio` varchar(100) NOT NULL,
  `id_municipio_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombre_montos`
--

CREATE TABLE IF NOT EXISTS `nombre_montos` (
  `id_nombre_monto` int(11) NOT NULL,
  `nombre_constante` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nombre_montos`
--

INSERT INTO `nombre_montos` (`id_nombre_monto`, `nombre_constante`) VALUES
(1, 'cesta ticket'),
(2, 'monto servicio prestado'),
(3, 'valor dia domingo'),
(4, 'monto servicio prestado'),
(5, 'monto servicio prestado'),
(6, 'valor dia feriado'),
(7, 'valor riesgo seguro social'),
(8, 'valor riesgo ley politica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombres_descuentos`
--

CREATE TABLE IF NOT EXISTS `nombres_descuentos` (
  `id_nombres_descuentos` int(11) NOT NULL,
  `nombre_descuento` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nombres_descuentos`
--

INSERT INTO `nombres_descuentos` (`id_nombres_descuentos`, `nombre_descuento`) VALUES
(1, 'descuentos horas nocturnas trabajadas'),
(2, ' descuentos horas diurnas trabajadas'),
(4, 'otros pagos diurnos'),
(5, 'dias feriados trabajados'),
(6, 'dias laborados'),
(7, 'servicios prestados'),
(8, 'faltas diurnas'),
(9, 'seguro social'),
(10, 'horas nocturnas extras trabajadas'),
(11, 'faltas justificadas'),
(12, 'faltas nocturnas'),
(13, 'domingos trabajados'),
(14, 'faltas mixtas trabajadas'),
(15, 'ley politica'),
(16, 'dias libres'),
(18, 'horas diurnas extras trabajadas'),
(19, 'otros pagos nocturnos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquias`
--

CREATE TABLE IF NOT EXISTS `parroquias` (
  `id_parroquias` int(11) NOT NULL,
  `nombre_parroquia` varchar(100) NOT NULL,
  `id_parroquia_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representate_empresas`
--

CREATE TABLE IF NOT EXISTS `representate_empresas` (
  `id_representante_empresa` int(11) NOT NULL,
  `cedula_representante` int(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `cod_empresa_representada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexos`
--

CREATE TABLE IF NOT EXISTS `sexos` (
  `id_sexo` int(11) NOT NULL,
  `sexo` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sexos`
--

INSERT INTO `sexos` (`id_sexo`, `sexo`) VALUES
(1, 'masculino'),
(2, 'femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_empleados`
--

CREATE TABLE IF NOT EXISTS `telefonos_empleados` (
  `id_telefono` int(11) NOT NULL,
  `id_telef_emp` int(11) NOT NULL,
  `id_tipo_telf` int(11) NOT NULL,
  `num_telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cuenta_banco`
--

CREATE TABLE IF NOT EXISTS `tipo_cuenta_banco` (
  `id_tipo_cuenta_banco` int(11) NOT NULL,
  `tipo_cuenta_banco` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_cuenta_banco`
--

INSERT INTO `tipo_cuenta_banco` (`id_tipo_cuenta_banco`, `tipo_cuenta_banco`) VALUES
(1, 'Corriente'),
(2, 'Ahorro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_dotaciones`
--

CREATE TABLE IF NOT EXISTS `tipos_dotaciones` (
  `id_dotacion` int(11) NOT NULL,
  `nombre_dotacion` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_dotaciones`
--

INSERT INTO `tipos_dotaciones` (`id_dotacion`, `nombre_dotacion`) VALUES
(1, 'camisa'),
(2, 'pantalon'),
(3, 'zapato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_niveles_cargo`
--

CREATE TABLE IF NOT EXISTS `tipos_niveles_cargo` (
  `id_tipos_niveles_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(30) NOT NULL,
  `nivel_cargo` varchar(30) NOT NULL,
  `sueldo_diario` int(11) NOT NULL,
  `acceso_cargo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_telefonos`
--

CREATE TABLE IF NOT EXISTS `tipos_telefonos` (
  `id_tipo_telef` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_telefonos`
--

INSERT INTO `tipos_telefonos` (`id_tipo_telef`, `nombre`) VALUES
(1, 'local'),
(2, 'movil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_banco_empleados`
--

CREATE TABLE IF NOT EXISTS `traza_banco_empleados` (
  `id_traza_banco` int(11) NOT NULL,
  `id_banco_actualizo` int(11) NOT NULL,
  `id_banco_emp_actualizo` int(11) NOT NULL,
  `id_tipo_cuenta_actualizo` int(11) NOT NULL,
  `nombre_cuenta_actualizo` varchar(20) NOT NULL,
  `id_nombre_banco_actialuzo` int(11) NOT NULL,
  `usuario_banco_emp_actualizo` int(11) NOT NULL,
  `fecha_banco_empleado_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_cantidad_descuentos_empleados`
--

CREATE TABLE IF NOT EXISTS `traza_cantidad_descuentos_empleados` (
  `id_traza_cantidad_descuentos` int(11) NOT NULL,
  `id_cantidad_descuentos_actualizado` int(11) NOT NULL,
  `cantidad_horas_actualizo` decimal(2,0) NOT NULL,
  `id_cantidad_nombre_descuento_actualizo` int(11) NOT NULL,
  `id_cantidad_descuento_emp_actualizo` int(11) NOT NULL,
  `usuario_cantidad_descuento_emp_actualizo` int(11) NOT NULL,
  `fecha_cantidad_descuento_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_descripcion_descuentos`
--

CREATE TABLE IF NOT EXISTS `traza_descripcion_descuentos` (
  `id_traza_descripcion_descuento` int(11) NOT NULL,
  `id_descricpion_descuento_actualizo` int(11) NOT NULL,
  `descripcion_descuento_actualizo` varchar(255) NOT NULL,
  `id_cantidad_descuento_descripcion_emp_actualizo` int(11) NOT NULL,
  `usuario_descripcion_descuento_actualizo` int(11) NOT NULL,
  `fecha_descripcion_descuento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_direccion_empleados`
--

CREATE TABLE IF NOT EXISTS `traza_direccion_empleados` (
  `id_traza_direccion_empleado` int(11) NOT NULL,
  `id_estado_empleado_actualizo` int(11) NOT NULL,
  `id_municipio_empleado_actualizo` int(11) NOT NULL,
  `id_parroquia_empleado_actualizo` int(11) NOT NULL,
  `calle_avenidda_empleado_actualizo` varchar(100) NOT NULL,
  `esquina_actualizo` varchar(100) NOT NULL,
  `edif_casa_actualizo` varchar(100) NOT NULL,
  `piso_edif_actualizo` varchar(30) NOT NULL,
  `apto_edif_actualizo` varchar(30) NOT NULL,
  `punto_referencia_empleado_actualizo` varchar(100) NOT NULL,
  `id_direccion_empleado_actualizo` int(11) NOT NULL,
  `usuario_direccion_empleado_actualizo` int(11) NOT NULL,
  `fecha_direccion_empleado_actualizo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_direccion_empresas`
--

CREATE TABLE IF NOT EXISTS `traza_direccion_empresas` (
  `id_traza_direccion_empresa` int(11) NOT NULL,
  `id_direccion_empresa_actualizo` int(11) NOT NULL,
  `cod_empresa_actualizo` int(11) NOT NULL,
  `id_estado_empresa_actualizo` int(11) NOT NULL,
  `id_municipio_empresa_actualizo` int(11) NOT NULL,
  `id_parroquia_empresa_actualizo` int(11) NOT NULL,
  `calle_avenida_empresa_actualizo` varchar(100) NOT NULL,
  `esquina_referencia_actualizo` varchar(100) NOT NULL,
  `edificio_empresa_actualizo` varchar(100) NOT NULL,
  `piso_edificio_actualizo` varchar(15) NOT NULL,
  `oficina_actualizo` varchar(15) NOT NULL,
  `punto_referencia_actualizo` varchar(100) NOT NULL,
  `usuario_actualizo_direccion` int(11) NOT NULL,
  `fecha_actualizo_direccion_empresa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_dotacion_empleados`
--

CREATE TABLE IF NOT EXISTS `traza_dotacion_empleados` (
  `id_traza_dotacion_empleados` int(11) NOT NULL,
  `id_tipo_dotacion_actualizo` int(11) NOT NULL,
  `id_dotacion_emp` int(11) NOT NULL,
  `talla_actualizo` varchar(2) NOT NULL,
  `cantidad_actualizo` varchar(2) NOT NULL,
  `fecha_recibio_dotacion_actualizo` date NOT NULL,
  `id_dotacion_empleado_actualizo` int(11) NOT NULL,
  `usuario_dotacion_empleado_actualizo` int(11) NOT NULL,
  `fecha_dotacion_empleado_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_empleados`
--

CREATE TABLE IF NOT EXISTS `traza_empleados` (
  `id_traza_empleado` int(11) NOT NULL,
  `cod_empleado_actualizo` int(11) NOT NULL,
  `cedula_empleado_actualizo` int(11) NOT NULL,
  `fecha_venc_ced_actualizo` date NOT NULL,
  `rif_emp_actualizo` int(11) NOT NULL,
  `fecha_venc_rif_actualizo` date NOT NULL,
  `nombres_empleado_actualizo` varchar(100) NOT NULL,
  `apellidos_empleado_actualizo` varchar(100) NOT NULL,
  `num_patronal_emp_actualizo` int(11) NOT NULL,
  `fecha_sso_actualizo` date NOT NULL,
  `fecha_nac_emp_actualizo` date NOT NULL,
  `foto_emp_actualizo` varchar(200) NOT NULL,
  `id_sexo_emp_actualizo` int(11) NOT NULL,
  `id_cargo_emp_actualizo` int(11) NOT NULL,
  `fecha_ingreso_actualizo` date NOT NULL,
  `fecha_egreso_actualizo` date NOT NULL,
  `cod_empresa_empleado_actualizo` int(11) NOT NULL,
  `usuario_empleado_actualizo` int(11) NOT NULL,
  `id_empleado_actualizo` int(11) NOT NULL,
  `fecha_empleado_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_empresas`
--

CREATE TABLE IF NOT EXISTS `traza_empresas` (
  `id_traza_empresa` int(11) NOT NULL,
  `codigo_empresa_actualizo` int(11) NOT NULL,
  `rif_empresa_actualizo` int(11) NOT NULL,
  `nit_empresa_actualizo` int(11) NOT NULL,
  `nombre_empresa_actualizo` varchar(60) NOT NULL,
  `fecha_ingreso_empresa_actualizo` date NOT NULL,
  `monto_cobrar_empresa_actualizo` int(11) NOT NULL,
  `tiempo_empresa_actualizo` int(11) NOT NULL,
  `fecha_retiro_empresa_actualizo` date NOT NULL,
  `descripcion_retiro_actualizo` varchar(200) NOT NULL,
  `id_empresa_actualizo` int(11) NOT NULL,
  `usuario_empresa_actualizo` int(11) NOT NULL,
  `fecha_empresa_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_nombres_descuentos`
--

CREATE TABLE IF NOT EXISTS `traza_nombres_descuentos` (
  `id_traza_nombres_descuentos` int(11) NOT NULL,
  `id_nombres_descuentos_actualizado` int(11) NOT NULL,
  `nombre_descuento_actualizo` varchar(50) NOT NULL,
  `usuario_nombre_descuento_actualizo` int(11) NOT NULL,
  `fecha_nombre_descuento_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_nombres_montos`
--

CREATE TABLE IF NOT EXISTS `traza_nombres_montos` (
  `id_traza_nombre_monto` int(11) NOT NULL,
  `id_nombre_monto_actualizado` int(11) NOT NULL,
  `nombre_constante_actualizado` int(11) NOT NULL,
  `usuario_nombre_monto_actualizo` int(11) NOT NULL,
  `fecha_nombre_monto_actualizado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_representante_empresas`
--

CREATE TABLE IF NOT EXISTS `traza_representante_empresas` (
  `id_traza_representante_empresa` int(11) NOT NULL,
  `cedula_representante_actualizo` int(11) NOT NULL,
  `nombres_actualizo` varchar(100) NOT NULL,
  `apellidos_actualizo` varchar(100) NOT NULL,
  `cod_empresa_representada_actualizo` int(11) NOT NULL,
  `id_representante_empresa_actualizo` int(11) NOT NULL,
  `usuario_representante_empresa_actualizo` int(11) NOT NULL,
  `fecha_representante_empresa_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_telefonos_empleados`
--

CREATE TABLE IF NOT EXISTS `traza_telefonos_empleados` (
  `id_traza_telefono` int(11) NOT NULL,
  `id_telefono_actualizo` int(11) NOT NULL,
  `id_telef_emp_actualizo` int(11) NOT NULL,
  `id_tipo_telef_actualizo` int(11) NOT NULL,
  `num_telefono_actualizo` int(11) NOT NULL,
  `usuario_telefono_actualizo` int(11) NOT NULL,
  `fecha_telefono_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_tipos_niveles_cargos`
--

CREATE TABLE IF NOT EXISTS `traza_tipos_niveles_cargos` (
  `id_traza_tipos_niveles_cargo` int(11) NOT NULL,
  `nombre_cargo_actualizo` varchar(30) NOT NULL,
  `nivel_cargo` varchar(30) NOT NULL,
  `sueldo_diario` int(11) NOT NULL,
  `acceso_cargo` int(1) NOT NULL,
  `id_tipos_niveles_cargo_actualizo` int(11) NOT NULL,
  `usuario_tipos_niveles_cargo_actualizo` int(11) NOT NULL,
  `fecha_niveles_cargo_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traza_valores_constantes`
--

CREATE TABLE IF NOT EXISTS `traza_valores_constantes` (
  `id_traza_valor` int(11) NOT NULL,
  `id_valor_actualizado` int(11) NOT NULL,
  `valor_actualizo` int(11) NOT NULL,
  `id_monto_constante_actualizo` int(11) NOT NULL,
  `usuario_valor_cosntante_actualizo` int(11) NOT NULL,
  `fecha_valor_constante_actualizo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` int(11) NOT NULL,
  `ultima_fecha_conexion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores_constantes`
--

CREATE TABLE IF NOT EXISTS `valores_constantes` (
  `id_valor` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `id_monto_constante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia_empleados`
--
ALTER TABLE `asistencia_empleados`
  ADD PRIMARY KEY (`id_asistencia_emp`),
  ADD KEY `id_empleado_asistencia` (`id_empleado_asistencia`);

--
-- Indices de la tabla `banco_empleados`
--
ALTER TABLE `banco_empleados`
  ADD PRIMARY KEY (`id_emp_banco`),
  ADD KEY `id_banco_emp` (`id_banco_emp`),
  ADD KEY `id_nombre_banco` (`id_nombre_banco`),
  ADD KEY `id_tipo_cuenta` (`id_tipo_cuenta`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id_banco`);

--
-- Indices de la tabla `cantidad_descuentos_empleados`
--
ALTER TABLE `cantidad_descuentos_empleados`
  ADD PRIMARY KEY (`id_cantidad_descuentos`),
  ADD KEY `id_cantidad_nombre_descuento` (`id_cantidad_nombre_descuento`),
  ADD KEY `id_cantidad_descuento_emp` (`id_cantidad_descuento_emp`);

--
-- Indices de la tabla `cargo_empleados`
--
ALTER TABLE `cargo_empleados`
  ADD PRIMARY KEY (`id_cargo`),
  ADD KEY `id_nivel_cargo` (`id_nivel_cargo`);

--
-- Indices de la tabla `descripcion_descuentos`
--
ALTER TABLE `descripcion_descuentos`
  ADD PRIMARY KEY (`id_descripcion_descuento`);

--
-- Indices de la tabla `direccion_empleados`
--
ALTER TABLE `direccion_empleados`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_direcc_emp` (`id_direcc_emp`),
  ADD KEY `id_municipio_emp` (`id_municipio_emp`),
  ADD KEY `id_estado__emp` (`id_estado_emp`),
  ADD KEY `id_parroquia_emp` (`id_parroquia_emp`);

--
-- Indices de la tabla `direccion_empresas`
--
ALTER TABLE `direccion_empresas`
  ADD PRIMARY KEY (`id_direccion_empresa`),
  ADD KEY `cod_empresa` (`cod_empresa`),
  ADD KEY `id_estado_empresa` (`id_estado_empresa`),
  ADD KEY `id_municipio_empresa` (`id_municipio_empresa`),
  ADD KEY `id_parroquia_empresa` (`id_parroquia_empresa`);

--
-- Indices de la tabla `dotacion_empleados`
--
ALTER TABLE `dotacion_empleados`
  ADD PRIMARY KEY (`id_dotacion_emp`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `id_dotacion_empleado` (`id_dotacion_empleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_emp`,`cod_emp`),
  ADD UNIQUE KEY `ci` (`cedula_emp`),
  ADD UNIQUE KEY `rif` (`rif_emp`),
  ADD KEY `cod_empresa` (`cod_empresa`),
  ADD KEY `cod_empresa_2` (`cod_empresa`),
  ADD KEY `id_cargo_emp` (`id_cargo_emp`),
  ADD KEY `id_cargo_emp_2` (`id_cargo_emp`),
  ADD KEY `id_cargo_emp_3` (`id_cargo_emp`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`,`codigo_empresa`),
  ADD UNIQUE KEY `rif_empresa` (`rif_empresa`),
  ADD UNIQUE KEY `nit_empresa` (`nit_empresa`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_municipio_estado` (`id_municipio_estado`);

--
-- Indices de la tabla `nombre_montos`
--
ALTER TABLE `nombre_montos`
  ADD PRIMARY KEY (`id_nombre_monto`);

--
-- Indices de la tabla `nombres_descuentos`
--
ALTER TABLE `nombres_descuentos`
  ADD PRIMARY KEY (`id_nombres_descuentos`);

--
-- Indices de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD PRIMARY KEY (`id_parroquias`),
  ADD KEY `id_parroquia_municipio` (`id_parroquia_municipio`);

--
-- Indices de la tabla `representate_empresas`
--
ALTER TABLE `representate_empresas`
  ADD PRIMARY KEY (`id_representante_empresa`),
  ADD KEY `cod_empresa_representada` (`cod_empresa_representada`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sexos`
--
ALTER TABLE `sexos`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `telefonos_empleados`
--
ALTER TABLE `telefonos_empleados`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `id_telef_emp` (`id_telef_emp`),
  ADD KEY `id_tipo_telf` (`id_tipo_telf`);

--
-- Indices de la tabla `tipo_cuenta_banco`
--
ALTER TABLE `tipo_cuenta_banco`
  ADD PRIMARY KEY (`id_tipo_cuenta_banco`);

--
-- Indices de la tabla `tipos_dotaciones`
--
ALTER TABLE `tipos_dotaciones`
  ADD PRIMARY KEY (`id_dotacion`);

--
-- Indices de la tabla `tipos_niveles_cargo`
--
ALTER TABLE `tipos_niveles_cargo`
  ADD PRIMARY KEY (`id_tipos_niveles_cargo`);

--
-- Indices de la tabla `tipos_telefonos`
--
ALTER TABLE `tipos_telefonos`
  ADD PRIMARY KEY (`id_tipo_telef`);

--
-- Indices de la tabla `traza_banco_empleados`
--
ALTER TABLE `traza_banco_empleados`
  ADD PRIMARY KEY (`id_traza_banco`),
  ADD KEY `usuario_banco_emp_actualizo` (`usuario_banco_emp_actualizo`),
  ADD KEY `id_nombre_banco_actialuzo` (`id_nombre_banco_actialuzo`),
  ADD KEY `id_tipo_cuenta_actualizo` (`id_tipo_cuenta_actualizo`);

--
-- Indices de la tabla `traza_cantidad_descuentos_empleados`
--
ALTER TABLE `traza_cantidad_descuentos_empleados`
  ADD PRIMARY KEY (`id_traza_cantidad_descuentos`),
  ADD KEY `id_cantidad_descuento_emp_actualizo` (`id_cantidad_descuento_emp_actualizo`),
  ADD KEY `usuario_cantidad_descuento_emp_actualizo` (`usuario_cantidad_descuento_emp_actualizo`),
  ADD KEY `id_cantidad_descuentos_actualizado` (`id_cantidad_descuentos_actualizado`);

--
-- Indices de la tabla `traza_descripcion_descuentos`
--
ALTER TABLE `traza_descripcion_descuentos`
  ADD PRIMARY KEY (`id_traza_descripcion_descuento`),
  ADD KEY `id_cantidad_descuento_descripcion_emp_actualizo` (`id_cantidad_descuento_descripcion_emp_actualizo`),
  ADD KEY `usuario_descripcion_descuento_actualizo` (`usuario_descripcion_descuento_actualizo`);

--
-- Indices de la tabla `traza_direccion_empleados`
--
ALTER TABLE `traza_direccion_empleados`
  ADD PRIMARY KEY (`id_traza_direccion_empleado`),
  ADD KEY `usuario_direccion_empleado_actualizo` (`usuario_direccion_empleado_actualizo`),
  ADD KEY `fecha_direccion_empleado_actualizo` (`fecha_direccion_empleado_actualizo`);

--
-- Indices de la tabla `traza_direccion_empresas`
--
ALTER TABLE `traza_direccion_empresas`
  ADD PRIMARY KEY (`id_traza_direccion_empresa`),
  ADD KEY `id_direccion_empresa_actualizo` (`id_direccion_empresa_actualizo`),
  ADD KEY `usuario_actualizo_direccion` (`usuario_actualizo_direccion`);

--
-- Indices de la tabla `traza_dotacion_empleados`
--
ALTER TABLE `traza_dotacion_empleados`
  ADD PRIMARY KEY (`id_traza_dotacion_empleados`),
  ADD KEY `usuario_dotacion_empleado_actualizo` (`usuario_dotacion_empleado_actualizo`),
  ADD KEY `id_dotacion_empleado_actualizo` (`id_dotacion_empleado_actualizo`);

--
-- Indices de la tabla `traza_empleados`
--
ALTER TABLE `traza_empleados`
  ADD PRIMARY KEY (`id_traza_empleado`),
  ADD KEY `usuario_empleado_actualizo` (`usuario_empleado_actualizo`),
  ADD KEY `id_empleado_actualizo` (`id_empleado_actualizo`);

--
-- Indices de la tabla `traza_empresas`
--
ALTER TABLE `traza_empresas`
  ADD PRIMARY KEY (`id_traza_empresa`),
  ADD KEY `id_empresa_actualizo` (`id_empresa_actualizo`),
  ADD KEY `usuario_empresa_actualizo` (`usuario_empresa_actualizo`);

--
-- Indices de la tabla `traza_nombres_descuentos`
--
ALTER TABLE `traza_nombres_descuentos`
  ADD PRIMARY KEY (`id_traza_nombres_descuentos`),
  ADD KEY `usuario_nombre_descuento_actualizo` (`usuario_nombre_descuento_actualizo`),
  ADD KEY `id_nombres_descuentos_actualizado` (`id_nombres_descuentos_actualizado`);

--
-- Indices de la tabla `traza_nombres_montos`
--
ALTER TABLE `traza_nombres_montos`
  ADD PRIMARY KEY (`id_traza_nombre_monto`),
  ADD KEY `usuario_nombre_monto_actualizo` (`usuario_nombre_monto_actualizo`),
  ADD KEY `id_nombre_monto_actualizado` (`id_nombre_monto_actualizado`);

--
-- Indices de la tabla `traza_representante_empresas`
--
ALTER TABLE `traza_representante_empresas`
  ADD PRIMARY KEY (`id_traza_representante_empresa`),
  ADD KEY `id_representante_empresa_actualizo` (`id_representante_empresa_actualizo`),
  ADD KEY `usuario_representante_empresa_actualizo` (`usuario_representante_empresa_actualizo`);

--
-- Indices de la tabla `traza_telefonos_empleados`
--
ALTER TABLE `traza_telefonos_empleados`
  ADD PRIMARY KEY (`id_traza_telefono`),
  ADD KEY `id_telefono_actualizo` (`id_telefono_actualizo`),
  ADD KEY `usuario_telefono_actualizo` (`usuario_telefono_actualizo`),
  ADD KEY `id_tipo_telef_actualizo` (`id_tipo_telef_actualizo`);

--
-- Indices de la tabla `traza_tipos_niveles_cargos`
--
ALTER TABLE `traza_tipos_niveles_cargos`
  ADD PRIMARY KEY (`id_traza_tipos_niveles_cargo`),
  ADD KEY `usuario_tipos_niveles_cargo_actualizo` (`usuario_tipos_niveles_cargo_actualizo`),
  ADD KEY `id_tipos_niveles_cargo_actualizo` (`id_tipos_niveles_cargo_actualizo`);

--
-- Indices de la tabla `traza_valores_constantes`
--
ALTER TABLE `traza_valores_constantes`
  ADD PRIMARY KEY (`id_traza_valor`),
  ADD KEY `id_monto_constante_actualizo` (`id_monto_constante_actualizo`),
  ADD KEY `usuario_valor_cosntante_actualizo` (`usuario_valor_cosntante_actualizo`),
  ADD KEY `id_valor_actualizado` (`id_valor_actualizado`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `valores_constantes`
--
ALTER TABLE `valores_constantes`
  ADD PRIMARY KEY (`id_valor`),
  ADD KEY `id_monto_constante` (`id_monto_constante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia_empleados`
--
ALTER TABLE `asistencia_empleados`
  MODIFY `id_asistencia_emp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `banco_empleados`
--
ALTER TABLE `banco_empleados`
  MODIFY `id_emp_banco` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id_banco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `cargo_empleados`
--
ALTER TABLE `cargo_empleados`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `descripcion_descuentos`
--
ALTER TABLE `descripcion_descuentos`
  MODIFY `id_descripcion_descuento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `direccion_empleados`
--
ALTER TABLE `direccion_empleados`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `direccion_empresas`
--
ALTER TABLE `direccion_empresas`
  MODIFY `id_direccion_empresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `dotacion_empleados`
--
ALTER TABLE `dotacion_empleados`
  MODIFY `id_dotacion_emp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_emp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `nombre_montos`
--
ALTER TABLE `nombre_montos`
  MODIFY `id_nombre_monto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `nombres_descuentos`
--
ALTER TABLE `nombres_descuentos`
  MODIFY `id_nombres_descuentos` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  MODIFY `id_parroquias` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `representate_empresas`
--
ALTER TABLE `representate_empresas`
  MODIFY `id_representante_empresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sexos`
--
ALTER TABLE `sexos`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `telefonos_empleados`
--
ALTER TABLE `telefonos_empleados`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_cuenta_banco`
--
ALTER TABLE `tipo_cuenta_banco`
  MODIFY `id_tipo_cuenta_banco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipos_dotaciones`
--
ALTER TABLE `tipos_dotaciones`
  MODIFY `id_dotacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipos_niveles_cargo`
--
ALTER TABLE `tipos_niveles_cargo`
  MODIFY `id_tipos_niveles_cargo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipos_telefonos`
--
ALTER TABLE `tipos_telefonos`
  MODIFY `id_tipo_telef` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `traza_banco_empleados`
--
ALTER TABLE `traza_banco_empleados`
  MODIFY `id_traza_banco` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_cantidad_descuentos_empleados`
--
ALTER TABLE `traza_cantidad_descuentos_empleados`
  MODIFY `id_traza_cantidad_descuentos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_descripcion_descuentos`
--
ALTER TABLE `traza_descripcion_descuentos`
  MODIFY `id_traza_descripcion_descuento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_direccion_empleados`
--
ALTER TABLE `traza_direccion_empleados`
  MODIFY `id_traza_direccion_empleado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_direccion_empresas`
--
ALTER TABLE `traza_direccion_empresas`
  MODIFY `id_traza_direccion_empresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_dotacion_empleados`
--
ALTER TABLE `traza_dotacion_empleados`
  MODIFY `id_traza_dotacion_empleados` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_empleados`
--
ALTER TABLE `traza_empleados`
  MODIFY `id_traza_empleado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_empresas`
--
ALTER TABLE `traza_empresas`
  MODIFY `id_traza_empresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_nombres_descuentos`
--
ALTER TABLE `traza_nombres_descuentos`
  MODIFY `id_traza_nombres_descuentos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_nombres_montos`
--
ALTER TABLE `traza_nombres_montos`
  MODIFY `id_traza_nombre_monto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_representante_empresas`
--
ALTER TABLE `traza_representante_empresas`
  MODIFY `id_traza_representante_empresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_telefonos_empleados`
--
ALTER TABLE `traza_telefonos_empleados`
  MODIFY `id_traza_telefono` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_tipos_niveles_cargos`
--
ALTER TABLE `traza_tipos_niveles_cargos`
  MODIFY `id_traza_tipos_niveles_cargo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traza_valores_constantes`
--
ALTER TABLE `traza_valores_constantes`
  MODIFY `id_traza_valor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `valores_constantes`
--
ALTER TABLE `valores_constantes`
  MODIFY `id_valor` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia_empleados`
--
ALTER TABLE `asistencia_empleados`
  ADD CONSTRAINT `asistencia_empleados_ibfk_1` FOREIGN KEY (`id_empleado_asistencia`) REFERENCES `empleados` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `banco_empleados`
--
ALTER TABLE `banco_empleados`
  ADD CONSTRAINT `banco_empleados_ibfk_1` FOREIGN KEY (`id_nombre_banco`) REFERENCES `bancos` (`id_banco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banco_empleados_ibfk_2` FOREIGN KEY (`id_banco_emp`) REFERENCES `empleados` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banco_empleados_ibfk_3` FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `tipo_cuenta_banco` (`id_tipo_cuenta_banco`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cantidad_descuentos_empleados`
--
ALTER TABLE `cantidad_descuentos_empleados`
  ADD CONSTRAINT `cantidad_descuentos_empleados_ibfk_1` FOREIGN KEY (`id_cantidad_nombre_descuento`) REFERENCES `nombres_descuentos` (`id_nombres_descuentos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cantidad_descuentos_empleados_ibfk_2` FOREIGN KEY (`id_cantidad_descuento_emp`) REFERENCES `empleados` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cargo_empleados`
--
ALTER TABLE `cargo_empleados`
  ADD CONSTRAINT `cargo_empleados_ibfk_1` FOREIGN KEY (`id_nivel_cargo`) REFERENCES `tipos_niveles_cargo` (`id_tipos_niveles_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direccion_empleados`
--
ALTER TABLE `direccion_empleados`
  ADD CONSTRAINT `direccion_empleados_ibfk_1` FOREIGN KEY (`id_direcc_emp`) REFERENCES `empleados` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direccion_empresas`
--
ALTER TABLE `direccion_empresas`
  ADD CONSTRAINT `direccion_empresas_ibfk_1` FOREIGN KEY (`cod_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dotacion_empleados`
--
ALTER TABLE `dotacion_empleados`
  ADD CONSTRAINT `dotacion_empleados_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_dotaciones` (`id_dotacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dotacion_empleados_ibfk_2` FOREIGN KEY (`id_dotacion_empleado`) REFERENCES `empleados` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`cod_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_cargo_emp`) REFERENCES `cargo_empleados` (`id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`id_municipio_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD CONSTRAINT `parroquias_ibfk_1` FOREIGN KEY (`id_parroquia_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `representate_empresas`
--
ALTER TABLE `representate_empresas`
  ADD CONSTRAINT `representate_empresas_ibfk_1` FOREIGN KEY (`cod_empresa_representada`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonos_empleados`
--
ALTER TABLE `telefonos_empleados`
  ADD CONSTRAINT `telefonos_empleados_ibfk_1` FOREIGN KEY (`id_tipo_telf`) REFERENCES `tipos_telefonos` (`id_tipo_telef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `telefonos_empleados_ibfk_2` FOREIGN KEY (`id_telef_emp`) REFERENCES `empleados` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valores_constantes`
--
ALTER TABLE `valores_constantes`
  ADD CONSTRAINT `valores_constantes_ibfk_1` FOREIGN KEY (`id_monto_constante`) REFERENCES `nombre_montos` (`id_nombre_monto`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `cdcol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cds`
--
ALTER TABLE `cds`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cds`
--
ALTER TABLE `cds`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;--
-- Base de datos: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
  `id` int(5) unsigned NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
  `id` bigint(20) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_navigationhiding`
--

CREATE TABLE IF NOT EXISTS `pma_navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Volcado de datos para la tabla `pma_navigationhiding`
--

INSERT INTO `pma_navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'roles', 'table', 'catsecurity', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma_pdf_pages`
--

INSERT INTO `pma_pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('catsecurity', 1, 'E/R catsecurity');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"sccn","table":"notas"},{"db":"sccn","table":"usuarios"},{"db":"sccn","table":"alumnos"},{"db":"sccn","table":"materias"},{"db":"sccn","table":"secciones"},{"db":"sccn","table":"usuario_materias"},{"db":"sccn","table":"info_usuarios"},{"db":"catsecurity","table":"usuarios"},{"db":"catsecurity","table":"asistencia_empleados"},{"db":"catsecurity","table":"banco_empleados"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_savedsearches`
--

CREATE TABLE IF NOT EXISTS `pma_savedsearches` (
  `id` int(5) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Volcado de datos para la tabla `pma_table_coords`
--

INSERT INTO `pma_table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('catsecurity', 'valores_constantes', 1, 665, 203),
('catsecurity', 'usuarios', 1, 45, 4),
('catsecurity', 'traza_valores_constantes', 1, 36, 2290),
('catsecurity', 'traza_telefonos_empleados', 1, 32, 2471),
('catsecurity', 'traza_tipos_niveles_cargos', 1, 33, 2058),
('catsecurity', 'traza_representante_empresas', 1, 32, 1830),
('catsecurity', 'traza_nombres_montos', 1, 808, 2352),
('catsecurity', 'traza_nombres_descuentos', 1, 803, 2191),
('catsecurity', 'traza_empresas', 1, 419, 1450),
('catsecurity', 'traza_empleados', 1, 777, 1436),
('catsecurity', 'traza_dotacion_empleados', 1, 778, 1939),
('catsecurity', 'traza_direccion_empresas', 1, 31, 1455),
('catsecurity', 'traza_direccion_empleados', 1, 407, 1821),
('catsecurity', 'traza_descripcion_descuentos', 1, 384, 2374),
('catsecurity', 'traza_cantidad_descuentos_empleados', 1, 406, 2170),
('catsecurity', 'traza_banco_empleados', 1, 802, 2516),
('catsecurity', 'tipo_cuenta_banco', 1, 628, 1129),
('catsecurity', 'tipos_telefonos', 1, 636, 1346),
('catsecurity', 'tipos_niveles_cargo', 1, 58, 295),
('catsecurity', 'tipos_dotaciones', 1, 341, 1351),
('catsecurity', 'telefonos_empleados', 1, 629, 1218),
('catsecurity', 'sexos', 1, 56, 205),
('catsecurity', 'roles', 1, 294, 14),
('catsecurity', 'representate_empresas', 1, 36, 617),
('catsecurity', 'parroquias', 1, 921, 17),
('catsecurity', 'nombre_montos', 1, 367, 202),
('catsecurity', 'nombres_descuentos', 1, 635, 458),
('catsecurity', 'municipios', 1, 679, 19),
('catsecurity', 'estados', 1, 451, 17),
('catsecurity', 'empresas', 1, 38, 772),
('catsecurity', 'empleados', 1, 356, 738),
('catsecurity', 'dotacion_empleados', 1, 341, 1181),
('catsecurity', 'direccion_empresas', 1, 40, 1093),
('catsecurity', 'direccion_empleados', 1, 351, 412),
('catsecurity', 'descripcion_descuentos', 1, 635, 347),
('catsecurity', 'cargo_empleados', 1, 60, 476),
('catsecurity', 'cantidad_descuentos_empleados', 1, 635, 552),
('catsecurity', 'banco_empleados', 1, 629, 971),
('catsecurity', 'bancos', 1, 628, 881),
('catsecurity', 'asistencia_empleados', 1, 624, 697);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-03-25 13:14:53', '{"lang":"es","collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_usergroups`
--

CREATE TABLE IF NOT EXISTS `pma_usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_users`
--

CREATE TABLE IF NOT EXISTS `pma_users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma_column_info`
--
ALTER TABLE `pma_column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma_designer_coords`
--
ALTER TABLE `pma_designer_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma_history`
--
ALTER TABLE `pma_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma_navigationhiding`
--
ALTER TABLE `pma_navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma_recent`
--
ALTER TABLE `pma_recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma_relation`
--
ALTER TABLE `pma_relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma_table_coords`
--
ALTER TABLE `pma_table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma_table_info`
--
ALTER TABLE `pma_table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma_table_uiprefs`
--
ALTER TABLE `pma_table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma_tracking`
--
ALTER TABLE `pma_tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma_userconfig`
--
ALTER TABLE `pma_userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma_usergroups`
--
ALTER TABLE `pma_usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma_users`
--
ALTER TABLE `pma_users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma_column_info`
--
ALTER TABLE `pma_column_info`
  MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma_history`
--
ALTER TABLE `pma_history`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
  MODIFY `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
  MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT;--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Tressie Monahan I', 'kip.wilderman', 'erdman.jeffry@example.org', '$2y$10$pAXWWSAWm9wkm6htofeyTe3IQVpl0t6B4T6R2rjnt8laungOBtj.u', 'dgBkmKZOoIPdGxcALtMlyHBET0WrTsTUnUQeAGHqmWoxYo2xV9G7Hk0MF1vz', '2016-05-08 20:23:52', '2016-05-08 20:36:39'),
(2, 'Rhett Upton Jr.', 'fay.allene', 'wayne.pouros@example.com', '$2y$10$XoNsntnPSKVtGJoPTbnssOY6LKveD1Y2lppdHHWtdzVH/7O3LHSFe', 'cXwzFd13dq', '2016-05-08 20:23:52', '2016-05-08 20:23:52'),
(3, 'Cassidy Cummerata Sr.', 'edgardo36', 'djohnston@example.com', '$2y$10$pjALLE4GBnO8IRm/jG/mbOa1ZxLyWdpQPKOr6u.CpJchCDD7BcBqK', 'Kt0D9qpgwt', '2016-05-08 20:23:52', '2016-05-08 20:23:52'),
(4, 'Miss Natasha Rice I', 'leannon.jennie', 'renee82@example.org', '$2y$10$qJ32.jv7RhCO77UyaG4i.OjGJSjOZ1CVvxhoqgQ4gP.sJRPW5bSeq', 'DlJ2QzlZAo', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(5, 'Liza Breitenberg MD', 'leffler.holly', 'freeman.roob@example.net', '$2y$10$wNZPTSKKBzXtGoFaBo9L5uwdOUFp5OHJikLpBUK8VJcENuDa92gOS', '9zaoIQojQZ', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(6, 'Vincent Gusikowski', 'gleason.arne', 'dubuque.devan@example.net', '$2y$10$WFpmT2a7ZePK7Om5LzFovueb.wFGCHEEZ1oj67l0f3TTWllKRB1.q', 'zTcJVYcZ4w', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(7, 'Prof. Ewell Considine Jr.', 'kohler.tess', 'btrantow@example.com', '$2y$10$a2H5x6BePre1tuGgv9EvfeKyxBgTtVcRfmSHRZHNZstGDGMRhWWnG', '3C4F3iGdaR', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(8, 'Philip Emmerich', 'aabshire', 'levi89@example.com', '$2y$10$43B8HqY/sPuFR.YyD/nbTeJ48/URk3adzRErO0YJw8WwqKwROqju2', 'nQKKuWIQAq', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(9, 'Claudia Mraz', 'chermiston', 'gutmann.athena@example.com', '$2y$10$FSRXexKELd7zOxOYR1GE8./a3IW9urCUWUHVPT/ztR6g.wKqfyW7y', 'aFDZ93ZVg9', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(10, 'Malika Schaefer', 'yleuschke', 'erdman.ashley@example.org', '$2y$10$/wRL5tUCIscz9gUqabAuGeEtaFjIMG5jUgICbpe0AT4/dClrGoITe', 'XRyaZzRTx8', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(11, 'Mr. Columbus Bruen', 'romaine60', 'osborne.turner@example.org', '$2y$10$.Qn4vU33VId/H.xVxN3sMOoiB4J9MtXjUOCHECbpeusNs8nGbY/jq', 'UeBoqvtbA0', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(12, 'Angelita Romaguera', 'adolf91', 'dale.jacobi@example.com', '$2y$10$qvR4cCtPtCex3pHOtFZ2n.xEg/Cj/uAmvPDXLhq6kjXEtW5PcZ9WG', 'hxwh278ncx', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(13, 'Consuelo Lemke', 'maverick58', 'bradtke.triston@example.com', '$2y$10$dkKqKzoYaMH/IyCGlnG1m.7ebSc4DmSLLE0c6pOfpGO3ce.cYtMsq', 'UWjJ1gLPuJ', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(14, 'Judy Altenwerth', 'chauncey02', 'charlotte41@example.net', '$2y$10$m9cNj1N0JCsit9xFiBjxSOg9N9uJnCvlJbsOL9X4gmGXe8C6hCXEG', 'sqgR6L1icR', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(15, 'Hanna Schinner', 'jbarrows', 'enola09@example.org', '$2y$10$xTI0FOG1pIvccl4lxMj9Autl8HEvMVSDxAJPntHjTamDw4psV3Nee', '3BHorJ3PUW', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(16, 'Erika Bosco', 'blanca17', 'boyle.alfredo@example.net', '$2y$10$dVy0yd.frGm/uBygPgx/zOd9n5aujcEbdeIefwe9bfK89LrcjDM2O', 's8juC6i9RS', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(17, 'Nina Herzog', 'carlotta.dare', 'bhuels@example.com', '$2y$10$caBCy2hNh3YUdo6lL/CnKOxqBCG4XQDUwj35efIiPzwWY84cnXWwu', 'BI4pa5dXso', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(18, 'Dallin Beatty', 'von.cleora', 'kuphal.sheridan@example.org', '$2y$10$RFis7eErFUIWJDpL3wbHueaSle4KWvGs7wDjPx551J6yOJwlB3VD6', 'S0e15si5zW', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(19, 'Ms. Lauriane Hayes Sr.', 'rowe.mauricio', 'lauriane.turcotte@example.net', '$2y$10$//ij/PBh1ADrPKfvqzApfeAUE1.yEaA647FtYQRzUrSdjB7wGDHPS', 'yyUlfUUhrw', '2016-05-08 20:23:53', '2016-05-08 20:23:53'),
(20, 'Kiley Ward', 'hartmann.flossie', 'olson.kaylie@example.com', '$2y$10$tOTbc7YfTXKMDli0X7qw8OltvH1ck4/Y5jRh3/Mugkv0lwjyUfOzi', 'nSHI1xSshO', '2016-05-08 20:23:53', '2016-05-08 20:23:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;--
-- Base de datos: `sccn`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL,
  `cedula_alumno` int(11) NOT NULL,
  `primer_nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `id_seccion_alumno` int(11) NOT NULL,
  `nombre_representante` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_representante` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `cedula_alumno`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `id_seccion_alumno`, `nombre_representante`, `apellido_representante`) VALUES
(1, 242424, 'Daniel', 'Augusto', 'Perez', 'Melendez', 1, 'Ramón José', 'Perez Molina'),
(2, 1111111, 'Carlos', '', 'Angulo', '', 5, '', ''),
(3, 2222222, 'Felipe', '', 'Mejias', '', 5, '', ''),
(4, 333333, 'Javier', 'Augusto', 'Perez', 'Gonzalez', 3, '', ''),
(5, 444444, 'Sara', '', 'Gonzales', '', 3, '', ''),
(6, 555555, 'Gabriel', '', 'Narciso', '', 3, '', ''),
(7, 6666666, 'Josefina', '', 'Montoya', '', 3, '', ''),
(10, 77777, 'Carlos', '', 'Angulo', '', 2, '', ''),
(11, 888888, 'Felipe', '', 'Gonzales', '', 2, '', ''),
(12, 123, 'Fernanda', 'Maria', 'Hernandez', 'Gomez', 1, 'Carlos', 'Alcala'),
(13, 2444444, 'Antonio', 'Danilo', 'Perez', 'Mejias', 1, 'Julia', 'Caceres'),
(14, 654646464, 'Sfsfsfs', '', 'Fsfsfsfsf', '', 3, '', ''),
(15, 789, 'Jose', '', 'Mendez', '', 1, 'Jose', 'Mendez'),
(16, 8767766, 'Fsfsf', '', 'Fsfsf', '', 3, '', ''),
(17, 35335333, 'Srrwrwrwr', '', 'Wrwrwrw', '', 4, '', ''),
(18, 353332222, 'Fsfsf', '', 'Sfsfs', '', 3, '', ''),
(19, 53535, 'Sfsfs', '', 'Sfsf', '', 3, '', ''),
(20, 2147483647, 'Dfdfdfd', '', 'Fdfdfd', '', 4, '', ''),
(21, 53355555, 'Sfsfs', '', 'Fsfsfsf', '', 3, '', ''),
(22, 253577777, 'Ddgd', '', 'Dgdgd', '', 2, '', ''),
(23, 666666, 'Ddddddd', 'Dddddd', 'Dddddd', 'Ddddd', 5, 'Ddddd', 'Ddddd'),
(24, 122222, 'Javier', '', 'Martinez', '', 2, 'Javier', 'Martinez'),
(25, 222333, 'Olga', '', 'Teran', '', 3, 'Olga', 'Teran'),
(26, 556666, 'Ddd', '', 'Ddd', '', 3, 'Ddd', 'Ddd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE IF NOT EXISTS `grados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `a_escolar` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id`, `nombre`, `a_escolar`) VALUES
(1, 'Quinto', '2015-2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_usuarios`
--

CREATE TABLE IF NOT EXISTS `info_usuarios` (
  `id` int(11) NOT NULL,
  `cedula_usuario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_movil` int(11) NOT NULL,
  `telefono_local` int(11) NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `info_usuarios`
--

INSERT INTO `info_usuarios` (`id`, `cedula_usuario`, `fecha_nac`, `correo`, `telefono_movil`, `telefono_local`, `direccion`) VALUES
(1, '777', '0000-00-00', 'rcrd@gmail.com', 1111, 1111, 'fsfs sfsfsfsf fsfs 1111'),
(2, '56666', '2016-06-15', 'daniel.perez@gmailcom', 4242424, 2424242, 'sfsf sfsfs sfsfsf'),
(3, '24242', '2016-06-15', 'fer@gmail.com', 42242, 24242, 'fdsfdfd'),
(4, '33322', '2016-06-16', 'rcrsds@gmail.com', 4242, 24242, 'sfsfsf'),
(5, '5333222', '2016-06-08', 'rcrd555@gmail.com', 33322, 34324, 'fee etete tetetet'),
(6, '5535399', '2016-06-15', 'rcrd322@gmail.com', 424242, 242424, 'sdsfsf fsfsf sfsf'),
(7, '887777', '2016-06-08', 'rcrd22@gmail.com', 353535, 3535, 'dgdg gdgd dgdgdg'),
(8, '766655', '2016-06-15', 'gilber@gmail.com', 242424, 242424, 'sf sfsf sfsfsf fsfsf'),
(9, '23333', '2016-06-09', 'juamanuel@gmail.com', 42424, 24242, 'Ffs Fssfsfsf Sfsfsfsf Sfsfsfsfsf'),
(10, '43555555', '2016-06-02', 'fer111@gmail.com', 242424, 242424, 'Sdfsfs Ssfsfsf'),
(11, '3444444', '2016-06-29', 'gabriel333@hotmail.com', 2424, 2424, 'Daaad Adadafafaf'),
(12, '35353535', '2016-06-08', 'rcrd3333@gmail.com', 535, 3535353, 'Dfdgdg'),
(13, '35353333', '2016-05-31', 'rcrdmedin333@gmail.com', 52525, 25252, 'Sfsgsgs'),
(14, '442222', '2016-06-08', 'rcrdmedina4446@gmail.com', 0, 0, 'Dfdfd'),
(15, '4353535', '2016-06-22', 'rcrdmedina655@gmail.com', 35353, 35353, 'Gdgd Dgdgdg'),
(16, '4533333', '2016-05-31', 'rcrdmedina6555@gmail.com', 3543535, 3535, 'Dgcgdxgx'),
(17, '332222', '2016-07-06', 'rcrd333@gmail.com', 3353, 353535, 'Dfet Etetete'),
(18, '555533333', '2016-07-13', 'rcrd33@gmail.com.ve', 24242, 24242, 'Sfswf Srswrwr Wrwrw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE IF NOT EXISTS `materias` (
  `id_mat` int(11) NOT NULL,
  `nombre_materia` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `notas` (
  `id_notas` int(11) NOT NULL,
  `cedula_estudiante` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `def_uno` decimal(10,2) NOT NULL,
  `def_dos` decimal(10,2) NOT NULL,
  `def_tres` decimal(10,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_notas`, `cedula_estudiante`, `id_seccion`, `id_materia`, `def_uno`, `def_dos`, `def_tres`) VALUES
(22, 242424, 1, 1, '10.00', '20.00', '20.00'),
(23, 242424, 1, 2, '6.00', '10.00', '20.00'),
(24, 242424, 1, 3, '12.00', '14.00', '14.00'),
(25, 242424, 1, 4, '13.00', '11.00', '14.00'),
(26, 242424, 1, 5, '14.00', '15.00', '16.00'),
(27, 242424, 1, 6, '11.00', '13.00', '13.00'),
(28, 242424, 1, 7, '11.00', '12.00', '11.00'),
(29, 123, 1, 1, '14.00', '13.00', '20.00'),
(30, 123, 1, 2, '14.00', '11.00', '14.00'),
(31, 123, 1, 4, '12.00', '7.00', '12.00'),
(32, 123, 1, 3, '12.00', '5.00', '0.00'),
(36, 2444444, 1, 1, '10.00', '3.00', '20.00'),
(39, 789, 1, 4, '14.00', '12.00', '16.00'),
(41, 789, 1, 1, '8.00', '0.00', '0.00'),
(42, 2444444, 1, 6, '13.00', '17.00', '10.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE IF NOT EXISTS `secciones` (
  `id_secc` int(11) NOT NULL,
  `nombre_seccion` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_prof_guia` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id_secc`, `nombre_seccion`, `id_grado`, `id_prof_guia`) VALUES
(1, 'A', 1, 2),
(2, 'B', 1, 8),
(3, 'C', 1, 6),
(4, 'D', 1, 0),
(5, 'E', 1, 0),
(6, 'ff', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_materias`
--

CREATE TABLE IF NOT EXISTS `usuario_materias` (
  `id` int(11) NOT NULL,
  `cedula_profesor` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish_ci;

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
(8, '3444444', 3, 3),
(12, '442222', 2, 2),
(14, '4533333', 6, 5),
(15, '4533333', 7, 4),
(16, '332222', 6, 3),
(17, '555533333', 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `usuario_sistema`, `password`, `rol`, `activo`) VALUES
(1, '15166525', 'Alberto', 'Alexander', 'Perez', 'Gomez', 'aperez', '1234', 'Admin', 1),
(2, '12332111', 'Carlos', 'Manuel', 'Perez', 'Gomez', 'rrr333', '1234', 'Profesor', 1),
(3, '777', 'Carlos', '', 'Martinez', '', 'aperez1', '11', 'Profesor', 1),
(4, '3535', 'sfsf', 'sfsf', 'sfsf', 'fsfs', 'aperez22', '33', 'Admin', 1),
(5, '353535', 'rafel', 'fsf', 'perez', 'dfddf', 'rafa323', 'UnidadE01', 'Profesor', 1),
(6, '56666', 'daniel', 'manuel', 'oropeza', 'mendez', 'daniel23', '12', 'Profesor', 2),
(7, '24242', 'fernando', 'carlos', 'mendez', 'oropeza', 'fer344', '1234', 'Profesor', 2),
(8, '33322', 'fgegeg', 'geegeg', 'egegeg', 'egeg', 'rrrrr', 'UnidadE01', 'Profesor', 0),
(9, '5333222', 'eerer', 'eetret', 'etete', 'etetet', 'fdfdf44', 'UnidadE01', 'Profesor', 0),
(10, '5535399', 'sfsfs', 'fssf', 'sfsf', 'sfsfs', 'fdfd43332', 'UnidadE01', 'Profesor', 0),
(11, '887777', 'dfdgd', 'gdgdgd', 'dggdg', 'dgdgdg', '646464644', 'UnidadE01', 'Profesor', 0),
(12, '766655', 'gilberto', 'inginio', 'perez', 'lorca', 'gilberto30', 'UnidadE01', 'Profesor', 0),
(13, '3111', 'Juan', '', 'Bimbo', '', 'kakey3111', 'UnidadE01', 'Admin', 0),
(14, '23333', 'Juan', 'Manuel', 'Oropeza', 'Cartalla', 'juan32', '1234', 'Profesor', 1),
(15, '43555555', 'Fernando1', '', 'Martinez', '', 'fer88888', 'UnidadE01', 'Profesor', 0),
(16, '3444444', 'Gabriel', '', 'Mendoza', '', 'gabriel23', '1234', 'Profesor', 2),
(17, '353511', 'Denis', '', 'Martinez', '', 'denis123', '', 'Admin', 2),
(18, '35353535', 'Ddgdg', '', 'Dgdgdgdg', '', '35353535', '', 'Profesor', 2),
(19, '35353333', 'Dgdg', '', 'Dgdgd', '', '35353333', '', 'Profesor', 2),
(20, '442222', 'Dfdfds', '', 'Fdgdgdg', '', '442222', '', 'Profesor', 2),
(21, '4353535', 'Dfdgd', '', 'Dgdg', '', '4353535', '', 'Profesor', 2),
(22, '4533333', 'Esteban', '', 'Toro', '', 'etoro', '1234', 'Profesor', 1),
(23, '332222', 'Hector', '', 'Matos', '', 'hector222', 'UnidadE01', 'Profesor', 2),
(24, '555533333', 'Jesus', '', 'Costa', '', 'jesus222', '2222', 'Profesor', 1);

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
-- Indices de la tabla `usuario_materias`
--
ALTER TABLE `usuario_materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `usuario_sistema` (`usuario_sistema`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `info_usuarios`
--
ALTER TABLE `info_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_mat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_notas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id_secc` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuario_materias`
--
ALTER TABLE `usuario_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;--
-- Base de datos: `sgv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `description_visits`
--

CREATE TABLE IF NOT EXISTS `description_visits` (
  `id_description_visits` bigint(20) unsigned NOT NULL,
  `id_guest_description` bigint(20) unsigned NOT NULL,
  `id_destination` bigint(20) unsigned NOT NULL,
  `id_type_visit` bigint(20) unsigned NOT NULL,
  `id_motive` int(11) NOT NULL,
  `motiveOther` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `description_visits`
--

INSERT INTO `description_visits` (`id_description_visits`, `id_guest_description`, `id_destination`, `id_type_visit`, `id_motive`, `motiveOther`, `created_at`, `updated_at`, `deleted_at`) VALUES
(64, 47, 1, 1, 1, '', '2016-01-30 16:39:46', '2016-01-30 16:39:46', NULL),
(65, 48, 6, 1, 1, '', '2016-01-30 16:45:06', '2016-01-30 16:45:06', NULL),
(66, 49, 2, 2, 5, 'Visita guiada por instalaciones', '2016-01-30 16:46:11', '2016-01-30 17:07:27', NULL),
(67, 50, 1, 2, 6, 'Alquilar maquinaria de tela', '2016-02-07 11:47:27', '2016-02-07 11:47:27', NULL),
(68, 50, 2, 1, 2, '', '2016-02-07 12:49:49', '2016-02-07 12:49:49', NULL),
(69, 50, 6, 2, 5, '', '2016-02-07 12:50:01', '2016-02-07 12:50:01', NULL),
(70, 50, 1, 1, 2, '', '2016-02-07 12:50:16', '2016-02-07 12:50:16', NULL),
(71, 49, 1, 1, 1, '', '2016-02-07 13:02:35', '2016-02-07 13:02:35', NULL),
(72, 49, 2, 1, 2, '', '2016-02-07 13:02:47', '2016-02-07 13:02:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinations`
--

CREATE TABLE IF NOT EXISTS `destinations` (
  `id` bigint(20) unsigned NOT NULL,
  `destination` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `destinations`
--

INSERT INTO `destinations` (`id`, `destination`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tienda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 'Mezzanina', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(3, 'Piso 1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(4, 'Piso 2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(5, 'Piso 3', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(6, 'Piso 4', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enterprise_guest`
--

CREATE TABLE IF NOT EXISTS `enterprise_guest` (
  `id_enterprise_guest` bigint(20) unsigned NOT NULL,
  `guest_id` bigint(20) unsigned NOT NULL,
  `enterprise_id` int(10) unsigned NOT NULL,
  `enterpriseOther` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `enterprise_guest`
--

INSERT INTO `enterprise_guest` (`id_enterprise_guest`, `guest_id`, `enterprise_id`, `enterpriseOther`, `created_at`, `updated_at`, `deleted_at`) VALUES
(47, 47, 5, '', '2016-01-30 16:39:46', '2016-01-30 16:39:46', NULL),
(48, 48, 6, '', '2016-01-30 16:45:06', '2016-01-30 16:45:06', NULL),
(49, 49, 7, 'ASEC C.A', '2016-01-30 16:46:11', '2016-01-30 19:49:08', NULL),
(50, 50, 7, 'INVERSIONES PATTY C.A.', '2016-02-07 11:47:27', '2016-02-07 11:47:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enterprises`
--

CREATE TABLE IF NOT EXISTS `enterprises` (
  `id_enterprise` int(10) unsigned NOT NULL,
  `enterprise` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `enterprises`
--

INSERT INTO `enterprises` (`id_enterprise`, `enterprise`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'R.P.M. colors, c.a.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 'Tecnoplanta, c.a.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(3, 'Accesorios plasticos, c.a.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(4, 'Asa., c.a.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(5, 'Comercial mara, s.a.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(6, 'Cartonera del caribe, c.a.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(7, 'Otra empresa', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id` bigint(20) unsigned NOT NULL,
  `cedula` int(11) NOT NULL,
  `names` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastNames` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo_src` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_type_guest` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `guests`
--

INSERT INTO `guests` (`id`, `cedula`, `names`, `lastNames`, `photo_src`, `id_type_guest`, `created_at`, `updated_at`, `deleted_at`) VALUES
(47, 11344556, 'Eugenio Manuel', 'Castillo Diaz', 'http://example.com/miproyecto/public/images/photo/11344556-30.01.16-12.09.45.png', 1, '2016-01-30 16:39:45', '2016-01-30 16:39:45', NULL),
(48, 13443556, 'Juan', 'Paez ', 'http://example.com/miproyecto/public/images/photo/13443556-30.01.16-12.15.06.png', 1, '2016-01-30 16:45:06', '2016-01-30 16:45:06', NULL),
(49, 14335667, 'Gabriel', 'Huerta', 'http://example.com/miproyecto/public/images/photo/14335667-30.01.16-12.16.11.png', 1, '2016-01-30 16:46:11', '2016-01-30 16:46:11', NULL),
(50, 12331223, 'Martin', 'Molina', 'http://example.com/miproyecto/public/images/photo/12331223-07.02.16-07.17.27.png', 2, '2016-02-07 11:47:27', '2016-02-07 11:47:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_12_06_163715_create_guests_table', 1),
('2015_12_06_164551_create_destinations_table', 1),
('2015_12_06_164941_create_type__guests_table', 1),
('2015_12_06_165138_create_type_visits_table', 1),
('2015_12_06_165413_create_motive_visits_table', 1),
('2015_12_06_165720_create_description_visits_table', 1),
('2015_12_06_171813_create_enterprises_table', 1),
('2015_12_06_173154_create_user_roles_table', 1),
('2015_12_17_151606_create_motive_clients_table', 1),
('2015_12_27_175849_create_guest_enterprise_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motive_clients`
--

CREATE TABLE IF NOT EXISTS `motive_clients` (
  `id` int(10) unsigned NOT NULL,
  `motive_client` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `motive_clients`
--

INSERT INTO `motive_clients` (`id`, `motive_client`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Comprar', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 'Solicitar información', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(3, 'Reunión', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(4, 'Retirar mercancia', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(5, 'Otro motivo', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motive_visits`
--

CREATE TABLE IF NOT EXISTS `motive_visits` (
  `id` int(10) unsigned NOT NULL,
  `motive_visit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `motive_visits`
--

INSERT INTO `motive_visits` (`id`, `motive_visit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Reunión', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 'Solicitar información', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(3, 'Entrevista', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(4, 'Ofrecer servicios', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(5, 'Entrega de curriculum', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(6, 'Otro motivo', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `rol` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_guests`
--

CREATE TABLE IF NOT EXISTS `type_guests` (
  `id` int(10) unsigned NOT NULL,
  `type_guest` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `type_guests`
--

INSERT INTO `type_guests` (`id`, `type_guest`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cliente', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 'Visitante', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_visits`
--

CREATE TABLE IF NOT EXISTS `type_visits` (
  `id` bigint(20) unsigned NOT NULL,
  `type_visit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `type_visits`
--

INSERT INTO `type_visits` (`id`, `type_visit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Formal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 'Particular', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(700) COLLATE utf8_unicode_ci NOT NULL,
  `rol` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `nombre`, `apellido`, `password`, `rol`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'rcrdmedina6@gmail.com', 'Ricardo', 'Medina', '$2y$10$rzqHnWOV9PtLRim./aml2uWGh2enW2/qxQlhnsZOf9RYoQn49fKkK', 1, 1, 'ekDnrkGhwKU2EE69CUSJ5tjiRnEaImoORW1mlKxvagePSFd9r8xm0gDFzMtw', '0000-00-00 00:00:00', '2016-06-02 17:55:30', NULL),
(2, 'rcrd@gmail.com', 'Fsfs', 'Fsfsf', '1234', 1, 1, NULL, '2016-06-02 17:55:00', '2016-06-02 17:55:50', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `description_visits`
--
ALTER TABLE `description_visits`
  ADD PRIMARY KEY (`id_description_visits`),
  ADD KEY `description_visits_id_guest_description_foreign` (`id_guest_description`),
  ADD KEY `description_visits_id_destination_foreign` (`id_destination`),
  ADD KEY `description_visits_id_type_visit_foreign` (`id_type_visit`);

--
-- Indices de la tabla `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enterprise_guest`
--
ALTER TABLE `enterprise_guest`
  ADD PRIMARY KEY (`id_enterprise_guest`),
  ADD UNIQUE KEY `enterprise_guest_guest_id_unique` (`guest_id`),
  ADD KEY `enterprise_guest_enterprise_id_foreign` (`enterprise_id`);

--
-- Indices de la tabla `enterprises`
--
ALTER TABLE `enterprises`
  ADD PRIMARY KEY (`id_enterprise`);

--
-- Indices de la tabla `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guests_cedula_unique` (`cedula`);

--
-- Indices de la tabla `motive_clients`
--
ALTER TABLE `motive_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `motive_visits`
--
ALTER TABLE `motive_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `type_guests`
--
ALTER TABLE `type_guests`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `type_visits`
--
ALTER TABLE `type_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_status_index` (`status`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `description_visits`
--
ALTER TABLE `description_visits`
  MODIFY `id_description_visits` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT de la tabla `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `enterprise_guest`
--
ALTER TABLE `enterprise_guest`
  MODIFY `id_enterprise_guest` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `enterprises`
--
ALTER TABLE `enterprises`
  MODIFY `id_enterprise` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `motive_clients`
--
ALTER TABLE `motive_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `motive_visits`
--
ALTER TABLE `motive_visits`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `type_guests`
--
ALTER TABLE `type_guests`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `type_visits`
--
ALTER TABLE `type_visits`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `description_visits`
--
ALTER TABLE `description_visits`
  ADD CONSTRAINT `description_visits_id_destination_foreign` FOREIGN KEY (`id_destination`) REFERENCES `destinations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `description_visits_id_guest_description_foreign` FOREIGN KEY (`id_guest_description`) REFERENCES `guests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `description_visits_id_type_visit_foreign` FOREIGN KEY (`id_type_visit`) REFERENCES `type_visits` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `enterprise_guest`
--
ALTER TABLE `enterprise_guest`
  ADD CONSTRAINT `enterprise_guest_enterprise_id_foreign` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprises` (`id_enterprise`),
  ADD CONSTRAINT `enterprise_guest_guest_id_foreign` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`) ON DELETE CASCADE;
--
-- Base de datos: `test`
--
--
-- Base de datos: `tienda_virtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL,
  `email_cliente` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_clientes` (`email_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;--
-- Base de datos: `webauth`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `user_pwd`
--
ALTER TABLE `user_pwd`
  ADD PRIMARY KEY (`name`);
--
-- Base de datos: `xcolar_system_chacao`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE IF NOT EXISTS `asistencias` (
  `id_asistencia` int(11) NOT NULL COMMENT 'object id',
  `id_estudiante` int(11) NOT NULL COMMENT 'id del estudiante',
  `status` tinyint(1) NOT NULL COMMENT 'status asistio o no',
  `fecha_asistencia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha en que asistio',
  `fecha_creacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL COMMENT 'fecha de actualización del registro',
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'registro activo o no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las asistencias diarias de los alumnos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `censo`
--

CREATE TABLE IF NOT EXISTS `censo` (
  `idcenso` int(11) NOT NULL,
  `Residente` varchar(2) DEFAULT NULL,
  `GradoACursar` varchar(13) DEFAULT NULL,
  `ElAlumnoEstudiaActualmente` varchar(2) DEFAULT NULL,
  `ElAlumnoRepiteGrado` varchar(2) DEFAULT NULL,
  `Grado` varchar(13) DEFAULT NULL,
  `UnidadEducativaDeProcedencia` varchar(100) DEFAULT NULL,
  `NombreDeLaInstitucion` varchar(48) DEFAULT NULL,
  `Estado` varchar(16) DEFAULT NULL,
  `Municipio` varchar(58) DEFAULT NULL,
  `MateriaPendiente` varchar(2) DEFAULT NULL,
  `EspecifiqueCualesMateriasEstanPendientes` varchar(10) DEFAULT NULL,
  `UnidadEducativaDeSuPreferencia` varchar(67) DEFAULT NULL,
  `RazonesDeSuSolicitud` varchar(23) DEFAULT NULL,
  `PrimerNombreDelAlumno` varchar(9) DEFAULT NULL,
  `SegundoNombreDelAlumno` varchar(14) DEFAULT NULL,
  `PrimerApellidoDelAlumno` varchar(10) DEFAULT NULL,
  `SegundoApellidoDelAlumno` varchar(10) DEFAULT NULL,
  `CedulaDeIdentidadDelAlumnoOCedulaEscolar` int(11) DEFAULT NULL,
  `FechaDeNacimientoDelAlumno` datetime DEFAULT NULL,
  `SexoDelAlumno` varchar(9) DEFAULT NULL,
  `NacionalidadDelAlumno` varchar(10) DEFAULT NULL,
  `PaisDeNacimientoDelAlumno` int(11) DEFAULT NULL,
  `EstadoDondeNacioElAlumno` varchar(22) DEFAULT NULL,
  `MunicipioDondeNacioElAlumno` varchar(28) DEFAULT NULL,
  `ParroquiaOSectorDondeNacioElAlumno` varchar(26) DEFAULT NULL,
  `EstadoDondeResideElAlumno` varchar(16) DEFAULT NULL,
  `MunicipioDondeResideElAlumno` varchar(58) DEFAULT NULL,
  `UrbanizacionOSectorDondeResideElAlumno` varchar(43) DEFAULT NULL,
  `CalleOAvenidaDondeResideElAlumno` varchar(28) DEFAULT NULL,
  `CasaOEdificioDondeResideElAlumno` varchar(22) DEFAULT NULL,
  `PisoOPlantaDondeResideElAlumno` varchar(12) DEFAULT NULL,
  `NumeroDeCasaOApartamentoDondeResideElAlumno` int(11) DEFAULT NULL,
  `PuntoDeReferenciaCercanoAlDomicilioDelAlumno` varchar(73) DEFAULT NULL,
  `ParentescoConElAlumno` varchar(5) DEFAULT NULL,
  `IndiqueElParentescoConElAlumno` int(11) DEFAULT NULL,
  `PrimerNombreDelRepresentante` varchar(12) DEFAULT NULL,
  `SegundoNombreDelRepresentante` varchar(9) DEFAULT NULL,
  `PrimerApellidoDelRepresentante` varchar(10) DEFAULT NULL,
  `SegundoApellidoDelRepresentante` varchar(10) DEFAULT NULL,
  `CedulaDeIdentidadDelRepresentante` int(11) DEFAULT NULL,
  `Terminaldecedula` int(11) DEFAULT NULL,
  `FechaDeNacimientoDelRepresentante` datetime DEFAULT NULL,
  `NacionalidadDelRepresentante` varchar(10) DEFAULT NULL,
  `PaisDeNacimientoDelRepresentante` varchar(8) DEFAULT NULL,
  `EstadoDondeNacioElRepresentante` varchar(16) DEFAULT NULL,
  `MunicipioDondeNacioElRepresentante` varchar(28) DEFAULT NULL,
  `ParroquiaDondeNacioElRepresentante` varchar(23) DEFAULT NULL,
  `EstadoCivilDelRepresentante` varchar(11) DEFAULT NULL,
  `EstadoDondeResideElRepresentante` int(11) DEFAULT NULL,
  `MunicipioDondeResideElRepresentante` int(11) DEFAULT NULL,
  `UrbanizacionOSectorDondeResideElRepresentante` int(11) DEFAULT NULL,
  `CalleOAvenidaDondeResideElRepresentante` int(11) DEFAULT NULL,
  `CasaOEdificioDondeResideElRepresentante` int(11) DEFAULT NULL,
  `PisoDondeResideElRepresentante` int(11) DEFAULT NULL,
  `NumeroOApartamentoDondeResideElRepresentante` int(11) DEFAULT NULL,
  `PuntoDeReferenciaCercanoAlDomicilioDelRepresentante` int(11) DEFAULT NULL,
  `TelefonoDeHabitacionDelRepresentante` int(11) DEFAULT NULL,
  `TelefonoCelularDelRepresentante` int(11) DEFAULT NULL,
  `CorreoElectronicoDelRepresentante` varchar(30) DEFAULT NULL,
  `UsoDeRedesSociales` varchar(29) DEFAULT NULL,
  `EspecifiqueQueOtrasRedesSocialesUsaElRepresentante` int(11) DEFAULT NULL,
  `TrabajaActualmente` varchar(2) DEFAULT NULL,
  `ProfesionUOcupacionDelRepresentante` varchar(67) DEFAULT NULL,
  `IngresoMensualDelRepresentante` varchar(21) DEFAULT NULL,
  `EscalaDeIngresoDelRepresentante` varchar(28) DEFAULT NULL,
  `OtrosIngresosDentroDeSuGrupoFamiliar` varchar(21) DEFAULT NULL,
  `EscalaDeIngresosDelGrupoFamiliar` varchar(28) DEFAULT NULL,
  `TipoDeJornadaLaboralDelRepresentante` varchar(15) DEFAULT NULL,
  `NombreDeLaEmpresaUOrganismoDondeTrabajaElRepresentante` varchar(37) DEFAULT NULL,
  `EstadoDondeSeUbicaElTrabajoDelRepresentante` varchar(16) DEFAULT NULL,
  `MunicipioDondeTrabajaElRepresentante` varchar(47) DEFAULT NULL,
  `CalleOAvenidaDondeSeUbicaElTrabajoDelRepresentante` varchar(39) DEFAULT NULL,
  `EdificioOCasaDondeTrabajaElRepresentante` varchar(32) DEFAULT NULL,
  `PisoDondeSeUbicaElTrabajoDelRepresentante` varchar(11) DEFAULT NULL,
  `OficinaNumeroOApartamentoDondeTrabajaElRepresentante` varchar(11) DEFAULT NULL,
  `TelefonoDelTrabajoActualDelRepresentante` int(11) DEFAULT NULL,
  `ExtensionTelefonicaParaContactarAlRepresentante` int(11) DEFAULT NULL,
  `PersonaContactoEnElTrabajoDelRepresentante` varchar(19) DEFAULT NULL,
  `TelefonoDeLaPersonaContactoDelTrabajoDelRepresentante` int(11) DEFAULT NULL,
  `ExtensionDeLaPersonaContactoDelTrabajoDelRepresentante` int(11) DEFAULT NULL,
  `ElRepresentanteTieneAlgunaDiversidadFuncional` varchar(2) DEFAULT NULL,
  `NombreDeLaMadre` int(11) DEFAULT NULL,
  `ApellidosDeLaMadre` int(11) DEFAULT NULL,
  `CedulaDeIdentidadDeLaMadre` int(11) DEFAULT NULL,
  `FechaDeNacimientoDeLaMadre` int(11) DEFAULT NULL,
  `PaisDeNacimientoDeLaMadre` int(11) DEFAULT NULL,
  `EstadoDondeNacioLaMadre` int(11) DEFAULT NULL,
  `MunicipioDondeNacioLaMadre` int(11) DEFAULT NULL,
  `EstadoDondeResideLaMadre` int(11) DEFAULT NULL,
  `MunicipioDondeResideLaMadre` int(11) DEFAULT NULL,
  `UrbanizacionOSectorDondeResideLaMadre` int(11) DEFAULT NULL,
  `CasaOEdificioDondeResideLaMadre` int(11) DEFAULT NULL,
  `PisoDondeResideLaMadre` int(11) DEFAULT NULL,
  `NumeroOApartamentoDondeResideLaMadre` int(11) DEFAULT NULL,
  `PuntoDeReferenciaCercanoAlDomiclioDeLaMadre` int(11) DEFAULT NULL,
  `TelefonoDeHabitacionDeLaMadre` int(11) DEFAULT NULL,
  `TelefonoCelularDeLaMadre` int(11) DEFAULT NULL,
  `CorreoElectronicoDeLaMadre` int(11) DEFAULT NULL,
  `ProfesionUOcupacionDeLaMadre` int(11) DEFAULT NULL,
  `NombreDeLaEmpresaUOrganismoDondeTrabajaLaMadre` int(11) DEFAULT NULL,
  `EstadoDondeTrabajaLaMadre` int(11) DEFAULT NULL,
  `MunicipioDondeTrabajaLaMadre` int(11) DEFAULT NULL,
  `UrbanizacionOSectorDondeTrabajaLaMadre` int(11) DEFAULT NULL,
  `EdificioOCasaDondeTrabajaLaMadre` int(11) DEFAULT NULL,
  `PisoDondeTrabajaLaMadre` int(11) DEFAULT NULL,
  `NumeroDeOficinaApartamentoOCasaDondeTrabajaLaMadre` int(11) DEFAULT NULL,
  `PuntoDeReferenciaCercanoAlTrabajoDeLaMadre` int(11) DEFAULT NULL,
  `TelefonoDelLugarDelTrabajodeLaMadre` int(11) DEFAULT NULL,
  `ExtensionTelefonicaParaContactarALaMadre` int(11) DEFAULT NULL,
  `PersonaContactoEnElTrabajoDeLaMadre` int(11) DEFAULT NULL,
  `TelefonoDeLaPersonaContactoEnElTrabajoDeLaMadre` int(11) DEFAULT NULL,
  `ExtensionDeLaPersonaContactoEnElTrabajoDeLaMadre` int(11) DEFAULT NULL,
  `ElPadreVive` varchar(2) DEFAULT NULL,
  `NombreDelPadre` varchar(17) DEFAULT NULL,
  `ApellidosDelPadre` varchar(16) DEFAULT NULL,
  `CedulaDeIdentidadDelPadre` int(11) DEFAULT NULL,
  `FechaDeNacimientoDelPadre` datetime DEFAULT NULL,
  `NacionalidadDelPadre` varchar(10) DEFAULT NULL,
  `PaisDondeNacioElPadre` varchar(20) DEFAULT NULL,
  `EstadoCivilDelPadre` varchar(14) DEFAULT NULL,
  `EstadoDondeNacioElPadre` varchar(16) DEFAULT NULL,
  `MunicipioDondeNacioElPadre` varchar(28) DEFAULT NULL,
  `ElPadreViveEnElMismoLugarDeResidenciaDelAlumno` varchar(2) DEFAULT NULL,
  `EstadoDondeResideElPadre` varchar(16) DEFAULT NULL,
  `MunicipioDondeResideElPadre` varchar(39) DEFAULT NULL,
  `UrbanizacionOSectorDondeResideElPadre` varchar(22) DEFAULT NULL,
  `CalleOAvenidaDondeResideElPadre` varchar(17) DEFAULT NULL,
  `CasaOEdificioDondeResideElPadre` varchar(15) DEFAULT NULL,
  `PisoDondeResideElPadre` varchar(8) DEFAULT NULL,
  `NumeroDeCasaOApartamentoDondeResideElPadre` varchar(3) DEFAULT NULL,
  `PuntoDeReferenciaCercanoAlDomicilioDelPadre` varchar(21) DEFAULT NULL,
  `TelefonoDeHabitacionDelPadre` int(11) DEFAULT NULL,
  `TelefonoCelularDelPadre` int(11) DEFAULT NULL,
  `CorreoElectronicoDelPadre` varchar(29) DEFAULT NULL,
  `RedesSocialesQueUsaElPadre` varchar(35) DEFAULT NULL,
  `EspecifiqueQueOtrasRedesSocialesUsaElPadre` varchar(9) DEFAULT NULL,
  `ElPadreTrabajaActualmente` varchar(2) DEFAULT NULL,
  `ProfesionUOcupacionDelPadre` varchar(27) DEFAULT NULL,
  `IngresoMensualDelPadre` varchar(21) DEFAULT NULL,
  `EscalaDeIngresosDelPadre` varchar(29) DEFAULT NULL,
  `TipoDeJornadaLaboralDelPadre` varchar(15) DEFAULT NULL,
  `NombreDeLaEmpresaUOrganismoDondeTrabajaElPadre` varchar(33) DEFAULT NULL,
  `EstadoDondeTrabajaElPadre` varchar(16) DEFAULT NULL,
  `MunicipioDondeTrabajaElPadre` varchar(47) DEFAULT NULL,
  `UrbanizacionOSectorDondeTrabajaElPadre` varchar(25) DEFAULT NULL,
  `CalleOAvenidaDondeTrabajaElPadre` varchar(30) DEFAULT NULL,
  `EdificioOCasaDondeTrabajaElPadre` varchar(28) DEFAULT NULL,
  `PisoDondeTrabajaElPadre` varchar(11) DEFAULT NULL,
  `OficinaCasaOApartamentoDondeTrabajaElPadre` varchar(17) DEFAULT NULL,
  `PuntoDeReferenciaCercanoAlTrabajoDelPadre` varchar(54) DEFAULT NULL,
  `TelefonoDelLugarDeTrabajotrabajoDelPadre` int(11) DEFAULT NULL,
  `ExtensionTelefonicaDeContactoDelPadre` int(11) DEFAULT NULL,
  `PersonaContactoEnElTrabajoDelPadre` varchar(15) DEFAULT NULL,
  `TelefonoDeLaPersonaContactoEnElTrabajoDelPadre` int(11) DEFAULT NULL,
  `ExtensionDeLaPersonaContactoEnElTrabajodelPadre` int(11) DEFAULT NULL,
  `ElAlumnoViveCon` varchar(14) DEFAULT NULL,
  `ElAlumnoEstaBecado` varchar(2) DEFAULT NULL,
  `EspecifiqueElTipoDeBecaDelAlumno` int(11) DEFAULT NULL,
  `MedioDeTrasladoAlPlantel` varchar(19) DEFAULT NULL,
  `EspecifiqueQueOtroMedioDeTransporteUsaElAlumno` varchar(9) DEFAULT NULL,
  `ElAlumnoSeRetiraSoloDelPlantel` varchar(2) DEFAULT NULL,
  `NumeroDeHermanos` int(11) DEFAULT NULL,
  `HermanosEstudianEnUnidadesEducativasMunicipales` varchar(2) DEFAULT NULL,
  `GradosQueCursanLosHermanos` varchar(17) DEFAULT NULL,
  `UnidadEducativaMunicipalDondeEstudianLosHermanos` varchar(22) DEFAULT NULL,
  `DatosDeLaVivienda` varchar(9) DEFAULT NULL,
  `EspecifiqueEnQueOtraCondicionDeViviendaResideElAlumno` varchar(45) DEFAULT NULL,
  `GrupoSanguineo` varchar(1) DEFAULT NULL,
  `FactorRh` varchar(1) DEFAULT NULL,
  `Talla` int(11) DEFAULT NULL,
  `Peso` int(11) DEFAULT NULL,
  `TipoDeParto` varchar(7) DEFAULT NULL,
  `PadeceAlgunaEnfermedad` varchar(2) DEFAULT NULL,
  `EspecifiqueElTipoDeEnfermedadQuePadeceElAlumno` varchar(18) DEFAULT NULL,
  `ElAlumnoTieneAlgunaDiversidadFuncional` varchar(2) DEFAULT NULL,
  `ElAlumnoHaSidoOperado` varchar(2) DEFAULT NULL,
  `ElAlumnoEsAlergico` varchar(2) DEFAULT NULL,
  `TipoDeAlergias` varchar(22) DEFAULT NULL,
  `EspecifiqueQueOtroTipoDeAlergiasTieneElAlumno` varchar(59) DEFAULT NULL,
  `SigueAlgunRegimenEspecialDeAlimentacionOTratamiento` varchar(2) DEFAULT NULL,
  `VacunasConLaQueCuentaElAlumno` varchar(90) DEFAULT NULL,
  `EspecifiqueConQueOtrasVacunasCuentaElAlumno` varchar(15) DEFAULT NULL,
  `EnfermedadesQueElAlumnoHaPadecido` varchar(28) DEFAULT NULL,
  `OtrasEnfermedades` varchar(7) DEFAULT NULL,
  `ElAlumnoEsCatolico` varchar(2) DEFAULT NULL,
  `HaCumplidoConAlgunoDeLosSiguientesSacramentos` varchar(27) DEFAULT NULL,
  `RealizaAlgunaActividadEspecial` varchar(2) DEFAULT NULL,
  `ActividadesEspecialesQueRealizaElAlumno` varchar(11) DEFAULT NULL,
  `EspecifiqueQueOtrasActividadesEspecialesRealizaElAlumno` varchar(16) DEFAULT NULL,
  `NombreYApellidoDelContactoDeEmergencia1` varchar(20) DEFAULT NULL,
  `TelefonoDelContactoDeEmergencia1` int(11) DEFAULT NULL,
  `ParentescoDelContactoDeEmergencia1ConElAlumno` varchar(14) DEFAULT NULL,
  `NombreYApellidoDelContactoDeEmergencia2` varchar(26) DEFAULT NULL,
  `TelefonoDelContactoDeEmergencia2` int(11) DEFAULT NULL,
  `ParentescoDelContactoDeEmergencia2ConElAlumno` varchar(14) DEFAULT NULL,
  `Observaciones` varchar(247) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de cada niño cansado.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_vivienda`
--

CREATE TABLE IF NOT EXISTS `condicion_vivienda` (
  `id_condicion_vivienda` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las condiciones de vivienda';

--
-- Volcado de datos para la tabla `condicion_vivienda`
--

INSERT INTO `condicion_vivienda` (`id_condicion_vivienda`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'PROPIA', '2015-10-20 20:12:39', NULL, 1),
(2, 'ALQUILADA', '2015-10-20 20:12:39', NULL, 1),
(3, 'FAMILIAR', '2015-10-20 20:12:39', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE IF NOT EXISTS `configuraciones` (
  `id_configuracion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las configuraciones del sistema';

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`id_configuracion`, `nombre`, `valor`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'system_name', 'Sistema Chacao XColar', '2015-10-24 21:28:38', NULL, 1),
(2, 'system_title', 'Chacao XColar', '2015-10-24 21:28:38', NULL, 1),
(3, 'address', 'Chacao, Distrito Capital', '2015-10-24 21:28:38', NULL, 1),
(4, 'phone', '+582127059500', '2015-10-24 21:28:38', NULL, 1),
(5, 'paypal_email', 'educacion@chacao.gob.ve', '2015-10-24 21:28:38', NULL, 1),
(6, 'currency', 'vef', '2015-10-24 21:28:38', NULL, 1),
(7, 'system_email', 'educacion@chacao.gob.ve', '2015-10-24 21:28:38', NULL, 1),
(8, 'active_sms_service', 'disabled', '2015-10-24 21:28:38', NULL, 1),
(9, 'language', 'spanish', '2015-10-24 21:28:38', NULL, 1),
(10, 'text_align', 'left-to-right', '2015-10-24 21:28:38', NULL, 1),
(11, 'clickatell_user', '', '2015-10-24 21:28:38', NULL, 1),
(12, 'clickatell_password', '', '2015-10-24 21:28:38', NULL, 1),
(13, 'clickatell_api_id', '', '2015-10-24 21:28:38', NULL, 1),
(14, 'skin_colour', 'blue', '2015-10-24 21:28:39', NULL, 1),
(15, 'twilio_account_sid', '', '2015-10-24 21:28:39', NULL, 1),
(16, 'twilio_auth_token', '', '2015-10-24 21:28:39', NULL, 1),
(17, 'twilio_sender_phone_number', '', '2015-10-24 21:28:39', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE IF NOT EXISTS `direcciones` (
  `id_direccion` int(11) NOT NULL,
  `id_tipo_direccion` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_parroquia` int(11) NOT NULL,
  `calle_avenida` varchar(150) DEFAULT NULL,
  `edificio_casa` varchar(150) DEFAULT NULL,
  `piso` varchar(10) DEFAULT NULL,
  `oficina_apartamento` varchar(45) DEFAULT NULL,
  `punto_referencia` varchar(150) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las direcciones por persona.';

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`id_direccion`, `id_tipo_direccion`, `id_pais`, `id_estado`, `id_municipio`, `id_parroquia`, `calle_avenida`, `edificio_casa`, `piso`, `oficina_apartamento`, `punto_referencia`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 1, 1, 1, 1, 1, 'FFAA', '1', '1', '1', 'ESCUELA', '2015-10-20 21:10:44', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleos`
--

CREATE TABLE IF NOT EXISTS `empleos` (
  `id_empleo` int(11) NOT NULL,
  `id_jornada_laboral` int(11) NOT NULL,
  `nombre_empresa` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `antiguedad` varchar(45) NOT NULL,
  `persona_contacto` varchar(45) DEFAULT NULL,
  `telefono_persona_contacto` varchar(45) DEFAULT NULL,
  `id_direccion_empresa` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene el listado de empleos por representante';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escala_ingresos`
--

CREATE TABLE IF NOT EXISTS `escala_ingresos` (
  `id_escala_ingreso` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que indica la escala de ingresos de un empleado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE IF NOT EXISTS `escuelas` (
  `id_escuela` int(11) NOT NULL,
  `nombre_escuela` varchar(150) NOT NULL,
  `logo_escuela` mediumblob,
  `id_direccion_escuela` int(11) NOT NULL,
  `id_telefono_escuela` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `id_persona_director` int(11) NOT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de las escuelas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id_estado` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL DEFAULT '1',
  `nombre` varchar(150) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los estados';

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `id_pais`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 1, 'DTTO. CAPITAL', '2015-10-20 19:53:01', NULL, 1),
(2, 1, 'ANZOATEGUI', '2015-10-20 19:53:01', NULL, 1),
(3, 1, 'APURE', '2015-10-20 19:53:01', NULL, 1),
(4, 1, 'ARAGUA', '2015-10-20 19:53:01', NULL, 1),
(5, 1, 'BARINAS', '2015-10-20 19:53:01', NULL, 1),
(6, 1, 'BOLIVAR', '2015-10-20 19:53:01', NULL, 1),
(7, 1, 'CARABOBO', '2015-10-20 19:53:01', NULL, 1),
(8, 1, 'COJEDES', '2015-10-20 19:53:01', NULL, 1),
(9, 1, 'FALCON', '2015-10-20 19:53:01', NULL, 1),
(10, 1, 'GUARICO', '2015-10-20 19:53:01', NULL, 1),
(11, 1, 'LARA', '2015-10-20 19:53:01', NULL, 1),
(12, 1, 'MERIDA', '2015-10-20 19:53:01', NULL, 1),
(13, 1, 'MIRANDA', '2015-10-20 19:53:01', NULL, 1),
(14, 1, 'MONAGAS', '2015-10-20 19:53:01', NULL, 1),
(15, 1, 'NUEVA ESPARTA', '2015-10-20 19:53:01', NULL, 1),
(16, 1, 'PORTUGUESA', '2015-10-20 19:53:01', NULL, 1),
(17, 1, 'SUCRE', '2015-10-20 19:53:01', NULL, 1),
(18, 1, 'TACHIRA', '2015-10-20 19:53:01', NULL, 1),
(19, 1, 'TRUJILLO', '2015-10-20 19:53:01', NULL, 1),
(20, 1, 'YARACUY', '2015-10-20 19:53:01', NULL, 1),
(21, 1, 'ZULIA', '2015-10-20 19:53:01', NULL, 1),
(22, 1, 'AMAZONAS', '2015-10-20 19:53:01', NULL, 1),
(23, 1, 'DELTA AMACURO', '2015-10-20 19:53:01', NULL, 1),
(24, 1, 'VARGAS', '2015-10-20 19:53:01', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  `id_telefono` int(11) NOT NULL,
  `id_direccion_nacimiento` int(11) NOT NULL,
  `id_direccion_residencia` int(11) NOT NULL,
  `id_escala_ingreso_familia` int(11) DEFAULT NULL,
  `id_vive_con` int(11) NOT NULL,
  `id_medio_transporte` int(11) NOT NULL,
  `id_condicion_vivienda` int(11) NOT NULL,
  `id_tipo_parto` int(11) NOT NULL,
  `id_persona_emergencia_uno` int(11) DEFAULT NULL,
  `id_persona_emergencia_dos` int(11) DEFAULT NULL,
  `id_escuela` int(11) NOT NULL,
  `cedula_escolar` varchar(15) NOT NULL,
  `cedula_identidad` varchar(15) NOT NULL,
  `repite_grado` tinyint(1) DEFAULT '0',
  `unidad_educativa_procedencia` varchar(150) DEFAULT NULL,
  `otros_ingresios_familia` decimal(10,2) DEFAULT NULL,
  `becado` tinyint(1) DEFAULT '0',
  `descripcion_beca` varchar(150) DEFAULT NULL,
  `se_retira_solo` tinyint(1) DEFAULT '0',
  `numero_hermanos` int(11) DEFAULT '0',
  `hermanos_estudian_unidades_educativas_municipales` int(11) DEFAULT NULL,
  `grupo_sanguineo` varchar(10) DEFAULT NULL,
  `factor_rh` varchar(5) DEFAULT NULL,
  `talla` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `padece_enfermedad` tinyint(1) DEFAULT '0',
  `nombre_enfermedad` varchar(100) DEFAULT NULL,
  `diversidad_funcional` tinyint(1) DEFAULT '0',
  `operado` tinyint(1) DEFAULT '0',
  `alergico` tinyint(1) DEFAULT '0',
  `alergias` longtext,
  `regimen_alimenticio` tinyint(1) DEFAULT '0',
  `vacunas` longtext,
  `enfermedades_padecidas` longtext,
  `otras_enfermedades` longtext,
  `catolico` tinyint(1) DEFAULT '0',
  `actividad_especial` tinyint(1) DEFAULT '0',
  `actividades_especiales` longtext,
  `observaciones` longtext,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1',
  `lugar_entre_hermanos` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los estudiantes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado_escuela`
--

CREATE TABLE IF NOT EXISTS `grado_escuela` (
  `id_grado_escuela` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los grados asociados a cada escuela';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE IF NOT EXISTS `grados` (
  `id_grado` int(11) NOT NULL,
  `nombre_grado` varchar(45) DEFAULT NULL,
  `abreviacion_grado` varchar(5) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los grados';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE IF NOT EXISTS `jornadas` (
  `id_jornadas` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las jornadas laborales';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_base_datos`
--

CREATE TABLE IF NOT EXISTS `log_base_datos` (
  `id_log_base_datos` int(11) NOT NULL,
  `operacion` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `tabla` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los registros de las acciones realizadas ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro_grado`
--

CREATE TABLE IF NOT EXISTS `maestro_grado` (
  `id_maestro_grado` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_maestro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los maestros por grado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE IF NOT EXISTS `maestros` (
  `id_maestro` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los maestros por escuela';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_transporte`
--

CREATE TABLE IF NOT EXISTS `medio_transporte` (
  `id_medio_transporte` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los medios en los que se transporta el al';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `id_municipio` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los municipios de un estado';

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `id_estado`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 1, 'LIBERTADOR', '2015-10-20 19:57:00', NULL, 1),
(2, 2, 'ANACO', '2015-10-20 19:57:00', NULL, 1),
(3, 2, 'ARAGUA', '2015-10-20 19:57:00', NULL, 1),
(4, 2, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(5, 2, 'BRUZUAL', '2015-10-20 19:57:00', NULL, 1),
(6, 2, 'CAJIGAL', '2015-10-20 19:57:00', NULL, 1),
(7, 2, 'FREITES', '2015-10-20 19:57:00', NULL, 1),
(8, 2, 'INDEPENDENCIA', '2015-10-20 19:57:00', NULL, 1),
(9, 2, 'LIBERTAD', '2015-10-20 19:57:00', NULL, 1),
(10, 2, 'MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(11, 2, 'MONAGAS', '2015-10-20 19:57:00', NULL, 1),
(12, 2, 'PEÑALVER', '2015-10-20 19:57:00', NULL, 1),
(13, 2, 'SIMON RODRIGUEZ', '2015-10-20 19:57:00', NULL, 1),
(14, 2, 'SOTILLO', '2015-10-20 19:57:00', NULL, 1),
(15, 2, 'GUANIPA', '2015-10-20 19:57:00', NULL, 1),
(16, 2, 'GUANTA', '2015-10-20 19:57:00', NULL, 1),
(17, 2, 'PIRITU', '2015-10-20 19:57:00', NULL, 1),
(18, 2, 'M.L/DIEGO BAUTISTA U', '2015-10-20 19:57:00', NULL, 1),
(19, 2, 'CARVAJAL', '2015-10-20 19:57:00', NULL, 1),
(20, 2, 'SANTA ANA', '2015-10-20 19:57:00', NULL, 1),
(21, 2, 'MC GREGOR', '2015-10-20 19:57:00', NULL, 1),
(22, 2, 'S JUAN CAPISTRANO', '2015-10-20 19:57:00', NULL, 1),
(23, 3, 'ACHAGUAS', '2015-10-20 19:57:00', NULL, 1),
(24, 3, 'MUÑOZ', '2015-10-20 19:57:00', NULL, 1),
(25, 3, 'PAEZ', '2015-10-20 19:57:00', NULL, 1),
(26, 3, 'PEDRO CAMEJO', '2015-10-20 19:57:00', NULL, 1),
(27, 3, 'ROMULO GALLEGOS', '2015-10-20 19:57:00', NULL, 1),
(28, 3, 'SAN FERNANDO', '2015-10-20 19:57:00', NULL, 1),
(29, 3, 'BIRUACA', '2015-10-20 19:57:00', NULL, 1),
(30, 4, 'GIRARDOT', '2015-10-20 19:57:00', NULL, 1),
(31, 4, 'SANTIAGO MARIÑO', '2015-10-20 19:57:00', NULL, 1),
(32, 4, 'JOSE FELIX RIVAS', '2015-10-20 19:57:00', NULL, 1),
(33, 4, 'SAN CASIMIRO', '2015-10-20 19:57:00', NULL, 1),
(34, 4, 'SAN SEBASTIAN', '2015-10-20 19:57:00', NULL, 1),
(35, 4, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(36, 4, 'URDANETA', '2015-10-20 19:57:00', NULL, 1),
(37, 4, 'ZAMORA', '2015-10-20 19:57:00', NULL, 1),
(38, 4, 'LIBERTADOR', '2015-10-20 19:57:00', NULL, 1),
(39, 4, 'JOSE ANGEL LAMAS', '2015-10-20 19:57:00', NULL, 1),
(40, 4, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(41, 4, 'SANTOS MICHELENA', '2015-10-20 19:57:00', NULL, 1),
(42, 4, 'MARIO B IRAGORRY', '2015-10-20 19:57:00', NULL, 1),
(43, 4, 'TOVAR', '2015-10-20 19:57:00', NULL, 1),
(44, 4, 'CAMATAGUA', '2015-10-20 19:57:00', NULL, 1),
(45, 4, 'JOSE R REVENGA', '2015-10-20 19:57:00', NULL, 1),
(46, 4, 'FRANCISCO LINARES A.', '2015-10-20 19:57:00', NULL, 1),
(47, 4, 'M.OCUMARE D LA COSTA', '2015-10-20 19:57:00', NULL, 1),
(48, 5, 'ARISMENDI', '2015-10-20 19:57:00', NULL, 1),
(49, 5, 'BARINAS', '2015-10-20 19:57:00', NULL, 1),
(50, 5, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(51, 5, 'EZEQUIEL ZAMORA', '2015-10-20 19:57:00', NULL, 1),
(52, 5, 'OBISPOS', '2015-10-20 19:57:00', NULL, 1),
(53, 5, 'PEDRAZA', '2015-10-20 19:57:00', NULL, 1),
(54, 5, 'ROJAS', '2015-10-20 19:57:00', NULL, 1),
(55, 5, 'SOSA', '2015-10-20 19:57:00', NULL, 1),
(56, 5, 'ALBERTO ARVELO T', '2015-10-20 19:57:00', NULL, 1),
(57, 5, 'A JOSE DE SUCRE', '2015-10-20 19:57:00', NULL, 1),
(58, 5, 'CRUZ PAREDES', '2015-10-20 19:57:00', NULL, 1),
(59, 5, 'ANDRES E. BLANCO', '2015-10-20 19:57:00', NULL, 1),
(60, 6, 'CARONI', '2015-10-20 19:57:00', NULL, 1),
(61, 6, 'CEDEÑO', '2015-10-20 19:57:00', NULL, 1),
(62, 6, 'HERES', '2015-10-20 19:57:00', NULL, 1),
(63, 6, 'PIAR', '2015-10-20 19:57:00', NULL, 1),
(64, 6, 'ROSCIO', '2015-10-20 19:57:00', NULL, 1),
(65, 6, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(66, 6, 'SIFONTES', '2015-10-20 19:57:00', NULL, 1),
(67, 6, 'RAUL LEONI', '2015-10-20 19:57:00', NULL, 1),
(68, 6, 'GRAN SABANA', '2015-10-20 19:57:00', NULL, 1),
(69, 6, 'EL CALLAO', '2015-10-20 19:57:00', NULL, 1),
(70, 6, 'PADRE PEDRO CHIEN', '2015-10-20 19:57:00', NULL, 1),
(71, 7, 'BEJUMA', '2015-10-20 19:57:00', NULL, 1),
(72, 7, 'CARLOS ARVELO', '2015-10-20 19:57:00', NULL, 1),
(73, 7, 'DIEGO IBARRA', '2015-10-20 19:57:00', NULL, 1),
(74, 7, 'GUACARA', '2015-10-20 19:57:00', NULL, 1),
(75, 7, 'MONTALBAN', '2015-10-20 19:57:00', NULL, 1),
(76, 7, 'JUAN JOSE MORA', '2015-10-20 19:57:00', NULL, 1),
(77, 7, 'PUERTO CABELLO', '2015-10-20 19:57:00', NULL, 1),
(78, 7, 'SAN JOAQUIN', '2015-10-20 19:57:00', NULL, 1),
(79, 7, 'VALENCIA', '2015-10-20 19:57:00', NULL, 1),
(80, 7, 'MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(81, 7, 'LOS GUAYOS', '2015-10-20 19:57:00', NULL, 1),
(82, 7, 'NAGUANAGUA', '2015-10-20 19:57:00', NULL, 1),
(83, 7, 'SAN DIEGO', '2015-10-20 19:57:00', NULL, 1),
(84, 7, 'LIBERTADOR', '2015-10-20 19:57:00', NULL, 1),
(85, 8, 'ANZOATEGUI', '2015-10-20 19:57:00', NULL, 1),
(86, 8, 'FALCON', '2015-10-20 19:57:00', NULL, 1),
(87, 8, 'GIRARDOT', '2015-10-20 19:57:00', NULL, 1),
(88, 8, 'MP PAO SN J BAUTISTA', '2015-10-20 19:57:00', NULL, 1),
(89, 8, 'RICAURTE', '2015-10-20 19:57:00', NULL, 1),
(90, 8, 'SAN CARLOS', '2015-10-20 19:57:00', NULL, 1),
(91, 8, 'TINACO', '2015-10-20 19:57:00', NULL, 1),
(92, 8, 'LIMA BLANCO', '2015-10-20 19:57:00', NULL, 1),
(93, 8, 'ROMULO GALLEGOS', '2015-10-20 19:57:00', NULL, 1),
(94, 9, 'ACOSTA', '2015-10-20 19:57:00', NULL, 1),
(95, 9, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(96, 9, 'BUCHIVACOA', '2015-10-20 19:57:00', NULL, 1),
(97, 9, 'CARIRUBANA', '2015-10-20 19:57:00', NULL, 1),
(98, 9, 'COLINA', '2015-10-20 19:57:00', NULL, 1),
(99, 9, 'DEMOCRACIA', '2015-10-20 19:57:00', NULL, 1),
(100, 9, 'FALCON', '2015-10-20 19:57:00', NULL, 1),
(101, 9, 'FEDERACION', '2015-10-20 19:57:00', NULL, 1),
(102, 9, 'MAUROA', '2015-10-20 19:57:00', NULL, 1),
(103, 9, 'MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(104, 9, 'PETIT', '2015-10-20 19:57:00', NULL, 1),
(105, 9, 'SILVA', '2015-10-20 19:57:00', NULL, 1),
(106, 9, 'ZAMORA', '2015-10-20 19:57:00', NULL, 1),
(107, 9, 'DABAJURO', '2015-10-20 19:57:00', NULL, 1),
(108, 9, 'MONS. ITURRIZA', '2015-10-20 19:57:00', NULL, 1),
(109, 9, 'LOS TAQUES', '2015-10-20 19:57:00', NULL, 1),
(110, 9, 'PIRITU', '2015-10-20 19:57:00', NULL, 1),
(111, 9, 'UNION', '2015-10-20 19:57:00', NULL, 1),
(112, 9, 'SAN FRANCISCO', '2015-10-20 19:57:00', NULL, 1),
(113, 9, 'JACURA', '2015-10-20 19:57:00', NULL, 1),
(114, 9, 'CACIQUE MANAURE', '2015-10-20 19:57:00', NULL, 1),
(115, 9, 'PALMA SOLA', '2015-10-20 19:57:00', NULL, 1),
(116, 9, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(117, 9, 'URUMACO', '2015-10-20 19:57:00', NULL, 1),
(118, 9, 'TOCOPERO', '2015-10-20 19:57:00', NULL, 1),
(119, 10, 'INFANTE', '2015-10-20 19:57:00', NULL, 1),
(120, 10, 'MELLADO', '2015-10-20 19:57:00', NULL, 1),
(121, 10, 'MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(122, 10, 'MONAGAS', '2015-10-20 19:57:00', NULL, 1),
(123, 10, 'RIBAS', '2015-10-20 19:57:00', NULL, 1),
(124, 10, 'ROSCIO', '2015-10-20 19:57:00', NULL, 1),
(125, 10, 'ZARAZA', '2015-10-20 19:57:00', NULL, 1),
(126, 10, 'CAMAGUAN', '2015-10-20 19:57:00', NULL, 1),
(127, 10, 'S JOSE DE GUARIBE', '2015-10-20 19:57:00', NULL, 1),
(128, 10, 'LAS MERCEDES', '2015-10-20 19:57:00', NULL, 1),
(129, 10, 'EL SOCORRO', '2015-10-20 19:57:00', NULL, 1),
(130, 10, 'ORTIZ', '2015-10-20 19:57:00', NULL, 1),
(131, 10, 'S MARIA DE IPIRE', '2015-10-20 19:57:00', NULL, 1),
(132, 10, 'CHAGUARAMAS', '2015-10-20 19:57:00', NULL, 1),
(133, 10, 'SAN GERONIMO DE G', '2015-10-20 19:57:00', NULL, 1),
(134, 11, 'CRESPO', '2015-10-20 19:57:00', NULL, 1),
(135, 11, 'IRIBARREN', '2015-10-20 19:57:00', NULL, 1),
(136, 11, 'JIMENEZ', '2015-10-20 19:57:00', NULL, 1),
(137, 11, 'MORAN', '2015-10-20 19:57:00', NULL, 1),
(138, 11, 'PALAVECINO', '2015-10-20 19:57:00', NULL, 1),
(139, 11, 'TORRES', '2015-10-20 19:57:00', NULL, 1),
(140, 11, 'URDANETA', '2015-10-20 19:57:00', NULL, 1),
(141, 11, 'ANDRES E BLANCO', '2015-10-20 19:57:00', NULL, 1),
(142, 11, 'SIMON PLANAS', '2015-10-20 19:57:00', NULL, 1),
(143, 12, 'ALBERTO ADRIANI', '2015-10-20 19:57:00', NULL, 1),
(144, 12, 'ANDRES BELLO', '2015-10-20 19:57:00', NULL, 1),
(145, 12, 'ARZOBISPO CHACON', '2015-10-20 19:57:00', NULL, 1),
(146, 12, 'CAMPO ELIAS', '2015-10-20 19:57:00', NULL, 1),
(147, 12, 'GUARAQUE', '2015-10-20 19:57:00', NULL, 1),
(148, 12, 'JULIO CESAR SALAS', '2015-10-20 19:57:00', NULL, 1),
(149, 12, 'JUSTO BRICEÑO', '2015-10-20 19:57:00', NULL, 1),
(150, 12, 'LIBERTADOR', '2015-10-20 19:57:00', NULL, 1),
(151, 12, 'SANTOS MARQUINA', '2015-10-20 19:57:00', NULL, 1),
(152, 12, 'MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(153, 12, 'ANTONIO PINTO S.', '2015-10-20 19:57:00', NULL, 1),
(154, 12, 'OB. RAMOS DE LORA', '2015-10-20 19:57:00', NULL, 1),
(155, 12, 'CARACCIOLO PARRA', '2015-10-20 19:57:00', NULL, 1),
(156, 12, 'CARDENAL QUINTERO', '2015-10-20 19:57:00', NULL, 1),
(157, 12, 'PUEBLO LLANO', '2015-10-20 19:57:00', NULL, 1),
(158, 12, 'RANGEL', '2015-10-20 19:57:00', NULL, 1),
(159, 12, 'RIVAS DAVILA', '2015-10-20 19:57:00', NULL, 1),
(160, 12, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(161, 12, 'TOVAR', '2015-10-20 19:57:00', NULL, 1),
(162, 12, 'TULIO F CORDERO', '2015-10-20 19:57:00', NULL, 1),
(163, 12, 'PADRE NOGUERA', '2015-10-20 19:57:00', NULL, 1),
(164, 12, 'ARICAGUA', '2015-10-20 19:57:00', NULL, 1),
(165, 12, 'ZEA', '2015-10-20 19:57:00', NULL, 1),
(166, 13, 'ACEVEDO', '2015-10-20 19:57:00', NULL, 1),
(167, 13, 'BRION', '2015-10-20 19:57:00', NULL, 1),
(168, 13, 'GUAICAIPURO', '2015-10-20 19:57:00', NULL, 1),
(169, 13, 'INDEPENDENCIA', '2015-10-20 19:57:00', NULL, 1),
(170, 13, 'LANDER', '2015-10-20 19:57:00', NULL, 1),
(171, 13, 'PAEZ', '2015-10-20 19:57:00', NULL, 1),
(172, 13, 'PAZ CASTILLO', '2015-10-20 19:57:00', NULL, 1),
(173, 13, 'PLAZA', '2015-10-20 19:57:00', NULL, 1),
(174, 13, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(175, 13, 'URDANETA', '2015-10-20 19:57:00', NULL, 1),
(176, 13, 'ZAMORA', '2015-10-20 19:57:00', NULL, 1),
(177, 13, 'CRISTOBAL ROJAS', '2015-10-20 19:57:00', NULL, 1),
(178, 13, 'LOS SALIAS', '2015-10-20 19:57:00', NULL, 1),
(179, 13, 'ANDRES BELLO', '2015-10-20 19:57:00', NULL, 1),
(180, 13, 'SIMON BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(181, 13, 'BARUTA', '2015-10-20 19:57:00', NULL, 1),
(182, 13, 'CARRIZAL', '2015-10-20 19:57:00', NULL, 1),
(183, 13, 'CHACAO', '2015-10-20 19:57:00', NULL, 1),
(184, 13, 'EL HATILLO', '2015-10-20 19:57:00', NULL, 1),
(185, 13, 'BUROZ', '2015-10-20 19:57:00', NULL, 1),
(186, 13, 'PEDRO GUAL', '2015-10-20 19:57:00', NULL, 1),
(187, 14, 'ACOSTA', '2015-10-20 19:57:00', NULL, 1),
(188, 14, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(189, 14, 'CARIPE', '2015-10-20 19:57:00', NULL, 1),
(190, 14, 'CEDEÑO', '2015-10-20 19:57:00', NULL, 1),
(191, 14, 'EZEQUIEL ZAMORA', '2015-10-20 19:57:00', NULL, 1),
(192, 14, 'LIBERTADOR', '2015-10-20 19:57:00', NULL, 1),
(193, 14, 'MATURIN', '2015-10-20 19:57:00', NULL, 1),
(194, 14, 'PIAR', '2015-10-20 19:57:00', NULL, 1),
(195, 14, 'PUNCERES', '2015-10-20 19:57:00', NULL, 1),
(196, 14, 'SOTILLO', '2015-10-20 19:57:00', NULL, 1),
(197, 14, 'AGUASAY', '2015-10-20 19:57:00', NULL, 1),
(198, 14, 'SANTA BARBARA', '2015-10-20 19:57:00', NULL, 1),
(199, 14, 'URACOA', '2015-10-20 19:57:00', NULL, 1),
(200, 15, 'ARISMENDI', '2015-10-20 19:57:00', NULL, 1),
(201, 15, 'DIAZ', '2015-10-20 19:57:00', NULL, 1),
(202, 15, 'GOMEZ', '2015-10-20 19:57:00', NULL, 1),
(203, 15, 'MANEIRO', '2015-10-20 19:57:00', NULL, 1),
(204, 15, 'MARCANO', '2015-10-20 19:57:00', NULL, 1),
(205, 15, 'MARIÑO', '2015-10-20 19:57:00', NULL, 1),
(206, 15, 'PENIN. DE MACANAO', '2015-10-20 19:57:00', NULL, 1),
(207, 15, 'VILLALBA(I.COCHE)', '2015-10-20 19:57:00', NULL, 1),
(208, 15, 'TUBORES', '2015-10-20 19:57:00', NULL, 1),
(209, 15, 'ANTOLIN DEL CAMPO', '2015-10-20 19:57:00', NULL, 1),
(210, 15, 'GARCIA', '2015-10-20 19:57:00', NULL, 1),
(211, 16, 'ARAURE', '2015-10-20 19:57:00', NULL, 1),
(212, 16, 'ESTELLER', '2015-10-20 19:57:00', NULL, 1),
(213, 16, 'GUANARE', '2015-10-20 19:57:00', NULL, 1),
(214, 16, 'GUANARITO', '2015-10-20 19:57:00', NULL, 1),
(215, 16, 'OSPINO', '2015-10-20 19:57:00', NULL, 1),
(216, 16, 'PAEZ', '2015-10-20 19:57:00', NULL, 1),
(217, 16, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(218, 16, 'TUREN', '2015-10-20 19:57:00', NULL, 1),
(219, 16, 'M.JOSE V DE UNDA', '2015-10-20 19:57:00', NULL, 1),
(220, 16, 'AGUA BLANCA', '2015-10-20 19:57:00', NULL, 1),
(221, 16, 'PAPELON', '2015-10-20 19:57:00', NULL, 1),
(222, 16, 'GENARO BOCONOITO', '2015-10-20 19:57:00', NULL, 1),
(223, 16, 'S RAFAEL DE ONOTO', '2015-10-20 19:57:00', NULL, 1),
(224, 16, 'SANTA ROSALIA', '2015-10-20 19:57:00', NULL, 1),
(225, 17, 'ARISMENDI', '2015-10-20 19:57:00', NULL, 1),
(226, 17, 'BENITEZ', '2015-10-20 19:57:00', NULL, 1),
(227, 17, 'BERMUDEZ', '2015-10-20 19:57:00', NULL, 1),
(228, 17, 'CAJIGAL', '2015-10-20 19:57:00', NULL, 1),
(229, 17, 'MARIÑO', '2015-10-20 19:57:00', NULL, 1),
(230, 17, 'MEJIA', '2015-10-20 19:57:00', NULL, 1),
(231, 17, 'MONTES', '2015-10-20 19:57:00', NULL, 1),
(232, 17, 'RIBERO', '2015-10-20 19:57:00', NULL, 1),
(233, 17, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(234, 17, 'VALDEZ', '2015-10-20 19:57:00', NULL, 1),
(235, 17, 'ANDRES E BLANCO', '2015-10-20 19:57:00', NULL, 1),
(236, 17, 'LIBERTADOR', '2015-10-20 19:57:00', NULL, 1),
(237, 17, 'ANDRES MATA', '2015-10-20 19:57:00', NULL, 1),
(238, 17, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(239, 17, 'CRUZ S ACOSTA', '2015-10-20 19:57:00', NULL, 1),
(240, 18, 'AYACUCHO', '2015-10-20 19:57:00', NULL, 1),
(241, 18, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(242, 18, 'INDEPENDENCIA', '2015-10-20 19:57:00', NULL, 1),
(243, 18, 'CARDENAS', '2015-10-20 19:57:00', NULL, 1),
(244, 18, 'JAUREGUI', '2015-10-20 19:57:00', NULL, 1),
(245, 18, 'JUNIN', '2015-10-20 19:57:00', NULL, 1),
(246, 18, 'LOBATERA', '2015-10-20 19:57:00', NULL, 1),
(247, 18, 'SAN CRISTOBAL', '2015-10-20 19:57:00', NULL, 1),
(248, 18, 'URIBANTE', '2015-10-20 19:57:00', NULL, 1),
(249, 18, 'CORDOBA', '2015-10-20 19:57:00', NULL, 1),
(250, 18, 'GARCIA DE HEVIA', '2015-10-20 19:57:00', NULL, 1),
(251, 18, 'GUASIMOS', '2015-10-20 19:57:00', NULL, 1),
(252, 18, 'MICHELENA', '2015-10-20 19:57:00', NULL, 1),
(253, 18, 'LIBERTADOR', '2015-10-20 19:57:00', NULL, 1),
(254, 18, 'PANAMERICANO', '2015-10-20 19:57:00', NULL, 1),
(255, 18, 'PEDRO MARIA UREÑA', '2015-10-20 19:57:00', NULL, 1),
(256, 18, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(257, 18, 'ANDRES BELLO', '2015-10-20 19:57:00', NULL, 1),
(258, 18, 'FERNANDEZ FEO', '2015-10-20 19:57:00', NULL, 1),
(259, 18, 'LIBERTAD', '2015-10-20 19:57:00', NULL, 1),
(260, 18, 'SAMUEL MALDONADO', '2015-10-20 19:57:00', NULL, 1),
(261, 18, 'SEBORUCO', '2015-10-20 19:57:00', NULL, 1),
(262, 18, 'ANTONIO ROMULO C', '2015-10-20 19:57:00', NULL, 1),
(263, 18, 'FCO DE MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(264, 18, 'JOSE MARIA VARGA', '2015-10-20 19:57:00', NULL, 1),
(265, 18, 'RAFAEL URDANETA', '2015-10-20 19:57:00', NULL, 1),
(266, 18, 'SIMON RODRIGUEZ', '2015-10-20 19:57:00', NULL, 1),
(267, 18, 'TORBES', '2015-10-20 19:57:00', NULL, 1),
(268, 18, 'SAN JUDAS TADEO', '2015-10-20 19:57:00', NULL, 1),
(269, 19, 'RAFAEL RANGEL', '2015-10-20 19:57:00', NULL, 1),
(270, 19, 'BOCONO', '2015-10-20 19:57:00', NULL, 1),
(271, 19, 'CARACHE', '2015-10-20 19:57:00', NULL, 1),
(272, 19, 'ESCUQUE', '2015-10-20 19:57:00', NULL, 1),
(273, 19, 'TRUJILLO', '2015-10-20 19:57:00', NULL, 1),
(274, 19, 'URDANETA', '2015-10-20 19:57:00', NULL, 1),
(275, 19, 'VALERA', '2015-10-20 19:57:00', NULL, 1),
(276, 19, 'CANDELARIA', '2015-10-20 19:57:00', NULL, 1),
(277, 19, 'MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(278, 19, 'MONTE CARMELO', '2015-10-20 19:57:00', NULL, 1),
(279, 19, 'MOTATAN', '2015-10-20 19:57:00', NULL, 1),
(280, 19, 'PAMPAN', '2015-10-20 19:57:00', NULL, 1),
(281, 19, 'S RAFAEL CARVAJAL', '2015-10-20 19:57:00', NULL, 1),
(282, 19, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(283, 19, 'ANDRES BELLO', '2015-10-20 19:57:00', NULL, 1),
(284, 19, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(285, 19, 'JOSE F M CAÑIZAL', '2015-10-20 19:57:00', NULL, 1),
(286, 19, 'JUAN V CAMPO ELI', '2015-10-20 19:57:00', NULL, 1),
(287, 19, 'LA CEIBA', '2015-10-20 19:57:00', NULL, 1),
(288, 19, 'PAMPANITO', '2015-10-20 19:57:00', NULL, 1),
(289, 20, 'BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(290, 20, 'BRUZUAL', '2015-10-20 19:57:00', NULL, 1),
(291, 20, 'NIRGUA', '2015-10-20 19:57:00', NULL, 1),
(292, 20, 'SAN FELIPE', '2015-10-20 19:57:00', NULL, 1),
(293, 20, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(294, 20, 'URACHICHE', '2015-10-20 19:57:00', NULL, 1),
(295, 20, 'PEÑA', '2015-10-20 19:57:00', NULL, 1),
(296, 20, 'JOSE ANTONIO PAEZ', '2015-10-20 19:57:00', NULL, 1),
(297, 20, 'LA TRINIDAD', '2015-10-20 19:57:00', NULL, 1),
(298, 20, 'COCOROTE', '2015-10-20 19:57:00', NULL, 1),
(299, 20, 'INDEPENDENCIA', '2015-10-20 19:57:00', NULL, 1),
(300, 20, 'ARISTIDES BASTID', '2015-10-20 19:57:00', NULL, 1),
(301, 20, 'MANUEL MONGE', '2015-10-20 19:57:00', NULL, 1),
(302, 20, 'VEROES', '2015-10-20 19:57:00', NULL, 1),
(303, 21, 'BARALT', '2015-10-20 19:57:00', NULL, 1),
(304, 21, 'SANTA RITA', '2015-10-20 19:57:00', NULL, 1),
(305, 21, 'COLON', '2015-10-20 19:57:00', NULL, 1),
(306, 21, 'MARA', '2015-10-20 19:57:00', NULL, 1),
(307, 21, 'MARACAIBO', '2015-10-20 19:57:00', NULL, 1),
(308, 21, 'MIRANDA', '2015-10-20 19:57:00', NULL, 1),
(309, 21, 'PAEZ', '2015-10-20 19:57:00', NULL, 1),
(310, 21, 'MACHIQUES DE P', '2015-10-20 19:57:00', NULL, 1),
(311, 21, 'SUCRE', '2015-10-20 19:57:00', NULL, 1),
(312, 21, 'LA CAÑADA DE U.', '2015-10-20 19:57:00', NULL, 1),
(313, 21, 'LAGUNILLAS', '2015-10-20 19:57:00', NULL, 1),
(314, 21, 'CATATUMBO', '2015-10-20 19:57:00', NULL, 1),
(315, 21, 'M/ROSARIO DE PERIJA', '2015-10-20 19:57:00', NULL, 1),
(316, 21, 'CABIMAS', '2015-10-20 19:57:00', NULL, 1),
(317, 21, 'VALMORE RODRIGUEZ', '2015-10-20 19:57:00', NULL, 1),
(318, 21, 'JESUS E LOSSADA', '2015-10-20 19:57:00', NULL, 1),
(319, 21, 'ALMIRANTE P', '2015-10-20 19:57:00', NULL, 1),
(320, 21, 'SAN FRANCISCO', '2015-10-20 19:57:00', NULL, 1),
(321, 21, 'JESUS M SEMPRUN', '2015-10-20 19:57:00', NULL, 1),
(322, 21, 'FRANCISCO J PULG', '2015-10-20 19:57:00', NULL, 1),
(323, 21, 'SIMON BOLIVAR', '2015-10-20 19:57:00', NULL, 1),
(324, 22, 'ATURES', '2015-10-20 19:57:00', NULL, 1),
(325, 22, 'ATABAPO', '2015-10-20 19:57:00', NULL, 1),
(326, 22, 'MAROA', '2015-10-20 19:57:00', NULL, 1),
(327, 22, 'RIO NEGRO', '2015-10-20 19:57:00', NULL, 1),
(328, 22, 'AUTANA', '2015-10-20 19:57:00', NULL, 1),
(329, 22, 'MANAPIARE', '2015-10-20 19:57:00', NULL, 1),
(330, 22, 'ALTO ORINOCO', '2015-10-20 19:57:00', NULL, 1),
(331, 23, 'TUCUPITA', '2015-10-20 19:57:00', NULL, 1),
(332, 23, 'PEDERNALES', '2015-10-20 19:57:00', NULL, 1),
(333, 23, 'ANTONIO DIAZ', '2015-10-20 19:57:00', NULL, 1),
(334, 23, 'CASACOIMA', '2015-10-20 19:57:00', NULL, 1),
(335, 24, 'VARGAS', '2015-10-20 19:57:00', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padres`
--

CREATE TABLE IF NOT EXISTS `padres` (
  `id_padre` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_redes_sociales` int(11) DEFAULT NULL,
  `id_empleo` int(11) DEFAULT NULL,
  `madre` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los padres';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los países, en este caso solo contendrá';

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'Venezuela', '2015-10-20 19:47:15', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentescos`
--

CREATE TABLE IF NOT EXISTS `parentescos` (
  `id_parentesco` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la lista de parentescos';

--
-- Volcado de datos para la tabla `parentescos`
--

INSERT INTO `parentescos` (`id_parentesco`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'PADRE', '2015-10-20 20:13:28', NULL, 1),
(2, 'MADRE', '2015-10-20 20:13:28', NULL, 1),
(3, 'HERMANO', '2015-10-20 20:13:28', NULL, 1),
(4, 'HERMANA', '2015-10-20 20:13:28', NULL, 1),
(5, 'ABUELO', '2015-10-20 20:13:28', NULL, 1),
(6, 'ABUELA', '2015-10-20 20:13:28', NULL, 1),
(7, 'TIA', '2015-10-20 20:13:28', NULL, 1),
(8, 'TIO', '2015-10-20 20:13:28', NULL, 1),
(9, 'PRIMO', '2015-10-20 20:13:28', NULL, 1),
(10, 'PRIMA', '2015-10-20 20:13:28', NULL, 1),
(11, 'SOBRINO', '2015-10-20 20:13:28', NULL, 1),
(12, 'SOBRINA', '2015-10-20 20:13:28', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquias`
--

CREATE TABLE IF NOT EXISTS `parroquias` (
  `id_parroquia` int(11) NOT NULL COMMENT 'Identificador de la parroquia',
  `id_municipio` int(11) NOT NULL COMMENT 'Identificador del municipio al que pertenece la parroquia',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre de la parroquia',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha de creación del registro',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL COMMENT 'fecha de actualización del registro',
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'registro activo o no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene informacion sobre parroquias.';

--
-- Volcado de datos para la tabla `parroquias`
--

INSERT INTO `parroquias` (`id_parroquia`, `id_municipio`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 1, 'ALTAGRACIA', '2015-10-20 19:59:36', NULL, 1),
(2, 1, 'CANDELARIA', '2015-10-20 19:59:36', NULL, 1),
(3, 1, 'CATEDRAL', '2015-10-20 19:59:36', NULL, 1),
(4, 1, 'LA PASTORA', '2015-10-20 19:59:36', NULL, 1),
(5, 1, 'SAN AGUSTIN', '2015-10-20 19:59:36', NULL, 1),
(6, 1, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(7, 1, 'SAN JUAN', '2015-10-20 19:59:36', NULL, 1),
(8, 1, 'SANTA ROSALIA', '2015-10-20 19:59:36', NULL, 1),
(9, 1, 'SANTA TERESA', '2015-10-20 19:59:36', NULL, 1),
(10, 1, 'SUCRE', '2015-10-20 19:59:36', NULL, 1),
(11, 1, '23 DE ENERO', '2015-10-20 19:59:36', NULL, 1),
(12, 1, 'ANTIMANO', '2015-10-20 19:59:36', NULL, 1),
(13, 1, 'EL RECREO', '2015-10-20 19:59:36', NULL, 1),
(14, 1, 'EL VALLE', '2015-10-20 19:59:36', NULL, 1),
(15, 1, 'LA VEGA', '2015-10-20 19:59:36', NULL, 1),
(16, 1, 'MACARAO', '2015-10-20 19:59:36', NULL, 1),
(17, 1, 'CARICUAO', '2015-10-20 19:59:36', NULL, 1),
(18, 1, 'EL JUNQUITO', '2015-10-20 19:59:36', NULL, 1),
(19, 1, 'COCHE', '2015-10-20 19:59:36', NULL, 1),
(20, 1, 'SAN PEDRO', '2015-10-20 19:59:36', NULL, 1),
(21, 1, 'SAN BERNARDINO', '2015-10-20 19:59:36', NULL, 1),
(22, 1, 'EL PARAISO', '2015-10-20 19:59:36', NULL, 1),
(23, 2, 'ANACO', '2015-10-20 19:59:36', NULL, 1),
(24, 2, 'SAN JOAQUIN', '2015-10-20 19:59:36', NULL, 1),
(25, 3, 'CM. ARAGUA DE BARCELONA', '2015-10-20 19:59:36', NULL, 1),
(26, 3, 'CACHIPO', '2015-10-20 19:59:36', NULL, 1),
(27, 4, 'EL CARMEN', '2015-10-20 19:59:36', NULL, 1),
(28, 4, 'SAN CRISTOBAL', '2015-10-20 19:59:36', NULL, 1),
(29, 4, 'BERGANTIN', '2015-10-20 19:59:36', NULL, 1),
(30, 4, 'CAIGUA', '2015-10-20 19:59:36', NULL, 1),
(31, 4, 'EL PILAR', '2015-10-20 19:59:36', NULL, 1),
(32, 4, 'NARICUAL', '2015-10-20 19:59:36', NULL, 1),
(33, 5, 'CM. CLARINES', '2015-10-20 19:59:36', NULL, 1),
(34, 5, 'GUANAPE', '2015-10-20 19:59:36', NULL, 1),
(35, 5, 'SABANA DE UCHIRE', '2015-10-20 19:59:36', NULL, 1),
(36, 6, 'CM. ONOTO', '2015-10-20 19:59:36', NULL, 1),
(37, 6, 'SAN PABLO', '2015-10-20 19:59:36', NULL, 1),
(38, 7, 'CM. CANTAURA', '2015-10-20 19:59:36', NULL, 1),
(39, 7, 'LIBERTADOR', '2015-10-20 19:59:36', NULL, 1),
(40, 7, 'SANTA ROSA', '2015-10-20 19:59:36', NULL, 1),
(41, 7, 'URICA', '2015-10-20 19:59:36', NULL, 1),
(42, 8, 'CM. SOLEDAD', '2015-10-20 19:59:36', NULL, 1),
(43, 8, 'MAMO', '2015-10-20 19:59:36', NULL, 1),
(44, 9, 'CM. SAN MATEO', '2015-10-20 19:59:36', NULL, 1),
(45, 9, 'EL CARITO', '2015-10-20 19:59:36', NULL, 1),
(46, 9, 'SANTA INES', '2015-10-20 19:59:36', NULL, 1),
(47, 10, 'CM. PARIAGUAN', '2015-10-20 19:59:36', NULL, 1),
(48, 10, 'ATAPIRIRE', '2015-10-20 19:59:36', NULL, 1),
(49, 10, 'BOCA DEL PAO', '2015-10-20 19:59:36', NULL, 1),
(50, 10, 'EL PAO', '2015-10-20 19:59:36', NULL, 1),
(51, 11, 'CM. MAPIRE', '2015-10-20 19:59:36', NULL, 1),
(52, 11, 'PIAR', '2015-10-20 19:59:36', NULL, 1),
(53, 11, 'SN DIEGO DE CABRUTICA', '2015-10-20 19:59:36', NULL, 1),
(54, 11, 'SANTA CLARA', '2015-10-20 19:59:36', NULL, 1),
(55, 11, 'UVERITO', '2015-10-20 19:59:36', NULL, 1),
(56, 11, 'ZUATA', '2015-10-20 19:59:36', NULL, 1),
(57, 12, 'CM. PUERTO PIRITU', '2015-10-20 19:59:36', NULL, 1),
(58, 12, 'SAN MIGUEL', '2015-10-20 19:59:36', NULL, 1),
(59, 12, 'SUCRE', '2015-10-20 19:59:36', NULL, 1),
(60, 13, 'CM. EL TIGRE', '2015-10-20 19:59:36', NULL, 1),
(61, 14, 'POZUELOS', '2015-10-20 19:59:36', NULL, 1),
(62, 14, 'CM PTO. LA CRUZ', '2015-10-20 19:59:36', NULL, 1),
(63, 15, 'CM. SAN JOSE DE GUANIPA', '2015-10-20 19:59:36', NULL, 1),
(64, 16, 'GUANTA', '2015-10-20 19:59:36', NULL, 1),
(65, 16, 'CHORRERON', '2015-10-20 19:59:36', NULL, 1),
(66, 17, 'PIRITU', '2015-10-20 19:59:36', NULL, 1),
(67, 17, 'SAN FRANCISCO', '2015-10-20 19:59:36', NULL, 1),
(68, 18, 'LECHERIAS', '2015-10-20 19:59:36', NULL, 1),
(69, 18, 'EL MORRO', '2015-10-20 19:59:36', NULL, 1),
(70, 19, 'VALLE GUANAPE', '2015-10-20 19:59:36', NULL, 1),
(71, 19, 'SANTA BARBARA', '2015-10-20 19:59:36', NULL, 1),
(72, 20, 'SANTA ANA', '2015-10-20 19:59:36', NULL, 1),
(73, 20, 'PUEBLO NUEVO', '2015-10-20 19:59:36', NULL, 1),
(74, 21, 'EL CHAPARRO', '2015-10-20 19:59:36', NULL, 1),
(75, 21, 'TOMAS ALFARO CALATRAVA', '2015-10-20 19:59:36', NULL, 1),
(76, 22, 'BOCA UCHIRE', '2015-10-20 19:59:36', NULL, 1),
(77, 22, 'BOCA DE CHAVEZ', '2015-10-20 19:59:36', NULL, 1),
(78, 23, 'ACHAGUAS', '2015-10-20 19:59:36', NULL, 1),
(79, 23, 'APURITO', '2015-10-20 19:59:36', NULL, 1),
(80, 23, 'EL YAGUAL', '2015-10-20 19:59:36', NULL, 1),
(81, 23, 'GUACHARA', '2015-10-20 19:59:36', NULL, 1),
(82, 23, 'MUCURITAS', '2015-10-20 19:59:36', NULL, 1),
(83, 23, 'QUESERAS DEL MEDIO', '2015-10-20 19:59:36', NULL, 1),
(84, 24, 'BRUZUAL', '2015-10-20 19:59:36', NULL, 1),
(85, 24, 'MANTECAL', '2015-10-20 19:59:36', NULL, 1),
(86, 24, 'QUINTERO', '2015-10-20 19:59:36', NULL, 1),
(87, 24, 'SAN VICENTE', '2015-10-20 19:59:36', NULL, 1),
(88, 24, 'RINCON HONDO', '2015-10-20 19:59:36', NULL, 1),
(89, 25, 'GUASDUALITO', '2015-10-20 19:59:36', NULL, 1),
(90, 25, 'ARAMENDI', '2015-10-20 19:59:36', NULL, 1),
(91, 25, 'EL AMPARO', '2015-10-20 19:59:36', NULL, 1),
(92, 25, 'SAN CAMILO', '2015-10-20 19:59:36', NULL, 1),
(93, 25, 'URDANETA', '2015-10-20 19:59:36', NULL, 1),
(94, 26, 'SAN JUAN DE PAYARA', '2015-10-20 19:59:36', NULL, 1),
(95, 26, 'CODAZZI', '2015-10-20 19:59:36', NULL, 1),
(96, 26, 'CUNAVICHE', '2015-10-20 19:59:36', NULL, 1),
(97, 27, 'ELORZA', '2015-10-20 19:59:36', NULL, 1),
(98, 27, 'LA TRINIDAD', '2015-10-20 19:59:36', NULL, 1),
(99, 28, 'SAN FERNANDO', '2015-10-20 19:59:36', NULL, 1),
(100, 28, 'PEÑALVER', '2015-10-20 19:59:36', NULL, 1),
(101, 28, 'EL RECREO', '2015-10-20 19:59:36', NULL, 1),
(102, 28, 'SN RAFAEL DE ATAMAICA', '2015-10-20 19:59:36', NULL, 1),
(103, 29, 'BIRUACA', '2015-10-20 19:59:36', NULL, 1),
(104, 30, 'CM. LAS DELICIAS', '2015-10-20 19:59:36', NULL, 1),
(105, 30, 'CHORONI', '2015-10-20 19:59:36', NULL, 1),
(106, 30, 'MADRE MA DE SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(107, 30, 'JOAQUIN CRESPO', '2015-10-20 19:59:36', NULL, 1),
(108, 30, 'PEDRO JOSE OVALLES', '2015-10-20 19:59:36', NULL, 1),
(109, 30, 'JOSE CASANOVA GODOY', '2015-10-20 19:59:36', NULL, 1),
(110, 30, 'ANDRES ELOY BLANCO', '2015-10-20 19:59:36', NULL, 1),
(111, 30, 'LOS TACARIGUAS', '2015-10-20 19:59:36', NULL, 1),
(112, 31, 'CM. TURMERO', '2015-10-20 19:59:36', NULL, 1),
(113, 31, 'SAMAN DE GUERE', '2015-10-20 19:59:36', NULL, 1),
(114, 31, 'ALFREDO PACHECO M', '2015-10-20 19:59:36', NULL, 1),
(115, 31, 'CHUAO', '2015-10-20 19:59:36', NULL, 1),
(116, 31, 'AREVALO APONTE', '2015-10-20 19:59:36', NULL, 1),
(117, 32, 'CM. LA VICTORIA', '2015-10-20 19:59:36', NULL, 1),
(118, 32, 'ZUATA', '2015-10-20 19:59:36', NULL, 1),
(119, 32, 'PAO DE ZARATE', '2015-10-20 19:59:36', NULL, 1),
(120, 32, 'CASTOR NIEVES RIOS', '2015-10-20 19:59:36', NULL, 1),
(121, 32, 'LAS GUACAMAYAS', '2015-10-20 19:59:36', NULL, 1),
(122, 33, 'CM. SAN CASIMIRO', '2015-10-20 19:59:36', NULL, 1),
(123, 33, 'VALLE MORIN', '2015-10-20 19:59:36', NULL, 1),
(124, 33, 'GUIRIPA', '2015-10-20 19:59:36', NULL, 1),
(125, 33, 'OLLAS DE CARAMACATE', '2015-10-20 19:59:36', NULL, 1),
(126, 34, 'CM. SAN SEBASTIAN', '2015-10-20 19:59:36', NULL, 1),
(127, 35, 'CM. CAGUA', '2015-10-20 19:59:36', NULL, 1),
(128, 35, 'BELLA VISTA', '2015-10-20 19:59:36', NULL, 1),
(129, 36, 'CM. BARBACOAS', '2015-10-20 19:59:36', NULL, 1),
(130, 36, 'SAN FRANCISCO DE CARA', '2015-10-20 19:59:36', NULL, 1),
(131, 36, 'TAGUAY', '2015-10-20 19:59:36', NULL, 1),
(132, 36, 'LAS PEÑITAS', '2015-10-20 19:59:36', NULL, 1),
(133, 37, 'CM. VILLA DE CURA', '2015-10-20 19:59:36', NULL, 1),
(134, 37, 'MAGDALENO', '2015-10-20 19:59:36', NULL, 1),
(135, 37, 'SAN FRANCISCO DE ASIS', '2015-10-20 19:59:36', NULL, 1),
(136, 37, 'VALLES DE TUCUTUNEMO', '2015-10-20 19:59:36', NULL, 1),
(137, 37, 'PQ AUGUSTO MIJARES', '2015-10-20 19:59:36', NULL, 1),
(138, 38, 'CM. PALO NEGRO', '2015-10-20 19:59:36', NULL, 1),
(139, 38, 'SAN MARTIN DE PORRES', '2015-10-20 19:59:36', NULL, 1),
(140, 39, 'CM. SANTA CRUZ', '2015-10-20 19:59:36', NULL, 1),
(141, 40, 'CM. SAN MATEO', '2015-10-20 19:59:36', NULL, 1),
(142, 41, 'CM. LAS TEJERIAS', '2015-10-20 19:59:36', NULL, 1),
(143, 41, 'TIARA', '2015-10-20 19:59:36', NULL, 1),
(144, 42, 'CM. EL LIMON', '2015-10-20 19:59:36', NULL, 1),
(145, 42, 'CA A DE AZUCAR', '2015-10-20 19:59:36', NULL, 1),
(146, 43, 'CM. COLONIA TOVAR', '2015-10-20 19:59:36', NULL, 1),
(147, 44, 'CM. CAMATAGUA', '2015-10-20 19:59:36', NULL, 1),
(148, 44, 'CARMEN DE CURA', '2015-10-20 19:59:36', NULL, 1),
(149, 45, 'CM. EL CONSEJO', '2015-10-20 19:59:36', NULL, 1),
(150, 46, 'CM. SANTA RITA', '2015-10-20 19:59:36', NULL, 1),
(151, 46, 'FRANCISCO DE MIRANDA', '2015-10-20 19:59:36', NULL, 1),
(152, 46, 'MONS FELICIANO G', '2015-10-20 19:59:36', NULL, 1),
(153, 47, 'OCUMARE DE LA COSTA', '2015-10-20 19:59:36', NULL, 1),
(154, 48, 'ARISMENDI', '2015-10-20 19:59:36', NULL, 1),
(155, 48, 'GUADARRAMA', '2015-10-20 19:59:36', NULL, 1),
(156, 48, 'LA UNION', '2015-10-20 19:59:36', NULL, 1),
(157, 48, 'SAN ANTONIO', '2015-10-20 19:59:36', NULL, 1),
(158, 49, 'ALFREDO A LARRIVA', '2015-10-20 19:59:36', NULL, 1),
(159, 49, 'BARINAS', '2015-10-20 19:59:36', NULL, 1),
(160, 49, 'SAN SILVESTRE', '2015-10-20 19:59:36', NULL, 1),
(161, 49, 'SANTA INES', '2015-10-20 19:59:36', NULL, 1),
(162, 49, 'SANTA LUCIA', '2015-10-20 19:59:36', NULL, 1),
(163, 49, 'TORUNOS', '2015-10-20 19:59:36', NULL, 1),
(164, 49, 'EL CARMEN', '2015-10-20 19:59:36', NULL, 1),
(165, 49, 'ROMULO BETANCOURT', '2015-10-20 19:59:36', NULL, 1),
(166, 49, 'CORAZON DE JESUS', '2015-10-20 19:59:36', NULL, 1),
(167, 49, 'RAMON I MENDEZ', '2015-10-20 19:59:36', NULL, 1),
(168, 49, 'ALTO BARINAS', '2015-10-20 19:59:36', NULL, 1),
(169, 49, 'MANUEL P FAJARDO', '2015-10-20 19:59:36', NULL, 1),
(170, 49, 'JUAN A RODRIGUEZ D', '2015-10-20 19:59:36', NULL, 1),
(171, 49, 'DOMINGA ORTIZ P', '2015-10-20 19:59:36', NULL, 1),
(172, 50, 'ALTAMIRA', '2015-10-20 19:59:36', NULL, 1),
(173, 50, 'BARINITAS', '2015-10-20 19:59:36', NULL, 1),
(174, 50, 'CALDERAS', '2015-10-20 19:59:36', NULL, 1),
(175, 51, 'SANTA BARBARA', '2015-10-20 19:59:36', NULL, 1),
(176, 51, 'JOSE IGNACIO DEL PUMAR', '2015-10-20 19:59:36', NULL, 1),
(177, 51, 'RAMON IGNACIO MENDEZ', '2015-10-20 19:59:36', NULL, 1),
(178, 51, 'PEDRO BRICEÑO MENDEZ', '2015-10-20 19:59:36', NULL, 1),
(179, 52, 'EL REAL', '2015-10-20 19:59:36', NULL, 1),
(180, 52, 'LA LUZ', '2015-10-20 19:59:36', NULL, 1),
(181, 52, 'OBISPOS', '2015-10-20 19:59:36', NULL, 1),
(182, 52, 'LOS GUASIMITOS', '2015-10-20 19:59:36', NULL, 1),
(183, 53, 'CIUDAD BOLIVIA', '2015-10-20 19:59:36', NULL, 1),
(184, 53, 'IGNACIO BRICEÑO', '2015-10-20 19:59:36', NULL, 1),
(185, 53, 'PAEZ', '2015-10-20 19:59:36', NULL, 1),
(186, 53, 'JOSE FELIX RIBAS', '2015-10-20 19:59:36', NULL, 1),
(187, 54, 'DOLORES', '2015-10-20 19:59:36', NULL, 1),
(188, 54, 'LIBERTAD', '2015-10-20 19:59:36', NULL, 1),
(189, 54, 'PALACIO FAJARDO', '2015-10-20 19:59:36', NULL, 1),
(190, 54, 'SANTA ROSA', '2015-10-20 19:59:36', NULL, 1),
(191, 55, 'CIUDAD DE NUTRIAS', '2015-10-20 19:59:36', NULL, 1),
(192, 55, 'EL REGALO', '2015-10-20 19:59:36', NULL, 1),
(193, 55, 'PUERTO DE NUTRIAS', '2015-10-20 19:59:36', NULL, 1),
(194, 55, 'SANTA CATALINA', '2015-10-20 19:59:36', NULL, 1),
(195, 56, 'RODRIGUEZ DOMINGUEZ', '2015-10-20 19:59:36', NULL, 1),
(196, 56, 'SABANETA', '2015-10-20 19:59:36', NULL, 1),
(197, 57, 'TICOPORO', '2015-10-20 19:59:36', NULL, 1),
(198, 57, 'NICOLAS PULIDO', '2015-10-20 19:59:36', NULL, 1),
(199, 57, 'ANDRES BELLO', '2015-10-20 19:59:36', NULL, 1),
(200, 58, 'BARRANCAS', '2015-10-20 19:59:36', NULL, 1),
(201, 58, 'EL SOCORRO', '2015-10-20 19:59:36', NULL, 1),
(202, 58, 'MASPARRITO', '2015-10-20 19:59:36', NULL, 1),
(203, 59, 'EL CANTON', '2015-10-20 19:59:36', NULL, 1),
(204, 59, 'SANTA CRUZ DE GUACAS', '2015-10-20 19:59:36', NULL, 1),
(205, 59, 'PUERTO VIVAS', '2015-10-20 19:59:36', NULL, 1),
(206, 60, 'SIMON BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(207, 60, 'ONCE DE ABRIL', '2015-10-20 19:59:36', NULL, 1),
(208, 60, 'VISTA AL SOL', '2015-10-20 19:59:36', NULL, 1),
(209, 60, 'CHIRICA', '2015-10-20 19:59:36', NULL, 1),
(210, 60, 'DALLA COSTA', '2015-10-20 19:59:36', NULL, 1),
(211, 60, 'CACHAMAY', '2015-10-20 19:59:36', NULL, 1),
(212, 60, 'UNIVERSIDAD', '2015-10-20 19:59:36', NULL, 1),
(213, 60, 'UNARE', '2015-10-20 19:59:36', NULL, 1),
(214, 60, 'YOCOIMA', '2015-10-20 19:59:36', NULL, 1),
(215, 60, 'POZO VERDE', '2015-10-20 19:59:36', NULL, 1),
(216, 61, 'CM. CAICARA DEL ORINOCO', '2015-10-20 19:59:36', NULL, 1),
(217, 61, 'ASCENSION FARRERAS', '2015-10-20 19:59:36', NULL, 1),
(218, 61, 'ALTAGRACIA', '2015-10-20 19:59:36', NULL, 1),
(219, 61, 'LA URBANA', '2015-10-20 19:59:36', NULL, 1),
(220, 61, 'GUANIAMO', '2015-10-20 19:59:36', NULL, 1),
(221, 61, 'PIJIGUAOS', '2015-10-20 19:59:36', NULL, 1),
(222, 62, 'CATEDRAL', '2015-10-20 19:59:36', NULL, 1),
(223, 62, 'AGUA SALADA', '2015-10-20 19:59:36', NULL, 1),
(224, 62, 'LA SABANITA', '2015-10-20 19:59:36', NULL, 1),
(225, 62, 'VISTA HERMOSA', '2015-10-20 19:59:36', NULL, 1),
(226, 62, 'MARHUANTA', '2015-10-20 19:59:36', NULL, 1),
(227, 62, 'JOSE ANTONIO PAEZ', '2015-10-20 19:59:36', NULL, 1),
(228, 62, 'ORINOCO', '2015-10-20 19:59:36', NULL, 1),
(229, 62, 'PANAPANA', '2015-10-20 19:59:36', NULL, 1),
(230, 62, 'ZEA', '2015-10-20 19:59:36', NULL, 1),
(231, 63, 'CM. UPATA', '2015-10-20 19:59:36', NULL, 1),
(232, 63, 'ANDRES ELOY BLANCO', '2015-10-20 19:59:36', NULL, 1),
(233, 63, 'PEDRO COVA', '2015-10-20 19:59:36', NULL, 1),
(234, 64, 'CM. GUASIPATI', '2015-10-20 19:59:36', NULL, 1),
(235, 64, 'SALOM', '2015-10-20 19:59:36', NULL, 1),
(236, 65, 'CM. MARIPA', '2015-10-20 19:59:36', NULL, 1),
(237, 65, 'ARIPAO', '2015-10-20 19:59:36', NULL, 1),
(238, 65, 'LAS MAJADAS', '2015-10-20 19:59:36', NULL, 1),
(239, 65, 'MOITACO', '2015-10-20 19:59:36', NULL, 1),
(240, 65, 'GUARATARO', '2015-10-20 19:59:36', NULL, 1),
(241, 66, 'CM. TUMEREMO', '2015-10-20 19:59:36', NULL, 1),
(242, 66, 'DALLA COSTA', '2015-10-20 19:59:36', NULL, 1),
(243, 66, 'SAN ISIDRO', '2015-10-20 19:59:36', NULL, 1),
(244, 67, 'CM. CIUDAD PIAR', '2015-10-20 19:59:36', NULL, 1),
(245, 67, 'SAN FRANCISCO', '2015-10-20 19:59:36', NULL, 1),
(246, 67, 'BARCELONETA', '2015-10-20 19:59:36', NULL, 1),
(247, 67, 'SANTA BARBARA', '2015-10-20 19:59:36', NULL, 1),
(248, 68, 'CM. SANTA ELENA DE UAIREN', '2015-10-20 19:59:36', NULL, 1),
(249, 68, 'IKABARU', '2015-10-20 19:59:36', NULL, 1),
(250, 69, 'CM. EL CALLAO', '2015-10-20 19:59:36', NULL, 1),
(251, 70, 'CM. EL PALMAR', '2015-10-20 19:59:36', NULL, 1),
(252, 71, 'BEJUMA', '2015-10-20 19:59:36', NULL, 1),
(253, 71, 'CANOABO', '2015-10-20 19:59:36', NULL, 1),
(254, 71, 'SIMON BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(255, 72, 'GUIGUE', '2015-10-20 19:59:36', NULL, 1),
(256, 72, 'BELEN', '2015-10-20 19:59:36', NULL, 1),
(257, 72, 'TACARIGUA', '2015-10-20 19:59:36', NULL, 1),
(258, 73, 'MARIARA', '2015-10-20 19:59:36', NULL, 1),
(259, 73, 'AGUAS CALIENTES', '2015-10-20 19:59:36', NULL, 1),
(260, 74, 'GUACARA', '2015-10-20 19:59:36', NULL, 1),
(261, 74, 'CIUDAD ALIANZA', '2015-10-20 19:59:36', NULL, 1),
(262, 74, 'YAGUA', '2015-10-20 19:59:36', NULL, 1),
(263, 75, 'MONTALBAN', '2015-10-20 19:59:36', NULL, 1),
(264, 76, 'MORON', '2015-10-20 19:59:36', NULL, 1),
(265, 76, 'URAMA', '2015-10-20 19:59:36', NULL, 1),
(266, 77, 'DEMOCRACIA', '2015-10-20 19:59:36', NULL, 1),
(267, 77, 'FRATERNIDAD', '2015-10-20 19:59:36', NULL, 1),
(268, 77, 'GOAIGOAZA', '2015-10-20 19:59:36', NULL, 1),
(269, 77, 'JUAN JOSE FLORES', '2015-10-20 19:59:36', NULL, 1),
(270, 77, 'BARTOLOME SALOM', '2015-10-20 19:59:36', NULL, 1),
(271, 77, 'UNION', '2015-10-20 19:59:36', NULL, 1),
(272, 77, 'BORBURATA', '2015-10-20 19:59:36', NULL, 1),
(273, 77, 'PATANEMO', '2015-10-20 19:59:36', NULL, 1),
(274, 78, 'SAN JOAQUIN', '2015-10-20 19:59:36', NULL, 1),
(275, 79, 'CANDELARIA', '2015-10-20 19:59:36', NULL, 1),
(276, 79, 'CATEDRAL', '2015-10-20 19:59:36', NULL, 1),
(277, 79, 'EL SOCORRO', '2015-10-20 19:59:36', NULL, 1),
(278, 79, 'MIGUEL PEÑA', '2015-10-20 19:59:36', NULL, 1),
(279, 79, 'SAN BLAS', '2015-10-20 19:59:36', NULL, 1),
(280, 79, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(281, 79, 'SANTA ROSA', '2015-10-20 19:59:36', NULL, 1),
(282, 79, 'RAFAEL URDANETA', '2015-10-20 19:59:36', NULL, 1),
(283, 79, 'NEGRO PRIMERO', '2015-10-20 19:59:36', NULL, 1),
(284, 80, 'MIRANDA', '2015-10-20 19:59:36', NULL, 1),
(285, 81, 'U LOS GUAYOS', '2015-10-20 19:59:36', NULL, 1),
(286, 82, 'NAGUANAGUA', '2015-10-20 19:59:36', NULL, 1),
(287, 83, 'URB SAN DIEGO', '2015-10-20 19:59:36', NULL, 1),
(288, 84, 'U TOCUYITO', '2015-10-20 19:59:36', NULL, 1),
(289, 84, 'U INDEPENDENCIA', '2015-10-20 19:59:36', NULL, 1),
(290, 85, 'COJEDES', '2015-10-20 19:59:36', NULL, 1),
(291, 85, 'JUAN DE MATA SUAREZ', '2015-10-20 19:59:36', NULL, 1),
(292, 86, 'TINAQUILLO', '2015-10-20 19:59:36', NULL, 1),
(293, 87, 'EL BAUL', '2015-10-20 19:59:36', NULL, 1),
(294, 87, 'SUCRE', '2015-10-20 19:59:36', NULL, 1),
(295, 88, 'EL PAO', '2015-10-20 19:59:36', NULL, 1),
(296, 89, 'LIBERTAD DE COJEDES', '2015-10-20 19:59:36', NULL, 1),
(297, 89, 'EL AMPARO', '2015-10-20 19:59:36', NULL, 1),
(298, 90, 'SAN CARLOS DE AUSTRIA', '2015-10-20 19:59:36', NULL, 1),
(299, 90, 'JUAN ANGEL BRAVO', '2015-10-20 19:59:36', NULL, 1),
(300, 90, 'MANUEL MANRIQUE', '2015-10-20 19:59:36', NULL, 1),
(301, 91, 'GRL/JEFE JOSE L SILVA', '2015-10-20 19:59:36', NULL, 1),
(302, 92, 'MACAPO', '2015-10-20 19:59:36', NULL, 1),
(303, 92, 'LA AGUADITA', '2015-10-20 19:59:36', NULL, 1),
(304, 93, 'ROMULO GALLEGOS', '2015-10-20 19:59:36', NULL, 1),
(305, 94, 'SAN JUAN DE LOS CAYOS', '2015-10-20 19:59:36', NULL, 1),
(306, 94, 'CAPADARE', '2015-10-20 19:59:36', NULL, 1),
(307, 94, 'LA PASTORA', '2015-10-20 19:59:36', NULL, 1),
(308, 94, 'LIBERTADOR', '2015-10-20 19:59:36', NULL, 1),
(309, 95, 'SAN LUIS', '2015-10-20 19:59:36', NULL, 1),
(310, 95, 'ARACUA', '2015-10-20 19:59:36', NULL, 1),
(311, 95, 'LA PEÑA', '2015-10-20 19:59:36', NULL, 1),
(312, 96, 'CAPATARIDA', '2015-10-20 19:59:36', NULL, 1),
(313, 96, 'BOROJO', '2015-10-20 19:59:36', NULL, 1),
(314, 96, 'SEQUE', '2015-10-20 19:59:36', NULL, 1),
(315, 96, 'ZAZARIDA', '2015-10-20 19:59:36', NULL, 1),
(316, 96, 'BARIRO', '2015-10-20 19:59:36', NULL, 1),
(317, 96, 'GUAJIRO', '2015-10-20 19:59:36', NULL, 1),
(318, 97, 'NORTE', '2015-10-20 19:59:36', NULL, 1),
(319, 97, 'CARIRUBANA', '2015-10-20 19:59:36', NULL, 1),
(320, 97, 'PUNTA CARDON', '2015-10-20 19:59:36', NULL, 1),
(321, 97, 'SANTA ANA', '2015-10-20 19:59:36', NULL, 1),
(322, 98, 'LA VELA DE CORO', '2015-10-20 19:59:36', NULL, 1),
(323, 98, 'ACURIGUA', '2015-10-20 19:59:36', NULL, 1),
(324, 98, 'GUAIBACOA', '2015-10-20 19:59:36', NULL, 1),
(325, 98, 'MACORUCA', '2015-10-20 19:59:36', NULL, 1),
(326, 98, 'LAS CALDERAS', '2015-10-20 19:59:36', NULL, 1),
(327, 99, 'PEDREGAL', '2015-10-20 19:59:36', NULL, 1),
(328, 99, 'AGUA CLARA', '2015-10-20 19:59:36', NULL, 1),
(329, 99, 'AVARIA', '2015-10-20 19:59:36', NULL, 1),
(330, 99, 'PIEDRA GRANDE', '2015-10-20 19:59:36', NULL, 1),
(331, 99, 'PURURECHE', '2015-10-20 19:59:36', NULL, 1),
(332, 100, 'PUEBLO NUEVO', '2015-10-20 19:59:36', NULL, 1),
(333, 100, 'ADICORA', '2015-10-20 19:59:36', NULL, 1),
(334, 100, 'BARAIVED', '2015-10-20 19:59:36', NULL, 1),
(335, 100, 'BUENA VISTA', '2015-10-20 19:59:36', NULL, 1),
(336, 100, 'JADACAQUIVA', '2015-10-20 19:59:36', NULL, 1),
(337, 100, 'MORUY', '2015-10-20 19:59:36', NULL, 1),
(338, 100, 'EL VINCULO', '2015-10-20 19:59:36', NULL, 1),
(339, 100, 'EL HATO', '2015-10-20 19:59:36', NULL, 1),
(340, 100, 'ADAURE', '2015-10-20 19:59:36', NULL, 1),
(341, 101, 'CHURUGUARA', '2015-10-20 19:59:36', NULL, 1),
(342, 101, 'AGUA LARGA', '2015-10-20 19:59:36', NULL, 1),
(343, 101, 'INDEPENDENCIA', '2015-10-20 19:59:36', NULL, 1),
(344, 101, 'MAPARARI', '2015-10-20 19:59:36', NULL, 1),
(345, 101, 'EL PAUJI', '2015-10-20 19:59:36', NULL, 1),
(346, 102, 'MENE DE MAUROA', '2015-10-20 19:59:36', NULL, 1),
(347, 102, 'CASIGUA', '2015-10-20 19:59:36', NULL, 1),
(348, 102, 'SAN FELIX', '2015-10-20 19:59:36', NULL, 1),
(349, 103, 'SAN ANTONIO', '2015-10-20 19:59:36', NULL, 1),
(350, 103, 'SAN GABRIEL', '2015-10-20 19:59:36', NULL, 1),
(351, 103, 'SANTA ANA', '2015-10-20 19:59:36', NULL, 1),
(352, 103, 'GUZMAN GUILLERMO', '2015-10-20 19:59:36', NULL, 1),
(353, 103, 'MITARE', '2015-10-20 19:59:36', NULL, 1),
(354, 103, 'SABANETA', '2015-10-20 19:59:36', NULL, 1),
(355, 103, 'RIO SECO', '2015-10-20 19:59:36', NULL, 1),
(356, 104, 'CABURE', '2015-10-20 19:59:36', NULL, 1),
(357, 104, 'CURIMAGUA', '2015-10-20 19:59:36', NULL, 1),
(358, 104, 'COLINA', '2015-10-20 19:59:36', NULL, 1),
(359, 105, 'TUCACAS', '2015-10-20 19:59:36', NULL, 1),
(360, 105, 'BOCA DE AROA', '2015-10-20 19:59:36', NULL, 1),
(361, 106, 'PUERTO CUMAREBO', '2015-10-20 19:59:36', NULL, 1),
(362, 106, 'LA CIENAGA', '2015-10-20 19:59:36', NULL, 1),
(363, 106, 'LA SOLEDAD', '2015-10-20 19:59:36', NULL, 1),
(364, 106, 'PUEBLO CUMAREBO', '2015-10-20 19:59:36', NULL, 1),
(365, 106, 'ZAZARIDA', '2015-10-20 19:59:36', NULL, 1),
(366, 107, 'CM. DABAJURO', '2015-10-20 19:59:36', NULL, 1),
(367, 108, 'CHICHIRIVICHE', '2015-10-20 19:59:36', NULL, 1),
(368, 108, 'BOCA DE TOCUYO', '2015-10-20 19:59:36', NULL, 1),
(369, 108, 'TOCUYO DE LA COSTA', '2015-10-20 19:59:36', NULL, 1),
(370, 109, 'LOS TAQUES', '2015-10-20 19:59:36', NULL, 1),
(371, 109, 'JUDIBANA', '2015-10-20 19:59:36', NULL, 1),
(372, 110, 'PIRITU', '2015-10-20 19:59:36', NULL, 1),
(373, 110, 'SAN JOSE DE LA COSTA', '2015-10-20 19:59:36', NULL, 1),
(374, 111, 'STA.CRUZ DE BUCARAL', '2015-10-20 19:59:36', NULL, 1),
(375, 111, 'EL CHARAL', '2015-10-20 19:59:36', NULL, 1),
(376, 111, 'LAS VEGAS DEL TUY', '2015-10-20 19:59:36', NULL, 1),
(377, 112, 'CM. MIRIMIRE', '2015-10-20 19:59:36', NULL, 1),
(378, 113, 'JACURA', '2015-10-20 19:59:36', NULL, 1),
(379, 113, 'AGUA LINDA', '2015-10-20 19:59:36', NULL, 1),
(380, 113, 'ARAURIMA', '2015-10-20 19:59:36', NULL, 1),
(381, 114, 'CM. YARACAL', '2015-10-20 19:59:36', NULL, 1),
(382, 115, 'CM. PALMA SOLA', '2015-10-20 19:59:36', NULL, 1),
(383, 116, 'SUCRE', '2015-10-20 19:59:36', NULL, 1),
(384, 116, 'PECAYA', '2015-10-20 19:59:36', NULL, 1),
(385, 117, 'URUMACO', '2015-10-20 19:59:36', NULL, 1),
(386, 117, 'BRUZUAL', '2015-10-20 19:59:36', NULL, 1),
(387, 118, 'CM. TOCOPERO', '2015-10-20 19:59:36', NULL, 1),
(388, 119, 'VALLE DE LA PASCUA', '2015-10-20 19:59:36', NULL, 1),
(389, 119, 'ESPINO', '2015-10-20 19:59:36', NULL, 1),
(390, 120, 'EL SOMBRERO', '2015-10-20 19:59:36', NULL, 1),
(391, 120, 'SOSA', '2015-10-20 19:59:36', NULL, 1),
(392, 121, 'CALABOZO', '2015-10-20 19:59:36', NULL, 1),
(393, 121, 'EL CALVARIO', '2015-10-20 19:59:36', NULL, 1),
(394, 121, 'EL RASTRO', '2015-10-20 19:59:36', NULL, 1),
(395, 121, 'GUARDATINAJAS', '2015-10-20 19:59:36', NULL, 1),
(396, 122, 'ALTAGRACIA DE ORITUCO', '2015-10-20 19:59:36', NULL, 1),
(397, 122, 'LEZAMA', '2015-10-20 19:59:36', NULL, 1),
(398, 122, 'LIBERTAD DE ORITUCO', '2015-10-20 19:59:36', NULL, 1),
(399, 122, 'SAN FCO DE MACAIRA', '2015-10-20 19:59:36', NULL, 1),
(400, 122, 'SAN RAFAEL DE ORITUCO', '2015-10-20 19:59:36', NULL, 1),
(401, 122, 'SOUBLETTE', '2015-10-20 19:59:36', NULL, 1),
(402, 122, 'PASO REAL DE MACAIRA', '2015-10-20 19:59:36', NULL, 1),
(403, 123, 'TUCUPIDO', '2015-10-20 19:59:36', NULL, 1),
(404, 123, 'SAN RAFAEL DE LAYA', '2015-10-20 19:59:36', NULL, 1),
(405, 124, 'SAN JUAN DE LOS MORROS', '2015-10-20 19:59:36', NULL, 1),
(406, 124, 'PARAPARA', '2015-10-20 19:59:36', NULL, 1),
(407, 124, 'CANTAGALLO', '2015-10-20 19:59:36', NULL, 1),
(408, 125, 'ZARAZA', '2015-10-20 19:59:36', NULL, 1),
(409, 125, 'SAN JOSE DE UNARE', '2015-10-20 19:59:36', NULL, 1),
(410, 126, 'CAMAGUAN', '2015-10-20 19:59:36', NULL, 1),
(411, 126, 'PUERTO MIRANDA', '2015-10-20 19:59:36', NULL, 1),
(412, 126, 'UVERITO', '2015-10-20 19:59:36', NULL, 1),
(413, 127, 'SAN JOSE DE GUARIBE', '2015-10-20 19:59:36', NULL, 1),
(414, 128, 'LAS MERCEDES', '2015-10-20 19:59:36', NULL, 1),
(415, 128, 'STA RITA DE MANAPIRE', '2015-10-20 19:59:36', NULL, 1),
(416, 128, 'CABRUTA', '2015-10-20 19:59:36', NULL, 1),
(417, 129, 'EL SOCORRO', '2015-10-20 19:59:36', NULL, 1),
(418, 130, 'ORTIZ', '2015-10-20 19:59:36', NULL, 1),
(419, 130, 'SAN FCO. DE TIZNADOS', '2015-10-20 19:59:36', NULL, 1),
(420, 130, 'SAN JOSE DE TIZNADOS', '2015-10-20 19:59:36', NULL, 1),
(421, 130, 'S LORENZO DE TIZNADOS', '2015-10-20 19:59:36', NULL, 1),
(422, 131, 'SANTA MARIA DE IPIRE', '2015-10-20 19:59:36', NULL, 1),
(423, 131, 'ALTAMIRA', '2015-10-20 19:59:36', NULL, 1),
(424, 132, 'CHAGUARAMAS', '2015-10-20 19:59:36', NULL, 1),
(425, 133, 'GUAYABAL', '2015-10-20 19:59:36', NULL, 1),
(426, 133, 'CAZORLA', '2015-10-20 19:59:36', NULL, 1),
(427, 134, 'FREITEZ', '2015-10-20 19:59:36', NULL, 1),
(428, 134, 'JOSE MARIA BLANCO', '2015-10-20 19:59:36', NULL, 1),
(429, 135, 'CATEDRAL', '2015-10-20 19:59:36', NULL, 1),
(430, 135, 'LA CONCEPCION', '2015-10-20 19:59:36', NULL, 1),
(431, 135, 'SANTA ROSA', '2015-10-20 19:59:36', NULL, 1),
(432, 135, 'UNION', '2015-10-20 19:59:36', NULL, 1),
(433, 135, 'EL CUJI', '2015-10-20 19:59:36', NULL, 1),
(434, 135, 'TAMACA', '2015-10-20 19:59:36', NULL, 1),
(435, 135, 'JUAN DE VILLEGAS', '2015-10-20 19:59:36', NULL, 1),
(436, 135, 'AGUEDO F. ALVARADO', '2015-10-20 19:59:36', NULL, 1),
(437, 135, 'BUENA VISTA', '2015-10-20 19:59:36', NULL, 1),
(438, 135, 'JUAREZ', '2015-10-20 19:59:36', NULL, 1),
(439, 136, 'JUAN B RODRIGUEZ', '2015-10-20 19:59:36', NULL, 1),
(440, 136, 'DIEGO DE LOZADA', '2015-10-20 19:59:36', NULL, 1),
(441, 136, 'SAN MIGUEL', '2015-10-20 19:59:36', NULL, 1),
(442, 136, 'CUARA', '2015-10-20 19:59:36', NULL, 1),
(443, 136, 'PARAISO DE SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(444, 136, 'TINTORERO', '2015-10-20 19:59:36', NULL, 1),
(445, 136, 'JOSE BERNARDO DORANTE', '2015-10-20 19:59:36', NULL, 1),
(446, 136, 'CRNEL. MARIANO PERAZA', '2015-10-20 19:59:36', NULL, 1),
(447, 137, 'BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(448, 137, 'ANZOATEGUI', '2015-10-20 19:59:36', NULL, 1),
(449, 137, 'GUARICO', '2015-10-20 19:59:36', NULL, 1),
(450, 137, 'HUMOCARO ALTO', '2015-10-20 19:59:36', NULL, 1),
(451, 137, 'HUMOCARO BAJO', '2015-10-20 19:59:36', NULL, 1),
(452, 137, 'MORAN', '2015-10-20 19:59:36', NULL, 1),
(453, 137, 'HILARIO LUNA Y LUNA', '2015-10-20 19:59:36', NULL, 1),
(454, 137, 'LA CANDELARIA', '2015-10-20 19:59:36', NULL, 1),
(455, 138, 'CABUDARE', '2015-10-20 19:59:36', NULL, 1),
(456, 138, 'JOSE G. BASTIDAS', '2015-10-20 19:59:36', NULL, 1),
(457, 138, 'AGUA VIVA', '2015-10-20 19:59:36', NULL, 1),
(458, 139, 'TRINIDAD SAMUEL', '2015-10-20 19:59:36', NULL, 1),
(459, 139, 'ANTONIO DIAZ', '2015-10-20 19:59:36', NULL, 1),
(460, 139, 'CAMACARO', '2015-10-20 19:59:36', NULL, 1),
(461, 139, 'CASTAÑEDA', '2015-10-20 19:59:36', NULL, 1),
(462, 139, 'CHIQUINQUIRA', '2015-10-20 19:59:36', NULL, 1),
(463, 139, 'ESPINOZA LOS MONTEROS', '2015-10-20 19:59:36', NULL, 1),
(464, 139, 'LARA', '2015-10-20 19:59:36', NULL, 1),
(465, 139, 'MANUEL MORILLO', '2015-10-20 19:59:36', NULL, 1),
(466, 139, 'MONTES DE OCA', '2015-10-20 19:59:36', NULL, 1),
(467, 139, 'TORRES', '2015-10-20 19:59:36', NULL, 1),
(468, 139, 'EL BLANCO', '2015-10-20 19:59:36', NULL, 1),
(469, 139, 'MONTA A VERDE', '2015-10-20 19:59:36', NULL, 1),
(470, 139, 'HERIBERTO ARROYO', '2015-10-20 19:59:36', NULL, 1),
(471, 139, 'LAS MERCEDES', '2015-10-20 19:59:36', NULL, 1),
(472, 139, 'CECILIO ZUBILLAGA', '2015-10-20 19:59:36', NULL, 1),
(473, 139, 'REYES VARGAS', '2015-10-20 19:59:36', NULL, 1),
(474, 139, 'ALTAGRACIA', '2015-10-20 19:59:36', NULL, 1),
(475, 140, 'SIQUISIQUE', '2015-10-20 19:59:36', NULL, 1),
(476, 140, 'SAN MIGUEL', '2015-10-20 19:59:36', NULL, 1),
(477, 140, 'XAGUAS', '2015-10-20 19:59:36', NULL, 1),
(478, 140, 'MOROTURO', '2015-10-20 19:59:36', NULL, 1),
(479, 141, 'PIO TAMAYO', '2015-10-20 19:59:36', NULL, 1),
(480, 141, 'YACAMBU', '2015-10-20 19:59:36', NULL, 1),
(481, 141, 'QBDA. HONDA DE GUACHE', '2015-10-20 19:59:36', NULL, 1),
(482, 142, 'SARARE', '2015-10-20 19:59:36', NULL, 1),
(483, 142, 'GUSTAVO VEGAS LEON', '2015-10-20 19:59:36', NULL, 1),
(484, 142, 'BURIA', '2015-10-20 19:59:36', NULL, 1),
(485, 143, 'GABRIEL PICON G.', '2015-10-20 19:59:36', NULL, 1),
(486, 143, 'HECTOR AMABLE MORA', '2015-10-20 19:59:36', NULL, 1),
(487, 143, 'JOSE NUCETE SARDI', '2015-10-20 19:59:36', NULL, 1),
(488, 143, 'PULIDO MENDEZ', '2015-10-20 19:59:36', NULL, 1),
(489, 143, 'PTE. ROMULO GALLEGOS', '2015-10-20 19:59:36', NULL, 1),
(490, 143, 'PRESIDENTE BETANCOURT', '2015-10-20 19:59:36', NULL, 1),
(491, 143, 'PRESIDENTE PAEZ', '2015-10-20 19:59:36', NULL, 1),
(492, 144, 'CM. LA AZULITA', '2015-10-20 19:59:36', NULL, 1),
(493, 145, 'CM. CANAGUA', '2015-10-20 19:59:36', NULL, 1),
(494, 145, 'CAPURI', '2015-10-20 19:59:36', NULL, 1),
(495, 145, 'CHACANTA', '2015-10-20 19:59:36', NULL, 1),
(496, 145, 'EL MOLINO', '2015-10-20 19:59:36', NULL, 1),
(497, 145, 'GUAIMARAL', '2015-10-20 19:59:36', NULL, 1),
(498, 145, 'MUCUTUY', '2015-10-20 19:59:36', NULL, 1),
(499, 145, 'MUCUCHACHI', '2015-10-20 19:59:36', NULL, 1),
(500, 146, 'ACEQUIAS', '2015-10-20 19:59:36', NULL, 1),
(501, 146, 'JAJI', '2015-10-20 19:59:36', NULL, 1),
(502, 146, 'LA MESA', '2015-10-20 19:59:36', NULL, 1),
(503, 146, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(504, 146, 'MONTALBAN', '2015-10-20 19:59:36', NULL, 1),
(505, 146, 'MATRIZ', '2015-10-20 19:59:36', NULL, 1),
(506, 146, 'FERNANDEZ PEÑA', '2015-10-20 19:59:36', NULL, 1),
(507, 147, 'CM. GUARAQUE', '2015-10-20 19:59:36', NULL, 1),
(508, 147, 'MESA DE QUINTERO', '2015-10-20 19:59:36', NULL, 1),
(509, 147, 'RIO NEGRO', '2015-10-20 19:59:36', NULL, 1),
(510, 148, 'CM. ARAPUEY', '2015-10-20 19:59:36', NULL, 1),
(511, 148, 'PALMIRA', '2015-10-20 19:59:36', NULL, 1),
(512, 149, 'CM. TORONDOY', '2015-10-20 19:59:36', NULL, 1),
(513, 149, 'SAN CRISTOBAL DE T', '2015-10-20 19:59:36', NULL, 1),
(514, 150, 'ARIAS', '2015-10-20 19:59:36', NULL, 1),
(515, 150, 'SAGRARIO', '2015-10-20 19:59:36', NULL, 1),
(516, 150, 'MILLA', '2015-10-20 19:59:36', NULL, 1),
(517, 150, 'EL LLANO', '2015-10-20 19:59:36', NULL, 1),
(518, 150, 'JUAN RODRIGUEZ SUAREZ', '2015-10-20 19:59:36', NULL, 1),
(519, 150, 'JACINTO PLAZA', '2015-10-20 19:59:36', NULL, 1),
(520, 150, 'DOMINGO PEÑA', '2015-10-20 19:59:36', NULL, 1),
(521, 150, 'GONZALO PICON FEBRES', '2015-10-20 19:59:36', NULL, 1),
(522, 150, 'OSUNA RODRIGUEZ', '2015-10-20 19:59:36', NULL, 1),
(523, 150, 'LASSO DE LA VEGA', '2015-10-20 19:59:36', NULL, 1),
(524, 150, 'CARACCIOLO PARRA P', '2015-10-20 19:59:36', NULL, 1),
(525, 150, 'MARIANO PICON SALAS', '2015-10-20 19:59:36', NULL, 1),
(526, 150, 'ANTONIO SPINETTI DINI', '2015-10-20 19:59:36', NULL, 1),
(527, 150, 'EL MORRO', '2015-10-20 19:59:36', NULL, 1),
(528, 150, 'LOS NEVADOS', '2015-10-20 19:59:36', NULL, 1),
(529, 151, 'CM. TABAY', '2015-10-20 19:59:36', NULL, 1),
(530, 152, 'CM. TIMOTES', '2015-10-20 19:59:36', NULL, 1),
(531, 152, 'ANDRES ELOY BLANCO', '2015-10-20 19:59:36', NULL, 1),
(532, 152, 'PIÑANGO', '2015-10-20 19:59:36', NULL, 1),
(533, 152, 'LA VENTA', '2015-10-20 19:59:36', NULL, 1),
(534, 153, 'CM. STA CRUZ DE MORA', '2015-10-20 19:59:36', NULL, 1),
(535, 153, 'MESA BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(536, 153, 'MESA DE LAS PALMAS', '2015-10-20 19:59:36', NULL, 1),
(537, 154, 'CM. STA ELENA DE ARENALES', '2015-10-20 19:59:36', NULL, 1),
(538, 154, 'ELOY PAREDES', '2015-10-20 19:59:36', NULL, 1),
(539, 154, 'PQ R DE ALCAZAR', '2015-10-20 19:59:36', NULL, 1),
(540, 155, 'CM. TUCANI', '2015-10-20 19:59:36', NULL, 1),
(541, 155, 'FLORENCIO RAMIREZ', '2015-10-20 19:59:36', NULL, 1),
(542, 156, 'CM. SANTO DOMINGO', '2015-10-20 19:59:36', NULL, 1),
(543, 156, 'LAS PIEDRAS', '2015-10-20 19:59:36', NULL, 1),
(544, 157, 'CM. PUEBLO LLANO', '2015-10-20 19:59:36', NULL, 1),
(545, 158, 'CM. MUCUCHIES', '2015-10-20 19:59:36', NULL, 1),
(546, 158, 'MUCURUBA', '2015-10-20 19:59:36', NULL, 1),
(547, 158, 'SAN RAFAEL', '2015-10-20 19:59:36', NULL, 1),
(548, 158, 'CACUTE', '2015-10-20 19:59:36', NULL, 1),
(549, 158, 'LA TOMA', '2015-10-20 19:59:36', NULL, 1),
(550, 159, 'CM. BAILADORES', '2015-10-20 19:59:36', NULL, 1),
(551, 159, 'GERONIMO MALDONADO', '2015-10-20 19:59:36', NULL, 1),
(552, 160, 'CM. LAGUNILLAS', '2015-10-20 19:59:36', NULL, 1),
(553, 160, 'CHIGUARA', '2015-10-20 19:59:36', NULL, 1),
(554, 160, 'ESTANQUES', '2015-10-20 19:59:36', NULL, 1),
(555, 160, 'SAN JUAN', '2015-10-20 19:59:36', NULL, 1),
(556, 160, 'PUEBLO NUEVO DEL SUR', '2015-10-20 19:59:36', NULL, 1),
(557, 160, 'LA TRAMPA', '2015-10-20 19:59:36', NULL, 1),
(558, 161, 'EL LLANO', '2015-10-20 19:59:36', NULL, 1),
(559, 161, 'TOVAR', '2015-10-20 19:59:36', NULL, 1),
(560, 161, 'EL AMPARO', '2015-10-20 19:59:36', NULL, 1),
(561, 161, 'SAN FRANCISCO', '2015-10-20 19:59:36', NULL, 1),
(562, 162, 'CM. NUEVA BOLIVIA', '2015-10-20 19:59:36', NULL, 1),
(563, 162, 'INDEPENDENCIA', '2015-10-20 19:59:36', NULL, 1),
(564, 162, 'MARIA C PALACIOS', '2015-10-20 19:59:36', NULL, 1),
(565, 162, 'SANTA APOLONIA', '2015-10-20 19:59:36', NULL, 1),
(566, 163, 'CM. STA MARIA DE CAPARO', '2015-10-20 19:59:36', NULL, 1),
(567, 164, 'CM. ARICAGUA', '2015-10-20 19:59:36', NULL, 1),
(568, 164, 'SAN ANTONIO', '2015-10-20 19:59:36', NULL, 1),
(569, 165, 'CM. ZEA', '2015-10-20 19:59:36', NULL, 1),
(570, 165, 'CAÑO EL TIGRE', '2015-10-20 19:59:36', NULL, 1),
(571, 166, 'CAUCAGUA', '2015-10-20 19:59:36', NULL, 1),
(572, 166, 'ARAGUITA', '2015-10-20 19:59:36', NULL, 1),
(573, 166, 'AREVALO GONZALEZ', '2015-10-20 19:59:36', NULL, 1),
(574, 166, 'CAPAYA', '2015-10-20 19:59:36', NULL, 1),
(575, 166, 'PANAQUIRE', '2015-10-20 19:59:36', NULL, 1),
(576, 166, 'RIBAS', '2015-10-20 19:59:36', NULL, 1),
(577, 166, 'EL CAFE', '2015-10-20 19:59:36', NULL, 1),
(578, 166, 'MARIZAPA', '2015-10-20 19:59:36', NULL, 1),
(579, 167, 'HIGUEROTE', '2015-10-20 19:59:36', NULL, 1),
(580, 167, 'CURIEPE', '2015-10-20 19:59:36', NULL, 1),
(581, 167, 'TACARIGUA', '2015-10-20 19:59:36', NULL, 1),
(582, 168, 'LOS TEQUES', '2015-10-20 19:59:36', NULL, 1),
(583, 168, 'CECILIO ACOSTA', '2015-10-20 19:59:36', NULL, 1),
(584, 168, 'PARACOTOS', '2015-10-20 19:59:36', NULL, 1),
(585, 168, 'SAN PEDRO', '2015-10-20 19:59:36', NULL, 1),
(586, 168, 'TACATA', '2015-10-20 19:59:36', NULL, 1),
(587, 168, 'EL JARILLO', '2015-10-20 19:59:36', NULL, 1),
(588, 168, 'ALTAGRACIA DE LA M', '2015-10-20 19:59:36', NULL, 1),
(589, 169, 'STA TERESA DEL TUY', '2015-10-20 19:59:36', NULL, 1),
(590, 169, 'EL CARTANAL', '2015-10-20 19:59:36', NULL, 1),
(591, 170, 'OCUMARE DEL TUY', '2015-10-20 19:59:36', NULL, 1),
(592, 170, 'LA DEMOCRACIA', '2015-10-20 19:59:36', NULL, 1),
(593, 170, 'SANTA BARBARA', '2015-10-20 19:59:36', NULL, 1),
(594, 171, 'RIO CHICO', '2015-10-20 19:59:36', NULL, 1),
(595, 171, 'EL GUAPO', '2015-10-20 19:59:36', NULL, 1),
(596, 171, 'TACARIGUA DE LA LAGUNA', '2015-10-20 19:59:36', NULL, 1),
(597, 171, 'PAPARO', '2015-10-20 19:59:36', NULL, 1),
(598, 171, 'SN FERNANDO DEL GUAPO', '2015-10-20 19:59:36', NULL, 1),
(599, 172, 'SANTA LUCIA', '2015-10-20 19:59:36', NULL, 1),
(600, 173, 'GUARENAS', '2015-10-20 19:59:36', NULL, 1),
(601, 174, 'PETARE', '2015-10-20 19:59:36', NULL, 1),
(602, 174, 'LEONCIO MARTINEZ', '2015-10-20 19:59:36', NULL, 1),
(603, 174, 'CAUCAGUITA', '2015-10-20 19:59:36', NULL, 1),
(604, 174, 'FILAS DE MARICHES', '2015-10-20 19:59:36', NULL, 1),
(605, 174, 'LA DOLORITA', '2015-10-20 19:59:36', NULL, 1),
(606, 175, 'CUA', '2015-10-20 19:59:36', NULL, 1),
(607, 175, 'NUEVA CUA', '2015-10-20 19:59:36', NULL, 1),
(608, 176, 'GUATIRE', '2015-10-20 19:59:36', NULL, 1),
(609, 176, 'BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(610, 177, 'CHARALLAVE', '2015-10-20 19:59:36', NULL, 1),
(611, 177, 'LAS BRISAS', '2015-10-20 19:59:36', NULL, 1),
(612, 178, 'SAN ANTONIO LOS ALTOS', '2015-10-20 19:59:36', NULL, 1),
(613, 179, 'SAN JOSE DE BARLOVENTO', '2015-10-20 19:59:36', NULL, 1),
(614, 179, 'CUMBO', '2015-10-20 19:59:36', NULL, 1),
(615, 180, 'SAN FCO DE YARE', '2015-10-20 19:59:36', NULL, 1),
(616, 180, 'S ANTONIO DE YARE', '2015-10-20 19:59:36', NULL, 1),
(617, 181, 'BARUTA', '2015-10-20 19:59:36', NULL, 1),
(618, 181, 'EL CAFETAL', '2015-10-20 19:59:36', NULL, 1),
(619, 181, 'LAS MINAS DE BARUTA', '2015-10-20 19:59:36', NULL, 1),
(620, 182, 'CARRIZAL', '2015-10-20 19:59:36', NULL, 1),
(621, 183, 'CHACAO', '2015-10-20 19:59:36', NULL, 1),
(622, 184, 'EL HATILLO', '2015-10-20 19:59:36', NULL, 1),
(623, 185, 'MAMPORAL', '2015-10-20 19:59:36', NULL, 1),
(624, 186, 'CUPIRA', '2015-10-20 19:59:36', NULL, 1),
(625, 186, 'MACHURUCUTO', '2015-10-20 19:59:36', NULL, 1),
(626, 187, 'CM. SAN ANTONIO', '2015-10-20 19:59:36', NULL, 1),
(627, 187, 'SAN FRANCISCO', '2015-10-20 19:59:36', NULL, 1),
(628, 188, 'CM. CARIPITO', '2015-10-20 19:59:36', NULL, 1),
(629, 189, 'CM. CARIPE', '2015-10-20 19:59:36', NULL, 1),
(630, 189, 'TERESEN', '2015-10-20 19:59:36', NULL, 1),
(631, 189, 'EL GUACHARO', '2015-10-20 19:59:36', NULL, 1),
(632, 189, 'SAN AGUSTIN', '2015-10-20 19:59:36', NULL, 1),
(633, 189, 'LA GUANOTA', '2015-10-20 19:59:36', NULL, 1),
(634, 189, 'SABANA DE PIEDRA', '2015-10-20 19:59:36', NULL, 1),
(635, 190, 'CM. CAICARA', '2015-10-20 19:59:36', NULL, 1),
(636, 190, 'AREO', '2015-10-20 19:59:36', NULL, 1),
(637, 190, 'SAN FELIX', '2015-10-20 19:59:36', NULL, 1),
(638, 190, 'VIENTO FRESCO', '2015-10-20 19:59:36', NULL, 1),
(639, 191, 'CM. PUNTA DE MATA', '2015-10-20 19:59:36', NULL, 1),
(640, 191, 'EL TEJERO', '2015-10-20 19:59:36', NULL, 1),
(641, 192, 'CM. TEMBLADOR', '2015-10-20 19:59:36', NULL, 1),
(642, 192, 'TABASCA', '2015-10-20 19:59:36', NULL, 1),
(643, 192, 'LAS ALHUACAS', '2015-10-20 19:59:36', NULL, 1),
(644, 192, 'CHAGUARAMAS', '2015-10-20 19:59:36', NULL, 1),
(645, 193, 'EL FURRIAL', '2015-10-20 19:59:36', NULL, 1),
(646, 193, 'JUSEPIN', '2015-10-20 19:59:36', NULL, 1),
(647, 193, 'EL COROZO', '2015-10-20 19:59:36', NULL, 1),
(648, 193, 'SAN VICENTE', '2015-10-20 19:59:36', NULL, 1),
(649, 193, 'LA PICA', '2015-10-20 19:59:36', NULL, 1),
(650, 193, 'ALTO DE LOS GODOS', '2015-10-20 19:59:36', NULL, 1),
(651, 193, 'BOQUERON', '2015-10-20 19:59:36', NULL, 1),
(652, 193, 'LAS COCUIZAS', '2015-10-20 19:59:36', NULL, 1),
(653, 193, 'SANTA CRUZ', '2015-10-20 19:59:36', NULL, 1),
(654, 193, 'SAN SIMON', '2015-10-20 19:59:36', NULL, 1),
(655, 194, 'CM. ARAGUA', '2015-10-20 19:59:36', NULL, 1),
(656, 194, 'CHAGUARAMAL', '2015-10-20 19:59:36', NULL, 1),
(657, 194, 'GUANAGUANA', '2015-10-20 19:59:36', NULL, 1),
(658, 194, 'APARICIO', '2015-10-20 19:59:36', NULL, 1),
(659, 194, 'TAGUAYA', '2015-10-20 19:59:36', NULL, 1),
(660, 194, 'EL PINTO', '2015-10-20 19:59:36', NULL, 1),
(661, 194, 'LA TOSCANA', '2015-10-20 19:59:36', NULL, 1),
(662, 195, 'CM. QUIRIQUIRE', '2015-10-20 19:59:36', NULL, 1),
(663, 195, 'CACHIPO', '2015-10-20 19:59:36', NULL, 1),
(664, 196, 'CM. BARRANCAS', '2015-10-20 19:59:36', NULL, 1),
(665, 196, 'LOS BARRANCOS DE FAJARDO', '2015-10-20 19:59:36', NULL, 1),
(666, 197, 'CM. AGUASAY', '2015-10-20 19:59:36', NULL, 1),
(667, 198, 'CM. SANTA BARBARA', '2015-10-20 19:59:36', NULL, 1),
(668, 199, 'CM. URACOA', '2015-10-20 19:59:36', NULL, 1),
(669, 200, 'CM. LA ASUNCION', '2015-10-20 19:59:36', NULL, 1),
(670, 201, 'CM. SAN JUAN BAUTISTA', '2015-10-20 19:59:36', NULL, 1),
(671, 201, 'ZABALA', '2015-10-20 19:59:36', NULL, 1),
(672, 202, 'CM. SANTA ANA', '2015-10-20 19:59:36', NULL, 1),
(673, 202, 'GUEVARA', '2015-10-20 19:59:36', NULL, 1),
(674, 202, 'MATASIETE', '2015-10-20 19:59:36', NULL, 1),
(675, 202, 'BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(676, 202, 'SUCRE', '2015-10-20 19:59:36', NULL, 1),
(677, 203, 'CM. PAMPATAR', '2015-10-20 19:59:36', NULL, 1),
(678, 203, 'AGUIRRE', '2015-10-20 19:59:36', NULL, 1),
(679, 204, 'CM. JUAN GRIEGO', '2015-10-20 19:59:36', NULL, 1),
(680, 204, 'ADRIAN', '2015-10-20 19:59:36', NULL, 1),
(681, 205, 'CM. PORLAMAR', '2015-10-20 19:59:36', NULL, 1),
(682, 206, 'CM. BOCA DEL RIO', '2015-10-20 19:59:36', NULL, 1),
(683, 206, 'SAN FRANCISCO', '2015-10-20 19:59:36', NULL, 1),
(684, 207, 'CM. SAN PEDRO DE COCHE', '2015-10-20 19:59:36', NULL, 1),
(685, 207, 'VICENTE FUENTES', '2015-10-20 19:59:36', NULL, 1),
(686, 208, 'CM. PUNTA DE PIEDRAS', '2015-10-20 19:59:36', NULL, 1),
(687, 208, 'LOS BARALES', '2015-10-20 19:59:36', NULL, 1),
(688, 209, 'CM.LA PLAZA DE PARAGUACHI', '2015-10-20 19:59:36', NULL, 1),
(689, 210, 'CM. VALLE ESP SANTO', '2015-10-20 19:59:36', NULL, 1),
(690, 210, 'FRANCISCO FAJARDO', '2015-10-20 19:59:36', NULL, 1),
(691, 211, 'CM. ARAURE', '2015-10-20 19:59:36', NULL, 1),
(692, 211, 'RIO ACARIGUA', '2015-10-20 19:59:36', NULL, 1),
(693, 212, 'CM. PIRITU', '2015-10-20 19:59:36', NULL, 1),
(694, 212, 'UVERAL', '2015-10-20 19:59:36', NULL, 1),
(695, 213, 'CM. GUANARE', '2015-10-20 19:59:36', NULL, 1),
(696, 213, 'CORDOBA', '2015-10-20 19:59:36', NULL, 1),
(697, 213, 'SAN JUAN GUANAGUANARE', '2015-10-20 19:59:36', NULL, 1),
(698, 213, 'VIRGEN DE LA COROMOTO', '2015-10-20 19:59:36', NULL, 1),
(699, 213, 'SAN JOSE DE LA MONTAÑA', '2015-10-20 19:59:36', NULL, 1),
(700, 214, 'CM. GUANARITO', '2015-10-20 19:59:36', NULL, 1),
(701, 214, 'TRINIDAD DE LA CAPILLA', '2015-10-20 19:59:36', NULL, 1),
(702, 214, 'DIVINA PASTORA', '2015-10-20 19:59:36', NULL, 1),
(703, 215, 'CM. OSPINO', '2015-10-20 19:59:36', NULL, 1),
(704, 215, 'APARICION', '2015-10-20 19:59:36', NULL, 1),
(705, 215, 'LA ESTACION', '2015-10-20 19:59:36', NULL, 1),
(706, 216, 'CM. ACARIGUA', '2015-10-20 19:59:36', NULL, 1),
(707, 216, 'PAYARA', '2015-10-20 19:59:36', NULL, 1),
(708, 216, 'PIMPINELA', '2015-10-20 19:59:36', NULL, 1),
(709, 216, 'RAMON PERAZA', '2015-10-20 19:59:36', NULL, 1),
(710, 217, 'CM. BISCUCUY', '2015-10-20 19:59:36', NULL, 1),
(711, 217, 'CONCEPCION', '2015-10-20 19:59:36', NULL, 1),
(712, 217, 'SAN RAFAEL PALO ALZADO', '2015-10-20 19:59:36', NULL, 1),
(713, 217, 'UVENCIO A VELASQUEZ', '2015-10-20 19:59:36', NULL, 1),
(714, 217, 'SAN JOSE DE SAGUAZ', '2015-10-20 19:59:36', NULL, 1),
(715, 217, 'VILLA ROSA', '2015-10-20 19:59:36', NULL, 1),
(716, 218, 'CM. VILLA BRUZUAL', '2015-10-20 19:59:36', NULL, 1),
(717, 218, 'CANELONES', '2015-10-20 19:59:36', NULL, 1),
(718, 218, 'SANTA CRUZ', '2015-10-20 19:59:36', NULL, 1),
(719, 218, 'SAN ISIDRO LABRADOR', '2015-10-20 19:59:36', NULL, 1),
(720, 219, 'CM. CHABASQUEN', '2015-10-20 19:59:36', NULL, 1),
(721, 219, 'PEÑA BLANCA', '2015-10-20 19:59:36', NULL, 1),
(722, 220, 'CM. AGUA BLANCA', '2015-10-20 19:59:36', NULL, 1),
(723, 221, 'CM. PAPELON', '2015-10-20 19:59:36', NULL, 1),
(724, 221, 'CAÑO DELGADITO', '2015-10-20 19:59:36', NULL, 1),
(725, 222, 'CM. BOCONOITO', '2015-10-20 19:59:36', NULL, 1),
(726, 222, 'ANTOLIN TOVAR AQUINO', '2015-10-20 19:59:36', NULL, 1),
(727, 223, 'CM. SAN RAFAEL DE ONOTO', '2015-10-20 19:59:36', NULL, 1),
(728, 223, 'SANTA FE', '2015-10-20 19:59:36', NULL, 1),
(729, 223, 'THERMO MORLES', '2015-10-20 19:59:36', NULL, 1),
(730, 224, 'CM. EL PLAYON', '2015-10-20 19:59:36', NULL, 1),
(731, 224, 'FLORIDA', '2015-10-20 19:59:36', NULL, 1),
(732, 225, 'RIO CARIBE', '2015-10-20 19:59:36', NULL, 1),
(733, 225, 'SAN JUAN GALDONAS', '2015-10-20 19:59:36', NULL, 1),
(734, 225, 'PUERTO SANTO', '2015-10-20 19:59:36', NULL, 1),
(735, 225, 'EL MORRO DE PTO SANTO', '2015-10-20 19:59:36', NULL, 1),
(736, 225, 'ANTONIO JOSE DE SUCRE', '2015-10-20 19:59:36', NULL, 1),
(737, 226, 'EL PILAR', '2015-10-20 19:59:36', NULL, 1),
(738, 226, 'EL RINCON', '2015-10-20 19:59:36', NULL, 1),
(739, 226, 'GUARAUNOS', '2015-10-20 19:59:36', NULL, 1),
(740, 226, 'TUNAPUICITO', '2015-10-20 19:59:36', NULL, 1),
(741, 226, 'UNION', '2015-10-20 19:59:36', NULL, 1),
(742, 226, 'GRAL FCO. A VASQUEZ', '2015-10-20 19:59:36', NULL, 1),
(743, 227, 'SANTA CATALINA', '2015-10-20 19:59:36', NULL, 1),
(744, 227, 'SANTA ROSA', '2015-10-20 19:59:36', NULL, 1),
(745, 227, 'SANTA TERESA', '2015-10-20 19:59:36', NULL, 1),
(746, 227, 'BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(747, 227, 'MACARAPANA', '2015-10-20 19:59:36', NULL, 1),
(748, 228, 'YAGUARAPARO', '2015-10-20 19:59:36', NULL, 1),
(749, 228, 'LIBERTAD', '2015-10-20 19:59:36', NULL, 1),
(750, 228, 'PAUJIL', '2015-10-20 19:59:36', NULL, 1),
(751, 229, 'IRAPA', '2015-10-20 19:59:36', NULL, 1),
(752, 229, 'CAMPO CLARO', '2015-10-20 19:59:36', NULL, 1),
(753, 229, 'SORO', '2015-10-20 19:59:36', NULL, 1),
(754, 229, 'SAN ANTONIO DE IRAPA', '2015-10-20 19:59:36', NULL, 1),
(755, 229, 'MARABAL', '2015-10-20 19:59:36', NULL, 1),
(756, 230, 'CM. SAN ANT DEL GOLFO', '2015-10-20 19:59:36', NULL, 1),
(757, 231, 'CUMANACOA', '2015-10-20 19:59:36', NULL, 1),
(758, 231, 'ARENAS', '2015-10-20 19:59:36', NULL, 1),
(759, 231, 'ARICAGUA', '2015-10-20 19:59:36', NULL, 1),
(760, 231, 'COCOLLAR', '2015-10-20 19:59:36', NULL, 1),
(761, 231, 'SAN FERNANDO', '2015-10-20 19:59:36', NULL, 1),
(762, 231, 'SAN LORENZO', '2015-10-20 19:59:36', NULL, 1),
(763, 232, 'CARIACO', '2015-10-20 19:59:36', NULL, 1),
(764, 232, 'CATUARO', '2015-10-20 19:59:36', NULL, 1),
(765, 232, 'RENDON', '2015-10-20 19:59:36', NULL, 1),
(766, 232, 'SANTA CRUZ', '2015-10-20 19:59:36', NULL, 1),
(767, 232, 'SANTA MARIA', '2015-10-20 19:59:36', NULL, 1),
(768, 233, 'ALTAGRACIA', '2015-10-20 19:59:36', NULL, 1),
(769, 233, 'AYACUCHO', '2015-10-20 19:59:36', NULL, 1),
(770, 233, 'SANTA INES', '2015-10-20 19:59:36', NULL, 1),
(771, 233, 'VALENTIN VALIENTE', '2015-10-20 19:59:36', NULL, 1),
(772, 233, 'SAN JUAN', '2015-10-20 19:59:36', NULL, 1),
(773, 233, 'GRAN MARISCAL', '2015-10-20 19:59:36', NULL, 1),
(774, 233, 'RAUL LEONI', '2015-10-20 19:59:36', NULL, 1),
(775, 234, 'GUIRIA', '2015-10-20 19:59:36', NULL, 1),
(776, 234, 'CRISTOBAL COLON', '2015-10-20 19:59:36', NULL, 1),
(777, 234, 'PUNTA DE PIEDRA', '2015-10-20 19:59:36', NULL, 1),
(778, 234, 'BIDEAU', '2015-10-20 19:59:36', NULL, 1),
(779, 235, 'MARIÑO', '2015-10-20 19:59:36', NULL, 1),
(780, 235, 'ROMULO GALLEGOS', '2015-10-20 19:59:36', NULL, 1),
(781, 236, 'TUNAPUY', '2015-10-20 19:59:36', NULL, 1),
(782, 236, 'CAMPO ELIAS', '2015-10-20 19:59:36', NULL, 1),
(783, 237, 'SAN JOSE DE AREOCUAR', '2015-10-20 19:59:36', NULL, 1),
(784, 237, 'TAVERA ACOSTA', '2015-10-20 19:59:36', NULL, 1),
(785, 238, 'CM. MARIGUITAR', '2015-10-20 19:59:36', NULL, 1),
(786, 239, 'ARAYA', '2015-10-20 19:59:36', NULL, 1),
(787, 239, 'MANICUARE', '2015-10-20 19:59:36', NULL, 1),
(788, 239, 'CHACOPATA', '2015-10-20 19:59:36', NULL, 1),
(789, 240, 'CM. COLON', '2015-10-20 19:59:36', NULL, 1),
(790, 240, 'RIVAS BERTI', '2015-10-20 19:59:36', NULL, 1),
(791, 240, 'SAN PEDRO DEL RIO', '2015-10-20 19:59:36', NULL, 1),
(792, 241, 'CM. SAN ANT DEL TACHIRA', '2015-10-20 19:59:36', NULL, 1),
(793, 241, 'PALOTAL', '2015-10-20 19:59:36', NULL, 1),
(794, 241, 'JUAN VICENTE GOMEZ', '2015-10-20 19:59:36', NULL, 1),
(795, 241, 'ISAIAS MEDINA ANGARIT', '2015-10-20 19:59:36', NULL, 1),
(796, 242, 'CM. CAPACHO NUEVO', '2015-10-20 19:59:36', NULL, 1),
(797, 242, 'JUAN GERMAN ROSCIO', '2015-10-20 19:59:36', NULL, 1),
(798, 242, 'ROMAN CARDENAS', '2015-10-20 19:59:36', NULL, 1),
(799, 243, 'CM. TARIBA', '2015-10-20 19:59:36', NULL, 1),
(800, 243, 'LA FLORIDA', '2015-10-20 19:59:36', NULL, 1),
(801, 243, 'AMENODORO RANGEL LAMU', '2015-10-20 19:59:36', NULL, 1),
(802, 244, 'CM. LA GRITA', '2015-10-20 19:59:36', NULL, 1),
(803, 244, 'EMILIO C. GUERRERO', '2015-10-20 19:59:36', NULL, 1),
(804, 244, 'MONS. MIGUEL A SALAS', '2015-10-20 19:59:36', NULL, 1),
(805, 245, 'CM. RUBIO', '2015-10-20 19:59:36', NULL, 1),
(806, 245, 'BRAMON', '2015-10-20 19:59:36', NULL, 1),
(807, 245, 'LA PETROLEA', '2015-10-20 19:59:36', NULL, 1),
(808, 245, 'QUINIMARI', '2015-10-20 19:59:36', NULL, 1),
(809, 246, 'CM. LOBATERA', '2015-10-20 19:59:36', NULL, 1),
(810, 246, 'CONSTITUCION', '2015-10-20 19:59:36', NULL, 1),
(811, 247, 'LA CONCORDIA', '2015-10-20 19:59:36', NULL, 1),
(812, 247, 'PEDRO MARIA MORANTES', '2015-10-20 19:59:36', NULL, 1),
(813, 247, 'SN JUAN BAUTISTA', '2015-10-20 19:59:36', NULL, 1),
(814, 247, 'SAN SEBASTIAN', '2015-10-20 19:59:36', NULL, 1),
(815, 247, 'DR. FCO. ROMERO LOBO', '2015-10-20 19:59:36', NULL, 1),
(816, 248, 'CM. PREGONERO', '2015-10-20 19:59:36', NULL, 1),
(817, 248, 'CARDENAS', '2015-10-20 19:59:36', NULL, 1),
(818, 248, 'POTOSI', '2015-10-20 19:59:36', NULL, 1),
(819, 248, 'JUAN PABLO PEÑALOZA', '2015-10-20 19:59:36', NULL, 1),
(820, 249, 'CM. STA. ANA  DEL TACHIRA', '2015-10-20 19:59:36', NULL, 1),
(821, 250, 'CM. LA FRIA', '2015-10-20 19:59:36', NULL, 1),
(822, 250, 'BOCA DE GRITA', '2015-10-20 19:59:36', NULL, 1),
(823, 250, 'JOSE ANTONIO PAEZ', '2015-10-20 19:59:36', NULL, 1),
(824, 251, 'CM. PALMIRA', '2015-10-20 19:59:36', NULL, 1),
(825, 252, 'CM. MICHELENA', '2015-10-20 19:59:36', NULL, 1),
(826, 253, 'CM. ABEJALES', '2015-10-20 19:59:36', NULL, 1),
(827, 253, 'SAN JOAQUIN DE NAVAY', '2015-10-20 19:59:36', NULL, 1),
(828, 253, 'DORADAS', '2015-10-20 19:59:36', NULL, 1),
(829, 253, 'EMETERIO OCHOA', '2015-10-20 19:59:36', NULL, 1),
(830, 254, 'CM. COLONCITO', '2015-10-20 19:59:36', NULL, 1),
(831, 254, 'LA PALMITA', '2015-10-20 19:59:36', NULL, 1),
(832, 255, 'CM. UREÑA', '2015-10-20 19:59:36', NULL, 1),
(833, 255, 'NUEVA ARCADIA', '2015-10-20 19:59:36', NULL, 1),
(834, 256, 'CM. QUENIQUEA', '2015-10-20 19:59:36', NULL, 1),
(835, 256, 'SAN PABLO', '2015-10-20 19:59:36', NULL, 1),
(836, 256, 'ELEAZAR LOPEZ CONTRERA', '2015-10-20 19:59:36', NULL, 1),
(837, 257, 'CM. CORDERO', '2015-10-20 19:59:36', NULL, 1),
(838, 258, 'CM.SAN RAFAEL DEL PINAL', '2015-10-20 19:59:36', NULL, 1),
(839, 258, 'SANTO DOMINGO', '2015-10-20 19:59:36', NULL, 1),
(840, 258, 'ALBERTO ADRIANI', '2015-10-20 19:59:36', NULL, 1),
(841, 259, 'CM. CAPACHO VIEJO', '2015-10-20 19:59:36', NULL, 1),
(842, 259, 'CIPRIANO CASTRO', '2015-10-20 19:59:36', NULL, 1),
(843, 259, 'MANUEL FELIPE RUGELES', '2015-10-20 19:59:36', NULL, 1),
(844, 260, 'CM. LA TENDIDA', '2015-10-20 19:59:36', NULL, 1),
(845, 260, 'BOCONO', '2015-10-20 19:59:36', NULL, 1),
(846, 260, 'HERNANDEZ', '2015-10-20 19:59:36', NULL, 1),
(847, 261, 'CM. SEBORUCO', '2015-10-20 19:59:36', NULL, 1),
(848, 262, 'CM. LAS MESAS', '2015-10-20 19:59:36', NULL, 1),
(849, 263, 'CM. SAN JOSE DE BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(850, 264, 'CM. EL COBRE', '2015-10-20 19:59:36', NULL, 1),
(851, 265, 'CM. DELICIAS', '2015-10-20 19:59:36', NULL, 1),
(852, 266, 'CM. SAN SIMON', '2015-10-20 19:59:36', NULL, 1),
(853, 267, 'CM. SAN JOSECITO', '2015-10-20 19:59:36', NULL, 1),
(854, 268, 'CM. UMUQUENA', '2015-10-20 19:59:36', NULL, 1),
(855, 269, 'BETIJOQUE', '2015-10-20 19:59:36', NULL, 1),
(856, 269, 'JOSE G HERNANDEZ', '2015-10-20 19:59:36', NULL, 1),
(857, 269, 'LA PUEBLITA', '2015-10-20 19:59:36', NULL, 1),
(858, 269, 'EL CEDRO', '2015-10-20 19:59:36', NULL, 1),
(859, 270, 'BOCONO', '2015-10-20 19:59:36', NULL, 1),
(860, 270, 'EL CARMEN', '2015-10-20 19:59:36', NULL, 1),
(861, 270, 'MOSQUEY', '2015-10-20 19:59:36', NULL, 1),
(862, 270, 'AYACUCHO', '2015-10-20 19:59:36', NULL, 1),
(863, 270, 'BURBUSAY', '2015-10-20 19:59:36', NULL, 1),
(864, 270, 'GENERAL RIVAS', '2015-10-20 19:59:36', NULL, 1),
(865, 270, 'MONSEÑOR JAUREGUI', '2015-10-20 19:59:36', NULL, 1),
(866, 270, 'RAFAEL RANGEL', '2015-10-20 19:59:36', NULL, 1),
(867, 270, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(868, 270, 'SAN MIGUEL', '2015-10-20 19:59:36', NULL, 1),
(869, 270, 'GUARAMACAL', '2015-10-20 19:59:36', NULL, 1),
(870, 270, 'LA VEGA DE GUARAMACAL', '2015-10-20 19:59:36', NULL, 1),
(871, 271, 'CARACHE', '2015-10-20 19:59:36', NULL, 1),
(872, 271, 'LA CONCEPCION', '2015-10-20 19:59:36', NULL, 1),
(873, 271, 'CUICAS', '2015-10-20 19:59:36', NULL, 1),
(874, 271, 'PANAMERICANA', '2015-10-20 19:59:36', NULL, 1);
INSERT INTO `parroquias` (`id_parroquia`, `id_municipio`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(875, 271, 'SANTA CRUZ', '2015-10-20 19:59:36', NULL, 1),
(876, 272, 'ESCUQUE', '2015-10-20 19:59:36', NULL, 1),
(877, 272, 'SABANA LIBRE', '2015-10-20 19:59:36', NULL, 1),
(878, 272, 'LA UNION', '2015-10-20 19:59:36', NULL, 1),
(879, 272, 'SANTA RITA', '2015-10-20 19:59:36', NULL, 1),
(880, 273, 'CRISTOBAL MENDOZA', '2015-10-20 19:59:36', NULL, 1),
(881, 273, 'CHIQUINQUIRA', '2015-10-20 19:59:36', NULL, 1),
(882, 273, 'MATRIZ', '2015-10-20 19:59:36', NULL, 1),
(883, 273, 'MONSEÑOR CARRILLO', '2015-10-20 19:59:36', NULL, 1),
(884, 273, 'CRUZ CARRILLO', '2015-10-20 19:59:36', NULL, 1),
(885, 273, 'ANDRES LINARES', '2015-10-20 19:59:36', NULL, 1),
(886, 273, 'TRES ESQUINAS', '2015-10-20 19:59:36', NULL, 1),
(887, 274, 'LA QUEBRADA', '2015-10-20 19:59:36', NULL, 1),
(888, 274, 'JAJO', '2015-10-20 19:59:36', NULL, 1),
(889, 274, 'LA MESA', '2015-10-20 19:59:36', NULL, 1),
(890, 274, 'SANTIAGO', '2015-10-20 19:59:36', NULL, 1),
(891, 274, 'CABIMBU', '2015-10-20 19:59:36', NULL, 1),
(892, 274, 'TUÑAME', '2015-10-20 19:59:36', NULL, 1),
(893, 275, 'MERCEDES DIAZ', '2015-10-20 19:59:36', NULL, 1),
(894, 275, 'JUAN IGNACIO MONTILLA', '2015-10-20 19:59:36', NULL, 1),
(895, 275, 'LA BEATRIZ', '2015-10-20 19:59:36', NULL, 1),
(896, 275, 'MENDOZA', '2015-10-20 19:59:36', NULL, 1),
(897, 275, 'LA PUERTA', '2015-10-20 19:59:36', NULL, 1),
(898, 275, 'SAN LUIS', '2015-10-20 19:59:36', NULL, 1),
(899, 276, 'CHEJENDE', '2015-10-20 19:59:36', NULL, 1),
(900, 276, 'CARRILLO', '2015-10-20 19:59:36', NULL, 1),
(901, 276, 'CEGARRA', '2015-10-20 19:59:36', NULL, 1),
(902, 276, 'BOLIVIA', '2015-10-20 19:59:36', NULL, 1),
(903, 276, 'MANUEL SALVADOR ULLOA', '2015-10-20 19:59:36', NULL, 1),
(904, 276, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(905, 276, 'ARNOLDO GABALDON', '2015-10-20 19:59:36', NULL, 1),
(906, 277, 'EL DIVIDIVE', '2015-10-20 19:59:36', NULL, 1),
(907, 277, 'AGUA CALIENTE', '2015-10-20 19:59:36', NULL, 1),
(908, 277, 'EL CENIZO', '2015-10-20 19:59:36', NULL, 1),
(909, 277, 'AGUA SANTA', '2015-10-20 19:59:36', NULL, 1),
(910, 277, 'VALERITA', '2015-10-20 19:59:36', NULL, 1),
(911, 278, 'MONTE CARMELO', '2015-10-20 19:59:36', NULL, 1),
(912, 278, 'BUENA VISTA', '2015-10-20 19:59:36', NULL, 1),
(913, 278, 'STA MARIA DEL HORCON', '2015-10-20 19:59:36', NULL, 1),
(914, 279, 'MOTATAN', '2015-10-20 19:59:36', NULL, 1),
(915, 279, 'EL BAÑO', '2015-10-20 19:59:36', NULL, 1),
(916, 279, 'JALISCO', '2015-10-20 19:59:36', NULL, 1),
(917, 280, 'PAMPAN', '2015-10-20 19:59:36', NULL, 1),
(918, 280, 'SANTA ANA', '2015-10-20 19:59:36', NULL, 1),
(919, 280, 'LA PAZ', '2015-10-20 19:59:36', NULL, 1),
(920, 280, 'FLOR DE PATRIA', '2015-10-20 19:59:36', NULL, 1),
(921, 281, 'CARVAJAL', '2015-10-20 19:59:36', NULL, 1),
(922, 281, 'ANTONIO N BRICEÑO', '2015-10-20 19:59:36', NULL, 1),
(923, 281, 'CAMPO ALEGRE', '2015-10-20 19:59:36', NULL, 1),
(924, 281, 'JOSE LEONARDO SUAREZ', '2015-10-20 19:59:36', NULL, 1),
(925, 282, 'SABANA DE MENDOZA', '2015-10-20 19:59:36', NULL, 1),
(926, 282, 'JUNIN', '2015-10-20 19:59:36', NULL, 1),
(927, 282, 'VALMORE RODRIGUEZ', '2015-10-20 19:59:36', NULL, 1),
(928, 282, 'EL PARAISO', '2015-10-20 19:59:36', NULL, 1),
(929, 283, 'SANTA ISABEL', '2015-10-20 19:59:36', NULL, 1),
(930, 283, 'ARAGUANEY', '2015-10-20 19:59:36', NULL, 1),
(931, 283, 'EL JAGUITO', '2015-10-20 19:59:36', NULL, 1),
(932, 283, 'LA ESPERANZA', '2015-10-20 19:59:36', NULL, 1),
(933, 284, 'SABANA GRANDE', '2015-10-20 19:59:36', NULL, 1),
(934, 284, 'CHEREGUE', '2015-10-20 19:59:36', NULL, 1),
(935, 284, 'GRANADOS', '2015-10-20 19:59:36', NULL, 1),
(936, 285, 'EL SOCORRO', '2015-10-20 19:59:36', NULL, 1),
(937, 285, 'LOS CAPRICHOS', '2015-10-20 19:59:36', NULL, 1),
(938, 285, 'ANTONIO JOSE DE SUCRE', '2015-10-20 19:59:36', NULL, 1),
(939, 286, 'CAMPO ELIAS', '2015-10-20 19:59:36', NULL, 1),
(940, 286, 'ARNOLDO GABALDON', '2015-10-20 19:59:36', NULL, 1),
(941, 287, 'SANTA APOLONIA', '2015-10-20 19:59:36', NULL, 1),
(942, 287, 'LA CEIBA', '2015-10-20 19:59:36', NULL, 1),
(943, 287, 'EL PROGRESO', '2015-10-20 19:59:36', NULL, 1),
(944, 287, 'TRES DE FEBRERO', '2015-10-20 19:59:36', NULL, 1),
(945, 288, 'PAMPANITO', '2015-10-20 19:59:36', NULL, 1),
(946, 288, 'PAMPANITO II', '2015-10-20 19:59:36', NULL, 1),
(947, 288, 'LA CONCEPCION', '2015-10-20 19:59:36', NULL, 1),
(948, 289, 'CM. AROA', '2015-10-20 19:59:36', NULL, 1),
(949, 290, 'CM. CHIVACOA', '2015-10-20 19:59:36', NULL, 1),
(950, 290, 'CAMPO ELIAS', '2015-10-20 19:59:36', NULL, 1),
(951, 291, 'CM. NIRGUA', '2015-10-20 19:59:36', NULL, 1),
(952, 291, 'SALOM', '2015-10-20 19:59:36', NULL, 1),
(953, 291, 'TEMERLA', '2015-10-20 19:59:36', NULL, 1),
(954, 292, 'CM. SAN FELIPE', '2015-10-20 19:59:36', NULL, 1),
(955, 292, 'ALBARICO', '2015-10-20 19:59:36', NULL, 1),
(956, 292, 'SAN JAVIER', '2015-10-20 19:59:36', NULL, 1),
(957, 293, 'CM. GUAMA', '2015-10-20 19:59:36', NULL, 1),
(958, 294, 'CM. URACHICHE', '2015-10-20 19:59:36', NULL, 1),
(959, 295, 'CM. YARITAGUA', '2015-10-20 19:59:36', NULL, 1),
(960, 295, 'SAN ANDRES', '2015-10-20 19:59:36', NULL, 1),
(961, 296, 'CM. SABANA DE PARRA', '2015-10-20 19:59:36', NULL, 1),
(962, 297, 'CM. BORAURE', '2015-10-20 19:59:36', NULL, 1),
(963, 298, 'CM. COCOROTE', '2015-10-20 19:59:36', NULL, 1),
(964, 299, 'CM. INDEPENDENCIA', '2015-10-20 19:59:36', NULL, 1),
(965, 300, 'CM. SAN PABLO', '2015-10-20 19:59:36', NULL, 1),
(966, 301, 'CM. YUMARE', '2015-10-20 19:59:36', NULL, 1),
(967, 302, 'CM. FARRIAR', '2015-10-20 19:59:36', NULL, 1),
(968, 302, 'EL GUAYABO', '2015-10-20 19:59:36', NULL, 1),
(969, 303, 'GENERAL URDANETA', '2015-10-20 19:59:36', NULL, 1),
(970, 303, 'LIBERTADOR', '2015-10-20 19:59:36', NULL, 1),
(971, 303, 'MANUEL GUANIPA MATOS', '2015-10-20 19:59:36', NULL, 1),
(972, 303, 'MARCELINO BRICEÑO', '2015-10-20 19:59:36', NULL, 1),
(973, 303, 'SAN TIMOTEO', '2015-10-20 19:59:36', NULL, 1),
(974, 303, 'PUEBLO NUEVO', '2015-10-20 19:59:36', NULL, 1),
(975, 304, 'PEDRO LUCAS URRIBARRI', '2015-10-20 19:59:36', NULL, 1),
(976, 304, 'SANTA RITA', '2015-10-20 19:59:36', NULL, 1),
(977, 304, 'JOSE CENOVIO URRIBARR', '2015-10-20 19:59:36', NULL, 1),
(978, 304, 'EL MENE', '2015-10-20 19:59:36', NULL, 1),
(979, 305, 'SANTA CRUZ DEL ZULIA', '2015-10-20 19:59:36', NULL, 1),
(980, 305, 'URRIBARRI', '2015-10-20 19:59:36', NULL, 1),
(981, 305, 'MORALITO', '2015-10-20 19:59:36', NULL, 1),
(982, 305, 'SAN CARLOS DEL ZULIA', '2015-10-20 19:59:36', NULL, 1),
(983, 305, 'SANTA BARBARA', '2015-10-20 19:59:36', NULL, 1),
(984, 306, 'LUIS DE VICENTE', '2015-10-20 19:59:36', NULL, 1),
(985, 306, 'RICAURTE', '2015-10-20 19:59:36', NULL, 1),
(986, 306, 'MONS.MARCOS SERGIO G', '2015-10-20 19:59:36', NULL, 1),
(987, 306, 'SAN RAFAEL', '2015-10-20 19:59:36', NULL, 1),
(988, 306, 'LAS PARCELAS', '2015-10-20 19:59:36', NULL, 1),
(989, 306, 'TAMARE', '2015-10-20 19:59:36', NULL, 1),
(990, 306, 'LA SIERRITA', '2015-10-20 19:59:36', NULL, 1),
(991, 307, 'BOLIVAR', '2015-10-20 19:59:36', NULL, 1),
(992, 307, 'COQUIVACOA', '2015-10-20 19:59:36', NULL, 1),
(993, 307, 'CRISTO DE ARANZA', '2015-10-20 19:59:36', NULL, 1),
(994, 307, 'CHIQUINQUIRA', '2015-10-20 19:59:36', NULL, 1),
(995, 307, 'SANTA LUCIA', '2015-10-20 19:59:36', NULL, 1),
(996, 307, 'OLEGARIO VILLALOBOS', '2015-10-20 19:59:36', NULL, 1),
(997, 307, 'JUANA DE AVILA', '2015-10-20 19:59:36', NULL, 1),
(998, 307, 'CARACCIOLO PARRA PEREZ', '2015-10-20 19:59:36', NULL, 1),
(999, 307, 'IDELFONZO VASQUEZ', '2015-10-20 19:59:36', NULL, 1),
(1000, 307, 'CACIQUE MARA', '2015-10-20 19:59:36', NULL, 1),
(1001, 307, 'CECILIO ACOSTA', '2015-10-20 19:59:36', NULL, 1),
(1002, 307, 'RAUL LEONI', '2015-10-20 19:59:36', NULL, 1),
(1003, 307, 'FRANCISCO EUGENIO B', '2015-10-20 19:59:36', NULL, 1),
(1004, 307, 'MANUEL DAGNINO', '2015-10-20 19:59:36', NULL, 1),
(1005, 307, 'LUIS HURTADO HIGUERA', '2015-10-20 19:59:36', NULL, 1),
(1006, 307, 'VENANCIO PULGAR', '2015-10-20 19:59:36', NULL, 1),
(1007, 307, 'ANTONIO BORJAS ROMERO', '2015-10-20 19:59:36', NULL, 1),
(1008, 307, 'SAN ISIDRO', '2015-10-20 19:59:36', NULL, 1),
(1009, 308, 'FARIA', '2015-10-20 19:59:36', NULL, 1),
(1010, 308, 'SAN ANTONIO', '2015-10-20 19:59:36', NULL, 1),
(1011, 308, 'ANA MARIA CAMPOS', '2015-10-20 19:59:36', NULL, 1),
(1012, 308, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(1013, 308, 'ALTAGRACIA', '2015-10-20 19:59:36', NULL, 1),
(1014, 309, 'GOAJIRA', '2015-10-20 19:59:36', NULL, 1),
(1015, 309, 'ELIAS SANCHEZ RUBIO', '2015-10-20 19:59:36', NULL, 1),
(1016, 309, 'SINAMAICA', '2015-10-20 19:59:36', NULL, 1),
(1017, 309, 'ALTA GUAJIRA', '2015-10-20 19:59:36', NULL, 1),
(1018, 310, 'SAN JOSE DE PERIJA', '2015-10-20 19:59:36', NULL, 1),
(1019, 310, 'BARTOLOME DE LAS CASAS', '2015-10-20 19:59:36', NULL, 1),
(1020, 310, 'LIBERTAD', '2015-10-20 19:59:36', NULL, 1),
(1021, 310, 'RIO NEGRO', '2015-10-20 19:59:36', NULL, 1),
(1022, 311, 'GIBRALTAR', '2015-10-20 19:59:36', NULL, 1),
(1023, 311, 'HERAS', '2015-10-20 19:59:36', NULL, 1),
(1024, 311, 'M.ARTURO CELESTINO A', '2015-10-20 19:59:36', NULL, 1),
(1025, 311, 'ROMULO GALLEGOS', '2015-10-20 19:59:36', NULL, 1),
(1026, 311, 'BOBURES', '2015-10-20 19:59:36', NULL, 1),
(1027, 311, 'EL BATEY', '2015-10-20 19:59:36', NULL, 1),
(1028, 312, 'ANDRES BELLO (KM 48)', '2015-10-20 19:59:36', NULL, 1),
(1029, 312, 'POTRERITOS', '2015-10-20 19:59:36', NULL, 1),
(1030, 312, 'EL CARMELO', '2015-10-20 19:59:36', NULL, 1),
(1031, 312, 'CHIQUINQUIRA', '2015-10-20 19:59:36', NULL, 1),
(1032, 312, 'CONCEPCION', '2015-10-20 19:59:36', NULL, 1),
(1033, 313, 'ELEAZAR LOPEZ C', '2015-10-20 19:59:36', NULL, 1),
(1034, 313, 'ALONSO DE OJEDA', '2015-10-20 19:59:36', NULL, 1),
(1035, 313, 'VENEZUELA', '2015-10-20 19:59:36', NULL, 1),
(1036, 313, 'CAMPO LARA', '2015-10-20 19:59:36', NULL, 1),
(1037, 313, 'LIBERTAD', '2015-10-20 19:59:36', NULL, 1),
(1038, 314, 'UDON PEREZ', '2015-10-20 19:59:36', NULL, 1),
(1039, 314, 'ENCONTRADOS', '2015-10-20 19:59:36', NULL, 1),
(1040, 315, 'DONALDO GARCIA', '2015-10-20 19:59:36', NULL, 1),
(1041, 315, 'SIXTO ZAMBRANO', '2015-10-20 19:59:36', NULL, 1),
(1042, 315, 'EL ROSARIO', '2015-10-20 19:59:36', NULL, 1),
(1043, 316, 'AMBROSIO', '2015-10-20 19:59:36', NULL, 1),
(1044, 316, 'GERMAN RIOS LINARES', '2015-10-20 19:59:36', NULL, 1),
(1045, 316, 'JORGE HERNANDEZ', '2015-10-20 19:59:36', NULL, 1),
(1046, 316, 'LA ROSA', '2015-10-20 19:59:36', NULL, 1),
(1047, 316, 'PUNTA GORDA', '2015-10-20 19:59:36', NULL, 1),
(1048, 316, 'CARMEN HERRERA', '2015-10-20 19:59:36', NULL, 1),
(1049, 316, 'SAN BENITO', '2015-10-20 19:59:36', NULL, 1),
(1050, 316, 'ROMULO BETANCOURT', '2015-10-20 19:59:36', NULL, 1),
(1051, 316, 'ARISTIDES CALVANI', '2015-10-20 19:59:36', NULL, 1),
(1052, 317, 'RAUL CUENCA', '2015-10-20 19:59:36', NULL, 1),
(1053, 317, 'LA VICTORIA', '2015-10-20 19:59:36', NULL, 1),
(1054, 317, 'RAFAEL URDANETA', '2015-10-20 19:59:36', NULL, 1),
(1055, 318, 'JOSE RAMON YEPEZ', '2015-10-20 19:59:36', NULL, 1),
(1056, 318, 'LA CONCEPCION', '2015-10-20 19:59:36', NULL, 1),
(1057, 318, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(1058, 318, 'MARIANO PARRA LEON', '2015-10-20 19:59:36', NULL, 1),
(1059, 319, 'MONAGAS', '2015-10-20 19:59:36', NULL, 1),
(1060, 319, 'ISLA DE TOAS', '2015-10-20 19:59:36', NULL, 1),
(1061, 320, 'MARCIAL HERNANDEZ', '2015-10-20 19:59:36', NULL, 1),
(1062, 320, 'FRANCISCO OCHOA', '2015-10-20 19:59:36', NULL, 1),
(1063, 320, 'SAN FRANCISCO', '2015-10-20 19:59:36', NULL, 1),
(1064, 320, 'EL BAJO', '2015-10-20 19:59:36', NULL, 1),
(1065, 320, 'DOMITILA FLORES', '2015-10-20 19:59:36', NULL, 1),
(1066, 320, 'LOS CORTIJOS', '2015-10-20 19:59:36', NULL, 1),
(1067, 321, 'BARI', '2015-10-20 19:59:36', NULL, 1),
(1068, 321, 'JESUS M SEMPRUN', '2015-10-20 19:59:36', NULL, 1),
(1069, 322, 'SIMON RODRIGUEZ', '2015-10-20 19:59:36', NULL, 1),
(1070, 322, 'CARLOS QUEVEDO', '2015-10-20 19:59:36', NULL, 1),
(1071, 322, 'FRANCISCO J PULGAR', '2015-10-20 19:59:36', NULL, 1),
(1072, 323, 'RAFAEL MARIA BARALT', '2015-10-20 19:59:36', NULL, 1),
(1073, 323, 'MANUEL MANRIQUE', '2015-10-20 19:59:36', NULL, 1),
(1074, 323, 'RAFAEL URDANETA', '2015-10-20 19:59:36', NULL, 1),
(1075, 324, 'FERNANDO GIRON TOVAR', '2015-10-20 19:59:36', NULL, 1),
(1076, 324, 'LUIS ALBERTO GOMEZ', '2015-10-20 19:59:36', NULL, 1),
(1077, 324, 'PARHUEÑA', '2015-10-20 19:59:36', NULL, 1),
(1078, 324, 'PLATANILLAL', '2015-10-20 19:59:36', NULL, 1),
(1079, 325, 'CM. SAN FERNANDO DE ATABA', '2015-10-20 19:59:36', NULL, 1),
(1080, 325, 'UCATA', '2015-10-20 19:59:36', NULL, 1),
(1081, 325, 'YAPACANA', '2015-10-20 19:59:36', NULL, 1),
(1082, 325, 'CANAME', '2015-10-20 19:59:36', NULL, 1),
(1083, 326, 'CM. MAROA', '2015-10-20 19:59:36', NULL, 1),
(1084, 326, 'VICTORINO', '2015-10-20 19:59:36', NULL, 1),
(1085, 326, 'COMUNIDAD', '2015-10-20 19:59:36', NULL, 1),
(1086, 327, 'CM. SAN CARLOS DE RIO NEG', '2015-10-20 19:59:36', NULL, 1),
(1087, 327, 'SOLANO', '2015-10-20 19:59:36', NULL, 1),
(1088, 327, 'COCUY', '2015-10-20 19:59:36', NULL, 1),
(1089, 328, 'CM. ISLA DE RATON', '2015-10-20 19:59:36', NULL, 1),
(1090, 328, 'SAMARIAPO', '2015-10-20 19:59:36', NULL, 1),
(1091, 328, 'SIPAPO', '2015-10-20 19:59:36', NULL, 1),
(1092, 328, 'MUNDUAPO', '2015-10-20 19:59:36', NULL, 1),
(1093, 328, 'GUAYAPO', '2015-10-20 19:59:36', NULL, 1),
(1094, 329, 'CM. SAN JUAN DE MANAPIARE', '2015-10-20 19:59:36', NULL, 1),
(1095, 329, 'ALTO VENTUARI', '2015-10-20 19:59:36', NULL, 1),
(1096, 329, 'MEDIO VENTUARI', '2015-10-20 19:59:36', NULL, 1),
(1097, 329, 'BAJO VENTUARI', '2015-10-20 19:59:36', NULL, 1),
(1098, 330, 'CM. LA ESMERALDA', '2015-10-20 19:59:36', NULL, 1),
(1099, 330, 'HUACHAMACARE', '2015-10-20 19:59:36', NULL, 1),
(1100, 330, 'MARAWAKA', '2015-10-20 19:59:36', NULL, 1),
(1101, 330, 'MAVACA', '2015-10-20 19:59:36', NULL, 1),
(1102, 330, 'SIERRA PARIMA', '2015-10-20 19:59:36', NULL, 1),
(1103, 331, 'SAN JOSE', '2015-10-20 19:59:36', NULL, 1),
(1104, 331, 'VIRGEN DEL VALLE', '2015-10-20 19:59:36', NULL, 1),
(1105, 331, 'SAN RAFAEL', '2015-10-20 19:59:36', NULL, 1),
(1106, 331, 'JOSE VIDAL MARCANO', '2015-10-20 19:59:36', NULL, 1),
(1107, 331, 'LEONARDO RUIZ PINEDA', '2015-10-20 19:59:36', NULL, 1),
(1108, 331, 'MONS. ARGIMIRO GARCIA', '2015-10-20 19:59:36', NULL, 1),
(1109, 331, 'MCL.ANTONIO J DE SUCRE', '2015-10-20 19:59:36', NULL, 1),
(1110, 331, 'JUAN MILLAN', '2015-10-20 19:59:36', NULL, 1),
(1111, 332, 'PEDERNALES', '2015-10-20 19:59:36', NULL, 1),
(1112, 332, 'LUIS B PRIETO FIGUERO', '2015-10-20 19:59:36', NULL, 1),
(1113, 333, 'CURIAPO', '2015-10-20 19:59:36', NULL, 1),
(1114, 333, 'SANTOS DE ABELGAS', '2015-10-20 19:59:36', NULL, 1),
(1115, 333, 'MANUEL RENAUD', '2015-10-20 19:59:36', NULL, 1),
(1116, 333, 'PADRE BARRAL', '2015-10-20 19:59:36', NULL, 1),
(1117, 333, 'ANICETO LUGO', '2015-10-20 19:59:36', NULL, 1),
(1118, 333, 'ALMIRANTE LUIS BRION', '2015-10-20 19:59:36', NULL, 1),
(1119, 334, 'IMATACA', '2015-10-20 19:59:36', NULL, 1),
(1120, 334, 'ROMULO GALLEGOS', '2015-10-20 19:59:36', NULL, 1),
(1121, 334, 'JUAN BAUTISTA ARISMEN', '2015-10-20 19:59:36', NULL, 1),
(1122, 334, 'MANUEL PIAR', '2015-10-20 19:59:36', NULL, 1),
(1123, 334, '5 DE JULIO', '2015-10-20 19:59:36', NULL, 1),
(1124, 335, 'CARABALLEDA', '2015-10-20 19:59:36', NULL, 1),
(1125, 335, 'CARAYACA', '2015-10-20 19:59:36', NULL, 1),
(1126, 335, 'CARUAO', '2015-10-20 19:59:36', NULL, 1),
(1127, 335, 'CATIA LA MAR', '2015-10-20 19:59:36', NULL, 1),
(1128, 335, 'LA GUAIRA', '2015-10-20 19:59:36', NULL, 1),
(1129, 335, 'MACUTO', '2015-10-20 19:59:36', NULL, 1),
(1130, 335, 'MAIQUETIA', '2015-10-20 19:59:36', NULL, 1),
(1131, 335, 'NAIGUATA', '2015-10-20 19:59:36', NULL, 1),
(1132, 335, 'EL JUNKO', '2015-10-20 19:59:36', NULL, 1),
(1133, 335, 'PQ RAUL LEONI', '2015-10-20 19:59:36', NULL, 1),
(1134, 335, 'PQ CARLOS SOUBLETTE', '2015-10-20 19:59:36', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int(11) NOT NULL,
  `id_pais_nacimiento` int(11) NOT NULL,
  `primer_nombre` varchar(100) NOT NULL,
  `segundo_nombre` varchar(100) DEFAULT NULL,
  `primer_apellido` varchar(100) NOT NULL,
  `segundo_apellido` varchar(100) DEFAULT NULL,
  `cedula_identidad` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_sexo` int(11) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `profesion_ocupacion` varchar(100) DEFAULT NULL,
  `id_direccion_persona` int(11) NOT NULL,
  `id_telefono_persona` int(11) NOT NULL,
  `trabaja` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de las personas';

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `id_pais_nacimiento`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `cedula_identidad`, `fecha_nacimiento`, `id_sexo`, `nacionalidad`, `correo_electronico`, `profesion_ocupacion`, `id_direccion_persona`, `id_telefono_persona`, `trabaja`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 1, 'DEMO', NULL, 'DEMO', NULL, '12345678', '0000-00-00', 1, 'VENEZOLANO', 'DEMO@DEMO.COM', 'DEMO', 1, 1, 0, '2015-10-20 21:16:46', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recaudos`
--

CREATE TABLE IF NOT EXISTS `recaudos` (
  `id_recaudo` int(11) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha de creación del registro',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL COMMENT 'fecha de actualización del registro',
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'registro activo o no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recaudos_grado`
--

CREATE TABLE IF NOT EXISTS `recaudos_grado` (
  `id_recaudo_grado` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_recaudo` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha de creación del registro',
  `fecha_actualizacion` timestamp NULL DEFAULT NULL COMMENT 'fecha de actualización del registro',
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'registro activo o no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_sociales`
--

CREATE TABLE IF NOT EXISTS `redes_sociales` (
  `id_redes_social` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las redes sociales que pudiese usar un pa';

--
-- Volcado de datos para la tabla `redes_sociales`
--

INSERT INTO `redes_sociales` (`id_redes_social`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'FACEBOOK', '2015-10-20 20:14:12', NULL, 1),
(2, 'TWITTER', '2015-10-20 20:14:12', NULL, 1),
(3, 'WHATSAPP', '2015-10-20 20:14:12', NULL, 1),
(4, 'GOOGLE PLUS', '2015-10-20 20:14:12', NULL, 1),
(5, 'INSTAGRAM', '2015-10-20 20:14:12', NULL, 1),
(6, 'LINKEDIN', '2015-10-20 20:14:12', NULL, 1),
(7, 'PINTEREST', '2015-10-20 20:14:13', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_sociales_usadas`
--

CREATE TABLE IF NOT EXISTS `redes_sociales_usadas` (
  `id_ redes_sociales_usadas` int(11) NOT NULL,
  `id_red_social` int(11) NOT NULL,
  `id_padre_representante` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las redes sociales usadas por padre o rep';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE IF NOT EXISTS `representantes` (
  `id_representante` int(11) NOT NULL,
  `id_parentesco` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_redes_sociales` int(11) DEFAULT NULL,
  `id_empleo` int(11) DEFAULT NULL,
  `id_escala_ingreso` int(11) DEFAULT NULL,
  `id_estado_civil` int(11) DEFAULT NULL,
  `ingreso_mensual` decimal(8,2) DEFAULT NULL,
  `diversidad_funcional` varchar(150) DEFAULT NULL,
  `trabaja` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1',
  `otros_ingresos` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los representantes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sacramentos`
--

CREATE TABLE IF NOT EXISTS `sacramentos` (
  `id_sacramento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los sacramentos disponibles para los estu';

--
-- Volcado de datos para la tabla `sacramentos`
--

INSERT INTO `sacramentos` (`id_sacramento`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'BAUTIZO', '2015-10-20 20:17:59', NULL, 1),
(2, 'PRIMERA COMUNION', '2015-10-20 20:17:59', NULL, 1),
(3, 'CONFIRMACION', '2015-10-20 20:17:59', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sacramentos_recibidos`
--

CREATE TABLE IF NOT EXISTS `sacramentos_recibidos` (
  `id_sacramentos_recibidos` int(11) NOT NULL,
  `id_sacramento` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los sacramentos recibidos po';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE IF NOT EXISTS `secciones` (
  `id_seccion` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `nombre_seccion` varchar(45) NOT NULL,
  `abreviacion_seccion` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de las secciones por grado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE IF NOT EXISTS `sesiones` (
  `id_sesion` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `direccion_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabla que contiene las sesiones de los usuarios';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexos`
--

CREATE TABLE IF NOT EXISTS `sexos` (
  `id_sexo` int(11) NOT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los tipos de sexo';

--
-- Volcado de datos para la tabla `sexos`
--

INSERT INTO `sexos` (`id_sexo`, `sexo`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'MASCULINO', '2015-10-20 20:09:17', NULL, 1),
(2, 'FEMENINO', '2015-10-20 20:09:17', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE IF NOT EXISTS `telefonos` (
  `id_telefono` int(11) NOT NULL,
  `id_tipo_telefono` int(11) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los teléfonos de las person';

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `id_tipo_telefono`, `telefono`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 1, '02129050000', '2015-10-20 20:21:10', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_direcciones`
--

CREATE TABLE IF NOT EXISTS `tipo_direcciones` (
  `id_tipo_direccion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene el listado de tipo de direcciones';

--
-- Volcado de datos para la tabla `tipo_direcciones`
--

INSERT INTO `tipo_direcciones` (`id_tipo_direccion`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'TRABAJO', '2015-10-20 20:07:33', NULL, 1),
(2, 'CASA', '2015-10-20 20:07:33', NULL, 1),
(3, 'FAMILIAR', '2015-10-20 20:07:33', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_parto`
--

CREATE TABLE IF NOT EXISTS `tipo_parto` (
  `id_tipo_parto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene el listado de tipo de partos';

--
-- Volcado de datos para la tabla `tipo_parto`
--

INSERT INTO `tipo_parto` (`id_tipo_parto`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'NATURAL', '2015-10-20 20:08:48', NULL, 1),
(2, 'CESAREA', '2015-10-20 20:08:48', NULL, 1),
(3, 'FORCEPS', '2015-10-20 20:08:48', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_telefonos`
--

CREATE TABLE IF NOT EXISTS `tipo_telefonos` (
  `id_tipo_telefono` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene el listado de tipo de telefonos';

--
-- Volcado de datos para la tabla `tipo_telefonos`
--

INSERT INTO `tipo_telefonos` (`id_tipo_telefono`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'TRABAJO', '2015-10-20 20:06:57', NULL, 1),
(2, 'CELULAR', '2015-10-20 20:06:57', NULL, 1),
(3, 'CASA', '2015-10-20 20:06:57', NULL, 1),
(4, 'OTRO', '2015-10-20 20:06:57', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `usuario` varchar(80) DEFAULT NULL,
  `clave` varchar(80) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los datos de los usuarios';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `usuario`, `clave`, `correo_electronico`, `activo`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 1, 'bd6dbd063f5ab7394879e3c08781cd72', 'bd6dbd063f5ab7394879e3c08781cd72', '30b38d0829c68a7c157f92cfeaaf29cc', 1, '2015-10-20 21:26:43', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vive_con`
--

CREATE TABLE IF NOT EXISTS `vive_con` (
  `id_vive_con` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `registro_activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene el listado de las personas con quien pued';

--
-- Volcado de datos para la tabla `vive_con`
--

INSERT INTO `vive_con` (`id_vive_con`, `nombre`, `fecha_creacion`, `fecha_actualizacion`, `registro_activo`) VALUES
(1, 'PADRE', '2015-10-20 20:10:09', NULL, 1),
(2, 'MADRE', '2015-10-20 20:10:09', NULL, 1),
(3, 'TIO', '2015-10-20 20:10:09', NULL, 1),
(4, 'TIA', '2015-10-20 20:10:09', NULL, 1),
(5, 'HERMANO', '2015-10-20 20:10:09', NULL, 1),
(6, 'HERMANA', '2015-10-20 20:10:09', NULL, 1),
(7, 'ABUELO', '2015-10-20 20:10:09', NULL, 1),
(8, 'ABUELA', '2015-10-20 20:10:09', NULL, 1),
(9, 'OTRO', '2015-10-20 20:10:09', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD UNIQUE KEY `id_asistencia_UNIQUE` (`id_asistencia`),
  ADD KEY `fk_asistencias_estudiantes1_idx` (`id_estudiante`);

--
-- Indices de la tabla `censo`
--
ALTER TABLE `censo`
  ADD PRIMARY KEY (`idcenso`),
  ADD UNIQUE KEY `idcenso_UNIQUE` (`idcenso`);

--
-- Indices de la tabla `condicion_vivienda`
--
ALTER TABLE `condicion_vivienda`
  ADD PRIMARY KEY (`id_condicion_vivienda`),
  ADD UNIQUE KEY `id_vive_con_UNIQUE` (`id_condicion_vivienda`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`id_configuracion`),
  ADD UNIQUE KEY `id_configuracion_UNIQUE` (`id_configuracion`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`id_direccion`),
  ADD UNIQUE KEY `id_direccion_UNIQUE` (`id_direccion`),
  ADD KEY `fk_direcciones_tipo_direcciones1_idx` (`id_tipo_direccion`),
  ADD KEY `fk_direcciones_paises1_idx` (`id_pais`),
  ADD KEY `fk_direcciones_estados1_idx` (`id_estado`),
  ADD KEY `fk_direcciones_municipios1_idx` (`id_municipio`),
  ADD KEY `fk_direcciones_parroquias1_idx` (`id_parroquia`);

--
-- Indices de la tabla `empleos`
--
ALTER TABLE `empleos`
  ADD PRIMARY KEY (`id_empleo`),
  ADD UNIQUE KEY `id_empleo_UNIQUE` (`id_empleo`),
  ADD KEY `fk_empleos_jornadas1_idx` (`id_jornada_laboral`),
  ADD KEY `fk_empleos_direcciones1_idx` (`id_direccion_empresa`);

--
-- Indices de la tabla `escala_ingresos`
--
ALTER TABLE `escala_ingresos`
  ADD PRIMARY KEY (`id_escala_ingreso`);

--
-- Indices de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD PRIMARY KEY (`id_escuela`),
  ADD UNIQUE KEY `idescuela_UNIQUE` (`id_escuela`),
  ADD KEY `fk_escuelas_telefonos1_idx` (`id_telefono_escuela`),
  ADD KEY `fk_escuelas_direcciones1_idx` (`id_direccion_escuela`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`),
  ADD UNIQUE KEY `id_pais_UNIQUE` (`id_estado`),
  ADD KEY `fk_estados_paises1_idx` (`id_pais`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD UNIQUE KEY `id_estudiante_UNIQUE` (`id_estudiante`),
  ADD UNIQUE KEY `cedula_escolar_UNIQUE` (`cedula_escolar`),
  ADD UNIQUE KEY `cedula_identidad_UNIQUE` (`cedula_identidad`),
  ADD KEY `fk_estudiantes_condicion_vivienda1_idx` (`id_condicion_vivienda`),
  ADD KEY `fk_estudiantes_medio_transporte1_idx` (`id_medio_transporte`),
  ADD KEY `fk_estudiantes_escuelas1_idx` (`id_escuela`),
  ADD KEY `fk_estudiantes_tipo_parto1_idx` (`id_tipo_parto`),
  ADD KEY `fk_estudiantes_personas1_idx` (`id_persona`),
  ADD KEY `fk_estudiantes_grados1_idx` (`id_grado`),
  ADD KEY `fk_estudiantes_secciones1_idx` (`id_seccion`),
  ADD KEY `fk_estudiantes_vive_con1_idx` (`id_vive_con`),
  ADD KEY `fk_estudiantes_telefonos1_idx` (`id_telefono`),
  ADD KEY `fk_estudiantes_direcciones1_idx` (`id_direccion_nacimiento`),
  ADD KEY `fk_estudiantes_direcciones2_idx` (`id_direccion_residencia`),
  ADD KEY `fk_estudiantes_escala_ingresos1_idx` (`id_escala_ingreso_familia`),
  ADD KEY `fk_estudiantes_personas2_idx` (`id_persona_emergencia_uno`),
  ADD KEY `fk_estudiantes_personas3_idx` (`id_persona_emergencia_dos`);

--
-- Indices de la tabla `grado_escuela`
--
ALTER TABLE `grado_escuela`
  ADD PRIMARY KEY (`id_grado_escuela`),
  ADD KEY `fk_grado_escuela_grados1_idx` (`id_grado`),
  ADD KEY `fk_grado_escuela_escuelas1_idx` (`id_escuela`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id_grado`),
  ADD UNIQUE KEY `id_grado_UNIQUE` (`id_grado`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`id_jornadas`),
  ADD UNIQUE KEY `id_tipo_direccion_UNIQUE` (`id_jornadas`);

--
-- Indices de la tabla `log_base_datos`
--
ALTER TABLE `log_base_datos`
  ADD PRIMARY KEY (`id_log_base_datos`),
  ADD UNIQUE KEY `id_log_base_datos_UNIQUE` (`id_log_base_datos`);

--
-- Indices de la tabla `maestro_grado`
--
ALTER TABLE `maestro_grado`
  ADD PRIMARY KEY (`id_maestro_grado`),
  ADD UNIQUE KEY `id_maestro_grado_UNIQUE` (`id_maestro_grado`),
  ADD KEY `fk_maestro_grado_grados1_idx` (`id_grado`),
  ADD KEY `fk_maestro_grado_maestros1_idx` (`id_maestro`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`id_maestro`),
  ADD UNIQUE KEY `idmaestro_UNIQUE` (`id_maestro`),
  ADD UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  ADD KEY `fk_maestros_escuelas1_idx` (`id_escuela`);

--
-- Indices de la tabla `medio_transporte`
--
ALTER TABLE `medio_transporte`
  ADD PRIMARY KEY (`id_medio_transporte`),
  ADD UNIQUE KEY `id_vive_con_UNIQUE` (`id_medio_transporte`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD UNIQUE KEY `id_pais_UNIQUE` (`id_municipio`),
  ADD KEY `fk_municipios_estados1_idx` (`id_estado`);

--
-- Indices de la tabla `padres`
--
ALTER TABLE `padres`
  ADD PRIMARY KEY (`id_padre`),
  ADD UNIQUE KEY `id_padre_UNIQUE` (`id_padre`),
  ADD UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  ADD KEY `fk_padres_empleos1_idx` (`id_empleo`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`),
  ADD UNIQUE KEY `id_pais_UNIQUE` (`id_pais`);

--
-- Indices de la tabla `parentescos`
--
ALTER TABLE `parentescos`
  ADD PRIMARY KEY (`id_parentesco`),
  ADD UNIQUE KEY `id_parentesco_UNIQUE` (`id_parentesco`);

--
-- Indices de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD PRIMARY KEY (`id_parroquia`),
  ADD KEY `fk_parroquia_municipio1` (`id_municipio`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  ADD KEY `fk_personas_direcciones1_idx` (`id_direccion_persona`),
  ADD KEY `fk_personas_tipo_telefonos1_idx` (`id_telefono_persona`),
  ADD KEY `fk_personas_sexos1_idx` (`id_sexo`),
  ADD KEY `fk_personas_paises1_idx` (`id_pais_nacimiento`);

--
-- Indices de la tabla `recaudos`
--
ALTER TABLE `recaudos`
  ADD PRIMARY KEY (`id_recaudo`),
  ADD UNIQUE KEY `id_recaudo_UNIQUE` (`id_recaudo`);

--
-- Indices de la tabla `recaudos_grado`
--
ALTER TABLE `recaudos_grado`
  ADD PRIMARY KEY (`id_recaudo_grado`),
  ADD UNIQUE KEY `id_recaudo_grado_UNIQUE` (`id_recaudo_grado`),
  ADD KEY `fk_recaudos_grado_grados1_idx` (`id_grado`),
  ADD KEY `fk_recaudos_grado_recaudos1_idx` (`id_recaudo`);

--
-- Indices de la tabla `redes_sociales`
--
ALTER TABLE `redes_sociales`
  ADD PRIMARY KEY (`id_redes_social`);

--
-- Indices de la tabla `redes_sociales_usadas`
--
ALTER TABLE `redes_sociales_usadas`
  ADD PRIMARY KEY (`id_ redes_sociales_usadas`),
  ADD UNIQUE KEY `id_ redes_sociales_usadas_UNIQUE` (`id_ redes_sociales_usadas`),
  ADD KEY `fk_redes_sociales_usadas_redes_sociales1_idx` (`id_red_social`),
  ADD KEY `fk_redes_sociales_usadas_padres1_idx` (`id_padre_representante`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id_representante`),
  ADD UNIQUE KEY `id_representante_UNIQUE` (`id_representante`),
  ADD UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  ADD KEY `fk_representantes_escala_ingresos1_idx` (`id_escala_ingreso`),
  ADD KEY `fk_representantes_parentescos1_idx` (`id_parentesco`),
  ADD KEY `fk_representantes_empleos1_idx` (`id_empleo`);

--
-- Indices de la tabla `sacramentos`
--
ALTER TABLE `sacramentos`
  ADD PRIMARY KEY (`id_sacramento`),
  ADD UNIQUE KEY `id_vive_con_UNIQUE` (`id_sacramento`);

--
-- Indices de la tabla `sacramentos_recibidos`
--
ALTER TABLE `sacramentos_recibidos`
  ADD PRIMARY KEY (`id_sacramentos_recibidos`),
  ADD UNIQUE KEY `id_vive_con_UNIQUE` (`id_sacramentos_recibidos`),
  ADD KEY `fk_sacramentos_recibidos_sacramentos1_idx` (`id_sacramento`),
  ADD KEY `fk_sacramentos_recibidos_estudiantes1_idx` (`id_estudiante`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id_seccion`),
  ADD UNIQUE KEY `id_seccion_UNIQUE` (`id_seccion`),
  ADD KEY `fk_secciones_grados1_idx` (`id_grado`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `fecha_sesiones` (`fecha`);

--
-- Indices de la tabla `sexos`
--
ALTER TABLE `sexos`
  ADD PRIMARY KEY (`id_sexo`),
  ADD UNIQUE KEY `id_sexo_UNIQUE` (`id_sexo`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`),
  ADD UNIQUE KEY `id_telefono_UNIQUE` (`id_telefono`),
  ADD KEY `fk_telefonos_tipo_telefonos1_idx` (`id_tipo_telefono`);

--
-- Indices de la tabla `tipo_direcciones`
--
ALTER TABLE `tipo_direcciones`
  ADD PRIMARY KEY (`id_tipo_direccion`),
  ADD UNIQUE KEY `id_tipo_direccion_UNIQUE` (`id_tipo_direccion`);

--
-- Indices de la tabla `tipo_parto`
--
ALTER TABLE `tipo_parto`
  ADD PRIMARY KEY (`id_tipo_parto`),
  ADD UNIQUE KEY `id_vive_con_UNIQUE` (`id_tipo_parto`);

--
-- Indices de la tabla `tipo_telefonos`
--
ALTER TABLE `tipo_telefonos`
  ADD PRIMARY KEY (`id_tipo_telefono`),
  ADD UNIQUE KEY `id_tipo_telefono_UNIQUE` (`id_tipo_telefono`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  ADD UNIQUE KEY `id_persona_UNIQUE` (`id_persona`);

--
-- Indices de la tabla `vive_con`
--
ALTER TABLE `vive_con`
  ADD PRIMARY KEY (`id_vive_con`),
  ADD UNIQUE KEY `id_vive_con_UNIQUE` (`id_vive_con`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'object id';
--
-- AUTO_INCREMENT de la tabla `censo`
--
ALTER TABLE `censo`
  MODIFY `idcenso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `condicion_vivienda`
--
ALTER TABLE `condicion_vivienda`
  MODIFY `id_condicion_vivienda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id_configuracion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `empleos`
--
ALTER TABLE `empleos`
  MODIFY `id_empleo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `escala_ingresos`
--
ALTER TABLE `escala_ingresos`
  MODIFY `id_escala_ingreso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `id_escuela` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `id_jornadas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `log_base_datos`
--
ALTER TABLE `log_base_datos`
  MODIFY `id_log_base_datos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `maestro_grado`
--
ALTER TABLE `maestro_grado`
  MODIFY `id_maestro_grado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `maestros`
--
ALTER TABLE `maestros`
  MODIFY `id_maestro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medio_transporte`
--
ALTER TABLE `medio_transporte`
  MODIFY `id_medio_transporte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `padres`
--
ALTER TABLE `padres`
  MODIFY `id_padre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parentescos`
--
ALTER TABLE `parentescos`
  MODIFY `id_parentesco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `recaudos`
--
ALTER TABLE `recaudos`
  MODIFY `id_recaudo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `recaudos_grado`
--
ALTER TABLE `recaudos_grado`
  MODIFY `id_recaudo_grado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `redes_sociales`
--
ALTER TABLE `redes_sociales`
  MODIFY `id_redes_social` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `redes_sociales_usadas`
--
ALTER TABLE `redes_sociales_usadas`
  MODIFY `id_ redes_sociales_usadas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `id_representante` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sacramentos`
--
ALTER TABLE `sacramentos`
  MODIFY `id_sacramento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sacramentos_recibidos`
--
ALTER TABLE `sacramentos_recibidos`
  MODIFY `id_sacramentos_recibidos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sexos`
--
ALTER TABLE `sexos`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_direcciones`
--
ALTER TABLE `tipo_direcciones`
  MODIFY `id_tipo_direccion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_parto`
--
ALTER TABLE `tipo_parto`
  MODIFY `id_tipo_parto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_telefonos`
--
ALTER TABLE `tipo_telefonos`
  MODIFY `id_tipo_telefono` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `vive_con`
--
ALTER TABLE `vive_con`
  MODIFY `id_vive_con` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `fk_asistencias_estudiantes1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `fk_direcciones_estados1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_direcciones_municipios1` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_direcciones_paises1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_direcciones_parroquias1` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquias` (`id_parroquia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_direcciones_tipo_direcciones1` FOREIGN KEY (`id_tipo_direccion`) REFERENCES `tipo_direcciones` (`id_tipo_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleos`
--
ALTER TABLE `empleos`
  ADD CONSTRAINT `fk_empleos_direcciones1` FOREIGN KEY (`id_direccion_empresa`) REFERENCES `direcciones` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleos_jornadas1` FOREIGN KEY (`id_jornada_laboral`) REFERENCES `jornadas` (`id_jornadas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD CONSTRAINT `fk_escuelas_direcciones1` FOREIGN KEY (`id_direccion_escuela`) REFERENCES `direcciones` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_escuelas_telefonos1` FOREIGN KEY (`id_telefono_escuela`) REFERENCES `telefonos` (`id_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `fk_estados_paises1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `fk_estudiantes_condicion_vivienda1` FOREIGN KEY (`id_condicion_vivienda`) REFERENCES `condicion_vivienda` (`id_condicion_vivienda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_direcciones1` FOREIGN KEY (`id_direccion_nacimiento`) REFERENCES `direcciones` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_direcciones2` FOREIGN KEY (`id_direccion_residencia`) REFERENCES `direcciones` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_escala_ingresos1` FOREIGN KEY (`id_escala_ingreso_familia`) REFERENCES `escala_ingresos` (`id_escala_ingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_escuelas1` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_grados1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_medio_transporte1` FOREIGN KEY (`id_medio_transporte`) REFERENCES `medio_transporte` (`id_medio_transporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_personas1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_personas2` FOREIGN KEY (`id_persona_emergencia_uno`) REFERENCES `personas` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_personas3` FOREIGN KEY (`id_persona_emergencia_dos`) REFERENCES `personas` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_secciones1` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_telefonos1` FOREIGN KEY (`id_telefono`) REFERENCES `telefonos` (`id_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_tipo_parto1` FOREIGN KEY (`id_tipo_parto`) REFERENCES `tipo_parto` (`id_tipo_parto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_vive_con1` FOREIGN KEY (`id_vive_con`) REFERENCES `vive_con` (`id_vive_con`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grado_escuela`
--
ALTER TABLE `grado_escuela`
  ADD CONSTRAINT `fk_grado_escuela_escuelas1` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grado_escuela_grados1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `maestro_grado`
--
ALTER TABLE `maestro_grado`
  ADD CONSTRAINT `fk_maestro_grado_grados1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_maestro_grado_maestros1` FOREIGN KEY (`id_maestro`) REFERENCES `maestros` (`id_maestro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD CONSTRAINT `fk_maestros_escuelas1` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_maestros_personas1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_municipios_estados1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `padres`
--
ALTER TABLE `padres`
  ADD CONSTRAINT `fk_padres_empleos1` FOREIGN KEY (`id_empleo`) REFERENCES `empleos` (`id_empleo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_padres_personas1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD CONSTRAINT `fk_parroquia_municipio1` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `fk_personas_direcciones1` FOREIGN KEY (`id_direccion_persona`) REFERENCES `direcciones` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personas_paises1` FOREIGN KEY (`id_pais_nacimiento`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personas_sexos1` FOREIGN KEY (`id_sexo`) REFERENCES `sexos` (`id_sexo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personas_tipo_telefonos1` FOREIGN KEY (`id_telefono_persona`) REFERENCES `tipo_telefonos` (`id_tipo_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recaudos_grado`
--
ALTER TABLE `recaudos_grado`
  ADD CONSTRAINT `fk_recaudos_grado_grados1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recaudos_grado_recaudos1` FOREIGN KEY (`id_recaudo`) REFERENCES `recaudos` (`id_recaudo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `redes_sociales_usadas`
--
ALTER TABLE `redes_sociales_usadas`
  ADD CONSTRAINT `fk_redes_sociales_usadas_padres1` FOREIGN KEY (`id_padre_representante`) REFERENCES `padres` (`id_padre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_redes_sociales_usadas_redes_sociales1` FOREIGN KEY (`id_red_social`) REFERENCES `redes_sociales` (`id_redes_social`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_redes_sociales_usadas_representantes1` FOREIGN KEY (`id_padre_representante`) REFERENCES `representantes` (`id_representante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `fk_representantes_empleos1` FOREIGN KEY (`id_empleo`) REFERENCES `empleos` (`id_empleo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_representantes_escala_ingresos1` FOREIGN KEY (`id_escala_ingreso`) REFERENCES `escala_ingresos` (`id_escala_ingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_representantes_parentescos1` FOREIGN KEY (`id_parentesco`) REFERENCES `parentescos` (`id_parentesco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_representantes_personas1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sacramentos_recibidos`
--
ALTER TABLE `sacramentos_recibidos`
  ADD CONSTRAINT `fk_sacramentos_recibidos_estudiantes1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sacramentos_recibidos_sacramentos1` FOREIGN KEY (`id_sacramento`) REFERENCES `sacramentos` (`id_sacramento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `fk_secciones_grados1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `fk_telefonos_tipo_telefonos1` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `tipo_telefonos` (`id_tipo_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_personas1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
