	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();
		if(! empty($_POST)){

			$mensaje = '';
			$error= 0;

			if($_POST['clave'] != $_POST['re_clave']){
				$mensaje = $mensaje.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> La clave de acceso no coiciden!'.'</p>';
				$error= 1;
			}

			if($error == 0){
				$sqlt = "UPDATE usuarios SET password = '".$_POST['clave']."', activo =1 where cedula = '".$ci_usuario."'";
		        $stmt = $bd->ejecutar($sqlt);

              	$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Su clave fue actualizada exitosamente!</p>';
			}

		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Cambiar <span class="titulo-palabra">clave</span>
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
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Acceso al sistema</legend>
					<span class="span-inline">
						<label for="clave">Clave Nueva</label>
						<input type="password" id="clave" name="clave" value="" placeholder="Ingrese una clave" required/>
					</span>
					<span class="span-inline">
						<label for="re_clave">Repita Clave</label>
						<input type="password" id="re_clave" name="re_clave" value="" placeholder="Repita la clave" required/>
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