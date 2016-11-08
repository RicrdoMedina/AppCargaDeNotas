<?php 
require_once('PHP/Sesion.php');
require_once('TEMPLATE/header.php');

if (! empty($_POST)) {
	/*Creamos la instancia del objeto. Ya estamos conectados*/
	$bd = Db::getInstance();

	/*Creamos una query sencilla*/
	$sql = "SELECT * FROM usuarios WHERE usuario_sistema = '".$_POST['usuario']."' and password = '".$_POST['pass']."'";

	/*Ejecutamos la query*/
	$stmt = $bd->ejecutar($sql);

	if ($x=$bd->obtener_fila($stmt,0)){

		if($x['activo'] == 1){
			$data = array(
				'usuario' 	=> $x['usuario_sistema'],
				'id' 	=> $x['id'],
				'cedula' 	=> $x['cedula'],
				'fullname' 	=> $x['primer_nombre'].' '.$x['primer_apellido'],
				'rol' 	=> $x['rol']
				);

			$Sesion = new Sesion();

			$Sesion->set($data);

			if($x['rol'] == 'Admin'){
				header('Location: registrar_profesor.php');
			}else{
				header('Location: consultar_notas.php');
			}
		}
		if($x['activo'] == 2){

			$data = array(
				'usuario' 	=> $x['usuario_sistema'],
				'id' 	=> $x['id'],
				'cedula' 	=> $x['cedula'],
				'fullname' 	=> $x['primer_nombre'].' '.$x['primer_apellido'],
				'rol' 	=> $x['rol']
			);

			$Sesion = new Sesion();

			$Sesion->set($data);
			
			header('Location: cambiar_clave.php');
		}
	}
	else
	{
		$mensaje = "Verifique sus datos!";
	}

}

?>
	<div class="contenedor-titulo">
		<i class="fa fa-arrow-circle-right"></i> Historia <span class="titulo-palabra">Unidad Educativa "Felipe Fermin Paul"</span>
	</div>

	<aside class="contenedor menu">

		<?php require_once('TEMPLATE/form_login.php');  ?>

	</aside>
	<section class="contenedor">
		<article class="index texto">
			<p>El Liceo Fermín Toro (oficialmente Liceo Bolivariano de Formación Cultural Fermín Toro) es una institución venezolana de educación secundaria (bachillerato) fundado en 1936. Tomó su nombre del escritor venezolano Fermín Toro siendo un centro educativo de carácter público financiado por el estado venezolano.</p>
			<p>Su construcción fue ordenada por el presidente Antonio Guzmán Blanco a unos paisajistas franceses para crear un jardín botánico y paseo en la colina de El Calvario, la obra fue inaugurada en 1883 con el nombre de Paseo Guzmán Blanco.</p>
			<p>Actualmente se puede hablar de dos etapas del liceo: la primera que trascurrió en la edificación que hoy ocupa El Liceo Creación Antimano en la calle cruz verde de la  Parroquia Antimano. solamente se impartían   los  tres primeros niveles  (El Básico)  y  luego una  segunda etapa   que comenzó la actual sede  , en un área que era  de una  antigua mansión de la época de Guzmán Blanco  y que  perteneció luego a Juan Vicente  Gómez ,por tanto  los terrenos tomados indemnizaron a unos particulares Reseña donde se comenzó además del básico ,el diversificado con las menciones de ciencias  y Administración.</p>
			<span id="leer-mas"><a href="informacion_completa.php" target="_blank">Leer más</a></span>
		</article>

		<aside class="index enlaces">
			<aside class="publicidad">
				<div class="titulos"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Interes</div>
				<figure class="logo-img fade-img">
					<a href="http://www.minci.gob.ve/wp-content/uploads/2013/12/Plan-de-la-Patria-libro.pdf" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/plandelapatria.png" title="Plan de la Patria 2013-2019">
					</a>
				</figure>

				<figure class="logo-img fade-img">
					<a href="http://formaciondocente.mppeuct.gob.ve/" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/bannersnfpdu.jpg" title="Sistema Nacional de Formación Permanente del Docente Universitario">
					</a>
				</figure>

				<figure class="logo-img fade-img">
					<a href="http://formaciondocente.mppeuct.gob.ve/" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/top5.png" title="Libro de Oportunidades de Estudio Universitario 2016">
					</a>
				</figure>
			</aside>
		</aside>
	</section>

<?php require_once('TEMPLATE/pie_pagina.php');  ?>