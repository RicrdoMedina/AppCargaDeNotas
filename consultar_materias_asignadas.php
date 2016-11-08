	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Consultar <span class="titulo-palabra">Materias Asignadas</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
			<div class="contenedor-estudiantes">
				<h2 ><i class="fa fa-hand-o-right" aria-hidden="true"></i> Lista de materias y sus profesores.</h2>
			</div> 

			<div class="contenedor-estudiantes">
						<form method="post">

						
							<div class="contenedor-estudiante">
								<table class="table" cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
			                	<thead>
			                    	<tr>
			                    		<th class="center">#</th>
						    			<th class="center">Sección</th>
						    			<th class="center">Materia</th>
						    			<th class="center">CI Docente</th>
						    			<th class="center">Docente</th>
			                    	</tr>
			                	</thead>
			                	<tbody>
			                	<?php

								$sql = "SELECT * FROM usuario_materias 
								LEFT JOIN materias ON usuario_materias.id_materia = materias.id_mat
								LEFT JOIN secciones ON usuario_materias.id_seccion = secciones.id_secc
								LEFT JOIN usuarios ON usuario_materias.cedula_profesor = usuarios.cedula order by secciones.nombre_seccion asc";

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
			                				<?php echo $x['nombre_seccion']; ?>
			                			</td>
			                            <td class="center">
			                            	<?php echo $x['nombre_materia']; ?>
			                            </td>
			                             <td class="center">
			                            	<?php echo $x['cedula']; ?>
			                            </td>
			                            <td class="center">
			                            	<?php echo $x['primer_nombre']." ".$x['segundo_nombre']; ?>

			                            	<?php echo $x['primer_apellido']." ".$x['segundo_apellido']; ?>
			                            </td>
			      
	                                </tr>
	                            <?php
	                            	}
	                            ?>
	                             </tbody>

	                             </table>
							
							</div>
					</div>

				
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>