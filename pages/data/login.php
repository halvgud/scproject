<?php session_start();

// print file_get_contents('php://input');

$data = json_decode(file_get_contents('php://input'));
// var_dump($data);
/*
include('core.php');
$cn = new Conexion();
$cn->abrirConexion();
$cn->seleccion('usuario','*',NULL,'rol="1"','id_usuario DESC');
$res = $cn->obtenerResultadoJson();
print_r($res);
*/
if(isset($data) && isset($data->usuario) && $data->usuario != "" && isset($data->password) && $data->password !=""){
	include('core.php');
	$cn = new Conexion();
	$cn->abrirConexion();
	$cn->seleccion('usuario','id_usuario,usuario,rol',NULL,'password="'.$data->password.'" and usuario = "'.$data->usuario.'"','id_usuario DESC');
	$res = $cn->obtenerResultadoJson();
	print_r($res);
}

?>

