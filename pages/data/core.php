<?php
include("lib/adodb5/adodb-exceptions.inc.php"); //include de las excepciones
include('lib/adodb5/adodb.inc.php'); //include del adodb
class Conexion
{
	public static $conn; //variable estatica de conexion
    private static $db_host = "localhost";  // variable estatica del host
    private static $db_user = "root";  // variable estatica del usuario de la db
    private static $db_pass = "";  // variable estatica del pw de la db
    private static $db_name = "sys_co_db";	// variable estatica del nombre de la db
    private $myQuery = "";
    private $numResults = "";
    private $result = array();

	public function abrirConexion()
	{
        self::$conn = NewADOConnection('mysqli');//se inicializa constructor tipo  mysqli
        try {
            self::$conn->Connect(self::$db_host, self::$db_user, self::$db_pass, self::$db_name);//se realiza la conexion
          } 
          catch (exception $e) {//si la conexion falla se atrapa la excepcion
            print_r($e);//se imprime el error
        }
	}
    public function iniciarTransaccion()
    {
        if(self::$conn) {
            self::$conn->StartTrans();
            return true;
        }
        else{
            array_push($this->result,'fallo de transaccion, conexion no establecida');
            return false;
        }
    }
    public function finalizarTransaccion()//rollback y commit dentro de este
    {
        if(self::$conn) {
            self::$conn->CompleteTrans();
            return true;
        }
        else{
            array_push($this->result,'fallo de transaccion, conexion no establecida');
            return false;
        }
    }

	public function seleccion($tabla, $rows = '*', $join = null, $where = null, $order = null, $limit = null){
		//Se crea query en base a los parametros
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
                $this->numResults = $query->RecordCount();
                if ($this->numResults<0) {
                    print self::$conn->ErrorMsg();
                }
                else {
                    $this->result = $query->getRows();
                }
				return true; // El query fue ejecutado correctamente

			}else{
				array_push($this->result,ErrorMsg());
				return false; // No rows where returned
			}
		}else{
        return false; // La tabla no existe
		}
	}
    // Function para insertar registros en la db
    public function Insertar($table,$params){
       $arreglo= json_decode(json_encode($params), true);
        // Revisar si la tabla existe
        if($this->existeTabla($table)){
            $insertSQL = self::$conn->AutoExecute($table, $arreglo, 'INSERT');
            if($insertSQL)
            {
                array_push($this->result,self::$conn->Insert_ID());
                return true;
            }else {
                self::$conn->FailTrans( );//forza rollback
                array_push($this->result, self::$conn->ErrorMsg());
                return false; // error
            }

        }else{
            return false; // Tabla no existe
        }
    }




    private function existeTabla($table){
    try {
        if(self::$conn){
        $tablesInDb = self::$conn->Execute('SHOW TABLES FROM ' . self::$db_name . ' LIKE "' . $table . '"');//Ejecuta query para ver si existe la tabla en la base de datos
        if ($tablesInDb) {//si si se realizo el query
            if ($tablesInDb->RecordCount() == 1) {//y si la cantidad de registros es = 1
                return true; // Regresa true si la tabla existe
            } else {//de otra manera
                array_push($this->result, $table . " no existe en la base de datos");
                return false; // Regresa false si la tabla no existe
            }
            }
        }else{
            array_push($this->result,'conexion no establecida');//se imprime el error
        }
    }
    catch (exception $e) {//si la conexion falla se atrapa la excepcion
        array_push($this->result,($e));//se imprime el error
    }
    }
    public function obtenerResultado(){
        return $this->result; //regresa el resultado
    }
    public function obtenerResultadoJson(){
        return json_encode($this->result); //regresa los valores en JSON
    }
    //regresa el SQL para efectos de debuggeo
    public function obtenerSQL(){
        return $this->myQuery;
    }
    //Regresa el numero de registros
    public function numeroRegistros(){
        return $this->numResults;
    }



	public static function cerrarConexion(){
		Debuggeo::enviarConsola("se cerro conexion. Linea:".__LINE__);
		$conn = null;
	}
}


