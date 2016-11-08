<?php 
require_once('PHP/Sesion.php');
require_once('TEMPLATE/header.php');
$bd = Db::getInstance();
if (! empty($_POST['ci'])) {
	$msj = '';
	$error= 0;

	/*Creamos una query sencilla*/
	$sql = "select * from usuarios where cedula = '".$_POST['ci']."'";

	/*Ejecutamos la query*/
	$stmt = $bd->ejecutar($sql);
			
	if($x=$bd->obtener_fila($stmt,0)){

		$sqlo = "UPDATE usuarios SET password = '1234', activo = '2' where cedula = '".$_POST['ci']."'";
		
		$stmto = $bd->ejecutar($sqlo);

		$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Su usuario es ' .$x["usuario_sistema"]. ' La clave provisional es 1234!</p>';
	}else{
		$msj = $msj.'<p><i class="fa fa-times-circle-o" aria-hidden="true"></i> La cédula ' .$_POST["ci"]. ' no existe!</p>';
		$error= 1;
	}

}

?>
	<div class="contenedor-titulo">
		<i class="fa fa-arrow-circle-right"></i> Recuperar <span class="titulo-palabra">Clave de acceso</span>
	</div>

	<aside class="contenedor menu">

		<?php require_once('TEMPLATE/form_login.php');  ?>

	</aside>
	<section class="contenedor">
		<?php
			if (! empty($msj)) {
				?>
					<div class="alert alert-danger"> <?php echo $msj; ?></div>
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
				<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Cuenta de usuario</legend>
	
					<span class="span-inline">
						<label for="ci">Ingrese su cédula</label>
						<input type="number" id="ci" name="ci" value="<?php if(! empty($_POST)) { echo $_POST['ci'];} ?>" placeholder="Cédula del usuario" required/>
					</span>

				</fieldset>
			</div>
			<div class="opcion-form">
				<span class="span-inline">
					<input type="submit" value="Resetear" />
				</span>
			</div>
		</form>
	</section>

<?php require_once('TEMPLATE/pie_pagina.php');  ?>