<?php



require_once 'data/testselect.php';
$data =  new ArrayObject();
$data->idTransaccion = '17';
$data->fecha_inicio = $_POST['fecha_inicio'];
$data->fecha_fin = $_POST['fecha_fin'];
$visitas = obtenerSelect($data);
//var_dump($visitas );
$tabla = '';

foreach ($visitas as &$visita) {
    $tabla .= '<tr><td>'.$visita['id_empleado'].'</td>'
    .'<td>'.$visita['nombre_completo'].'</td>'
    .'<td>'.$visita['turno'].'</td>'
    .'<td>'.$visita['area'].'</td>'
    .'<td>'.$visita['departamento'].'</td>'
    .'<td>'.$visita['fecha'].'</td>'
    .'<td>'.$visita['motivo'].'</td></tr>';
}
$tabla = '<table class="bpmTopnTail" border="1" style="margin:0 auto;"><thead><tr class="headerrow"><th>ID EMPLEADO</th><th>NOMBRE</th>
<th>TURNO</th>
<th>AREA</th>
<th>DEPARTAMENTO</th>
<th>FECHA</th>
<th>MOTIVO(S)</th></tr>'.$tabla.'</table>';

$html = $tabla;

//==============================================================
//==============================================================
//==============================================================
define('_MPDF_URI','data/lib/mpdf60/');
include("data/lib/mpdf60/mpdf.php");

$mpdf=new mPDF('utf-8', 'Leter-C',0,'',15,15,40,16,5,9);
$mpdf->SetDisplayMode('fullpage');

$mpdf->SetHTMLHeader('
<table style="width: 100%;"><tr><td><h1>Cirpro de Delicias</h1></td><td style="text-align: right"> <img src="img/header.png" style="height 80pt; width: 110pt; margin 0 0 0 0;" alt="Cardinal Healt"></td></tr></table>
<h2>Pases de Salida de '.$_POST['fecha_inicio_mostrar'].' a '.$_POST['fecha_fin_mostrar'].' </h2>
<h4>Reporte de Pases de Salida</h4>');
$mpdf->setFooter('Pagina {PAGENO} de {nbpg}');
$mpdf->list_indent_first_level = 0;	// 1 or 0 - whether to indent the first level of a list

    // LOAD a stylesheet
$stylesheet = file_get_contents('mpdfstyletables.css');
$mpdf->WriteHTML($stylesheet,1);	// The parameter 1 tells that this is css/style only and no body/html/text

$mpdf->WriteHTML($html,2);


//print $html;
$mpdf->Output('mpdf.pdf','I');
exit;
//==============================================================
//==============================================================
//==============================================================


?>