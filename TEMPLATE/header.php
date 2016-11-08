<?php
	require_once('PHP/DB.php');
	setlocale(LC_ALL,"es","es_ES","esp");

	$Sesion = new Sesion();
	$fullname = $Sesion->get('fullname');
	$ci_usuario = $Sesion->get('cedula');
	$rol = $Sesion->get('rol');

	header('Content-Type: text/html; charset=UTF-8'); 
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="description" content="Sistema para el Control de Carga de Notas, Colegio Universitario Francisco de Miranda" />
  <title>Carga de Notas, <?php  echo strftime("%d de %B del %Y"); ?></title>
  <link rel="stylesheet" href="font-awesome/css/font-awesome.css" />
  <link rel="stylesheet" href="CSS/style.css" />
  <link rel="stylesheet" href="CSS/tabs.css" />
  
</head>
<body>
	<header class="encabezado">

		<div class="contenedor-banner">
			<div class="imagen-banner contenedor-imagen1">
				<img class="imagen_1" src="IMAGENES/banner_1.png">
			</div>
			<div class="imagen-banner contenedor-imagen2">
				<img class="imagen_2" src="IMAGENES/banner_2.jpg">
			</div>
		</div>

		<div class="contenedor-colegio">
			<div class="imagen-colegio">
				<img class="logo-colegio" src="IMAGENES/header_1.jpg">
			</div>
			<div class="imagen-colegio nombre-colegio">
				<h1>Unidad Educativa Liceo "Felipe Fermin Paul"</h1>
				<h1>Sistema para el Control de Carga de Notas</h1>
			</div>
			<div class="imagen-colegio">
				<img class="logo-colegio" src="IMAGENES/header_2.jpg">
			</div>
		</div>

		<div class="barra-usuario">
			<div class="barra-item">
				<p class="fecha"><i class="fa fa-calendar"></i> 
				Caracas, <?php  echo strftime("%A %d de %B del %Y"); ?></p>
			</div>
			<div class="barra-item contenedor-datos-usuario">
				
				<?php
					if (! empty($fullname) and ! empty($rol))
					{
				?>
						<i class="fa fa-user"></i>
				<?php
						echo $rol.': '.$fullname;
					}
				?>
			</div>
			<div class="barra-item contenedor-salir">
				<?php
					if (! empty($fullname) and ! empty($rol)) 
					{
				?>
					<div class="boton">
						<a href="PHP/cerrar.php">
							<i class="fa fa-sign-out"></i> 
							Salir
						</a>
					</div>
				<?php
					}
				?>
			</div>
		</div>
		
	</header>

	<section class="seccion-principal">