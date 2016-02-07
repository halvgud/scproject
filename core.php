<?php
include("../lib/adodb5/adodb-exceptions.inc.php");
include('../lib/adodb5/adodb.inc.php');
class Conexion
{
	public static $conn;
	public static function abrirConexion()
	{

        $conn = NewADOConnection('mysql');
        //self::$conn->Connect('localhost', 'root', '', 'sicar');
		try {
            self::$conn->Connect('localhost', 'root', '', 'sys_co_db');
          } 
          catch (exception $e) {
            print_r($e);
            Debuggeo::enviarConsola($e.". Linea:".__LINE__);
        }


		  
	}
	public static function LlamarStoredProcedure($SP){
		Debuggeo::enviarConsola($SP);
		    $IVCODEMP="CAP";
    		$IVCODCLI="CTR00026478";
		$params = array(
			array(&$IVCODEMP, SQLSRV_PARAM_IN),
			array(&$IVCODCLI, SQLSRV_PARAM_IN)
			);
		$smtp = sqlsrv_query(self::$conn, $SP, $params);
		if ($smtp === false) {
				print_r( sqlsrv_errors(), true);
		}
			return $smtp;
	}

	public static function cerrarConexion(){
		Debuggeo::enviarConsola("se cerro conexion. Linea:".__LINE__);
		$conn = null;
	}
}

class Debuggeo
{
	public static function enviarConsola( $data ) {

		if ( is_array( $data ) )
			$output = "<script>console.log( 'Debug Objects: " . implode( ',', $data) . "' );</script>";
		else
			$output = "<script>console.log( 'Debug Objects: " . $data . "' );</script>";

		echo $output;
	}
}

class Operacion
{
	public static function GenerarTablaConArray($array,$bs)
	{ 
		$tabla="";
		if ($bs === TRUE)
		{
			$tabla = "<table class='table table-bordered'><tbody>";
 			   while($row = sqlsrv_fetch_array($array,SQLSRV_FETCH_ASSOC)){
                $tabla.='<tr><td>'.$row['cod_tercero']."</td><td> ".$row['nom_tercero']."</td></tr>";
            }
            $tabla .= "</tbody></table>";
            return  $tabla;
		}else{

		}
	}
}


