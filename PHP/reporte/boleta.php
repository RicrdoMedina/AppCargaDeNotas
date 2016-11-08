<?php

// Rutas donde tendremos la libreria y el fichero de idiomas.
require_once('../tcpdf/config/lang/spa.php');
require_once('../tcpdf/tcpdf.php');

require_once('../DB.php');

session_start();

$id_secc = $_GET['sec'];
	
$cedula = $_GET['ca'];

class MYPDF extends TCPDF {
	//Page header
	public function Header() {
		// get the current page break margin
		$bMargin = $this->getBreakMargin();
		// get current auto-page-break mode
		$auto_page_break = $this->AutoPageBreak;
		// disable auto-page-break
		$this->SetAutoPageBreak(false, 0);
		// set bacground image
		$img_file = K_PATH_IMAGES.'cgr.jpg';
		$this->Image($img_file, 0, 0, 210, 297, '', '', '', false, 300, '', false, false, 0);
		// restore auto-page-break status
		$this->SetAutoPageBreak($auto_page_break, $bMargin);
		// set the starting point for the page content
		$this->setPageMark();
	}
}


$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true,'UTF-8', false);

// set document information


$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('');
$pdf->SetTitle('BOLETIN DE CALIFICACIONES');
$pdf->SetSubject('BOLETIN DE CALIFICACIONES');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' ', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));
$pdf->setFooterData($tc=array(0,64,0), $lc=array(0,64,128));

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 6, '', true);

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();

// set text shadow effect
$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));

// Set some content to print

$html = "";

$bd = Db::getInstance();

$sqlu = "SELECT * FROM alumnos 
LEFT JOIN notas ON alumnos.cedula_alumno = notas.cedula_estudiante
LEFT JOIN materias ON  materias.id_mat = notas.id_materia 
LEFT JOIN secciones ON secciones.id_secc = notas.id_seccion WHERE alumnos.id_seccion_alumno = '$id_secc' AND alumnos.cedula_alumno = '$cedula'";

/*Ejecutamos la query*/
$stmtu = $bd->ejecutar($sqlu);

$u=$bd->obtener_fila($stmtu,0);

///////////DATOS DEL BOLETIN//////////

$html.='<br><br><br><br>';

$html.='<table width="100%" border="1" cellpadding="0" cellspacing="0" >
			<tr>
			   <td width="33%" align="center" rowspan="2">
			   		UNIDAD EDUCATIVA FELIPE FERMIN PAUL<br>
			   		Caracas - Antimano<br>
			   		Año Escolar<br>
			   		2015-2016
			   	</td>
			   <td width="33%" align="center"><b>BOLETIN DE CALIFICACIONES</b></td>
			   <td width="33%" align="center" rowspan="2">
			   		REPRESENTANTE<br>
			   		'.$u['nombre_representante'].' '.$u['apellido_representante'].'<br>
			   		'.date('d/m/Y').'
			   </td>
            </tr>';
$html.='	<tr>
			   <td width="33%" align="center" rowspan="2">
			   		Alumno:'.$u['primer_nombre'].' '.$u['segundo_nombre'].' '.$u['primer_apellido'].' '.$u['segundo_apellido'].'<br>
			   		CI:'.$u['cedula_alumno'].'<br>
			   		Grado: 5to - Sección: '.$u['nombre_seccion'].'
			  	</td>
            </tr>';

$html.='</table>';
$html.='<table width="100%" border="1" cellpadding="0" cellspacing="0" >
			<tr>
			   <td width="33%" align="center" rowspan="2"><h2>Asignaturas</h2></td>
			   <td width="33%" align="center"><h4>Resumen Academico del alumno correspondiente</h4></td>
			   <td width="33%" align="center"><h2>Resumen</h2></td>
            </tr>

			<tr>
			   <td width="10%" align="center">Inasistencias</td>
			   <td width="10%" align="center">Evaluación Continua</td>
			   <td width="13%" align="center">Observaciones</td>
			   <td width="11%" align="center">1ER LAPSO</td>
			   <td width="11%" align="center">2DO LAPSO</td>
			   <td width="11%" align="center">3ER LAPSO</td>
            </tr>';
            
$sqlh = "SELECT * FROM alumnos 
		LEFT JOIN notas ON alumnos.cedula_alumno = notas.cedula_estudiante
		LEFT JOIN materias ON  materias.id_mat = notas.id_materia 
		LEFT JOIN secciones ON secciones.id_secc = notas.id_seccion WHERE alumnos.id_seccion_alumno = '".$u['id_secc']."' AND alumnos.cedula_alumno = '".$u['cedula_alumno']."'";

/*Ejecutamos la query*/
$stmth = $bd->ejecutar($sqlh);

$i = 0;	

/*Realizamos un bucle para ir obteniendo los resultados*/
while ($r=$bd->obtener_fila($stmth,0))
{
$i = $i + 1;

$nota_final = ($r['def_uno'] + $r['def_dos'] + $r['def_tres'] ) / 3;

$html.='    <tr>
			   <td width="5%" align="center">'.$i.'</td>
			   <td width="28%" align="center">'.$r['nombre_materia'].'</td>
			   <td width="10%" align="center">0</td>
			   <td width="10%" align="center">'.round($nota_final).'</td>
			   <td width="13%" align="center"></td>
			   <td width="11%" align="center">'.round($r['def_uno']).'</td>
			   <td width="11%" align="center">'.round($r['def_dos']).'</td>
			   <td width="11%" align="center">'.round($r['def_tres']).'</td>
            </tr>';
}

$html.='</table>';


$bMargin = $pdf->getBreakMargin();

$pdf->writeHTML($html, true, false, true, false, '');
// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output('example_001.pdf', 'I');
