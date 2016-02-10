<?php
include('lib/adodb5/adodb.inc.php'); //include del adodb
include('core.php');

$data = json_decode(file_get_contents('php://input'));

if(isset($data) && isset($data->tabla)) {
    $db = new Conexion();
    $db->abrirConexion();
    $tabla = $data->tabla;
    unset($data->tabla);
    //$db->Insertar($tabla,$data);
    //return json_encode(0);
   if($db->Insertar($tabla,$data)){
       return json_encode(0);
      // return json_encode('Exito: Se a registrado');
   }
    else{
        //return json_encode('error: fallo al insertar');
    }
   // return json_encode($db->Insertar($tabla,$data));
}
else
{
    return json_encode(0);
}
?>