<?php

require_once 'data/testselect.php';
$data =  new ArrayObject();
$data->idTransaccion = '15';
$visitas = obtenerSelect($data);

$plantilla = file_get_contents('/pdf_template_pase_salida.html', FILE_USE_INCLUDE_PATH);
foreach ($visitas[0] as $key => $item) {
    $plantilla =preg_replace('/'.$key.'/',$item,$plantilla);

}
include("data/lib/mpdf60/mpdf.php");
$mpdf=new mPDF('utf-8', 'Leter-A');
$mpdf->SetDisplayMode('fullpage');
$mpdf->list_indent_first_level = 0;
$mpdf->WriteHTML($plantilla,2);
$mpdf->Output('mpdf.pdf','I');
exit;