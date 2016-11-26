
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
			//Sumarlos porcentajes acumulados y mostrarlos
			$(document).on('change','#showElements input.porcentaje',function(e){

                 var total = $("#showElements input.porcentaje").size();

                	var temp = 0;

			        var add = 0;  

			        var totalPorcentaje = Number($("#totalPorcentaje").val());    

                for (var i = 0; i < total; i++) {
                	id = 'input[name=porcentaje'+i+']';
                	element = $(id).val();
                	
                	add += temp + Number(element);
                	//console.log('input[name=porcentaje'+i);
                };

                if(totalPorcentaje === 99){ 
                	$("#crearPlan").show();
                	$("#msjError").hide();
                }else if(totalPorcentaje >= 99){
                	$("#crearPlan").hide();
                	$("#msjError").show();
                }else if(totalPorcentaje <= 99){
                	$("#crearPlan").hide();
                }
                

                //console.log(add);
                $(".mostrarPorcentaje").html(add);
                $("#totalPorcentaje").val(add);
			});

			//Cargar dinamicamente elementos
			$("#cantidadItems").change(function(){
			    var valor = $(this).val();
			    var id = $(this).attr("data-id");
			    var i = 0;
			    var elementos = $( "#showElements #containerElements").size();
			    var total = valor - elementos;
			    var estudiante = ['ci','pnombre','papellido','nombres_representate','apellidos_representate'];
			    var seccion = ['seccion'];
			    var evaluacion = ['evaluacion','porcentaje'];
			    var materia = ['materia'];
			    var materiaImpartida = ['mimpartida','seccion'];

			    var patron = /^\d*$/; 
			    
              	//Si el numero es negativo
              	//Se eliminan elementos
				if( ! patron.test(total)){   
					           
					total = total * (-1);
					while (i < total){
						i++; 
						var ultimo = $("#showElements #containerElements").last();
						if(id == 'cargar-evaluacion'){
							var ultimoElement = $("#showElements input.porcentaje").last();
							var valorUltimoElement = ultimoElement[0].value;
						}
						ultimo.remove();
					}

					
					if(id == 'cargar-evaluacion'){
						var totalPorcentajeAcu = $("#totalPorcentaje").val();
						var resultadoPorcentaje = (Number(valorUltimoElement ) - Number(totalPorcentajeAcu)) * (-1);
						$("#totalPorcentaje").attr("value",resultadoPorcentaje);
						$(".mostrarPorcentaje").html(resultadoPorcentaje);
					}

				}else{

					while (i < total){
						i++;
						var last = $("#showElements #containerElements").size();
						$("#containerElements").clone().appendTo("#showElements").show().attr("class","element"+last).addClass('zebra');
						
						
						if(id == 'cargar-estuadiantes'){
							writeNameAtributesInput(last,estudiante);
						}
						else if(id == 'cargar-secciones'){
							writeNameAtributesInput(last,seccion);
						}
						else if(id == 'cargar-materias'){
							writeNameAtributesInput(last,materia);
						}
						else if(id == 'cargar-materias-impartidas'){
							writeNameAtributesInput(last,materiaImpartida);
						}
						else if(id == 'cargar-evaluacion'){
							writeNameAtributesInput(last,evaluacion);
						}
					}
				}
			});

			//Escribir atributos name dinamicamente para luego extraer el valor del input con PHP
			var writeNameAtributesInput = function(iterador,atributeInputs){
				var cont = 0;

				while(cont < atributeInputs.length){
					$("."+"element"+iterador+" ."+atributeInputs[cont]).attr("name",atributeInputs[cont]+iterador).val('');
					cont++;
				}
			};

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
		});
	</script>
</body>
</html> 