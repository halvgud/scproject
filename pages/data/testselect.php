<?php
include('lib/adodb5/adodb.inc.php'); //include del adodb
include('core.php');


$data = json_decode(file_get_contents('php://input'));
if($data->idTransaccion=='1'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('medicamento','id_medicamento,descripcion',null,null,'id_medicamento asc',null);
     print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='2'){

    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('presentacion_medicamento','id_presentacion,presentacion_medicamento.descripcion',"medicamento md on (md.id_presentacion_salida=presentacion_medicamento.id_presentacion)","md.id_medicamento='".$data->idBusqueda."'",'id_presentacion asc',null);
    print json_encode($db->obtenerResultado());

}

?>