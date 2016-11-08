<?php
	require_once('../PHP/Sesion.php');

	$Sesion = new Sesion();
	$Sesion->borrarVariables();
	$Sesion->cerrarSesion();

	header('Location: ../index.php');
?>