
	</section>

	<footer class="footer caja_animada">
		<div class="contenedor-footer contenedor-img-footer">
			<img class="img-footer" src="IMAGENES/publicidad/footer.png">
		</div>
		<div class="contenedor-footer texto-footer">
			Revolución Educativa del Gobierno Bolivariano!
		</div>
	</footer>

	<script src="JS/jquery.js"></script>
	<script src="JS/tabs.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			//Menu dinamico jquery
			$(".menu-item").addClass("open");
			$(".nivel-item").css("display","block");
			$("li.menu-item").click(function() {
				var id = $(this).attr('id');

				var contenido = $('ul.'+'sub-'+id);
				
				 if(contenido.css("display")=="none"){ //open		
				      contenido.slideDown(250);			
				      $(this).addClass("open");
				 }
				 else
				 { //close		
				      contenido.slideUp(250);
				      $(this).removeClass("open");	
				}
			});

			//Cargar dinamicamente las materias de los profesores
			$("#cmateria").change(function(){
			    var valor = $(this).val();
			    var i = 0;
			    var elementos = $( "#mostrarMaterias #contenedorMaterias").size();
			    var total = valor - elementos;

			    var patron = /^\d*$/; 
			    

              	//Si el numero es negativo
              	//Se eliminan elementos
				if( ! patron.test(total)){   
					           
					total = total * (-1);
					while (i < total){
						i++; 
						var ultimo = $("#mostrarMaterias #contenedorMaterias").last();
						ultimo.remove();
					}
				}else{

					while (i < total){
						i++;
						var last = $("#mostrarMaterias #contenedorMaterias").size();
						//alert(last);
						//console.log(last);
						$("#contenedorMaterias").clone().appendTo("#mostrarMaterias").show().attr("class","materia"+last).addClass('zebra');
						$("."+"materia"+last+" .mimpartida").attr("name","materia"+last);
						$("."+"materia"+last+" .seccion").attr("name","seccion"+last);
					}
				}
			});

			//Cargar dinamicamente las materias
			$("#cargarMateria").change(function(){
			    var valor = $(this).val();
			    var i = 0;
			    var elementos = $( "#mostrarMaterias #contenedorMaterias").size();
			    var total = valor - elementos;

			    var patron = /^\d*$/; 
			    

              	//Si el numero es negativo
              	//Se eliminan elementos
				if( ! patron.test(total)){   
					           
					total = total * (-1);
					while (i < total){
						i++; 
						var ultimo = $("#mostrarMaterias #contenedorMaterias").last();
						ultimo.remove();
					}
				}else{

					while (i < total){
						i++;
						var last = $("#mostrarMaterias #contenedorMaterias").size();
						//alert(last);
						//console.log(last);
						$("#contenedorMaterias").clone().appendTo("#mostrarMaterias").show().attr("class","materia"+last).addClass('zebra');
						$("."+"materia"+last+" .materia").attr("name","materia"+last).val('');
					}
				}
			});

			//Cargar dinamicamente de evaluaciones
			$("#cargarEvaluacion").change(function(){
			    var valor = $(this).val();
			    var i = 0;
			    var elementos = $( "#mostrarEvaluaciones #contenedorEvaluaciones").size();
			    var total = valor - elementos;

			    var patron = /^\d*$/; 
			    

              	//Si el numero es negativo
              	//Se eliminan elementos
				if( ! patron.test(total)){   
					           
					total = total * (-1);
					while (i < total){
						i++; 
						var ultimo = $("#mostrarEvaluaciones #contenedorEvaluaciones").last();
						ultimo.remove();
					}
				}else{

					while (i < total){
						i++;
						var last = $("#mostrarEvaluaciones #contenedorEvaluaciones").size();
						//alert(last);
						//console.log(last);
						$("#contenedorEvaluaciones").clone().appendTo("#mostrarEvaluaciones").show().attr("class","evaluacion"+last).addClass('zebra');
						$("."+"evaluacion"+last+" .evaluacion").attr("name","evaluacion"+last).val('');
						$("."+"evaluacion"+last+" .porcentaje").attr("name","porcentaje"+last).val('');
						$("."+"evaluacion"+last+" .nota").attr("name","nota"+last).val('');
					}
				}
			});

			//Cargar dinamicamente las materias
			$("#cargarSeccion").change(function(){
			    var valor = $(this).val();
			    var i = 0;
			    var elementos = $( "#mostrarSecciones #contenedorSecciones").size();
			    var total = valor - elementos;

			    var patron = /^\d*$/; 
			    

              	//Si el numero es negativo
              	//Se eliminan elementos
				if( ! patron.test(total)){   
					           
					total = total * (-1);
					while (i < total){
						i++; 
						var ultimo = $("#mostrarSecciones #contenedorSecciones").last();
						ultimo.remove();
					}
				}else{

					while (i < total){
						i++;
						var last = $("#mostrarSecciones #contenedorSecciones").size();
						//alert(last);
						//console.log(last);
						$("#contenedorSecciones").clone().appendTo("#mostrarSecciones").show().attr("class","seccion"+last).addClass('zebra');
						$("."+"seccion"+last+" .seccion").attr("name","seccion"+last).val('');
					}
				}
			});

			//Cargar dinamicamente los estudiantes
			$("#cestudiantes").change(function(){
			    var valor = $(this).val();
			    var i = 0;
			    var elementos = $( "#mostrarEstudiantes #contenedorEstudiantes").size();
			    var total = valor - elementos;

			    var patron = /^\d*$/; 
			    

              	//Si el numero es negativo
              	//Se eliminan elementos
				if( ! patron.test(total)){   
					           
					total = total * (-1);
					while (i < total){
						i++; 
						var ultimo = $("#mostrarEstudiantes #contenedorEstudiantes").last();
						ultimo.remove();
					}
				}else{

					while (i < total){
						i++;
						var last = $("#mostrarEstudiantes #contenedorEstudiantes").size();
						//alert(last);
						//console.log(last);
						$("#contenedorEstudiantes").clone().appendTo("#mostrarEstudiantes").show().attr("class","estudiante"+last).addClass('zebra');
						$("."+"estudiante"+last+" .ci").attr("name","ci"+last).val('');
						$("."+"estudiante"+last+" .pnombre").attr("name","pnombre"+last).val('');
						$("."+"estudiante"+last+" .snombre").attr("name","snombre"+last).val('');
						$("."+"estudiante"+last+" .papellido").attr("name","papellido"+last).val('');
						$("."+"estudiante"+last+" .sapellido").attr("name","sapellido"+last).val('');
						$("."+"estudiante"+last+" .nombres_representate").attr("name","nombres_representate"+last).val('');
						$("."+"estudiante"+last+" .apellidos_representate").attr("name","apellidos_representate"+last).val('');
					}
				}
			});

			//Mostrar dinamicamente tabla de estudiantes
			$("#notas").change(function(){
			    var id = $(this).val();
			    var status;
			  	
			  	$(".contenedor-estudiantes").attr("data-status","0").hide();

			  	$("#"+id).attr("data-status","1");

			  	$(".contenedor-estudiantes").each(function (index) 
			    { 
			      	status = $(this).attr("data-status");
			      	if(status == 1){
			      		$(this).show(250);
			      	}

			    })
			});

			$('.disabled').prop('disabled', true);

			 $(".check").click(function() {
			 	var id = $(this).attr("id");
			 	var status = $(this).val();
			 	//alert(id);
			 	if(status == 0){
          			$("."+id).removeClass('disabled');
          			$("."+id).prop('disabled', false);
          			$("#"+id).val(1);
			 	}else{
			 		$("."+id).prop('disabled', true);
			 		$("."+id).addClass('disabled');
			 		$("#"+id).val(0);
			 	}
			 	
			 });

			 $('#generarPdf').click(function(){

		        var dataString = $('#planEvaluacion').serialize();

		        alert('Datos serializados: '+dataString);

		        $.ajax({
		            type: "POST",
		            url: "PHP/reporte/plan_evaluacion.php",
		            data: dataString,
		            success: function(data) {

		            }
		        });

		        window.open('PHP/reporte/plan_evaluacion.php','_blank');
		    });
		});
	</script>
</body>
</html> 