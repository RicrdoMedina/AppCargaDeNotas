	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Generar <span class="titulo-palabra">Boletas</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
				<div class="contenedor-form">
				<form action="" method="post">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Boletas por Sección</legend>
						<span class="span-inline">
							<label for="seccion">Seleccione</label>
							<select  class="seccion" id="seccion" name="boletas_seccion" required onchange="form.submit()">
							   <?php

								/*Creamos una query sencilla*/
								$sql = "select * from secciones";

								/*Ejecutamos la query*/
								$stmt=$bd->ejecutar($sql);

								echo "<option value='' selected='selected'> ---- </option>";
								
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

								?>
									<option value='<?php echo $x['id_secc']; ?>'><?php echo "Sección ".$x['nombre_seccion']; ?></option>
								<?php
								}

								?>
							</select>
						</span>
					</fieldset>
				</form>
				</div>

			<?php
				if ( ! empty($_POST['boletas_seccion'])) { 
					$sqlt = "select * from secciones where id_secc = '".$_POST['boletas_seccion']."'";

					/*Ejecutamos la query*/
					$stmtt = $bd->ejecutar($sqlt);

					$seccion = $bd->obtener_fila($stmtt,0);
			?>
				<div class="contenedor-estudiantes">
					<h2 ><i class="fa fa-hand-o-right" aria-hidden="true"></i> Notas Cargadas de la Sección <?php echo $seccion['nombre_seccion']; ?></h2>
				</div>

			<?php 
					$sql = "SELECT * FROM alumnos 
						LEFT JOIN secciones ON alumnos.id_seccion_alumno = secciones.id_secc
						WHERE  alumnos.id_seccion_alumno = '".$_POST['boletas_seccion']."'";

					/*Ejecutamos la query*/
					$stmt = $bd->ejecutar($sql);
				    
					/*Realizamos un bucle para ir obteniendo los resultados*/
					while ($x=$bd->obtener_fila($stmt,0)){

			?>
						<div class="contenedor-estudiantes">
							

						
							<div class="contenedor-estudiante">
								<div class="contenedor-form">
									<span class="span-inline datos-alumnos">
										Cédula: <?php echo $x['cedula_alumno']; ?>
									</span>
									<span class="span-inline datos-alumnos">
										Nombres y Apellidos: <?php echo $x['primer_nombre']." ".$x['segundo_nombre']." ".$x['primer_apellido']." ".$x['segundo_apellido']; ?>

												<a href="./PHP/reporte/boleta.php?sec=<?php echo $x['id_secc']; ?>&ca=<?php echo $x['cedula_alumno']; ?>" target="_blank"><input class="generar-boletas" type="button" value="Boleta" /></a>

									</span>
								</div>
								<table class="table" cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
			                	<thead>
			                    	<tr>
			                    		<th class="center">#</th>
			                            <th class="center">Materia</th>
						    			<th class="center">Def. 1er L</th>
						    			<th class="center">Def. 2do L</th>
						    			<th class="center">Def. 3er L</th>
						    			<th class="center">Definitiva</th>
			                    	</tr>
			                	</thead>
			                	<tbody>
			                	<?php

			                		$sqlu = "SELECT * FROM alumnos 
									LEFT JOIN notas ON alumnos.cedula_alumno = notas.cedula_estudiante
									LEFT JOIN materias ON  materias.id_mat = notas.id_materia 
									LEFT JOIN secciones ON secciones.id_secc = notas.id_seccion WHERE alumnos.id_seccion_alumno = '".$x['id_secc']."' AND alumnos.cedula_alumno = '".$x['cedula_alumno']."'";

									/*Ejecutamos la query*/
									$stmtu = $bd->ejecutar($sqlu);

									$i = 0;	

									/*Realizamos un bucle para ir obteniendo los resultados*/
									while ($u=$bd->obtener_fila($stmtu,0))
									{
										$i = $i + 1;

										if(! empty($u['nombre_materia'])){
											
										
								?>

			                		<tr>
			                			<?php 

			                            	$nota_final = ($u['def_uno'] + $u['def_dos'] + $u['def_tres'] ) / 3;
			                            ?>
			                			<td>
			                				<?php echo $i; ?>
			                			</td>
			                			<td>
			                				<span <?php if($nota_final < 10){ echo "class='reprobado'"; } if($nota_final >= 10 and $nota_final <= 13){ echo "class='apenas-aprobo'"; } if($nota_final >= 13){ echo "class='aprobado'"; } ?> > 
			                					<?php echo $u['nombre_materia']; ?>
			                				</span>
			                			</td>
			                            <td>
			                            	<span <?php if($nota_final < 10){ echo "class='reprobado'"; } if($nota_final >= 10 and $nota_final <= 13){ echo "class='apenas-aprobo'"; } if($nota_final >= 13){ echo "class='aprobado'"; } ?> > 
			                            		<?php echo $u['def_uno']; ?>
			                            	</span>
			                            </td>
			                            <td class="center">
			                            	<span <?php if($nota_final < 10){ echo "class='reprobado'"; } if($nota_final >= 10 and $nota_final <= 13){ echo "class='apenas-aprobo'"; } if($nota_final >= 13){ echo "class='aprobado'"; } ?> > 
			                            		<?php echo $u['def_dos']; ?>
			                            	</span>
			                            </td>
			                            <td class="center">
			                            	<span <?php if($nota_final < 10){ echo "class='reprobado'"; } if($nota_final >= 10 and $nota_final <= 13){ echo "class='apenas-aprobo'"; } if($nota_final >= 13){ echo "class='aprobado'"; } ?> > 
			                            		<?php echo $u['def_tres']; ?>
			                            	</span>
			                            </td>
			                            <td class="center">
			                            	
			                            	<span <?php if($nota_final < 10){ echo "class='reprobado'"; } if($nota_final >= 10 and $nota_final <= 13){ echo "class='apenas-aprobo'"; } if($nota_final >= 13){ echo "class='aprobado'"; } ?> > 
			                            		<?php echo $total_f = round($nota_final); ?>
			                            	</span>
			                            </td>
	                                </tr>
	                            <?php
	                            		}else{
	                            			$mensaje = "No se han cargado las notas.";
	                            ?>
	                            <?php
	                            		}
	                              	}
	                            ?>
	                             </tbody>

	                             </table>
	                             <?php
	                            	if (! empty($mensaje)) {
	                            ?>
	                              	<div class="alert alert-warning"> <?php echo $mensaje; ?></div>
	                            <?php
	                              	}
	                            ?>
								
							</div>
					</div>


			<?php
						
					}


				}
			?>
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>