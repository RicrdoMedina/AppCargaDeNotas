	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();

		if(! empty($_POST['ci_alumno']) and ! empty($_POST['id_materia']) and ! empty($_POST['id_sec_alumno'])){

			$error = 0;

			$ci_alumno = $_POST['ci_alumno'];

			$id_mate = $_POST['id_materia'];

			$id_secci = $_POST['id_sec_alumno'];

			/*Creamos una query sencilla*/
			$sqltn = "select al.cedula_alumno, al.primer_nombre, al.segundo_nombre, al.primer_apellido, al.segundo_apellido, al.id_seccion_alumno, 
			no.cedula_estudiante, no.id_seccion, no.id_materia, no.def_uno, no.def_dos, no.def_tres, mat.id_mat, mat.nombre_materia, secc.id_secc, 
			secc.nombre_seccion from alumnos as al, notas as no, materias as mat, secciones as secc WHERE al.cedula_alumno = no.cedula_estudiante 
			and al.id_seccion_alumno = no.id_seccion and no.id_seccion = secc.id_secc and mat.id_mat = no.id_materia and no.id_materia = '".$id_mate."' and 
			no.id_seccion = '".$id_secci."' and no.cedula_estudiante = '".$ci_alumno."'";

			/*Ejecutamos la query*/
			$stmtw = $bd->ejecutar($sqltn);

			if($estudiante = $bd->obtener_fila($stmtw,0)){

				$status = 1;
			}
			else{
				/*Creamos una query sencilla*/
				$sqlt = "select al.cedula_alumno, al.primer_nombre, al.segundo_nombre, al.primer_apellido, al.segundo_apellido, al.id_seccion_alumno, 
				mat.id_mat, mat.nombre_materia, secc.id_secc, secc.nombre_seccion from alumnos as al, materias as mat, secciones as secc 
				WHERE al.id_seccion_alumno = secc.id_secc and mat.id_mat = '".$id_mate."' and secc.id_secc = '".$id_secci."' and al.cedula_alumno = '".$ci_alumno."'";

				/*Ejecutamos la query*/
				$stmtx = $bd->ejecutar($sqlt);
			
				$estudiante = $bd->obtener_fila($stmtx,0);

				if(empty($estudiante)){

					$error = 1;
				}

				$status = 0;
			}		
		}

		if(! empty($_POST['ci_estudiante'])){

			if($_POST['status'] == 1){
				$sqlty = "UPDATE notas SET def_uno = '".$_POST['def_uno']."', def_dos = '".$_POST['def_dos']."', def_tres = '".$_POST['def_tres']."' where cedula_estudiante = '".$_POST['ci_estudiante']."' and id_seccion = '". $_POST['seccion_estudiante'] ."' and id_materia = '". $_POST['materia_estudiante'] ."'";
		        $stmty = $bd->ejecutar($sqlty);

		        if($_POST['def_uno'] != 0){
		        	$insercion = '<p>
			         <ul>
		            	<li>Def 1er lapso:'. $_POST['def_uno'].' </li><br>
		            </ul>
		            </p>';
		        }
		        if( $_POST['def_uno'] != 0 and $_POST['def_dos'] != 0){
		        	$insercion = '<p>
			         <ul>
		            	<li>Def 1er lapso:'. $_POST['def_uno'].' </li><br>
		            	<li>Def 1er lapso:'. $_POST['def_dos'].' </li><br>
		            </ul>
		            </p>';
		        }
		        if( $_POST['def_uno'] != 0 and $_POST['def_dos'] != 0 and $_POST['def_tres'] != 0){
		        	$insercion = '<p>
			         <ul>
		            	<li>Def 1er lapso:'. $_POST['def_uno'].' </li><br>
		            	<li>Def 1er lapso:'. $_POST['def_dos'].' </li><br>
		            	<li>Def 1er lapso:'. $_POST['def_tres'].' </li><br>
		            </ul>
		            </p>';
		        }
		         
			}else{
				$sql = "insert notas values('','".$_POST['ci_estudiante']."','". $_POST['seccion_estudiante'] ."','". $_POST['materia_estudiante'] ."','". $_POST['def_uno'] ."','". $_POST['def_dos'] ."','". $_POST['def_tres'] ."')";
	            $stmt = $bd->ejecutar($sql);
	            if($_POST['def_uno'] != 0){
		        	$insercion = '<p>
			         <ul>
		            	<li>Def 1er lapso:'. $_POST['def_uno'].' </li><br>
		            </ul>
		            </p>';
		        }
		        if( $_POST['def_uno'] != 0 and $_POST['def_dos'] != 0){
		        	$insercion = '<p>
			         <ul>
		            	<li>Def 1er lapso:'. $_POST['def_uno'].' </li><br>
		            	<li>Def 1er lapso:'. $_POST['def_dos'].' </li><br>
		            </ul>
		            </p>';
		        }
		        if( $_POST['def_uno'] != 0 and $_POST['def_dos'] != 0 and $_POST['def_tres'] != 0){
		        	$insercion = '<p>
			         <ul>
		            	<li>Def 1er lapso:'. $_POST['def_uno'].' </li><br>
		            	<li>Def 1er lapso:'. $_POST['def_dos'].' </li><br>
		            	<li>Def 1er lapso:'. $_POST['def_tres'].' </li><br>
		            </ul>
		            </p>';
		        }
			}

		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Notas</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
			
				<form action="" method="post">
					
					<div class="contenedor-form">
						<fieldset>
						<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Buscar Alumno</legend>
						<span class="span-inline">
							<label for="seccion_alumno">Sección</label>
							<select id="seccion_alumno" class="notas" name="id_sec_alumno" onchange="form.submit()" required>
							   <?php

							   if(empty($_POST['id_sec_alumno'])){

									$ci_usuario;
									/*Creamos una query sencilla*/
									$sql = "select * from secciones";

									/*Ejecutamos la query*/
									$stmt = $bd->ejecutar($sql);

									echo "<option value='' selected='selected'> ---- </option>";
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){

									?>
										<option value='<?php echo $x['id_secc']; ?>'>Sección <?php echo $x['nombre_seccion']; ?></option>
									<?php
									}

								}else{
									$ci_usuario;
									/*Creamos una query sencilla*/
									$sql = "select * from secciones";

									/*Ejecutamos la query*/
									$stmt = $bd->ejecutar($sql);
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){
										if($_POST['id_sec_alumno'] == $x['id_secc']){
									?>
										<option value='<?php echo $x['id_secc']; ?>' <?php echo" selected='selected'"; ?>>Sección <?php echo $x['nombre_seccion']; ?></option>
									<?php
										}else{
									?>
										<option value='<?php echo $x['id_secc']; ?>'>Sección <?php echo $x['nombre_seccion']; ?></option>
									<?php
										}

									?>
									<?php
									}
								}

								?>

							</select>
						</span>
						<?php
							if(!empty($_POST['id_sec_alumno'])){
						?>

						<span class="span-inline">
							<label for="id_materia">Materia</label>
							<select id="id_materia" class="notas" name="id_materia" onchange="form.submit()" required>
							   <?php
							   if(empty($_POST['id_materia'])){
									$ci_usuario;
									/*Creamos una query sencilla*/
									$sql = "select * from materias";

									/*Ejecutamos la query*/
									$stmt = $bd->ejecutar($sql);

									echo "<option value='' selected='selected'> ---- </option>";
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){

									?>
										<option value='<?php echo $x['id_mat']; ?>'><?php echo $x['nombre_materia']; ?></option>
									<?php
									}
								}else{
									$ci_usuario;
									/*Creamos una query sencilla*/
									$sql = "select * from materias";

									/*Ejecutamos la query*/
									$stmt = $bd->ejecutar($sql);
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){
										if($_POST['id_materia'] == $x['id_mat']){
									?>
										<option value='<?php echo $x['id_mat']; ?>' <?php echo" selected='selected'"; ?>><?php echo $x['nombre_materia']; ?></option>
									<?php
										}else{
									?>
										<option value='<?php echo $x['id_mat']; ?>'><?php echo $x['nombre_materia']; ?></option>
									<?php
										}

									?>
									<?php
									}
								}
								?>

							</select>
						</span>

						<span class="span-inline">
							<label for="ci_alumno">Alumno</label>
							<select id="ci_alumno" class="notas" name="ci_alumno" onchange="form.submit()" required>
							   <?php
							   if(empty($_POST['ci_alumno'])){
									$ci_usuario;
									/*Creamos una query sencilla*/
									$sql = "select * from alumnos where id_seccion_alumno = '".$_POST['id_sec_alumno']."'";

									/*Ejecutamos la query*/
									$stmt = $bd->ejecutar($sql);

									echo "<option value='' selected='selected'> ---- </option>";
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){

									?>
										<option value='<?php echo $x['cedula_alumno']; ?>'><?php echo $x['cedula_alumno'].' - '.$x['primer_nombre'].' '.$x['primer_apellido']; ?></option>
									<?php
									}
								}else{
									$ci_usuario;
									/*Creamos una query sencilla*/
									$sql = "select * from alumnos where id_seccion_alumno = '".$_POST['id_sec_alumno']."'";

									/*Ejecutamos la query*/
									$stmt = $bd->ejecutar($sql);
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){
										if($_POST['ci_alumno'] == $x['cedula_alumno']){
									?>
										<option value='<?php echo $x['cedula_alumno']; ?>' <?php echo" selected='selected'"; ?>><?php echo $x['cedula_alumno'].' - '.$x['primer_nombre'].' '.$x['primer_apellido']; ?></option>
									<?php
										}else{
									?>
										<option value='<?php echo $x['cedula_alumno']; ?>'><?php echo $x['cedula_alumno'].' - '.$x['primer_nombre'].' '.$x['primer_apellido']; ?></option>
									<?php
										}

									?>
									<?php
									}
								}
								?>

							</select>
						</span>
						<?php
							}
						?>
					</div>
				</form>

				<?php
				if (isset($error) and $error == 1) {
				?>
					<div class="alert alert-danger"> <?php echo '<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> No se encontro resultado!</p>'; ?></div>
				<?php
				}
				if (! empty($insercion)) {
				?>
					<div class="alert alert-success"> <?php echo $insercion; ?></div>
				<?php
				}
							
				?>

				<form action="" method="post">
				<div class="contenedor-form" <?php if (empty($estudiante)) { echo "style='display:none;'"; } ?> >
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> <?php if(! empty($estudiante)) { echo "Sección ".$estudiante['nombre_seccion']." - ".$estudiante['nombre_materia']; } ?></legend>
					<div class="form-block">
						<span class="span-inline">
							<label for="ci_estudiante">Cédula</label>
							<input type="number" id="ci_estudiante" class="cedula" name="ci_estudiante" value="<?php if(! empty($estudiante)) { echo $estudiante['cedula_alumno']; } ?>" placeholder="Cédula alumno" required/>
							<input type="hidden" name="seccion_estudiante" value="<?php if(! empty($estudiante)) { echo $estudiante['id_secc']; } ?>"/>
							<input type="hidden" name="materia_estudiante" value="<?php if(! empty($estudiante)) { echo $estudiante['id_mat']; } ?>"/>
							<input type="hidden" name="status" value="<?php if(! empty($status)) { echo $status; } ?>"/>
						</span>
						<span class="span-inline">
							<label for="nombres">Nombres</label>
							<input type="text" id="nombres" class="" name="nombres" value="<?php if(! empty($estudiante)) { echo $estudiante['primer_nombre']." ".$estudiante['segundo_nombre']; } ?>" placeholder="Nombres" required/>
						</span>
						<span class="span-inline">
							<label for="apellidos">Apellidos</label>
							<input type="text" id="apellidos" class="" name="apellidos" value="<?php if(! empty($estudiante)) { echo $estudiante['primer_apellido']." ".$estudiante['segundo_apellido']; } ?>" placeholder="Apellidos" required/>
						</span>
					</div>
					<div class="form-block">
						<span class="span-inline">
							<label for="def_uno">Def. 1 Lapso</label>
							<input type="number" min="0" max="20" id="def_uno" class="snombre" name="def_uno" value="<?php if( !empty($estudiante['def_uno']) and ! empty($estudiante['def_uno'])) { echo $estudiante['def_uno']; } ?>" placeholder="1er. Lapso" />
						</span>
						<span class="span-inline">
							<label for="def_dos">Def. 2 Lapso</label>
							<input type="number" min="0" max="20" id="def_dos" class="papellido" name="def_dos" value="<?php if( !empty($estudiante['def_dos']) and ! empty($estudiante['def_dos'])) { echo $estudiante['def_dos']; } ?>" placeholder="2do. Lapso"/>
						</span>
						<span class="span-inline">
							<label for="def_tres">Def. 3 Lapso</label>
							<input type="number" min="0" max="20" id="def_tres" class="sapellido" name="def_tres" value="<?php if( !empty($estudiante['def_tres']) and ! empty($estudiante['def_tres'])) { echo $estudiante['def_tres']; } ?>" placeholder="3er. Lapso" />
						</span>	

					</div>
					</fieldset>
					<div class="opcion-form">
						<span class="span-inline">
							<input type="submit" value="Guardar" />
						</span>
	
					</div>
				</div>
				
			</form>

				
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>