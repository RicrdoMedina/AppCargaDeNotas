	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();
		if(! empty($_POST['usuario_sistema'])){

			$mensaje = '';
			$error= 0;
			/*Creamos una query sencilla*/
			$sql = "select * from usuarios where usuario_sistema = '".$_POST['usuario_sistema']."'";

			/*Ejecutamos la query*/
			$stmt = $bd->ejecutar($sql);

			/*if($x=$bd->obtener_fila($stmt,0)){
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> El nombre de usuario '. $_POST['usuario_sistema'] .' ya esta registrado!'.'</p>';
				$error= 1;
			}*/
			

			if($error == 0){
				$sqlt = "UPDATE usuarios SET usuario_sistema = '".$_POST['usuario_sistema']."', password = 'UnidadE01', activo = '2' where cedula = '".$_POST['ci_sistema']."'";
		        $stmt = $bd->ejecutar($sqlt);

              	$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> El usuario '. $_POST['usuario_sistema'] .' fue creado con clave de acceso por defecto UnidadE01</p>';
               
			}

		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Usuario de sistema</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">
			


			<form action="" method="post">

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Acceso al sistema</legend>
							<span class="span-inline">
							<label for="usuario">Seleccione</label>
							<select  class="usuario" id="usuario" name="usuario" required onchange="form.submit()">
							   <?php

								/*Creamos una query sencilla*/
								$sql = "select * from usuarios order by primer_nombre asc";

								/*Ejecutamos la query*/
								$stmt=$bd->ejecutar($sql);

								echo "<option value='' selected='selected'> ---- </option>";
								
								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

								?>
									<option value='<?php echo $x['cedula']; ?>'><?php echo $x['cedula']." : ".$x['primer_nombre']." ".$x['primer_apellido']; ?></option>
								<?php
								}

								?>
							</select>
						</span>
					</fieldset>
				</div>
			</form>

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
				if (isset($_POST['usuario']) and ! empty($_POST['usuario'])) {
					/*Creamos una query sencilla*/
					$sqlr = "select * from usuarios where cedula = '".$_POST['usuario']."'";

					/*Ejecutamos la query*/
					$stmtr=$bd->ejecutar($sqlr);

					$r=$bd->obtener_fila($stmtr,0);
			?>
			<form action="" method="post">

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> <?php if(! empty($r['primer_nombre'])) { echo $r['primer_nombre']." ".$r['segundo_nombre']; } ?><?php if(! empty($r['primer_apellido'])) { echo " ".$r['primer_apellido']." ".$r['segundo_apellido']; } ?></legend>

						<span class="span-inline">
							<label for="usuario_sistema">Crear un Usuario</label>
							<input type="hidden" id="ci_sistema" name="ci_sistema" value="<?php  if(! empty($r['cedula'])) { echo $r['cedula']; } ?>"/>
							<input type="text" id="usuario_sistema" name="usuario_sistema" value="" placeholder="Ingrese un usuario" required/>
						</span>
	
					</fieldset>
				</div>
				<div class="opcion-form">
					<span class="span-inline">
						<input type="submit" value="Guardar" />
					</span>
	
				</div>
			</form>

			<?php
			}
			?>

		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>