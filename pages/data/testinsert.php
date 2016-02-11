<?php
include('lib/adodb5/adodb.inc.php'); //include del adodb
include('core.php');

$data = json_decode(file_get_contents('php://input'));

if(isset($data) /*&& isset($data->tabla)*/ &&isset($data->tipo_transaccion)) {
    $db = new Conexion();
    $db->abrirConexion();
    if ($data->tipo_transaccion == 1) {
        $tabla = $data->tabla;
        unset($data->tabla);
        if ($db->iniciarTransaccion()) {
            if ($db->Insertar($tabla, $data)) {
                mensajeSuccess();
            } else {
                mensajeError(1,$db->obtenerResultado());
            }
        } else {
            mensajeError(1,$db->obtenerResultado());
        }
        $db->finalizarTransaccion();
    } else if ($data->tipo_transaccion == 2) {//insertar visita
        foreach ($data as $key => $value) {
            $$key = $value;
        }
        $bandera =false;
        if ($db->iniciarTransaccion()) {
            $tabla1 = 'visita';
            $datosVisita = array();
            $datosMedicamento=array();
            $datosVisita['fecha'] = $visita->fecha;
            $datosVisita['id_empleado'] = $visita->id_empleado;
            $datosVisita['id_usuario'] = $visita->id_usuario;
            $arregloVisitaMedico= json_decode(json_encode($relacion_visita_medicamento), true);
            var_dump($arregloVisitaMedico);
            if ($db->Insertar($tabla1,$datosVisita)) {
                $separado_por_comas = implode(",", $db->obtenerResultado());
                for ($x = 1; $x <= $data->contador; $x++) {
                    $datosMedicamento['id_visita']=$separado_por_comas;
                    $datosMedicamento['id_medicamento'] =$arregloVisitaMedico['id_medicamento'.$x];
                    $datosMedicamento['cantidad'] = $arregloVisitaMedico['cantidad'.$x];
                   // var_dump($datosMedicamento);
                    if($db->Insertar('relacion_visita_medicamento',$datosMedicamento))
                    {
                        //update de medicamento
                     $bandera=true;
                    }
                    else{
                        $bandera=false;
                        break;
                    }
                }
            }else{
                mensajeError(1,$db->obtenerResultado());
            }
            $db->finalizarTransaccion();
        }//iniciarTransaccion
         else {
            mensajeError(1,$db->obtenerResultado());
        }
        if($bandera){
            mensajeSuccess();
        }else
        {
            //mensajeError(1,$db->obtenerResultado());
        }
    }//transaccion 2
}
else
{
    mensajeError(2,$db->obtenerResultado());
}

function mensajeError($error,$arreglo){
    $resArray = array();
    http_response_code(403);
    if($error=1){

        $separado_por_comas = implode(",", $arreglo);
        $resArray['error'] = $separado_por_comas;
        print json_encode($resArray);
    }
    else{
        $resArray['error'] = 'informacion no recibida';
        print json_encode($resArray);
    }
}
function mensajeSuccess(){
    $resArray = array();
    $resArray['success'] = 'Se ha insertado el registro. ';
    print json_encode($resArray);
}
?>

