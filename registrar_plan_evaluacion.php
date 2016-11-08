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
							<label for="cevaluacion">Ingrese número de evaluaciones</label>
							<input type="number" min="0" max="20" id="cargarEvaluacion" name="cantidad_evaluaciones" value=""  placeholder="0" required="required">
						</span>
						<div class="mostrarEvaluaciones" id="mostrarEvaluaciones">
							
						</div>
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

		<div id="contenedorEvaluaciones" style="display:none;">
			<span class="span-block">
				<label for="evaluacion">Evaluación</label>
				<textarea id="evaluacion" class="evaluacion" name="" value="" placeholder="Descripción de la evaluación" required></textarea>
			</span>
			<span class="span-inline">
				<label for="porcentaje">Porcentaje (%)</label>
				<input type="number" id="porcentaje" class="porcentaje" name=""  min="0" max="100" value="" required>
			</span>
			<span class="span-inline">
				<label for="nota">Nota</label>
				<input type="number" id="nota" class="nota" name=""  min="0" max="20" value="" required>
			</span>
		</div>

	

		<?php require_once('TEMPLATE/pie_pagina.php');  ?>