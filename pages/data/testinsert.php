<?php  session_start();
include('lib/adodb5/adodb.inc.php'); //include del adodb
include('core.php');

$data = json_decode(file_get_contents('php://input'));

if(isset($data) /*&& isset($data->tabla)*/ &&isset($data->tipo_transaccion)) {
    $db = new Conexion();
    $db->abrirConexion();
    if ($data->tipo_transaccion == 1) {
        $tabla = $data->tabla;
        unset($data->tabla);
        if(isset($data->id_usuario_creacion)){
            $data->id_usuario_creacion = $_SESSION['id_usuario'];
        }
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
            $datosVisita['id_diagnostico'] = $visita->diagnostico;
            $datosVisita['id_proceso'] = $visita->proceso;
            $datosVisita['id_usuario_creacion'] = $_SESSION['id_usuario'];
            $arregloVisitaMedico= json_decode(json_encode($relacion_visita_medicamento), true);
            if ($db->Insertar($tabla1,$datosVisita)) {
                $separado_por_comas = implode(",", $db->obtenerResultado());
                $resultado = actualizarMedicamento($db,$data,$separado_por_comas,$visita,$arregloVisitaMedico,'visita');
                $bandera = $resultado['bandera'];
            }else{
                mensajeError(1,$db->obtenerResultado());
            }
            $db->finalizarTransaccion();
        }//iniciarTransaccion
         else {
            mensajeError(1,$db->obtenerResultado());
        }
        if($bandera){
            if(isset($resultado['warning'])){
                mensajeWarning($resultado['warning']);
            }
            else{
                mensajeSuccess();
            }
        }else
        {
            //mensajeError(1,$db->obtenerResultado());
        }
    }//transaccion 2
    else if ($data->tipo_transaccion == 3) {//insertar consulta
        foreach ($data as $key => $value) {
            $$key = $value;
        }
        $bandera =false;
        $fecha_inicial = $consulta->fecha_consulta.' '.$consulta->hora_inicio;
        $fecha_final = $consulta->fecha_consulta.' '.$consulta->hora_fin;
        $db->seleccion('consulta','count(*) as \'count\' ',null,
         ' (fecha_inicio<="'.$fecha_inicial.'" and fecha_inicio<"'.$fecha_final.'" and fecha_fin>"'.$fecha_inicial.'" and fecha_fin>="'.$fecha_final.'")'.
         ' or (fecha_inicio>"'.$fecha_inicial.'" and fecha_inicio<"'.$fecha_final.'" and fecha_fin>"'.$fecha_inicial.'" and fecha_fin>="'.$fecha_final.'")'.
         ' or (fecha_inicio<="'.$fecha_inicial.'" and fecha_inicio<"'.$fecha_final.'" and fecha_fin>"'.$fecha_inicial.'" and fecha_fin<"'.$fecha_final.'")'.
         ' or (fecha_inicio>"'.$fecha_inicial.'" and fecha_inicio<"'.$fecha_final.'" and fecha_fin>"'.$fecha_inicial.'" and fecha_fin<"'.$fecha_final.'")'
         ,null,null);
        $count = $db->obtenerResultado();
        if($count['0']['count']<1){
            if ($db->iniciarTransaccion()) {
                $tabla1 = 'consulta';
                $datosConsulta = array();
                $datosMedicamento=array();
                $datosConsulta['fecha'] = $consulta->fecha;
                $datosConsulta['id_diagnostico'] = $consulta->diagnostico;
                $datosConsulta['id_proceso'] = $consulta->proceso;
                $datosConsulta['fecha_inicio'] = $consulta->fecha_consulta.' '.$consulta->hora_inicio;
                $datosConsulta['fecha_fin'] = $consulta->fecha_consulta.' '.$consulta->hora_fin;
                $datosConsulta['asistencia'] = 'N';
                $datosConsulta['id_empleado'] = $consulta->id_empleado;
                $datosConsulta['id_usuario_creacion'] = $_SESSION['id_usuario'];
                $datosConsulta['peso'] = $consulta->peso;
                $datosConsulta['talla'] = $consulta->talla;
                $datosConsulta['altura'] = $consulta->altura;
                $datosConsulta['frecuencia_respiratoria'] = $consulta->frecuencia_respiratoria;
                $datosConsulta['frecuencia_cardiaca'] = $consulta->frecuencia_cardiaca;
                $datosConsulta['temperatura'] = $consulta->temperatura;
                $arregloVisitaMedico= json_decode(json_encode($relacion_consulta_medicamento), true);
                if ($db->Insertar($tabla1,$datosConsulta)) {
                    $separado_por_comas = implode(",", $db->obtenerResultado());
                    $resultado = actualizarMedicamento($db,$data,$separado_por_comas,$consulta,$arregloVisitaMedico,'consulta');
                    $bandera = $resultado['bandera'];
                }else{
                    mensajeError(1,$db->obtenerResultado());
                }
                $db->finalizarTransaccion();
            }//iniciarTransaccion
            if($bandera){
                if(isset($resultado['warning'])){
                    mensajeWarning($resultado['warning']);
                }
                else{
                    mensajeSuccess();
                }
            }else
            {
                mensajeError(1,$db->obtenerResultado());
            }
        }
        else{
            mensajeError(2,"Existen problemas para agendar el evento, posiblemente ocurra un confilcto con otro evento por favor seleccione una fecha sin conflictos.");
        }
    }//transaccion 3
    else if ($data->tipo_transaccion == 4) {//insertar medicamento nuevo
        foreach ($data as $key => $value) {
            $$key = $value;
        }
        $bandera =false;
        $tabla = $data->tabla;
        if($data->cantidad >0){
            $db->seleccion('presentacion_medicamento','cantidad',null,' id_presentacion = "'.$data->id_presentacion_entrada.'"',null,null);
            $cantidad_entrada = $db->obtenerResultado();
            $data->cantidad = $data->cantidad*$cantidad_entrada['0']['cantidad'];
        }
        unset($data->tabla);
        if ($db->iniciarTransaccion()) {
            $data->id_usuario_creacion = $_SESSION['id_usuario'];

            if ($db->Insertar($tabla,$data)) {
                $bandera = true;
            }else{
                $bandera=false;
            }
            $db->finalizarTransaccion();
        }//iniciarTransaccion
        if($bandera){
            mensajeSuccess();
        }else
        {
            mensajeError(1,$db->obtenerResultado());
        }
    }//transaccion 4
    else if ($data->tipo_transaccion == 5) {//Guardar Expediente
        foreach ($data as $key => $value) {
            $$key = $value;
        }
        $bandera =false;
        if ($db->iniciarTransaccion()) {
            $tabla1 = 'expediente';
            $tabla2 = 'consulta';
            $expediente->id_usuario_creacion = $_SESSION['id_usuario'];
            $expediente->id_proceso = $expediente->proceso;
            $arregloMedicamentoTabla= json_decode(json_encode($relacion_medicamento_tablas), true);
            if ($db->Insertar($tabla1,$expediente)) {
                $separado_por_comas = implode(",", $db->obtenerResultado());
                $resultado = actualizarMedicamento($db,$data,$separado_por_comas,$expediente,$arregloMedicamentoTabla,'expediente');
                $bandera = $resultado['bandera'];
                if($bandera && $db->Actualizar($tabla2,'asistencia="A"','id_consulta='.$expediente->id_consulta)){
                    $bandera=true;
                }else{
                    $bandera = false;
                }
            }else{
                $bandera=false;
            }
            $db->finalizarTransaccion();
        }//iniciarTransaccion
        if($bandera){
            if(isset($resultado['warning'])){
                mensajeWarning($resultado['warning']);
            }
            else{
                mensajeSuccess();
            }
        }else
        {
            mensajeError(1,$db->obtenerResultado());
        }
    }//transaccion 5
    else if($data->tipo_transaccion==6){
        foreach ($data as $key => $value) {
            $$key = $value;
        }
        $bandera =false;
        if ($db->iniciarTransaccion()) {
            $tabla = 'pase_salida';
            $pasesalida = array();
            $pasesalida['id_empleado'] = $pase_salida->id_empleado;
            $pasesalida['motivo'] = $pase_salida->motivo;
            $pasesalida['estado'] = 'A';
            $pasesalida['id_usuario_creacion'] = $_SESSION['id_usuario'];
            $pasesalida['fecha_creacion'] = $pase_salida->fecha_creacion;
            if ($db->Insertar($tabla,$pasesalida)) {
                $bandera = true;
            }else{
                $bandera=false;
            }
            $db->finalizarTransaccion();
        }//iniciarTransaccion
        if($bandera){
            mensajeSuccess();
        }else
        {
            mensajeError(1,$db->obtenerResultado());
        }
    }
    else{
        mensajeError(2,"Numero de transaccion invalido");
    }

}
else
{
    mensajeError(2,$db->obtenerResultado());
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
function mensajeSuccess(){
    $resArray = array();
    $resArray['success'] = 'Se ha insertado el registro. ';
    print json_encode($resArray);
}
function mensajeWarning($mensaje){
    $resArray = array();
    $resArray['warning'] = $mensaje;
    print json_encode($resArray);
}
function actualizarMedicamento($db,$data,$idTabla,$tabla,$arregloMedicamentoTabla,$descripcionTabla){
    $bandera = true;
    $warning = '';
    $resultado = Array();
    $result = Array();
    for ($x = 1; $x <= $data->contador; $x++) {
        $datosMedicamento['id_tabla']=$idTabla;
        $datosMedicamento['id_medicamento'] =$arregloMedicamentoTabla['id_medicamento'.$x];
        $datosMedicamento['cantidad'] = $arregloMedicamentoTabla['cantidad'.$x];
        $datosMedicamento['fecha'] = $tabla->fecha;
        $datosMedicamento['descripcion_tabla'] = $descripcionTabla;
        if($db->Insertar('relacion_medicamento_tablas',$datosMedicamento))
        {
            if($db->Actualizar('medicamento','cantidad=cantidad-'.$datosMedicamento['cantidad'],'id_medicamento='.$datosMedicamento['id_medicamento'])){
                $bandera=true;
                $db->seleccion('medicamento', 'cantidad,cantidad_minima,descripcion'
                    , null, 'id_medicamento='.$datosMedicamento['id_medicamento'], null, null);
                $result = $db->obtenerResultado();
                $cantidad = $result['0']['cantidad'];
                $cantidadMinima = $result['0']['cantidad_minima'];
                if($cantidad <= $cantidadMinima){
                    $warning .= 'Cantidad actual para '.$result['0']['descripcion'].' es '.$cantidad.' cantidad minima es '.$cantidadMinima.'<br>';
                }
            }
        }
        else{
            $resultado['error'] = $db->obtenerResultado();
            $bandera=false;
            break;
        }
    }//for
    if($warning != ''){
        $resultado['warning'] = $warning;
    }
    $resultado['bandera'] = $bandera;
    return $resultado;
}
?>

