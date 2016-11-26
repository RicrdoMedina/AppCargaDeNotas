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
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> La contraseña de acceso no coiciden!'.'</p>';
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

			$sql = "select * from info_usuarios where correo = '".$_POST['correo']."'";

			/*Ejecutamos la query*/
			$stmt = $bd->ejecutar($sql);

			if($x=$bd->obtener_fila($stmt,0)){
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> El correo ya esta registrado!'.'</p>';
				$error= 1;
			}


			//Validar con una badera si seleccionaron alguna materia
			$bandera = 0;
			if(! empty($_POST['cantidad_materias'])) {
				

				for($i=0; $i < $_POST['cantidad_materias']; $i++) { 
			    	//echo $_POST['materia' . $i];

			    	$sqlw = "select * from usuario_materias where id_materia = '".$_POST['mimpartida' . $i]."' and id_seccion = '".$_POST['seccion' . $i]."'";
			    	$stmtw = $bd->ejecutar($sqlw);

			    	if(!$w=$bd->obtener_fila($stmtw,0)){
			    	}else{
			    		$bandera == 1;
			    		$error= 1;
			    	}
			    }
			}
			

			if($error == 1) {
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> Usted selecciono una materia que ya tiene asignado un docente!'.'</p>';
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


                $sql = "insert into usuarios values('','".$_POST['ci']."','". ucwords(strtolower($primer_nombre)) ."','". ucwords(strtolower($segundo_nombre))  ."','". ucwords(strtolower($primer_apellido)) ."','". ucwords(strtolower($segundo_apellido)) ."','". $_POST['ci'] ."','UnidadE01','Profesor',2)";
                $stmt = $bd->ejecutar($sql);

			    if($stmt){
			    	$sqlt = "insert into info_usuarios values('','".$_POST['ci']."','".$_POST['fnacimiento']."','".$_POST['correo']."','".$_POST['tmovil']."','".$_POST['tlocal']."','".ucwords(strtolower($_POST['direccion']))."')";
			    	$bd->ejecutar($sqlt);


			    	for ($i=0; $i < $_POST['cantidad_materias']; $i++) { 
			    		//echo $_POST['materia' . $i];
			    		$sqlu = "insert into usuario_materias values('','".$_POST['ci']."','".$_POST['mimpartida' . $i]."','".$_POST['seccion' . $i]."')";
			    		$bd->ejecutar($sqlu);
			    	}

			    	$insercion = "<p><i class='fa fa-check-square' aria-hidden='true'></i> El profesor ". ucwords(strtolower($_POST['pnombre'])) ." ".ucwords(strtolower($_POST['papellido']))." ha sido registrado!</p>";

			    	$_POST['ci'] =''; $_POST['pnombre']= ''; $_POST['snombre']=''; $_POST['papellido']=''; $_POST['sapellido']=''; $_POST['usuario']='';
				    $_POST['fnacimiento']=''; $_POST['correo']=''; $_POST['tmovil']=''; $_POST['tlocal']=''; $_POST['direccion']='';

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
					<div class="alert alert-success"> 
						<?php 
							echo $insercion; 
						?>
					</div>
				<?php
				}
							
			?>

			<form action="" method="post">

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Información del Profesor</legend>
					<div class="form">
						<span class="span-block">
							<label for="ci">Cédula</label>
							<input type="number" id="ci" name="ci" class="cedula" value="<?php if(! empty($_POST)) { echo $_POST['ci'];} ?>" placeholder="Cédula" required/>
						</span>
						<span class="span-block">
							<label for="pnombre">Nombres</label>
							<input type="text" id="pnombre" name="pnombre" value="<?php if(! empty($_POST)) { echo $_POST['pnombre'];} ?>" placeholder="Nombres del Profesor" required/>
						</span>
	
						<span class="span-block">
							<label for="papellido">Apellidos</label>
							<input type="text" id="papellido" name="papellido" value="<?php if(! empty($_POST)) { echo $_POST['papellido'];} ?>" placeholder="Apellidos del Profesor" required/>
						</span>
						<span class="span-block">
							<label for="fnacimiento">Fecha Nacimiento</label>
							<input type="date" id="fnacimiento" value="<?php if(! empty($_POST)) { echo $_POST['fnacimiento'];} ?>" name="fnacimiento" required/>
						</span>
					</div>
					<div class="form">
						<span class="span-block">
							<label for="correo">Correo eléctronico</label>
							<input type="mail" id="correo" name="correo" value="<?php if(! empty($_POST)) { echo $_POST['correo'];} ?>" placeholder="ejemplo@domain.com" required/>
						</span>
						<span class="span-block">
							<label for="tmovil">Telefono Movil</label>
							<input type="number" id="tmovil" name="tmovil" class="cedula" value="<?php if(! empty($_POST)) { echo $_POST['tmovil'];} ?>" placeholder="4XX2314432" required/>
						</span>
						<span class="span-block">
							<label for="tlocal">Telefono Local</label>
							<input type="number" id="tlocal" name="tlocal" class="cedula" value="<?php if(! empty($_POST)) { echo $_POST['tlocal'];} ?>" placeholder="2XX3214567" required/>
						</span>
						<span class="span-block">
							<label for="direccion">Direccion</label>
							<textarea id="direccion" name="direccion" required><?php if(! empty($_POST)) { echo $_POST['direccion'];} ?></textarea>
						</span>
					</div>
					</fieldset>
				</div>

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Materia impartida</legend>
					<span class="span-block">
						<label for="cmateria">Catidad de Materias</label>
						<input type="number" min="0" max="5" id="cantidadItems" data-id="cargar-materias-impartidas" name="cantidad_materias" value=""  placeholder="0" required>
					</span>
					<div class="showElements" id="showElements">
						
					</div>
					</fieldset>
				</div>

				<div class="opcion-form">
					<span class="span-inline">
						<input type="submit" value="Guardar" />
					</span>
	
				</div>
			</form>

		</section>
					<div id="containerElements" style="display:none;">
						<span class="span-inline">
							<label for="secciones">Sección</label>
							<select  class="seccion" id="seccion" name="" required>
							   <?php

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

								?>
							</select>
						</span>
						<span class="span-inline">
							<label for="mimpartida">Materia</label>
							<select class="mimpartida" id="mimpartida" name="" required>
							  <?php

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

								?>
							</select>
						</span>
					</div>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>