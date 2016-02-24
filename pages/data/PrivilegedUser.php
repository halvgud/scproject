<?php
require_once 'core.php';
class PrivilegedUser
{
    private $roles;

    public function __construct() {

    }

    // override User method
    public static function getByUsername($username) {
       /* $sql = "SELECT * FROM users WHERE username = :username";
        $sth = $GLOBALS["DB"]->prepare($sql);
        $sth->execute(array(":username" => $username));
        $result = $sth->fetchAll();
*/
        if (!empty($username)) {
            $privUser = new PrivilegedUser();
            /*$privUser->user_id = $result[0]["user_id"];
            $privUser->username = $username;
            $privUser->password = $result[0]["password"];
            $privUser->email_addr = $result[0]["email_addr"];*/
            $privUser->initRoles($username);
            return $privUser;
        } else {
            return false;
        }
    }

    // populate roles with their associated permissions
    protected function initRoles($username) {
        $this->roles = array();
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('roles','r.id_rol,r.descripcion',' r inner join usuario u on r.id_rol = u.rol','u.id_usuario="'.$username.'"','r.id_rol asc',null);
        $resultado = $db->obtenerResultado();
        foreach($resultado as &$rol) {
            $this->roles[$rol["descripcion"]] = Role::getRolePerms($rol["id_rol"]);
        }
        //print json_encode($db->obtenerResultado());
/*
        while($row = $sth->fetch(PDO::FETCH_ASSOC)) {
            $this->roles[$row["role_name"]] = Role::getRolePerms($row["role_id"]);
        }
        */
    }

    // check if user has a specific privilege
    public function hasPrivilege($perm) {
        foreach ($this->roles as $role) {
            if ($role->hasPerm($perm)) {
                return true;
            }
        }
        return false;
    }
}