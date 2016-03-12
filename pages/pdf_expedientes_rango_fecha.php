<?php



require_once 'data/testselect.php';
$data =  new ArrayObject();
$data->idTransaccion = '24';
$data->fecha_inicio = $_POST['fecha_inicio'];
$data->fecha_fin = $_POST['fecha_fin'];
$visitas = obtenerSelect($data);
//var_dump($visitas );
$tabla = '';
$NomrePDF = 'Memos_'.$data->fecha_inicio.'_'.$data->fecha_fin.'.PDF';
foreach ($visitas as &$visita) {
    $tabla .= '<tr><td>'.$visita['id_empleado'].'</td>'.
        '<td>'.$visita['nombre_completo'].'</td>'.
        '<td>'.$visita['peso'].'</td>'.
        '<td>'.$visita['talla'].'</td>'.
        '<td>'.$visita['altura'].'</td>'.
        '<td>'.$visita['frecuencia_respiratoria'].'</td>'.
        '<td>'.$visita['frecuencia_cardiaca'].'</td>'.
        '<td>'.$visita['temperatura'].'</td>'.
        '<td>'.$visita['imc'].'</td>'.
        '<td>'.$visita['interrogatorio'].'</td>'.
        '<td>'.$visita['exploracion_fisica'].'</td>'.
        '<td>'.$visita['tratamiento'].'</td>'.
        '<td>'.$visita['diagnostico'].'</td>'.
        '<td>'.$visita['ramo_seguro'].'</td>'.
        '<td>'.$visita['otras_indicaciones'].'</td>'.
        '<td>'.$visita['pase_imss'].'</td>'.
        '<td>'.$visita['proceso'].'</td></tr>';
}
$tabla = '<table class="bpmTopnTail" border="1" style="margin:0 auto;"><thead><tr class="headerrow">
        <th>ID EMPLEADO</th>
        <th>EMPLEADO</th>
        <th>PESO</th>
        <th>TALLA</th>
        <th>ALTURA</th>
        <th>FRECUENCIA RESPIRATORIA</th>
        <th>FRECUENCIA CARDIACA</th>
        <th>TEMPERATURA</th>
        <th>IMC</th>
        <th>INTERROGATORIO</th>
        <th>EXPLORACION FISICA</th>
        <th>TRATAMIENTO</th>
        <th>DIAGNOSTICO</th>
        <th>RAMO SEGURO</th>
        <th>OTRAS INDICACIONES</th>
        <th>PASE IMSS</th>
        <th>PROCESO</th>
</tr></thead><tbody>'.$tabla.'</tbody></table>';
$html = '
<htmlpageheader name=\"MyHeader1\">
<div style="text-align: right; position: fixed; top: 0pt;right: 20pt;"><img src="img/header.png" style="height 80pt; width: 110pt;" alt="Cardinal Healt"></div>
<h1>Cirpro de Delicias</h1>
<h2>Memos de '.$_POST['fecha_inicio_mostrar'].' a '.$_POST['fecha_fin_mostrar'].' </h2>
<h4>Reporte de Memos</h4>
</htmlpageheader>
 <div style="text-align: center;">'
.$tabla.'</div>
';

//==============================================================
//==============================================================
//==============================================================
define('_MPDF_URI','data/lib/mpdf60/');
include("data/lib/mpdf60/mpdf.php");
//function mPDF($mode='',$format='A4',$default_font_size=0,$default_font='',$mgl=15,$mgr=15,$mgt=16,$mgb=16,$mgh=9,$mgf=9, $orientation='P') {

//$mpdf=new mPDF('c','Letter',0,'',15,15,30,16,30,9,'L');
$mpdf=new mPDF('utf-8', 'Leter-L',0,'',15,15,40,16,5,9);
//$mpdf->StartProgressBarOutput(1);
$mpdf->SetDisplayMode('fullpage');

$mpdf->SetHTMLHeader('
<table style="width: 100%;"><tr><td><h1>Cirpro de Delicias</h1></td><td style="text-align: right"> <img src="img/header.png" style="height 80pt; width: 110pt; margin 0 0 0 0;" alt="Cardinal Health"></td></tr></table>
<h2>Memos de '.$_POST['fecha_inicio_mostrar'].' a '.$_POST['fecha_fin_mostrar'].' </h2>
<h4>Reporte de Expedientes</h4>');
$mpdf->setFooter('Pagina {PAGENO} de {nbpg}');
$mpdf->list_indent_first_level = 0;	// 1 or 0 - whether to indent the first level of a list

    // LOAD a stylesheet
$stylesheet = file_get_contents('mpdfstyletables.css');
$mpdf->WriteHTML($stylesheet,1);	// The parameter 1 tells that this is css/style only and no body/html/text

$mpdf->WriteHTML($html,2);


//print $html;
$mpdf->Output($NomrePDF ,'I');
exit;
//==============================================================
//==============================================================
//==============================================================


?>