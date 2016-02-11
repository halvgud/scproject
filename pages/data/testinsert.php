<?php
include('lib/adodb5/adodb.inc.php'); //include del adodb
include('core.php');

$data = json_decode(file_get_contents('php://input'));

if(isset($data) && isset($data->tabla) &&isset($data->tipo_transaccion)) {
    $db = new Conexion();
    $db->abrirConexion();
    if($data->tipo_transaccion==1){
        $tabla = $data->tabla;
        unset($data->tabla);
        if($db->iniciarTransaccion()){
            if($db->Insertar($tabla,$data)){
                $separado_por_comas = implode(",", $db->obtenerResultado());
                $resArray['success'] = 'Se ha insertado el registro No. '.$separado_por_comas;
                print json_encode($resArray);
           }
            else{
                http_response_code(403);
                $resArray = array();
                $separado_por_comas = implode(",", $db->obtenerResultado());
                $resArray['error'] = $separado_por_comas;
                print json_encode($resArray);
            }
        }
        else{
            http_response_code(403);
            $separado_por_comas = implode(",", $db->obtenerResultado());
            $resArray['error'] = $separado_por_comas;
            print json_encode($resArray);
        }
        $db->finalizarTransaccion();
    }else if($data->tipo_transaccion>1){

    }
}
else
{
    http_response_code(403);
    $resArray['error'] = 'informacion no recibida';
}
?>