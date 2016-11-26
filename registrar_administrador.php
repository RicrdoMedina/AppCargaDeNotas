	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');

		$bd = Db::getInstance();
		if(! empty($_POST)){

			$mensaje = '';
			$error= 0;
			/*Creamos una query sencilla
			$sql = "select * from usuarios where usuario_sistema = '".$_POST['usuario']."'";*/

			/*Ejecutamos la query
			$stmt = $bd->ejecutar($sql);*/

			/*if($x=$bd->obtener_fila($stmt,0)){
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> El nombre de usuario ya esta registrado!'.'</p>';
				$error= 1;
			}
			if($_POST['clave'] != $_POST['re_clave']){
				$mensaje = $mensaje.'<i class="fa fa-times-circle-o" aria-hidden="true"></i> La contraseña de acceso no coiciden!'.'<br>';
				$error= 1;
			}*/

			/*Creamos una query sencilla*/
			$sql = "select * from usuarios where cedula = '".$_POST['ci']."'";

			/*Ejecutamos la query*/
			$stmt = $bd->ejecutar($sql);
			
			if($x=$bd->obtener_fila($stmt,0)){
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> La cédula ya esta registrada!'.'</p>';
				$error= 1;
			}

			if($error == 0){
				//Guardar la fecha y hora actual
                $fecha = date("d-m-Y");

                $porciones_nombres = explode(" ", $_POST['pnombre']);

				@$segundo_nombre = $porciones_nombres[1];

				$primer_nombre= $porciones_nombres[0];

				$porciones_apellidos = explode(" ", $_POST['papellido']);

				@$segundo_apellido = $porciones_apellidos[1];
				
				$primer_apellido = $porciones_apellidos[0];

                $sql = "insert into usuarios values('','".$_POST['ci']."','".$primer_nombre."','".$segundo_nombre."','".$primer_apellido."','".$segundo_apellido."','".$_POST['ci']."','UnidadE01','Admin',2)";
                $stmt = $bd->ejecutar($sql);
			    if($stmt){
			    	$insercion = '<i class="fa fa-check-square" aria-hidden="true"></i> El administrador '.$_POST['pnombre'].' '.$_POST['papellido'].' ha sido registrado!';

			    	$_POST['ci'] =''; $_POST['pnombre']= ''; $_POST['snombre']=''; $_POST['papellido']=''; $_POST['sapellido']=''; $_POST['usuario']='';
				    $_POST['fnacimiento']=''; $_POST['correo']=''; $_POST['tmovil']=''; $_POST['tlocal']=''; $_POST['direccion']='';
			    }
			}

		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Administrador</span>
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
				
				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Información del Administrador</legend>
	
						<span class="span-inline">
							<label for="ci">Cédula</label>
							<input type="number" id="ci" name="ci" class="cedula" value="<?php if(! empty($_POST)) { echo $_POST['ci'];} ?>" placeholder="Cédula" required/>
						</span>
						<span class="span-inline">
							<label for="pnombre">Nombres</label>
							<input type="text" id="pnombre" name="pnombre" value="<?php if(! empty($_POST)) { echo $_POST['pnombre'];} ?>" placeholder="Nombres del usuario"/>
						</span>

						<span class="span-inline">
							<label for="papellido">Apellidos</label>
							<input type="text" id="papellido" name="papellido" value="<?php if(! empty($_POST)) { echo $_POST['papellido'];} ?>" placeholder="Apellidos del usuario"/>
						</span>


					</fieldset>
				</div>
				<div class="opcion-form">
					<span class="span-inline">
						<input type="submit" value="Guardar" />
					</span>
	
				</div>
			</form>

		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>