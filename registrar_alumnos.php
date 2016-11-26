	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');

		$bd = Db::getInstance();
		if(! empty($_POST)){

			$mensaje = '';
			$error= 0;

			$data_cedula = array();

			for ($i=0; $i < $_POST['cantidad_estudiantes']; $i++) { 
			   /*Creamos una query sencilla*/
				$sql = "select * from alumnos where cedula_alumno = '".$_POST['ci' . $i]."'";

				/*Ejecutamos la query*/
				$stmt = $bd->ejecutar($sql);

				if($x=$bd->obtener_fila($stmt,0)){
					$error= 1;
				}
			}

			if($error == 0){
				for ($i=0; $i < $_POST['cantidad_estudiantes']; $i++) { 
				    //echo $_POST['materia' . $i];
				    $porciones_nombres = explode(" ", $_POST['pnombre' . $i]);

					@$segundo_nombre = $porciones_nombres[1];

					$primer_nombre= $porciones_nombres[0];

					$porciones_apellidos = explode(" ", $_POST['papellido'. $i]);

					@$segundo_apellido = $porciones_apellidos[1];

					$primer_apellido = $porciones_apellidos[0];
				    $sql = "insert into alumnos values('','".$_POST['ci' . $i]."','". ucwords(strtolower($primer_nombre)) ."','". ucwords(strtolower($segundo_nombre)) ."','". ucwords(strtolower($primer_apellido)) ."','". ucwords(strtolower($segundo_apellido)) ."','". $_POST['seccion'] ."','". ucwords(strtolower($_POST['nombres_representate' . $i])) ."','". ucwords(strtolower($_POST['apellidos_representate' . $i])) ."')";
	            	$stmt = $bd->ejecutar($sql);
				}

				$sqlt = "UPDATE secciones SET id_prof_guia = '".$_POST['pguia']."' where id_secc = '".$_POST['seccion']."'";
                $stmt = $bd->ejecutar($sqlt);

				$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Su registro fue exitoso!</p>';
			}

		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Alumnos</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">

			

		

			<form action="" method="post">
				
				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Información del curso</legend>


						<span class="span-inline">
							<label for="grado">Grado</label>
							<select  class="grado" id="grado" name="grado" required>
								<option value='1'>Quinto</option>
							</select>
						</span>


						<span class="span-inline">
							<label for="secciones">Sección</label>
							<select  class="seccion" id="seccion" name="seccion" required>
							   <?php

								/*Creamos una query sencilla*/
								$sql = "select * from secciones";

								/*Ejecutamos la query*/
								$stmt=$bd->ejecutar($sql);

								echo "<option value='' selected='selected'> ---- </option>";
								
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

								?>
									<option value='<?php echo $x['id_secc']; ?>'><?php echo $x['nombre_seccion']; ?></option>
								<?php
								}

								?>
							</select>
						</span>
						<span class="span-inline">
							<label for="aescolar">Año Escolar</label>
							<select  class="aescolar" id="aescolar" name="aescolar" required>
								<option value='2015-2016'>2015-2016</option>
							</select>
						</span>
						<span class="span-inline">
							<label for="pguia">Profesor (a) Guia</label>
							<select  class="pguia" id="pguia" name="pguia" >
							   <?php

								/*Creamos una query sencilla*/
								$sql = "select * from usuarios where rol = 'Profesor' order by primer_nombre asc";

								/*Ejecutamos la query*/
								$stmt=$bd->ejecutar($sql);

								echo "<option value='' selected='selected'> ---- </option>";
								
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

								?>
									<option value='<?php echo $x['id']; ?>'><?php echo $x['primer_nombre']." ".$x['segundo_apellido']; ?></option>
								<?php
								}

								?>
							</select>
						</span>

					</fieldset>
				</div>
			<?php
				if ( isset($error) and $error == 1) {
				?>
					<div class="alert alert-danger"> 
						<?php 
				    		echo "<p class='msj-grupos'> <i class='fa fa-times-circle-o' aria-hidden='true'></i> Ingreso una cédula que ya existe en la base de datos, debido a esto no se registro el alumno!</p>";
						?>
					</div>
				<?php
				}
				if (! empty($insercion)) {
				?>
					<div class="alert alert-success"> <?php echo $insercion; ?></div>
				<?php
				}
							
			?>
				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Agregar estudiantes</legend>

						<span class="span-inline">
							<label for="cestudiantes">Catidad de estudiantes</label>
							<input type="number" min="0" max="38" id="cantidadItems" data-id="cargar-estuadiantes" name="cantidad_estudiantes" value="" placeholder="0"  required>
						</span>
						<div class="showElements" id="showElements">
						
						</div>

					</fieldset>
				</div>
				<div class="opcion-form">
					<span class="span-inline">
						<input type="submit" value="Guardar" />
					</span>
	
				</div>
			</form>

		</section>

		<div id="containerElements" style="display:none;">
			<span class="span-inline">
				<label for="ci">Cédula</label>
				<input type="number" id="ci" class="ci" name="ci" class="cedula" value="<?php if(! empty($_POST)) { echo $_POST['ci'];} ?>" placeholder="Cédula del Alumno" required/>
			</span>
			<div class="form-block">
				<span class="span-inline">
					<label for="pnombre">Nombres</label>
					<input type="text" id="pnombre" class="pnombre" name="pnombre" value="<?php if(! empty($_POST)) { echo $_POST['pnombre'];} ?>" placeholder="Nombres del Alumno" required/>
				</span>
				<span class="span-inline">
					<label for="papellido">Apellidos</label>
					<input type="text" id="papellido" class="papellido" name="papellido" value="<?php if(! empty($_POST)) { echo $_POST['papellido'];} ?>" placeholder="Apellidos del Alumno" required/>
				</span>
			</div>
			<div class="form-block">
				<span class="span-inline">
					<label for="nombres_representate">Nombres del Representante</label>
					<input type="text" id="nombres_representate" class="nombres_representate" name="nombres_representate" value="<?php if(! empty($_POST)) { echo $_POST['nombres_representate'];} ?>" placeholder="Nombres del Representante" required/>
				</span>
				<span class="span-inline">
					<label for="apellidos_representate">Apellidos del Representante</label>
					<input type="text" id="apellidos_representate" class="apellidos_representate" name="apellidos_representate" value="<?php if(! empty($_POST)) { echo $_POST['apellidos_representate'];} ?>" placeholder="Apellidos del Representante" required/>
				</span>
			</div>
		</div>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>