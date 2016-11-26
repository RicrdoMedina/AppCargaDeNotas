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

			<form action="PHP/reporte/plan_evaluacion.php" id="formPlanEvaluacion" target="_blank" method="post">

				<div class="contenedor-form">
					<fieldset>
					<legend><i class="fa fa-hand-o-right" aria-hidden="true"></i> Plan de evaluación</legend>
					<div class="form-evaluacion">
						<span class="span-inline">
							<label for="cantidad_estudiantes">Estudiantes</label>
							<input type="number" min="0" max="40" name="cantidad_estudiantes" value=""  placeholder="0" required="required">
						</span>
						<span class="span-inline">
							<label for="cevaluacion">Evaluaciones</label>
							<input type="number" min="0" max="20" id="cantidadItems" data-id="cargar-evaluacion" name="cantidad_evaluaciones" value=""  placeholder="0" required="required">
						</span>
						
						<div class="showElements" id="showElements">

						</div>

					</div>

					</fieldset>
				</div>
				<div class="alert alert-danger" id="msjError" style="display:none;"> Por favor verifique los porcentajes de las evaluaciones!</div>
				<div class="opcion-form">
					<span class="span-inline">
						<input type="hidden" id="totalPorcentaje" value="0" name="total_porcentaje">
						<input type="submit" value="Crear" style="display:none;" id="crearPlan" />
					</span>
	
				</div>
			</form>

		</section>

		<div id="containerElements" style="display:none;">
			<span class="inline-input">
				<label for="evaluacion">Evaluación</label>
				<input id="evaluacion" type="text" class="evaluacion" name="" value="" placeholder="Nombre de la evaluación" required>
			</span>
			<span class="inline-input">
				<label for="porcentaje">Porcentaje</label>
				<input type="number" id="porcentaje" class="porcentaje prueba" name=""  min="0" max="30" value="" placeholder=" % " required>
			</span>
			<span class="inline-input">
				<span class="total-porcentaje">Total: <b class="mostrarPorcentaje"></b><b>%</b></span>

			</span>
		</div>


		<?php require_once('TEMPLATE/pie_pagina.php');  ?>