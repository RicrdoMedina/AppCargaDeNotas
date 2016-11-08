	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();
		if(! empty($_POST)){

			$mensaje = '';
			$error= 0;
			/*Creamos una query sencilla*/
			$sql = "SELECT * FROM usuarios WHERE usuario_sistema = '".$_POST['usuario']."'";

			/*Ejecutamos la query*/
			$stmt = $bd->ejecutar($sql);

			if($x=$bd->obtener_fila($stmt,0)){
				$mensaje = $mensaje.'* El nombre de usuario ya esta registrado!'.'<br>';
				$error= 1;
			}
			if($_POST['clave'] != $_POST['re_clave']){
				$mensaje = $mensaje.'* La contraseña de acceso no coiciden!'.'<br>';
				$error= 1;
			}

			/*Creamos una query sencilla*/
			$sql = "SELECT * FROM usuarios WHERE cedula = '".$_POST['ci']."'";

			/*Ejecutamos la query*/
			$stmt = $bd->ejecutar($sql);
			
			if($x=$bd->obtener_fila($stmt,0)){
				$mensaje = $mensaje.'* La cédula ya esta registrada!'.'<br>';
				$error= 1;
			}

			$sql = "SELECT * FROM materias";
			$stmt=$bd->ejecutar($sql);

			//Validar con una badera si seleccionaron alguna materia
			$bandera = 1;
			while ($x=$bd->obtener_fila($stmt,0)){
				if(! empty($_POST[$x['id_materia']])){
					$bandera = 0;
				}
			}

			if($bandera == 1) {
				$mensaje = $mensaje.'* Debe seleccionar al menos una materia!'.'<br>';
				$error= 1;
			}

			if($error == 0){
				//Guardar la fecha y hora actual
                $fecha = date("d-m-Y");
				$sql = "insert into usuarios values('','".$_POST['ci']."','".$_POST['pnombre']."','".$_POST['snombre']."','".$_POST['papellido']."','".$_POST['sapellido']."','".$_POST['usuario']."',".$_POST['clave'].",'Profesor',1,'".$fecha."')";
			    $stmt=$bd->ejecutar($sql);

			    if($stmt){
			    	$sqlt = "insert into info_usuarios values('','".$_POST['ci']."','".$_POST['fnacimiento']."','".$_POST['correo']."','".$_POST['tmovil']."','".$_POST['tlocal']."','".$_POST['direccion']."')";
			    	$bd->ejecutar($sqlt);

			    	$insercion = 'El profesor '.$_POST['pnombre'].' '.$_POST['papellido'].' ha sido registrado!';

			    	$_POST['ci'] =''; $_POST['pnombre']= ''; $_POST['snombre']=''; $_POST['papellido']=''; $_POST['sapellido']=''; $_POST['usuario']='';
				    $_POST['fnacimiento']=''; $_POST['correo']=''; $_POST['tmovil']=''; $_POST['tlocal']=''; $_POST['direccion']='';

				    //Resetear input de materias
				    $sql = "SELECT * FROM materias";
					$stmt=$bd->ejecutar($sql);

					//Validar con una badera si seleccionaron alguna materia
					$bandera = 1;
					while ($x=$bd->obtener_fila($stmt,0)){
						if(! empty($_POST[$x['id_materia']])){
							$_POST[$x['id_materia']]='';
						}
					}
			    }

			    
			}

		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Profesor</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">

			<?php
				if (! empty($mensaje)) {
				?>
					<div class="alert alert-danger"> <?php echo $mensaje; ?></div>
				<?php
				}
				if (! empty($insercion)) {
				?>
					<div class="alert alert-success"> <?php echo $insercion; ?></div>
				<?php
				}
							
			?>

			<form action="" method="post">
				<div class="opcion-form">
					<span class="iconos-form">
						<input type="submit" value="Guardar" />
					</span> 
					<span class="iconos-form">
						<input type="reset" value="Borrar" />
					</span>
	
				</div>

				<div class="contenedor-form">
					<fieldset>
					<legend>Acceso al sistema</legend>
					<span class="span-inline">
						<label for="usuario">Usuario</label>
						<input type="text" id="usuario" name="usuario" value="<?php if(! empty($_POST)) { echo $_POST['usuario'];} ?>" placeholder="Ingrese un usuario" required/>
					</span>
					<span class="span-inline">
						<label for="clave">Contraseña</label>
						<input type="password" id="clave" name="clave" placeholder="Ingrese una clave" required/>
					</span>
					<span class="span-inline">
						<label for="re_clave">Repita la contraseña</label>
						<input type="password" id="re_clave" name="re_clave" placeholder="Repita la clave" required/>
					</span>
				</div>
				<div class="contenedor-form">
					<fieldset>
					<legend>Información del Profesor</legend>
					<div class="form">
						<span class="span-block">
							<label for="ci">Cédula</label>
							<input type="number" id="ci" name="ci" value="<?php if(! empty($_POST)) { echo $_POST['ci'];} ?>" placeholder="Cédula" required/>
						</span>
						<span class="span-block">
							<label for="pnombre">Primer Nombre</label>
							<input type="text" id="pnombre" name="pnombre" value="<?php if(! empty($_POST)) { echo $_POST['pnombre'];} ?>" placeholder="Primer Nombre"/>
						</span>
						<span class="span-block">
							<label for="snombre">Segundo Nombre</label>
							<input type="text" id="snombre" name="snombre" value="<?php if(! empty($_POST)) { echo $_POST['snombre'];} ?>" placeholder="Segundo Nombre" required/>
						</span>
						<span class="span-block">
							<label for="papellido">Primer Apellido</label>
							<input type="text" id="papellido" name="papellido" value="<?php if(! empty($_POST)) { echo $_POST['papellido'];} ?>" placeholder="Primer Apellido"/>
						</span>
						<span class="span-block">
							<label for="sapellido">Segundo Apellido</label>
							<input type="text" id="sapellido" name="sapellido" value="<?php if(! empty($_POST)) { echo $_POST['sapellido'];} ?>" placeholder="Segundo Apellido" required/>

						</span>
						<span class="span-block">
							<label for="fnacimiento">Fecha Nacimiento</label>
							<input type="date" id="fnacimiento" value="<?php if(! empty($_POST)) { echo $_POST['fnacimiento'];} ?>" name="fnacimiento" required/>
						</span>
					</div>
					<div class="form">
						<span class="span-block">
							<label for="correo">Correo eléctronico</label>
							<input type="mail" id="correo" name="correo" value="<?php if(! empty($_POST)) { echo $_POST['correo'];} ?>" placeholder="usuario@mail.com" required/>
						</span>
						<span class="span-block">
							<label for="tmovil">Telefono Movil</label>
							<input type="number" id="tmovil" name="tmovil" value="<?php if(! empty($_POST)) { echo $_POST['tmovil'];} ?>" placeholder="4XX2314432" required/>
						</span>
						<span class="span-block">
							<label for="tlocal">Telefono Local</label>
							<input type="number" id="tlocal" name="tlocal" value="<?php if(! empty($_POST)) { echo $_POST['tlocal'];} ?>" placeholder="2XX3214567" required/>
						</span>
						<span class="span-block">
							<label for="direccion">Direccion</label>
							<textarea id="direccion" name="direccion" required><?php if(! empty($_POST)) { echo $_POST['direccion'];} ?></textarea>
						</span>
						<span class="span-block">
							<label for="mimpartida">Materia impartida</label>
							<span class="materia-impartida">
								<?php

								/*Creamos una query sencilla*/
								$sql = "SELECT * FROM materias";

								/*Ejecutamos la query*/
								$stmt=$bd->ejecutar($sql);

								/*Realizamos un bucle para ir obteniendo los resultados*/
								while ($x=$bd->obtener_fila($stmt,0)){

								?>
								   <input type='radio' name='<?php echo $x['id_materia']; ?>' <?php if(! empty($_POST[$x['id_materia']]) and $_POST[$x['id_materia']] == $x['id_materia']) { echo 'checked = checked';} ?> id='<?php echo $x['nombre']; ?>' value='<?php echo $x['id_materia']; ?>'> <label for='<?php echo $x['nombre']; ?>'><?php echo $x['nombre']; ?></label>
								<?php
								}

								?>
							</span>
						</span>
					</div>
					</fieldset>
				</div>
			</form>

		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>