	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
		$bd = Db::getInstance();
		if(! empty($_POST)){
			echo "gfdgdgd";
			for ($i=0; $i < $_POST['cantidad_secciones']; $i++) { 
			    //echo $_POST['seccion' . $i];
			    $sql = "insert into secciones values('','". $_POST['seccion' . $i] ."', '1','')";
            	$stmt = $bd->ejecutar($sql);
			}

			$insercion = '<p><i class="fa fa-check-square" aria-hidden="true"></i> Su registro fue exitoso!</p>';
		}
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Secciones</span>
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
							
							for ($i=0; $i < $_POST['cantidad_secciones']; $i++) { 
			    			//echo $_POST['materia' . $i];
			    			echo "<p class='msj-grupos'> Sección: " . ucwords(strtolower($_POST['seccion' . $i])) ."</p>";
							}			
						?>
					</div>
				<?php
				}
							
			?>

			<form action="" method="post">

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Agregar secciones</legend>
				
					<div class="form">
						<span class="span-block">
							<label for="cmateria">Ingrese número de secciones</label>
							<input type="number" min="0" max="20" id="cargarSeccion" name="cantidad_secciones" placeholder="0" required>
						</span>
						<div class="mostrarSecciones" id="mostrarSecciones">
							
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

		<div id="contenedorSecciones" style="display:none;">
			<span class="span-block">
				<label for="seccion">Sección</label>
				<input type="text" id="seccion" class="seccion" name="" placeholder="Identifique la sección" required/>
			</span>
		</div>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>