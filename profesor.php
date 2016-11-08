	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();

		if(! empty($_POST)){

			for ($i=1; $i <= $_POST['cantidad_estudiantes']; $i++) { 
				//echo $_POST['ci_'. $i];
				if(@$_POST['cargar_' . $i] == 1){
					/*Creamos una query sencilla*/
					$sqlu = "select * from notas where cedula_estudiante = '".$_POST['ci_' . $i]."' and id_seccion = '". $_POST['seccion'] ."' and id_materia = '". $_POST['materia'] ."'";

					/*Ejecutamos la query*/
					$stmtu = $bd->ejecutar($sqlu);

					if($x=$bd->obtener_fila($stmtu,0)){
						$sqlt = "UPDATE notas SET def_uno = '".$_POST['df1_' . $i]."', def_dos = '".$_POST['df2_' . $i]."', def_tres = '".$_POST['df3_' . $i]."' where cedula_estudiante = '".$_POST['ci_' . $i]."' and id_seccion = '". $_POST['seccion'] ."' and id_materia = '". $_POST['materia'] ."'";
		                $stmt = $bd->ejecutar($sqlt);
					}else{
						$sql = "insert into notas values('','".$_POST['ci_' . $i]."','". $_POST['seccion'] ."','". $_POST['materia'] ."','". $_POST['df1_' . $i] ."','". $_POST['df2_' . $i] ."','". $_POST['df3_' . $i]."')";
		            	$stmt = $bd->ejecutar($sql);
					}
				}
			}
			$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Su registro fue exitoso!</p>';
		}
	?>

		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
			<?php
				if (! empty($insercion)) {
				?>
					<div class="alert alert-success"> <?php echo $insercion; ?></div>
				<?php
				}
							
			?>

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Cargar notas</legend>
						<span class="span-inline">
							<label for="secciones">Seleccione</label>
							<select  class="notas" id="notas" name="notas" required>
							   <?php
								$ci_usuario;
								/*Creamos una query sencilla*/
								$sql = "select us.cedula, us.rol, usu_mat.cedula_profesor, usu_mat.id_materia, usu_mat.id_seccion,
								mat.id_mat, mat.nombre_materia, secc.id_secc,secc.nombre_seccion from usuarios as us, 
								usuario_materias as usu_mat, materias as mat, secciones as secc 
								WHERE us.cedula = usu_mat.cedula_profesor and usu_mat.id_materia = mat.id_mat 
								and usu_mat.id_seccion = secc.id_secc and us.cedula = $ci_usuario";

								/*Ejecutamos la query*/
								$stmt = $bd->ejecutar($sql);

								echo "<option value='' selected='selected'> ---- </option>";
								
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

								?>
									<option value='<?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia']; ?>'>Sección <?php echo $x['nombre_seccion']." ".$x['nombre_materia']; ?></option>
								<?php
								}

								?>

							</select>
						</span>
					</fieldset>
				</div>

				<?php

					$sql = "select us.cedula, us.rol, usu_mat.cedula_profesor, usu_mat.id_materia, usu_mat.id_seccion,
					mat.id_mat, mat.nombre_materia, secc.id_secc,secc.nombre_seccion from usuarios as us, 
					usuario_materias as usu_mat, materias as mat, secciones as secc 
					WHERE us.cedula = usu_mat.cedula_profesor and usu_mat.id_materia = mat.id_mat 
					and usu_mat.id_seccion = secc.id_secc and us.cedula = $ci_usuario";

					/*Ejecutamos la query*/
					$stmt = $bd->ejecutar($sql);
				    
					/*Realizamos un bucle para ir obteniendo los resultados*/
					while ($x=$bd->obtener_fila($stmt,0)){

				?>


					<div class="contenedor-estudiantes" id="<?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia']; ?>" data-status="0" style="display:none;">
					<form action="" method="post">
						<fieldset>
						<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Sección <?php echo $x['nombre_seccion']." ".$x['nombre_materia']; ?></legend>

							<div id="">
								<table class="table" cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
			                	<thead>
			                    	<tr>
			                    		<th class="center">#</th>
			                            <th class="center">C&eacute;dula</th>
			                            <th class="center">Nombres</th>
			                            <th class="center">Apellidos</th>
						    			<th class="center">Def. 1er L</th>
						    			<th class="center">Def. 2do L</th>
						    			<th class="center">Def. 3er L</th>
						    			<th class="center">Seleccionar</th>
			                    	</tr>
			                	</thead>
			                	<tbody>
			                			<?php

											$sqlu = "select al.cedula_alumno,al.primer_nombre, al.segundo_nombre, al.primer_apellido, al.segundo_apellido,
											 al.id_seccion_alumno,secc.id_secc, secc.nombre_seccion from alumnos as al, secciones as secc 
											 WHERE al.id_seccion_alumno = secc.id_secc and al.id_seccion_alumno = '".$x['id_secc']."'";

											/*Ejecutamos la query*/
											$stmtu = $bd->ejecutar($sqlu);
											$i = 0;	
											/*Realizamos un bucle para ir obteniendo los resultados*/
											while ($u=$bd->obtener_fila($stmtu,0))
											{
												$i = $i + 1;
										?>
			                		<tr>
			                			<input type="hidden" name="ci_<?php echo $i; ?>" value="<?php echo $u['cedula_alumno']; ?>"/>
			                			<td>
			                				<?php echo " " . $i; ?>
			                			</td>
			                            <td>
			                            	<?php echo $u['cedula_alumno']; ?>
			                            </td>
			                            <td class="center">
			                            	<?php echo $u['primer_nombre']." ".$u['segundo_nombre']; ?>
			                            </td>
			                            <td class="center">
			                            	<?php echo $u['primer_apellido']." ".$u['segundo_apellido']; ?>
			                            </td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="df1_<?php echo $i; ?>" value="" placeholder="0" />
			                            </td>
						    			<td class="center">
						    				<input type="text" class="disabled <?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="df2_<?php echo $i; ?>" value="" placeholder="0" />
						    			</td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="df3_<?php echo $i; ?>" value="" placeholder="0" />
			                            </td>
			                            <td class="center">
			                            	<input type="checkbox" class="check" id="<?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="cargar_<?php echo $i; ?>" value="0"> 
			                            </td>
   
	                                </tr>

	                                	<?php
	                                		
			                            	}
			                            ?>

	                             </tbody>
	                             </table>

	                        <input type="hidden" name="materia" value="<?php echo $x['id_mat']; ?>" />
							<input type="hidden" name="seccion" value="<?php echo $x['id_secc']; ?>" />
							<input type="hidden" name="cantidad_estudiantes" value="<?php echo $i; ?>" />
							</div>
						</fieldset>
						<div class="opcion-form">
							<span class="iconos-form">
								<input type="submit" value="Guardar" />
							</span> 
							<span class="iconos-form">
								<input type="reset" value="Borrar" />
							</span>
			
						</div>
					</div>
					</form>
				<?php
				}

				?>
				
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>