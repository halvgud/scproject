<?php
include("pages/lib/adodb5/adodb-exceptions.inc.php");
include('pages/lib/adodb5/adodb.inc.php');
class Conexion
{
	public static $conn;
    private static $db_host = "localhost";  // Change as required
    private static $db_user = "root";  // Change as required
    private  static $db_pass = "";  // Change as required
    private static $db_name = "sys_co_db";	// Change as required
	public function abrirConexion()
	{

        self::$conn = NewADOConnection('mysqli');
        try {
            self::$conn->Connect(self::$db_host, self::$db_user, self::$db_pass, self::$db_name);
          } 
          catch (exception $e) {
            print_r($e);
            Debuggeo::enviarConsola($e.". Linea:".__LINE__);
        }
	}
	private $myQuery = "";
    private $numResults = "";
    private $result = array();
	public function seleccion($tabla, $rows = '*', $join = null, $where = null, $order = null, $limit = null){
		//Se crea query en base a los parametros
        //$r= array();
		$q = 'SELECT '.$rows.' FROM '.$tabla;
		if($join != null){
			$q .= ' JOIN '.$join;
		}
		if($where != null){
			$q .= ' WHERE '.$where;
		}
		if($order != null){
			$q .= ' ORDER BY '.$order;
		}
		if($limit != null){
			$q .= ' LIMIT '.$limit;
		}
		$this->myQuery = $q; // se reasigna el sql
		// Revisa si existe la tabla
		if($this->existeTabla($tabla)){
			// Si la tabla existe, que corra el query
			$query = self::$conn->execute($q);
			if($query){
				//
                if ($query->RecordCount()<0) {
                    print self::$conn->ErrorMsg();
                }
                else {
                    $this->result = $query->getRows();

                }

				return true; // Query was successful

			}else{
				//array_push($this->result,mysql_error());
				return false; // No rows where returned
			}
		}else{
        return false; // Table does not exist
		}
	}
    // Function para insertar registros en la db
    public function Insertar($table,$params=array()){
        // Revisar si la tabla existe
        if($this->existeTabla($table)){
            $sql='INSERT INTO `'.$table.'` (`'.implode('`, `',array_keys($params)).'`) VALUES ("' . implode('", "', $params) . '")';
            $this->myQuery = $sql;
            // se ejecuta query
            if($ins =self::$conn->Execute($sql)){
                array_push($this->result,self::$conn->Insert_ID());
                return true; // la info a sido insertada
            }else{
                array_push($this->result,self::$conn->ErrorMsg());
                return false; // error
            }
        }else{
            return false; // Tabla no existe
        }
    }




    private function existeTabla($table){
        $tablesInDb = self::$conn->execute('SHOW TABLES FROM '.self::$db_name.' LIKE "'.$table.'"');
        if($tablesInDb){
            if($tablesInDb->RecordCount()==1){
                return true; // The table exists
            }else{
                array_push($this->result,$table." no existe en la base de datos");
                return false; // The table does not exist
            }
        }
    }
    public function obtenerResultadoJson(){
        $val = $this->result;
        $this->result = array();;
        return json_encode($val);
    }
    //regresa el SQL para efectos de debuggeo
    public function obtenerSQL(){
        $val = $this->myQuery;
        $this->myQuery = array();
        return $val;
    }
    //Regresa el numero de registros
    public function numeroRegistros(){
        $val = $this->numResults;
        $this->numResults = array();
        return $val;
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


