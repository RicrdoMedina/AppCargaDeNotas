	<?php 
		require_once('PHP/Sesion.php');
		require_once('TEMPLATE/header.php');
		require_once('PHP/validar_usuario.php');
	?>
		<div class="contenedor-titulo">
				<i class="fa fa-arrow-circle-right"></i> Registrar <span class="titulo-palabra">Plan Evaluación</span>
			</div>
		<aside class="contenedor menu">

			<?php require_once('TEMPLATE/menu.php');  ?>
			
		</aside>
		<section class="contenedor">

			<form action="PHP/reporte/plan_evaluacion.php" target="_blank" method="post">

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Plan de evaluación</legend>
					<div class="form-evaluacion">
						<span class="span-block">
							<label for="cevaluacion">Ingrese cantidad de estudiantes</label>
							<input type="number" min="0" max="20" id="cargarEvaluacion" name="cantidad_evaluaciones" value=""  placeholder="0" required="required">
						</span>
					</div>

					</fieldset>
				</div>

				<div class="opcion-form">
					<span class="span-inline">
						<input type="submit" value="Crear" />
					</span>
	
				</div>
			</form>

		</section>

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>