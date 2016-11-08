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
				header('Location: registrar_notas.php');
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

	<section class="contenedor-informacion">
		<article class="info-principal">
			<h2 class="nombre"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> Nombre: "Felipe Fermin Paul"</h2>
			<h2 class="nombre"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> Ubicación: Caracas - Antimano</h2>
			<p><strong class="resaltar">Reseña Histórica:</strong> 
			Actualmente se puede hablar de dos etapas del liceo: la primera que trascurrió en la edificación que hoy ocupa El Liceo Creación Antimano en la calle cruz verde de la  Parroquia Antimano. solamente se impartían   los  tres primeros niveles  (El Básico)  y  luego una  segunda etapa   que comenzó la actual sede  , en un área que era  de una  antigua mansión de la época de Guzmán Blanco  y que  perteneció luego a Juan Vicente  Gómez ,por tanto  los terrenos tomados indemnizaron a unos particulares Reseña donde se comenzó además del básico ,el diversificado con las menciones de ciencias  y Administración.
			</p>
			<p><strong class="resaltar">Año de fundación y quién y/o quienes lo fundaron:</strong>
			Nace en el año lectivo 71-72  y con alumnos solo en  primer año su Director fundador  fue Parmenio  García y Sub Directora la profesora Hilda Grabielle  nombrare algunos  profesores ,Egle Lopez Del Corral ,Omaira Martinez ,Poncio Carreño ,William Alvares ,Augusto Loroño , Iraima Chaparro , Emilio Heredia , Carmelo Salazar ,Sarita ,Ferrer ,Chacón , Francisco adrian y otros
			</p>
			<p><strong class="resaltar">Qué era la edificación antes de ser una institución: </strong>
			La primero me réferi a un edificio de apartamentos, la segunda  a una  gran mansión de la época de guzmán Blanco ¿En qué año comenzó a funcionar la edificación como institución educativa? : La edificación  nueva en el año 1985.
			</p>
			<p><strong class="resaltar">Por qué se decide ponerle el nombre de Felipe Fermín Paúl:</strong>
			Felipe  Fermín Paul fue  diputado y redacto junto con otros  El Acta de Independencia (Caracas, 1774- id., 1843) Político venezolano. Elegido presidente del primer Congreso de Venezuela (1811), suscribió el Acta de Independencia. Diputado en las Cortes españolas, residió en Madrid entre 1817 y 1823. A su vuelta fue ministro del Interior y de Justicia (1837).
			</p>
			<p>
			Asi mismo siempre nos hemos regido por unas palabras de famosos educadores muy esenciales, Según Andres bello “Un buen método de enseñanza no tanto se propone comunicar mucha ciencia al estudiante, cuanto dar a su entendimiento poderoso impulso y rumbo cierto”
			</p>
			<p>
			Siguiendo el mismo orden de ideas esta institución se prestó con mucho respeto y solidaridad para todos los integrantes de antes mencionada comunidad que a sucumbir en las diferentes protesta y descontentos que por un tiempo se avecinaron en la amada caracas, el colegio después convertido en liceo se unió a los habitantes para realizar pacíficamente protesta en auxilio de las necesidades que presentaba tanto la institución como la población en cuestión, así mismo el liceo Felipe Fermín Paul siempre se ha encontrado involucrado en cada uno de los hechos que han trascurrido en la parroquia inculcando a sus alumnos, docentes y obreros la continuidad de esta acción, con el fin de crear amor a su colegio como a su comunidad.
			</p>
			<p>
			Por consiguiente los alumnos que culminaban el básico eran asignados a liceos de la  parroquia  Caricuao .todo esto agregado al deterioro que presentaba  la sede inicial ,edificación hecha  por  un particular (edificio de apartamentos ) nos  llevó a emprender una  lucha  de toda  la comunidad  (profesores ,representantes y alumnos ) para lograr una  nueva sede ,la actual y que está construida que lo ocupaban .La construcción duro  varios años y bajo fuerte  presión de la comunidad se logró su culminación. Es bueno agregar que si bien logramos  una  nueva edificación, hubo la necesidad de dejar la antigua sede con  todo su deterioro, para  que naciera  una nueva institución educativa “Creación Antimano“ 
			</p>
		</article>
	</section>

<?php require_once('TEMPLATE/pie_pagina.php');  ?>