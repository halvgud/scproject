<?php session_start();
include('lib/adodb5/adodb.inc.php'); //include del adodb
include('core.php');




$data = json_decode(file_get_contents('php://input'));

if(isset($data) /*&& isset($data->tabla)*/ &&isset($data->idTransaccion)) {
    $db = new Conexion();
    $db->abrirConexion();
    if ($data->idTransaccion == 1) {
        if(isset($data->id_usuario_creacion)){
            $data->id_usuario_creacion = $_SESSION['id_usuario'];
        }
        if ($db->iniciarTransaccion()) {
            if($db->Actualizar('medicamento','cantidad=cantidad+'.$data->cantidad,'id_medicamento='.$data->id_medicamento)){
                mensajeSuccess(null);
            } else {
                mensajeError(1,$db->obtenerResultado());
            }
        } else {
            mensajeError(1,$db->obtenerResultado());
        }
        $db->finalizarTransaccion();
    }
    else if ($data->idTransaccion == 2) {
        if(isset($data->id_usuario_creacion)){
            $data->id_usuario_creacion = $_SESSION['id_usuario'];
        }
        if ($db->iniciarTransaccion()) {
            if($db->Actualizar('medicamento','estado="I"','id_medicamento='.$data->id_medicamento)){
                mensajeSuccess(null);
            } else {
                mensajeError(1,$db->obtenerResultado());
            }
        } else {
            mensajeError(1,$db->obtenerResultado());
        }
        $db->finalizarTransaccion();
    }
    else if ($data->idTransaccion == 3) {
        if(isset($data->id_usuario_creacion)){
            $data->id_usuario_creacion = $_SESSION['id_usuario'];
        }
        if ($db->iniciarTransaccion()) {
            if($db->Actualizar('medicamento','cantidad_minima="'.$data->cantidad_minima.'",clave="'.$data->clave.'",descripcion="'.$data->descripcion.'",precio='.$data->precio,'id_medicamento='.$data->id_medicamento)){
                mensajeSuccess(null);
            } else {
                mensajeError(1,$db->obtenerResultado());
            }
        } else {
            mensajeError(1,$db->obtenerResultado());
        }
        $db->finalizarTransaccion();
    }
    else if ($data->idTransaccion == 4) {
        if(isset($data->id_usuario_creacion)){
            $data->id_usuario_creacion = $_SESSION['id_usuario'];
        }
        if ($db->iniciarTransaccion()) {
            if($db->Actualizar('usuario','estado="I"','id_usuario='.$data->id_usuario)){
                mensajeSuccess(null);
            } else {
                mensajeError(1,$db->obtenerResultado());
            }
        } else {
            mensajeError(1,$db->obtenerResultado());
        }
        $db->finalizarTransaccion();
    }
    else if ($data->idTransaccion == 5) {
        if(isset($data->id_usuario_creacion)){
            $data->id_usuario_creacion = $_SESSION['id_usuario'];
        }
        if ($db->iniciarTransaccion()) {
            if($db->Actualizar('usuario','usuario="'.$data->usuario.'",password="'.$data->password.'",rol='.$data->rol,'id_usuario='.$data->id_usuario)){
                mensajeSuccess(null);
            } else {
                mensajeError(1,$db->obtenerResultado());
            }
        } else {
            mensajeError(1,$db->obtenerResultado());
        }
        $db->finalizarTransaccion();
    }
    else if ($data->idTransaccion == 6) {
        $bandera =false;
        if ($db->iniciarTransaccion()) {
            $rol = $data->rol;
            foreach($rol->permisos as &$permiso) {
                $estado = $permiso->activo?'A':'I';
                if ($db->Actualizar('relacion_rol_permiso', 'estado="'.$estado.'"', 'id_rol=' . $rol->id_rol . ' and id_permiso=' . $permiso->id_permiso)) {
                    $bandera=true;
                } else {
                    $bandera=false;
                    break;
                }
            }
        } else {
            mensajeError(1,$db->obtenerResultado());
        }
        if($bandera){
            mensajeSuccess("Se ha actualizado la informacion");
        }else
        {
            mensajeError(1, $db->obtenerResultado());
        }
        $db->finalizarTransaccion();
    }
    else{
        mensajeError(2,"Numero de transaccion invalido");
    }
}
else
{
    mensajeError(2,"Faltan parametros para realizar una actualizacion");
}

function mensajeError($error,$object){
    $resArray = array();
    http_response_code(403);
    if($error==1){
        $separado_por_comas = implode(",", $object);
        $resArray['error'] = $separado_por_comas;
        print json_encode($resArray);
    }
    else if ($error==2){
        $resArray['error'] = $object;
        print json_encode($resArray);
    }
    else{
        $resArray['error'] = 'informacion no recibida';
        print json_encode($resArray);
    }
}
function mensajeSuccess($mensaje){
    $resArray = array();
    if($mensaje){
        $resArray['success'] = $mensaje;
    }
    else{
        $resArray['success'] = 'Se ha actualizado el registro. ';
    }
    print json_encode($resArray);
}

?>

