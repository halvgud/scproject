<?php
require_once 'core.php';

class Roles
{
    protected $permissions;

    protected function __construct() {
        $this->permissions = array();
    }

    // return a role object with associated permissions
    public static function obtenerPermisosDelRol($role_id) {
        $role = new Roles();
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
    public function tienePermiso($permission) {
        return isset($this->permissions[$permission]);
    }
}