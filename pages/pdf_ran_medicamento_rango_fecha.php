<?php



require_once 'data/testselect.php';
$data =  new ArrayObject();
$data->idTransaccion = '16';
$data->fecha_inicio = $_POST['fecha_inicio'];
$data->fecha_fin = $_POST['fecha_fin'];
$visitas = obtenerSelect($data);
//var_dump($visitas );
$tabla = '';

foreach ($visitas as &$visita) {
    $tabla .= '<tr><td>'.$visita['descripcion'].'</td>'
    .'<td>'.$visita['total'].'</td></tr>';
}
$tabla = '<table class="bpmTopnTail" border="1" style="margin:0 auto;"><thead><tr class="headerrow">
<th>MEDICAMENTO</th>
<th>TOTAL</th>
</tr></thead><tbody>'.$tabla.'</tbody></table>';
$html = '
<div style="text-align: right; position: fixed; top: 0pt;right: 20pt;"><img src="img/header.png" style="height 80pt; width: 110pt;" alt="Cardinal Healt"></div>
<h1>Cirpro de Delicias</h1>
<h2>Rank de Medicamentos de '.$_POST['fecha_inicio_mostrar'].' a '.$_POST['fecha_fin_mostrar'].' </h2>

<h4>Reporte de Medicamento</h4>
 <div style="text-align: center;">'
.$tabla.'</div>
';

//==============================================================
//==============================================================
//==============================================================
include("data/lib/mpdf60/mpdf.php");
//function mPDF($mode='',$format='A4',$default_font_size=0,$default_font='',$mgl=15,$mgr=15,$mgt=16,$mgb=16,$mgh=9,$mgf=9, $orientation='P') {

//$mpdf=new mPDF('c','Letter','','',15,15,16,16,9,9,'L');
$mpdf=new mPDF('utf-8', 'Leter-L');

$mpdf->SetDisplayMode('fullpage');

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