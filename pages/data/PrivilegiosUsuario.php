<?php
require_once 'core.php';
class PrivilegiosUsuario
{
    private $roles;

    public function __construct() {

    }

    // Metodo para obtener permisos del usuario
    public static function obtenerPorUsuario($username) {
        if (!empty($username)) {
            $privUser = new PrivilegiosUsuario();
            $privUser->InicializarRoles($username);
            return $privUser;
        } else {
            return false;
        }
    }

    // Llenar roles con los permisos que tienen asociados
    protected function InicializarRoles($username) {
        $this->roles = array();
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('roles','r.id_rol,r.descripcion',' r inner join usuario u on r.id_rol = u.rol','u.id_usuario="'.$username.'"','r.id_rol asc',null);
        $resultado = $db->obtenerResultado();
        foreach($resultado as &$rol) {
            $this->roles[$rol["descripcion"]] = Roles::obtenerPermisosDelRol($rol["id_rol"]);
        }
    }

    // check if user has a specific privilege
    public function tienePrivilegio($perm) {
        foreach ($this->roles as $role) {
            if ($role->tienePermiso($perm)) {
                return true;
            }
        }
        return false;
    }
}