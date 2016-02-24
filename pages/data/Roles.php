<?php
require_once 'core.php';

class Role
{
    protected $permissions;

    protected function __construct() {
        $this->permissions = array();
    }

    // return a role object with associated permissions
    public static function getRolePerms($role_id) {
        $role = new Role();
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('relacion_rol_permiso','p.descripcion',' r inner join permisos p on r.id_permiso = p.id_permiso','r.id_rol="'.$role_id.'" and r.estado="A"','p.id_permiso asc',null);
        $permisos =  $db->obtenerResultado();
        foreach($permisos as &$permiso) {
            $role->permissions[$permiso['descripcion']] = true;
        }
        return $role;
    }

    // check if a permission is set
    public function hasPerm($permission) {
        return isset($this->permissions[$permission]);
    }
}