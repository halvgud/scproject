<?php



require_once 'data/testselect.php';
$data =  new ArrayObject();
$data->idTransaccion = '20';
$data->fecha_inicio = $_POST['fecha_inicio'];
$data->fecha_fin = $_POST['fecha_fin'];
$visitas = obtenerSelect($data);
//var_dump($visitas );
$tabla = '';
$NomrePDF = 'Memos_'.$data->fecha_inicio.'_'.$data->fecha_fin.'.PDF';
foreach ($visitas as &$visita) {
    $tabla .= '<tr><td>'.$visita['id_empleado'].'</td>'
    .'<td>'.$visita['nombre_completo'].'</td>'
    .'<td>'.$visita['solicita'].'</td>'
        .'<td>'.$visita['semana'].'</td>'
    .'<td>'.$visita['respetar'].'</td>'
    .'<td>'.$visita['motivo'].'</td>'
    .'<td>'.$visita['supervisor'].'</td>'
    .'<td>'.$visita['fecha'].'</td></tr>';
}
$tabla = '<table class="bpmTopnTail" border="1" style="margin:0 auto;"><thead><tr class="headerrow">
<th>ID EMPLEADO</th>
<th>EMPLEADO</th>
<th>SOLICITA</th>
<th>SEMANA</th>
<th>RESPETAR</th>
<th>MOTIVO</th>
<th>SUPERVISOR</th>
<th>FECHA</th>
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
$mpdf=new mPDF('utf-8', 'Leter-L',0,'',15,15,50,35,5,9);
//$mpdf->StartProgressBarOutput(1);
$mpdf->SetDisplayMode('fullpage');
$mpdf->defaultfooterline = 0;

$mpdf->SetHTMLHeader('
<table style="width: 100%;"><tr><td><h1>Cirpro de Delicias</h1></td><td style="text-align: right"> <img src="img/header.png" style="height 80pt; width: 110pt; margin 0 0 0 0;" alt="Cardinal Healt"></td></tr></table>
<h2>Memos de '.$_POST['fecha_inicio_mostrar'].' a '.$_POST['fecha_fin_mostrar'].' </h2>
<h3>AT¨N DEPARTAMENTO DE NOMINAS</h3>
<p>Por medio de la presente se le solicita, que a las siguientes personas les sea respetado lo que a continuación se menciona:</p>
<p STYLE="text-align:right;">BONOS DE PUNTUALIDAD Y ASISTENCIA</p>
'

);
$mpdf->setFooter('
<table>
<tr><td>___________________________________</td><td></td><td>______________________________________________</td><td></td><td>___________________________________</td></tr>
<tr><td style="text-align: center; ">Relaciones Laborales</td>
<td style="text-align: center;padding-left: 20mm; padding-right: 20mm; "></td>
<td style="text-align: center;">GTE. DE REC. HUMANOS</td>
<td style="text-align: center;padding-left: 20mm; padding-right: 20mm; "></td>
<td style="text-align: center; ">Gte. Finanzas</td></tr>
</table>
<BR>
Pagina {PAGENO} de {nbpg}');
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