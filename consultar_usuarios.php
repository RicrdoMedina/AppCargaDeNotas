	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();

		if(! empty($_POST['cantidad_usuarios'])){

			$mensaje = '';
			$error= 0;

			$data_cedula = array();

			for ($i=1; $i <= $_POST['cantidad_usuarios']; $i++) { 
				//echo $_POST['ci_'. $i];
				if(@$_POST['cargar_' . $i] == 1){

					$porciones_nombres = explode(" ", $_POST['nombres_'. $i]);

					@$segundo_nombre = $porciones_nombres[1];

					$primer_nombre= $porciones_nombres[0];

					$porciones_apellidos = explode(" ", $_POST['apellidos_'. $i]);

					@$segundo_apellido = $porciones_apellidos[1];

					$primer_apellido = $porciones_apellidos[0];

					if($_POST['ci_bd_' . $i] != $_POST['ci_' . $i]){
						/*Creamos una query sencilla*/
						$sqlu = "select * from usuarios where cedula = '".$_POST['ci_' . $i]."'";

						/*Ejecutamos la query*/
						$stmtu = $bd->ejecutar($sqlu);

						if($x=$bd->obtener_fila($stmtu,0)){
							$error= 1;
						}
						else{
							
							$sqlo = "UPDATE usuarios SET cedula = '".$_POST['ci_' . $i]."', primer_nombre = '".ucwords(strtolower($primer_nombre))."', segundo_nombre = '".ucwords(strtolower($segundo_nombre))."',primer_apellido = '".ucwords(strtolower($primer_apellido))."', segundo_apellido = '".ucwords(strtolower($segundo_apellido))."', rol = '".ucwords(strtolower($_POST['rol_'. $i]))."' where cedula = '".$_POST['ci_bd_' . $i]."'";
		                	$stmto = $bd->ejecutar($sqlo);

		                	$sqlr = "UPDATE usuario_materias SET cedula_profesor = '".$_POST['ci_' . $i]."' where cedula_profesor = '".$_POST['ci_bd_' . $i]."'";
		        			$stmtr = $bd->ejecutar($sqlr);

		                	$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
						}
					}
					if($_POST['user_bd_' . $i] != $_POST['usuario_' . $i]){
						/*Creamos una query sencilla*/
						$sqlp = "select * from usuarios where usuario_sistema = '".$_POST['usuario_' . $i]."'";

						/*Ejecutamos la query*/
						$stmtp = $bd->ejecutar($sqlp);

						if($x=$bd->obtener_fila($stmtp,0)){
							$error= 2;
						}
						else{
							
							$sqle = "UPDATE usuarios SET primer_nombre = '".ucwords(strtolower($primer_nombre))."', segundo_nombre = '".ucwords(strtolower($segundo_nombre))."',primer_apellido = '".ucwords(strtolower($primer_apellido))."', segundo_apellido = '".ucwords(strtolower($segundo_apellido))."', usuario_sistema = '".$_POST['usuario_'. $i]."', rol = '".ucwords(strtolower($_POST['rol_'. $i]))."' where cedula = '".$_POST['ci_' . $i]."'";
		                	$stmte = $bd->ejecutar($sqle);

		                	$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
						}
					}
					else{
						$sqli = "UPDATE usuarios SET primer_nombre = '".ucwords(strtolower($primer_nombre))."', segundo_nombre = '".ucwords(strtolower($segundo_nombre))."',primer_apellido = '".ucwords(strtolower($primer_apellido))."', segundo_apellido = '".ucwords(strtolower($segundo_apellido))."', rol = '".ucwords(strtolower($_POST['rol_'. $i]))."' where cedula = '".$_POST['ci_' . $i]."'";
		                $stmti = $bd->ejecutar($sqli);

		                $insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
					}
				}
			}
			
		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Consultar <span class="titulo-palabra">Usuarios</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
				<div class="contenedor-form">
				<form action="" method="post">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Consultar ó Editar Usuarios</legend>
						<span class="span-inline">
							<label for="usuario">Seleccione</label>
							<select  class="usuario" id="usuario" name="tipo_usuario" required onchange="form.submit()">
								<option value='----' selected='selected'> ----- </option>
								<option value='Admin'>Admin</option>
								<option value='Profesor'>Profesor</option>
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
				if ( isset($error) and $error == 2) {
				?>
					<div class="alert alert-danger"> 
						<?php 
				    	echo "<p class='msj-grupos'> <i class='fa fa-times-circle-o' aria-hidden='true'></i> Ingreso un nombre de usuario que ya existe en la base de datos, debido a esto no se edito el registro!</p>";
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
				if ( ! empty($_POST['tipo_usuario'])) { 
					$sqlt = "select * from usuarios where rol = '".$_POST['tipo_usuario']."'";

					/*Ejecutamos la query*/
					$stmtt = $bd->ejecutar($sqlt);

					$seccion = $bd->obtener_fila($stmtt,0);
			?>
				<div class="contenedor-estudiantes">
					<h2 ><i class="fa fa-hand-o-right" aria-hidden="true"></i> Lista de Usuarios Tipo : <?php echo $_POST['tipo_usuario']; ?></h2>
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
						    			<th class="center">Rol</th>
						    			<th class="center">Cédula</th>
						    			<th class="center">Nombres</th>
						    			<th class="center">Apellidos</th>
						    			<th class="center">Usuario</th>
						    			<th class="center">Editar</th>
			                    	</tr>
			                	</thead>
			                	<tbody>
			                	<?php
								$sql = "select * from usuarios where rol = '".$_POST['tipo_usuario']."' order by primer_nombre asc";

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
			                				<select  class="disabled <?php echo $x['cedula']; ?> rol" id="rol" name="rol_<?php echo $i; ?>" required>
											   <?php
													if($x['rol'] == 'Admin'){
												?>
													<option value='Admin' selected='selected' >Admin</option>
													<option value='Profesor'>Profesor</option>
												<?php
													}
													if($x['rol'] == 'Profesor'){
												?>
													<option value='Profesor' selected='selected' >Profesor</option>
													<option value='Admin'>Admin</option>
												<?php
													}
												?>
											</select>
			                			</td>
			                            <td class="center">
			                            	<input type="hidden" name="ci_bd_<?php echo $i; ?>" value="<?php echo $x['cedula']; ?>" />
			                            	<input type="number" class="cedula-u disabled <?php echo $x['cedula']; ?>" name="ci_<?php echo $i; ?>" value="<?php echo $x['cedula']; ?>" placeholder="Cédula del alumno" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo $x['cedula']; ?>" name="nombres_<?php echo $i; ?>" value="<?php echo $x['primer_nombre']." ".$x['segundo_nombre']; ?>" placeholder="Nombres del alumno" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="text" class="disabled <?php echo $x['cedula']; ?>" name="apellidos_<?php echo $i; ?>" value="<?php echo $x['primer_apellido']." ".$x['segundo_apellido']; ?>" placeholder="Apellidos del alumno" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="hidden" name="user_bd_<?php echo $i; ?>" value="<?php echo $x['usuario_sistema']; ?>" />
			                            	<input type="text" class="disabled <?php echo $x['cedula']; ?>" name="usuario_<?php echo $i; ?>" value="<?php if($x['cedula'] == $x['usuario_sistema']){ }else{ echo $x['usuario_sistema'];} ?>" placeholder="Usuario sistema" required/>
			                            </td>
			                            <td class="center">
			                            	<input type="checkbox" class="check" id="<?php echo $x['cedula']; ?>" name="cargar_<?php echo $i; ?>" value="0"> 
			                            </td>
	                                </tr>
	                            <?php
	                            	}
	                            ?>
	                             </tbody>

	                             </table>
								<input type="hidden" name="cantidad_usuarios" value="<?php echo $i; ?>" />
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