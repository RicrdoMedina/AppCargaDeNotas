	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();

		if(! empty($_POST['ci'])){

			$mensaje = '';
			$error= 0;

			/*if($_POST['user_bd'] != $_POST['usuario']){

				$sql = "select * from usuarios where usuario_sistema = '".$_POST['usuario']."'";

				$stmt = $bd->ejecutar($sql);

				if($x=$bd->obtener_fila($stmt,0)){
					$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> El nombre de usuario ' .$_POST['usuario'].' ya esta registrado!'.'</p>';
					$error= 1;
				}

			}*/
			/*if($_POST['clave'] != $_POST['re_clave']){
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> La contraseña de acceso no coiciden!'.'</p>';
				$error= 1;
			}*/

			if($_POST['cedula_bd'] != $_POST['ci']) {

				/*Creamos una query sencilla*/
				$sql = "select * from usuarios where cedula = '".$_POST['ci']."'";

				/*Ejecutamos la query*/
				$stmt = $bd->ejecutar($sql);
				
				if($x=$bd->obtener_fila($stmt,0)){
					$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> La cédula '.$_POST['ci'].' ya esta registrada!'.'</p>';
					$error= 1;
				}
			}

			if($_POST['correo_bd'] != $_POST['correo']) {

				$sql = "select * from info_usuarios where correo = '".$_POST['correo']."'";

				/*Ejecutamos la query*/
				$stmt = $bd->ejecutar($sql);

				if($x=$bd->obtener_fila($stmt,0)){
					$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> El correo ' .$_POST['correo'].' ya esta registrado!'.'</p>';
					$error= 1;
				}

			}

			if($error == 0){

				$porciones_nombres = explode(" ", $_POST['pnombre']);

				@$segundo_nombre = $porciones_nombres[1];

				$primer_nombre= $porciones_nombres[0];

				$porciones_apellidos = explode(" ", $_POST['papellido']);

				@$segundo_apellido = $porciones_apellidos[1];
				$primer_apellido = $porciones_apellidos[0];

				$sqlo = "UPDATE usuarios SET cedula = '".$_POST['ci']."', primer_nombre = '".ucwords(strtolower($primer_nombre))."', segundo_nombre = '".ucwords(strtolower($segundo_nombre))."',primer_apellido = '".ucwords(strtolower($primer_apellido))."', segundo_apellido = '".ucwords(strtolower($segundo_apellido))."' where cedula = '".$_POST['cedula_bd']."'";
		        $stmto = $bd->ejecutar($sqlo);

		        if($stmto){
		        	$sqly = "UPDATE info_usuarios SET cedula_usuario = '".$_POST['ci']."', fecha_nac = '".$_POST['fnacimiento']."', correo = '".$_POST['correo']."', telefono_movil = '".$_POST['tmovil']."', telefono_local = '".$_POST['tlocal']."', direccion = '".$_POST['direccion']."' where cedula_usuario = '".$_POST['cedula_bd']."'";
		        	$stmty = $bd->ejecutar($sqly);
		        }

		        for ($i=1; $i < $_POST['cantidad_materias']; $i++) { 
		        	$sqlr = "UPDATE usuario_materias SET id_materia = '".$_POST['mimpartida_'. $i]."', id_seccion = '".$_POST['seccion_'. $i]."' where id = '".$_POST['id_'. $i]."'";
		        	$stmtr = $bd->ejecutar($sqlr);
		        }

		        $insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Registro editado exitosamente!</p>';
			}
			
		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Consultar <span class="titulo-palabra">Profesor</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
				<div class="contenedor-form">
					<form method="post">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Consultar ó Editar Profesor</legend>
						</span>
							<span class="span-inline">
							<label for="ci_profesor">Ingrese cédula</label>
							<input type="number" id="ci_profesor" class="cedula" name="ci_profesor" placeholder="Cédula del profesor" required/>
						</span>
						<span class="span-inline">
							<input type="submit" value="Buscar" />
						</span>
					</fieldset>
					</form>
				</div>
				<?php
				if (! empty($mensaje)) {
				?>
					<div class="alert alert-danger"> <?php echo $mensaje; ?></div>
				<?php
				}
				if (! empty($insercion)) {
				?>
					<div class="alert alert-success"> 
						<?php 
							echo $insercion; 
						?>
					</div>
				<?php
				}		
				?>

				<?php
				if(isset($_POST['ci_profesor']) and ! empty($_POST['ci_profesor'])){

					/*Creamos una query sencilla*/
					$sql = "SELECT * FROM usuarios 
					LEFT JOIN info_usuarios ON usuarios.cedula = info_usuarios.cedula_usuario
					WHERE usuarios.cedula = '".$_POST['ci_profesor']."' and usuarios.rol = 'Profesor'";

					/*Ejecutamos la query*/
					$stmt = $bd->ejecutar($sql);

					if ($x = $bd->obtener_fila($stmt,0)) {			
				?>
					<form action="" method="post">

						<div class="contenedor-form">
							<fieldset>
							<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Información del Profesor</legend>
							<div class="form">
								<span class="span-block">
									<label for="ci">Cédula</label>
									<input type="hidden" value="<?php if(! empty($x['cedula'])) { echo $x['cedula'];} ?>" name="cedula_bd">
									<input type="number" id="ci" name="ci" class="cedula" value="<?php if(! empty($x['cedula'])) { echo $x['cedula'];} ?>" placeholder="Cédula" required/>
								</span>
								<span class="span-block">
									<label for="pnombre">Nombres</label>
									<input type="text" id="pnombre" name="pnombre" value="<?php if(! empty($x['primer_nombre'])) { echo $x['primer_nombre']." ".$x['segundo_nombre'];} ?>" placeholder="Primer Nombre" required/>
								</span>
								<span class="span-block">
									<label for="papellido">Apellidos</label>
									<input type="text" id="papellido" name="papellido" value="<?php if(! empty($x['primer_apellido'])) { echo $x['primer_apellido']." ".$x['segundo_apellido'];} ?>" placeholder="Primer Apellido" required/>
								</span>
								<span class="span-block">
									<label for="fnacimiento">Fecha Nacimiento</label>
									<input type="date" id="fnacimiento" value="<?php if(! empty($x['fecha_nac'])) { echo $x['fecha_nac'];} ?>" name="fnacimiento" required/>
								</span>
							</div>
							<div class="form">
								<span class="span-block">
									<label for="correo">Correo eléctronico</label>
									<input type="hidden" value="<?php if(! empty($x['correo'])) { echo $x['correo'];} ?>" name="correo_bd">
									<input type="mail" id="correo" name="correo" value="<?php if(! empty($x['correo'])) { echo $x['correo'];} ?>" placeholder="ejemplo@domain.com" required/>
								</span>
								<span class="span-block">
									<label for="tmovil">Telefono Movil</label>
									<input type="number" class="cedula" id="tmovil" name="tmovil" value="<?php if(! empty($x['telefono_movil'])) { echo $x['telefono_movil'];} ?>" placeholder="4XX2314432" required/>
								</span>
								<span class="span-block">
									<label for="tlocal">Telefono Local</label>
									<input type="number" class="cedula" id="tlocal" name="tlocal" value="<?php if(! empty($x['telefono_local'])) { echo $x['telefono_local'];} ?>" placeholder="2XX3214567" required/>
								</span>
								<span class="span-block">
									<label for="direccion">Direccion</label>
									<textarea id="direccion" name="direccion" required><?php if(! empty($x['direccion'])) { echo $x['direccion'];} ?></textarea>
								</span>
							</div>
							</fieldset>
						</div>

						<?php

							/*Creamos una query sencilla*/
							$sqlb = "SELECT * FROM usuario_materias 
							WHERE cedula_profesor = '".$x['cedula']."'";

							/*Ejecutamos la query*/
							$stmtb = $bd->ejecutar($sqlb);

							/*Realizamos un bucle para ir obteniendo los resultados*/
							if($j=$bd->obtener_fila($stmtb,0)){
							
						?>
						<div class="contenedor-form">
							<fieldset>
							<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Materia impartida</legend>
								<?php
								/*Creamos una query sencilla*/
								$sqlu = "SELECT * FROM usuario_materias 
								WHERE cedula_profesor = '".$x['cedula']."'";

								/*Ejecutamos la query*/
								$stmtu = $bd->ejecutar($sqlu);

								$i = 0;
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($r=$bd->obtener_fila($stmtu,0)){
								$i = $i + 1;
								?>
								<div class="form-block">
									<span class="span-inline">
										<label for="secciones">Sección</label>
										<input type="hidden" name="id_<?php echo $i; ?>" value="<?php echo $r['id']; ?>">
										<select  class="seccion" id="seccion" name="seccion_<?php echo $i; ?>" required>
										   <?php

											/*Creamos una query sencilla*/
											$sql = "select * from secciones";

											/*Ejecutamos la query*/
											$stmt=$bd->ejecutar($sql);

											echo "<option value='' selected='selected'> ---- </option>";
											
											/*Realizamos un bucle para ir obteniendo los resultados*/
											while ($x=$bd->obtener_fila($stmt,0)){
												if($r['id_seccion'] == $x['id_secc']){
											?>
												<option value='<?php echo $x['id_secc']; ?>' selected='selected'><?php echo $x['nombre_seccion']; ?></option>
											<?php
												}else{
											?>
												<option value='<?php echo $x['id_secc']; ?>'><?php echo $x['nombre_seccion']; ?></option>
											<?php

												}
											}

											?>
										</select>
									</span>
									<span class="span-inline">
										<label for="mimpartida">Materia</label>
										<select class="mimpartida" id="mimpartida" name="mimpartida_<?php echo $i; ?>" required>
										  <?php

											/*Creamos una query sencilla*/
											$sql = "select * from materias";

											/*Ejecutamos la query*/
											$stmt=$bd->ejecutar($sql);

											echo "<option value='' selected='selected'> ---- </option>";
											
											/*Realizamos un bucle para ir obteniendo los resultados*/
											while ($x=$bd->obtener_fila($stmt,0)){
												if($r['id_materia'] == $x['id_mat']){
											?>
												<option value='<?php echo $x['id_mat']; ?>' selected='selected'><?php echo $x['nombre_materia']; ?></option>
											<?php
												}else{
											?>
												<option value='<?php echo $x['id_mat']; ?>'><?php echo $x['nombre_materia']; ?></option>
											<?php
												}
											}

											?>
										</select>
									</span>
								</div>
								<input type="hidden" name="cantidad_materias" value="<?php echo $i; ?>">
								<?php
									}
								}
								?>
							</fieldset>
						</div>

						<div class="opcion-form">
							<span class="span-inline">
								<input type="submit" value="Guardar" />
							</span>
			
						</div>
					</form>

				<?php
				}else{

				?>
					<div class="alert alert-danger"> <?php echo '<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> No se encontro resultado!</p>'; ?></div>
				<?php
				}

				}

				?>

				
		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>