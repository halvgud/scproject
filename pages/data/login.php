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

	if($cn->numeroRegistros()>0){
		$res = $cn->obtenerResultado();
		$_SESSION['id_usuario']= $res[0]['id_usuario'];
		$_SESSION['usuario'] = $res[0]['usuario'];
		$_SESSION['rol'] = $res[0]['rol'];
		print $cn->obtenerResultadoJson();
	}
	else{
		http_response_code(403);
		$resArray = array();
		$resArray['error'] = 'Usuario o Password incorrecto, por favor introduzca los datos correctos.';
		// var_dump($resArray);
		print json_encode($resArray);
	}
}
else{
	$resArray = array();
	http_response_code(403);
		$resArray['error'] = 'Datos insuficientes, debe introducir usuario y password';
		// var_dump($resArray);
		print json_encode($resArray);
}

?>

