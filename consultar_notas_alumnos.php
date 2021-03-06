	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();

		if(! empty($_POST['secc'])){

			$id_mat = $_POST['mat'];

			$id_sec= $_POST['secc'];
		}

		if(! empty($_POST['cantidad_estudiantes'])){
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

		                $insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
					}

					
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
			<form method="post">
				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Consultar ó Editar Notas</legend>
						
						<span class="span-inline">
							<label for="mat">Materia</label>
							<select  class="mat" id="mat" name="mat" onchange="form.submit()" required>
							   <?php

							   if(empty($_POST['mat'])){

									/*Creamos una query sencilla*/
									$sql = "select * from materias";

									/*Ejecutamos la query*/
									$stmt=$bd->ejecutar($sql);

									echo "<option value='' selected='selected'> ---- </option>";
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){

									?>
										<option value='<?php echo $x['id_mat']; ?>'><?php echo $x['nombre_materia']; ?></option>
									<?php
									}

								}
								else{
									/*Creamos una query sencilla*/
									$sql = "select * from materias";

									/*Ejecutamos la query*/
									$stmt=$bd->ejecutar($sql);
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){
										if($_POST['mat'] == $x['id_mat']){
									?>
										<option value='<?php echo $x['id_mat']; ?>' <?php echo" selected='selected'"; ?>><?php echo $x['nombre_materia']; ?></option>
									<?php
										}else{
									?>
										<option value='<?php echo $x['id_mat']; ?>'><?php echo $x['nombre_materia']; ?></option>
									<?php
										}
									}
								}

								?>
							</select>
						</span>
						<?php
							if(!empty($_POST['mat'])){
						?>

						<span class="span-inline">
							<label for="seccion">Sección</label>
							<select  class="seccion" id="seccion" name="secc" onchange="form.submit()" required>
							   <?php

							   if(empty($_POST['secc'])){

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
								}else{
									/*Creamos una query sencilla*/
									$sql = "select * from secciones";

									/*Ejecutamos la query*/
									$stmt=$bd->ejecutar($sql);
									
									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($x=$bd->obtener_fila($stmt,0)){
										if($_POST['secc'] == $x['id_secc']){
									?>
										<option value='<?php echo $x['id_secc']; ?>' <?php echo" selected='selected'"; ?>><?php echo $x['nombre_seccion']; ?></option>
									<?php
										}else{
									?>
										<option value='<?php echo $x['id_secc']; ?>'><?php echo $x['nombre_seccion']; ?></option>
									<?php
										}
									}
								}

								?>
							</select>
						</span>
						<?php
							}
						?>
					</fieldset>
				</div>
			</form>
				<?php
				if (! empty($insercion)) {
				?>
					<div class="alert alert-success"> <?php echo $insercion; ?></div>
				<?php
				}
							
				?>

					<div class="contenedor-estudiantes" id="<?php echo $x['id_seccion'].$x['id_materia']; ?>" data-status="0">
					<form action="" method="post">
					<?php

						if(! empty($id_mat)){
							$sqlu = "SELECT * FROM alumnos 
							LEFT JOIN notas ON alumnos.cedula_alumno = notas.cedula_estudiante
							LEFT JOIN materias ON  materias.id_mat = notas.id_materia 
							LEFT JOIN secciones ON secciones.id_secc = notas.id_seccion WHERE notas.id_materia = '".$id_mat."' AND notas.id_seccion = '".$id_sec."'";

							/*Ejecutamos la query*/
							$stmtu = $bd->ejecutar($sqlu);
							$i = 0;	


							if($tr=$bd->obtener_fila($bd->ejecutar($sqlu),0)){
						
					?>
					<h2 ><i class="fa fa-hand-o-right" aria-hidden="true"></i> <?php echo "Notas cargadas de la Sección ".$tr['nombre_seccion']." - Materia: ".$tr['nombre_materia']; ?></h2>

							

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
						    			<th class="center">Editar</th>
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
			                            		$nota_final = ($u['def_uno'] + $u['def_dos'] + $u['def_tres'] ) / 3;	
			                            	?>
			                            	<span <?php if($nota_final < 10){ echo "class='reprobado'"; } if($nota_final >= 10 and $nota_final <= 13){ echo "class='apenas-aprobo'"; } if($nota_final >= 13){ echo "class='aprobado'"; } ?> > 
			                            		<?php echo $total_f = round($nota_final); ?>
			                            	</span>
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

	                        	<input type="hidden" name="materia" value="<?php echo $id_mat; ?>" />
								<input type="hidden" name="seccion" value="<?php echo $id_sec; ?>" />
								<input type="hidden" name="cantidad_estudiantes" value="<?php echo $i; ?>" />

								<div class="opcion-form">
									<span class="span-inline">
										<input type="submit" value="Guardar" />
									</span>
					
								</div>
								
							</div>


					</form>	
					</div>
					
				<?php
					}else{
				?>
					<div class="alert alert-warning"> No se han cargado notas para esta materia!</div>
				<?php 
					}
				}	
				?>
	
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>