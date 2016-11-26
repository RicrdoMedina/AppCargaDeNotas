<?php

// Rutas donde tendremos la libreria y el fichero de idiomas.
require_once('../tcpdf/config/lang/spa.php');
require_once('../tcpdf/tcpdf.php');
require_once('../DB.php');
require_once('../Sesion.php');



$Sesion = new Sesion();
$fullname = $Sesion->get('fullname');
$ci_usuario = $Sesion->get('cedula');
$rol = $Sesion->get('rol');

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


$pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true,'UTF-8', false);

// set document information


$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('');
$pdf->SetTitle('PLAN DE EVALUACIÓN');
$pdf->SetSubject('PLAN DE EVALUACIÓN');
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


$html.='<div style="font-size:25px; width:100%;  border-top:1px solid #000; border-bottom:1px solid #000; text-align:center;">
			   		<b>UNIDAD EDUCATIVA FELIPE FERMIN PAUL</b><br>
			   		Caracas - Antimano<br>
			   		Año Escolar<br>
			   		2016-2017
            </div>';

$html.='<table style="font-size:20px" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
			   <td width="100%" align="left"> <span style="font-size:25px">Profesor:'. $Sesion->get('fullname').'</span></td>
            </tr>
			<tr>
			   <td width="100%" align="center"><h2>Plan de Evaluación</h2></td>
            </tr>';

$html.='    <tr>
			   <td width="2%" align="center">N°</td>
			   <td width="18%" align="center">Nombre y Apellido</td>';


			for ($i=0; $i < $_POST['cantidad_evaluaciones']; $i++) { 
				$col = (80 / $_POST['cantidad_evaluaciones']) - 3;
				$html.='
					<td width="'.$col.'%" align="center" style="font-size:16px"><b>EVALUACIÓN</b><br><b>'.$_POST['evaluacion'.$i].'</b></td>
			   		<td width="3%" align="center">'.$_POST['porcentaje'.$i].'%</td>
			   	';
            }

$html.=' 	</tr>';



			for ($i=0; $i < $_POST['cantidad_estudiantes']; $i++) { 
			$html.='    <tr>';
				$c=1;
				$html.='
			   		<td width="2%" align="center">'.$t = $c + $i.'</td>
			   		<td width="18%" align="center"></td>';
			   	
			   	for ($cont=0; $cont < $_POST['cantidad_evaluaciones']; $cont++) { 
					$col = (80 / $_POST['cantidad_evaluaciones']) - 3;
					$html.='
						<td width="'.$col.'%" align="center"></td>
			   			<td width="3%" align="center"></td>
			   		';
            	}
            $html.=' 	</tr>';
			}



$html.='</table>';

$html.='<table style="font-size:25px" align="center" width="100%" border="0" cellpadding="0" cellspacing="0">';

$html.='    <tr>
			   <td width="100%" align="center">*Entregar este documento al Departamento de Evaluacion una vez culminadas las actividades 						
</td>
            </tr>
            <tr>
			   <td width="100%" align="center">Academicas de el liceo U.E.N Felipe Fermin Paul.</td>
            </tr>';

$html.='</table><br><br><br><br>';

$html.='<table style="font-size:25px; margin-top:10px;" align="center" width="100%" border="0" cellpadding="0" cellspacing="0">';

$html.='
        <tr>
			<td width="35%" align="center">___________________</td>
			<td width="35%" align="center"></td>
			<td width="20%" align="center" rowspan="4" border="1"></td>
        </tr>
         <tr>
			<td width="35%" align="center">Firma del Profesor</td>
			<td width="35%" align="center"></td>
        </tr>
        <tr>
			<td width="35%" align="center">CI: '.$ci_usuario.'</td>
			<td width="35%" align="center"></td>
        </tr>
        <tr>
			<td width="35%" align="center">Fecha: '.date('d/m/Y').'</td>
			<td width="35%" align="center">Sección: _____________________</td>
        </tr>
        <tr>
			<td width="35%" align="center"></td>
			<td width="35%" align="center"></td>
			<td width="20%" align="center">Sello de la institución</td>
        </tr>';

$html.='</table>';


$bMargin = $pdf->getBreakMargin();

$pdf->writeHTML($html, true, false, true, false, '');
// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output('example_001.pdf', 'I');
