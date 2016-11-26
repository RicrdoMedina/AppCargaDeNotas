	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();

		if(! empty($_POST['cantidad_estudiantes'])){

			$mensaje = '';
			$error= 0;

			$data_cedula = array();

			for ($i=1; $i <= $_POST['cantidad_estudiantes']; $i++) { 
				//echo $_POST['ci_'. $i];
				if(@$_POST['cargar_' . $i] == 1){

					$porciones_nombres = explode(" ", $_POST['nombres_'. $i]);

					@$segundo_nombre = $porciones_nombres[1];

					$primer_nombre= $porciones_nombres[0];

					$porciones_apellidos = explode(" ", $_POST['apellidos_'. $i]);

					@$segundo_apellido = $porciones_apellidos[1];

					$primer_apellido = $porciones_apellidos[0];

					if($_POST['ci_alumno_' . $i] != $_POST['cedula_' . $i]){
						/*Creamos una query sencilla*/
						$sqlu = "select * from alumnos where cedula_alumno = '".$_POST['cedula_' . $i]."'";

						/*Ejecutamos la query*/
						$stmtu = $bd->ejecutar($sqlu);

						if($x=$bd->obtener_fila($stmtu,0)){
							$error= 1;
						}
						else{
							
							$sqlo = "UPDATE alumnos SET cedula_alumno = '".$_POST['cedula_' . $i]."', primer_nombre = '".ucwords(strtolower($primer_nombre))."', segundo_nombre = '".ucwords(strtolower($segundo_nombre))."',primer_apellido = '".ucwords(strtolower($primer_apellido))."', segundo_apellido = '".ucwords(strtolower($segundo_apellido))."', id_seccion_alumno = '".$_POST['seccion_alumno_'. $i]."', nombre_representante = '".ucwords(strtolower($_POST['nom_repre_'. $i]))."', apellido_representante = '".ucwords(strtolower($_POST['ape_repre_'. $i]))."' where cedula_alumno = '".$_POST['ci_alumno_' . $i]."'";
		                	$stmto = $bd->ejecutar($sqlo);

		                	$sqly = "UPDATE notas SET cedula_estudiante = '".$_POST['cedula_' . $i]."' where cedula_estudiante = '".$_POST['ci_alumno_' . $i]."'";
		                	$stmty = $bd->ejecutar($sqly);

		                	$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
						}
					}else{
						$sqli = "UPDATE alumnos SET primer_nombre = '".ucwords(strtolower($primer_nombre))."', segundo_nombre = '".ucwords(strtolower($segundo_nombre))."',primer_apellido = '".ucwords(strtolower($primer_apellido))."', segundo_apellido = '".ucwords(strtolower($segundo_apellido))."', id_seccion_alumno = '".$_POST['seccion_alumno_'. $i]."', nombre_representante = '".ucwords(strtolower($_POST['nom_repre_'. $i]))."', apellido_representante = '".ucwords(strtolower($_POST['ape_repre_'. $i]))."' where cedula_alumno = '".$_POST['ci_alumno_' . $i]."'";
		                $stmti = $bd->ejecutar($sqli);

		                $insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
					}
				}
			}
			
		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Consultar <span class="titulo-palabra">Alumnos</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
				<div class="contenedor-form">
				<form action="" method="post">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Consultar ó Editar Alumnos</legend>
						<span class="span-inline">
							<label for="seccion">Seleccione</label>
							<select  class="seccion" id="seccion" name="boletas_seccion" required onchange="form.submit()">
							   <?php

								/*Creamos una query sencilla*/
								$sqle = "select * from secciones";

								/*Ejecutamos la query*/
								$stmte=$bd->ejecutar($sqle);

								echo "<option value='' selected='selected'> ---- </option>";
								
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($e=$bd->obtener_fila($stmte,0)){

								?>
									<option value='<?php echo $e['id_secc']; ?>'><?php echo "Sección ".$e['nombre_seccion']; ?></option>
								<?php
								}

								?>
							</select>
						</span>
					</fieldset>
				</form>
				</div>

			<?php
				if ( isset($error) and $error == 1) {
				?>
					<div class="alert alert-danger"> 
						<?php 
				    	echo "<p class='msj-grupos'> <i class='fa fa-times-circle-o' aria-hidden='true'></i> Ingreso una cédula que ya existe en la base de datos, debido a esto no se edito el registro!</p>";
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
			<?php
				if ( ! empty($_POST['boletas_seccion'])) { 
					$sqlt = "select * from secciones where id_secc = '".$_POST['boletas_seccion']."'";

					/*Ejecutamos la query*/
					$stmtt = $bd->ejecutar($sqlt);

					$seccion = $bd->obtener_fila($stmtt,0);
			?>
				<div class="contenedor-estudiantes">
					<h2 ><i class="fa fa-hand-o-right" aria-hidden="true"></i> Lista de Alumnos - Sección <?php echo $seccion['nombre_seccion']; ?></h2>
				</div>

			<?php 
				

			?>
						<div class="contenedor-estudiantes">
						<form method="post">

						
							<div class="contenedor-estudiante">
								<table class="table" cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
			                	<thead>
			                    	<tr>
			                    		<th class="center">#</th>
			                    		<th class="center">Sección</th>
			                            <th class="center">Cédula</th>
						    			<th class="center">Nombres</th>
						    			<th class="center">Apellidos</th>
						    			<th class="center">Nombres Representante</th>
						    			<th class="center">Apellidos Representante</th>
						    			<th class="center">Editar</th>
			                    	</tr>
			                	</thead>
			                	<tbody>
			                	<?php
								$sql = "SELECT * FROM alumnos 
								LEFT JOIN secciones ON alumnos.id_seccion_alumno = secciones.id_secc
								WHERE  alumnos.id_seccion_alumno = '".$_POST['boletas_seccion']."' order by alumnos.cedula_alumno desc";

								/*Ejecutamos la query*/
								$stmt = $bd->ejecutar($sql);
				    			
				    			$i = 0;

								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

									$i = $i + 1;
												
								?>

			                		<tr>
			                			<td>
			                				<?php echo $i; ?>
			                			</td>
			                			<td>
			                				<select  class="disabled <?php echo $x['cedula_alumno']; ?>" id="seccion" name="seccion_alumno_<?php echo $i; ?>" required>
											   <?php

												/*Creamos una query sencilla*/
												$sqlt = "select * from secciones";

												/*Ejecutamos la query*/
												$stmtt=$bd->ejecutar($sqlt);

												/*Realizamos un bucle para ir obteniendo los resultados*/
												while ($t=$bd->obtener_fila($stmtt,0)){

													if($t['id_secc'] == $x['id_seccion_alumno']){
												?>
													<option value='<?php echo $t['id_secc']; ?>' selected='selected' ><?php echo $t['nombre_seccion']; ?></option>
												<?php
													}else{
												?>
													<option value='<?php echo $t['id_secc']; ?>'><?php echo $t['nombre_seccion']; ?></option>
												<?php

													}
												}

												?>
											</select>
			                			</td>
			                            <td>
			                            	<input type="hidden" name="ci_alumno_<?php echo $i; ?>" value="<?php echo $x['cedula_alumno']; ?>" />
			                            	<input type="number" class="cedula-u disabled <?php echo $x['cedula_alumno']; ?>" name="cedula_<?php echo $i; ?>" value="<?php echo $x['cedula_alumno']; ?>" placeholder="Cédula del alumno" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo $x['cedula_alumno']; ?>" name="nombres_<?php echo $i; ?>" value="<?php echo $x['primer_nombre']." ".$x['segundo_nombre']; ?>" placeholder="Nombres del alumno" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo $x['cedula_alumno']; ?>" name="apellidos_<?php echo $i; ?>" value="<?php echo $x['primer_apellido']." ".$x['segundo_apellido']; ?>" placeholder="Apellidos del alumno" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo $x['cedula_alumno']; ?>" name="nom_repre_<?php echo $i; ?>" value="<?php echo $x['nombre_representante']; ?>" placeholder="Nombres del Representante" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo $x['cedula_alumno']; ?>" name="ape_repre_<?php echo $i; ?>" value="<?php echo $x['apellido_representante']; ?>" placeholder="Apellidos del Representante" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="checkbox" class="check" id="<?php echo $x['cedula_alumno']; ?>" name="cargar_<?php echo $i; ?>" value="0"> 
			                            </td>
	                                </tr>
	                            <?php
	                            	}
	                            ?>
	                             </tbody>

	                             </table>
								<input type="hidden" name="cantidad_estudiantes" value="<?php echo $i; ?>" />
								<input type="hidden" name="id_seccion" value="<?php echo $_POST['boletas_seccion']; ?>" />
								<div class="opcion-form">
									<span class="span-inline">
										<input type="submit" value="Guardar" />
									</span>
					
								</div>
	                             <?php
	                            	if (! empty($mensaje)) {
	                            ?>
	                              	<div class="alert alert-warning"> <?php echo $mensaje; ?></div>
	                            <?php
	                              	}
	                            ?>
								
							</div>
					</form>
					</div>


			<?php
				}
			?>
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>