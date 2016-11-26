	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();
		if(! empty($_POST)){

			for ($i=0; $i < $_POST['cantidad_materias']; $i++) { 
			    //echo $_POST['materia' . $i];
			    $sql = "insert into materias values('','". ucwords(strtolower($_POST['materia' . $i])) ."')";
            	$stmt = $bd->ejecutar($sql);
			}

			$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Su registro fue exitoso!</p>';

		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Materias</span>
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
						<?php echo $insercion; 
							
							for ($i=0; $i < $_POST['cantidad_materias']; $i++) { 
			    			//echo $_POST['materia' . $i];
			    			echo "<p class='msj-grupos'> Materia: " . ucwords(strtolower($_POST['materia' . $i])) ."</p>";
							}			
						?>
					</div>
				<?php
				}
							
			?>

			<form action="" method="post">

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Agregar materias</legend>
					<div class="form">
						<span class="span-block">
							<label for="cmateria">Ingrese número de materias</label>
							<input type="number" min="0" max="20" id="cantidadItems" data-id="cargar-materias" value=""  placeholder="0" required>
						</span>
						<div class="showElements" id="showElements">
							
						</div>
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
			<span class="span-block">
				<label for="materia">Materia</label>
				<input type="text" id="materia" class="materia" name="" value="" placeholder="Nombre de la materia" required/>
			</span>
		</div>

	

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>