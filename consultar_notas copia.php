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
					}

					$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
				}
			}
			
		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Consultar <span class="titulo-palabra">Notas</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Consultar ó Editar Notas</legend>
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
								and usu_mat.id_seccion = secc.id_secc and us.cedula = $ci_usuario order by secc.nombre_seccion asc";

								/*Ejecutamos la query*/
								$stmt = $bd->ejecutar($sql);

								echo "<option value='' selected='selected'> ---- </option>";
								
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

								?>
									<option value='<?php echo $x['id_secc'].$x['id_mat']; ?>'>Sección <?php echo $x['nombre_seccion']." - ".$x['nombre_materia']; ?></option>
								<?php
								}

								?>

							</select>
						</span>
					</fieldset>
				</div>
				<?php
				if (! empty($insercion)) {
				?>
					<div class="alert alert-success"> <?php echo $insercion; ?></div>
				<?php
				}
							
				?>

				<?php

					$sql = "select us.cedula, us.rol, usu_mat.cedula_profesor, usu_mat.id_materia, usu_mat.id_seccion,
					mat.id_mat, mat.nombre_materia, secc.id_secc,secc.nombre_seccion from usuarios as us, 
					usuario_materias as usu_mat, materias as mat, secciones as secc 
					WHERE us.cedula = usu_mat.cedula_profesor and usu_mat.id_materia = mat.id_mat 
					and usu_mat.id_seccion = secc.id_secc and us.cedula = $ci_usuario order by us.cedula asc";

					/*Ejecutamos la query*/
					$stmt = $bd->ejecutar($sql);
				    
					/*Realizamos un bucle para ir obteniendo los resultados*/
					while ($x=$bd->obtener_fila($stmt,0)){

				?>


					<div class="contenedor-estudiantes" id="<?php echo $x['id_seccion'].$x['id_materia']; ?>" data-status="0" style="display:none;">
					<form action="" method="post">
					<?php

						$sqlu = "SELECT * FROM alumnos 
						LEFT JOIN notas ON alumnos.cedula_alumno = notas.cedula_estudiante
						LEFT JOIN materias ON  materias.id_mat = notas.id_materia 
						LEFT JOIN secciones ON secciones.id_secc = notas.id_seccion WHERE notas.id_materia = '".$x['id_mat']."' AND notas.id_seccion = '".$x['id_secc']."'";

						/*Ejecutamos la query*/
						$stmtu = $bd->ejecutar($sqlu);
						$i = 0;	

						if($tr=$bd->obtener_fila($bd->ejecutar($sqlu),0)){
												
					?>
					<h2 ><i class="fa fa-hand-o-right" aria-hidden="true"></i> <?php echo "Notas cargadas de la Sección ".$x['nombre_seccion']." - Materia: ".$x['nombre_materia']; ?></h2>

							

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
						    			<th class="center">Definitiva</th>
						    			<?php
						    			if($_SESSION['rol'] == 'Admin'){
						    			?>
						    			<th class="center">Editar</th>
						    			<?php
						    				}
						    			?>
			                    	</tr>
			                	</thead>
			                	<tbody>
			                	<?php

									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($u=$bd->obtener_fila($stmtu,0))
									{
										$i = $i + 1;
								?>
			                		<tr>
			                			<input type="hidden" name="ci_<?php echo $i; ?>" value="<?php echo $u['cedula_alumno']; ?>"/>
			                			<td>
			                				<?php echo $i; ?>
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
			                            	<input type="number" min="0" max="20" class="disabled <?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="df1_<?php echo $i; ?>" value="<?php echo $u['def_uno']; ?>" placeholder="0" required/>
			                            </td>
						    			<td class="center">
						    				<input type="number" min="0" max="20" class="disabled <?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="df2_<?php echo $i; ?>" value="<?php echo $u['def_dos']; ?>" placeholder="0" />
						    			</td>
			                            <td class="center">
			                            	<input type="number" min="0" max="20" class="disabled <?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="df3_<?php echo $i; ?>" value="<?php echo $u['def_tres']; ?>" placeholder="0" />
			                            </td>
			                            <td class="center">
			                            	<?php 

			                            		if( $u['def_uno'] != 0 and $u['def_dos'] != 0 and $u['def_tres'] != 0) {
			                            			$nota_final = ($u['def_uno'] + $u['def_dos'] + $u['def_tres'] ) / 3;
			                            		}
			                            		if( $u['def_uno'] != 0 and $u['def_dos'] != 0 and $u['def_tres'] == 0) {
			                            			$nota_final = ($u['def_uno'] + $u['def_dos'] ) / 2;
			                            		}
			                            		if( $u['def_uno'] != 0 and $u['def_dos'] == 0) {
			                            			$nota_final = $u['def_uno'];
			                            		}

			                            		$total = round($nota_final);
			                            			
			                            	?>
			                            	<span <?php if($total < 10){ echo "class='reprobado'"; } if($total >= 10 and $total <= 13){ echo "class='apenas-aprobo'"; } if($total >= 13){ echo "class='aprobado'"; } ?> > 
			                            		<?php echo $total; ?>
			                            	</span>
			                            </td>
			                            <?php
						    			if($_SESSION['rol'] == 'Admin'){
						    			?>
			                             <td class="center">
			                            	<input type="checkbox" class="check" id="<?php echo "seccion".$x['nombre_seccion'].$x['nombre_materia'].$i; ?>" name="cargar_<?php echo $i; ?>" value="0"> 
			                            </td>
			                            <?php
			                            	}
			                            ?>
   
	                                </tr>

	                            <?php
	                                		
			                        }

								

								?>
									


	                             </tbody>
	                             </table>

	                        	<input type="hidden" name="materia" value="<?php echo $x['id_mat']; ?>" />
								<input type="hidden" name="seccion" value="<?php echo $x['id_secc']; ?>" />
								<input type="hidden" name="cantidad_estudiantes" value="<?php echo $i; ?>" />

								<div class="opcion-form">
									<?php
						    			if($_SESSION['rol'] == 'Admin'){
						    		?>
									<span class="span-inline">
										<input type="submit" value="Guardar" />
									</span>
									<?php
										}
									?>
					
								</div>
								
							</div>
							<?php
								}else{
							?>
								 	<div class="alert alert-warning"> No se han cargado notas para esta materia!</div>
							<?php
								}

			                 ?>

					</form>	
					</div>
					
				<?php
				}

				?>

				
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>