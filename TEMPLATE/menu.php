

		<nav class="menu-vertical">
				<?php
				if($rol =='Admin'){
				?>
				<ul class="menu-items">
					<li class="menu-item" id="registrar">
						<span class="icon-menu">
						</span> 
						Registrar
					</li>
					<ul class="nivel-item sub-registrar">
						<a href="registrar_profesor.php"><li class="item">Profesor</li></a>
						<a href="registrar_alumnos.php"><li class="item">Alumnos</li></a>
						<a href="registrar_administrador.php"><li class="item">Administrador</li></a>
						<a href="registrar_materias.php"><li class="item">Materias</li></a>
						<a href="registrar_secciones.php"><li class="item">Secciones</li></a>
						<a href="registrar_sistema.php"><li class="item">Inicio sesión</li></a>
						<a href="registrar_notas.php"><li class="item">Notas</li></a>

					</ul>
					
					<li class="menu-item" id="consultar">
						<span class="icon-menu">
						</span>
						Consultar
					</li>
					<ul class="nivel-item sub-consultar">
						<a href="consultar_profesor.php"><li class="item">Profesor</li></a>
						<a href="consultar_alumnos.php"><li class="item">Alumnos</li></a>
						<a href="consultar_usuarios.php"><li class="item">Usuarios</li></a>
						<a href="consultar_materias_asignadas.php"><li class="item">Materias asignadas</li></a>
						<a href="consultar_notas_alumnos.php"><li class="item">Consultar notas</li></a>
					</ul>
					<li class="menu-item" id="boletas">
						<span class="icon-menu">
						</span>
						Generar 
					</li>
					<ul class="nivel-item sub-boletas">
						<a href="generar_boletas.php"><li class="item">Boletas</li></a>
					</ul>
				</ul>
				<?php
			    }
			    else
			    {
			    ?>
			   
				<ul class="menu-items">
					<li class="menu-item" id="registrar">
						<span class="icon-menu">
						</span> 
						Registrar
					</li>
					<ul class="nivel-item sub-registrar">
						<a href="registrar_notas_profesor.php"><li class="item">Notas</li></a>
					</ul>
					<ul class="nivel-item sub-registrar">
						<a href="registrar_plan_evaluacion.php"><li class="item">Plan Evaluación</li></a>
					</ul>
					<li class="menu-item" id="consultar">
						<span class="icon-menu">
						</span>
						Consultar
					</li>
					<ul class="nivel-item sub-consultar">
						<a href="consultar_notas.php"><li class="item">Notas</li></a>
					</ul>
					<ul class="nivel-item sub-consultar">
						<a href="alumnos.php"><li class="item">Alumnos</li></a>
					</ul>
					<li class="menu-item" id="boletas">
						<span class="icon-menu">
						</span>
						Generar 
					</li>
					<ul class="nivel-item sub-boletas">
						<a href="generar_boletas.php"><li class="item">Boletas</li></a>
					</ul>
				</ul>
				<?php
				}
				?>
			</nav>


			<aside class="publicidad">
				<div class="titulos"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Interes</div>
				<figure class="logo-img fade-img">
					<a href="http://www.minci.gob.ve/wp-content/uploads/2013/12/Plan-de-la-Patria-libro.pdf" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/plandelapatria.png" title="Plan de la Patria 2013-2019">
					</a>
				</figure>

				<figure class="logo-img fade-img">
					<a href="http://formaciondocente.mppeuct.gob.ve/" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/bannersnfpdu.jpg" title="Sistema Nacional de Formación Permanente del Docente Universitario">
					</a>
				</figure>

				<figure class="logo-img fade-img">
					<a href="http://formaciondocente.mppeuct.gob.ve/" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/top5.png" title="Libro de Oportunidades de Estudio Universitario 2016">
					</a>
				</figure>
			</aside>

