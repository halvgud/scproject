<?php session_start();

$data = json_decode(file_get_contents('php://input'));

/*
include('core.php');
$cn = new Conexion();
$cn->abrirConexion();
$cn->seleccion('usuario','*',NULL,'rol="1"','id_usuario DESC');
$res = $cn->obtenerResultadoJson();
print_r($res);
*/
print json_encode($data);

?>