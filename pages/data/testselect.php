<?php
require_once 'core.php';
require_once "Roles.php";
require_once "PrivilegiosUsuario.php";

$data = json_decode(file_get_contents('php://input'));
if($data->idTransaccion=='1'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('descripcion','id_descripcion,descripcion',null,'estado="A" and tipo="'.$data->tipo.'"','id_descripcion asc',null);
    print json_encode($db->obtenerResultado());
}
if($data->idTransaccion=='2'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('medicamento','id_medicamento,descripcion',null,'estado="A"','id_medicamento asc',null);
     print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='3'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('presentacion_medicamento','id_presentacion,presentacion_medicamento.descripcion',"medicamento md on (md.id_presentacion_salida=presentacion_medicamento.id_presentacion)","md.estado='A' and md.id_medicamento='".$data->idBusqueda."'",'id_presentacion asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='4'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('presentacion_medicamento','id_presentacion,descripcion',null,'estado="A"','id_presentacion asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='5'){//Select de los datos del empleado
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('empleado','e.id_empleado,concat(e.nombre," ",e.paterno," ",e.materno) nombre,t.descripcion turno, a.descripcion area, d.descripcion departamento, e.nss'
        ,'e inner join descripcion t on e.id_turno = t.id_descripcion inner join descripcion a on e.id_area = a.id_descripcion inner join descripcion d on e.id_departamento = d.id_descripcion'
        ,'e.id_empleado="'.$data->idBusqueda.'" and e.estado="A"','e.id_empleado asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='6'){//select de los datos de la consulta para generar los eventos del calendario
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('consulta','c.id_consulta,c.id_empleado,e.nombre,e.paterno,e.materno,c.peso,c.talla,c.altura,c.frecuencia_respiratoria,c.frecuencia_cardiaca,c.temperatura,c.asistencia,c.fecha_inicio,c.fecha_fin'
        ,'c inner join empleado e on c.id_empleado = e.id_empleado','c.fecha_inicio>="'.$data->fecha_inicio.'" and c.fecha_fin<="'.$data->fecha_fin.'"','c.fecha_inicio asc',null);
    ///print $db->obtenerSQL();
    $consultas = $db->obtenerResultado();
    foreach($consultas as &$consulta){
        $db->seleccion('medicamento','m.id_medicamento,m.descripcion'
            ,'m inner join relacion_consulta_medicamento rcm on m.id_medicamento = rcm.id_medicamento',
            'rcm.id_consulta="'.$consulta['id_consulta'].'"',null,null);
        $medicamentos = $db->obtenerResultado();
        //var_dump($medicamentos);
        $consulta['medicamentos'] = $medicamentos;
        $consulta['title'] = $consulta['nombre'].' '.$consulta['paterno'].' '.$consulta['materno'];
        $consulta['start'] = $consulta['fecha_inicio'];
        $consulta['end'] = $consulta['fecha_fin'];
    }
    print json_encode($consultas);
}
else if($data->idTransaccion=='7'){//Select de los datos del empleado
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('medicamento','id_medicamento,clave,descripcion,precio,cantidad'
        ,null ,'estado="A" and clave like "%'.$data->clave.'%" and descripcion like "%'.$data->descripcion.'%"','id_medicamento asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='8'){//Select de los datos del empleado
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('medicamento','id_medicamento,clave,descripcion,precio,cantidad'
        ,null ,'estado="A" and clave like "%'.$data->clave.'%"','id_medicamento asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='9'){//Select de los datos del empleado
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('medicamento','id_medicamento,clave,descripcion,precio,cantidad'
        ,null ,'estado="A" and descripcion like "%'.$data->descripcion.'%"','id_medicamento asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='10'){//Select de los datos del empleado
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('usuario','u.id_usuario,u.usuario,u.password,u.rol,r.descripcion'
        ,'u inner join roles r on u.rol=r.id_rol' ,'estado="A" and usuario like "%'.$data->usuario.'%"','id_usuario asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='11'){//Select de los datos del empleado
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('roles','id_rol,descripcion',null,null,'id_rol asc',null);
    $roles = $db->obtenerResultado();
    foreach($roles as &$rol){
        $permisoDelRol = Roles::obtenerPermisosDelRol($rol["id_rol"]);
        $db->seleccion('permisos','id_permiso,descripcion',null,null,'id_permiso asc',null);
        $permisos = $db->obtenerResultado();
        foreach($permisos as &$permiso) {
            if ($permisoDelRol->tienePermiso($permiso['descripcion'])) {
                $permiso['activo'] = true;
            }
            else{
                $permiso['activo'] = false;
            }
        }
        $rol['permisos'] = $permisos;
    }
    print json_encode($roles);
}
else if($data->idTransaccion=='12'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('roles','id_rol,descripcion',null,null,'id_rol asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='13'){//select de los datos de la consulta para generar los eventos del calendario
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('consulta','c.id_consulta,c.id_empleado,e.nombre,e.paterno,e.materno,c.peso,c.talla,c.altura,c.frecuencia_respiratoria,c.frecuencia_cardiaca,c.temperatura,c.asistencia,c.fecha_inicio,c.fecha_fin'
        ,'c inner join empleado e on c.id_empleado = e.id_empleado','c.fecha_inicio>="'.$data->fecha_inicio.'" and c.fecha_fin<="'.$data->fecha_fin.'" and c.asistencia = "N"','c.fecha_inicio asc',null);
    ///print $db->obtenerSQL();
    $consultas = $db->obtenerResultado();
    foreach($consultas as &$consulta){
        $db->seleccion('medicamento','m.id_medicamento,m.descripcion'
            ,'m inner join relacion_consulta_medicamento rcm on m.id_medicamento = rcm.id_medicamento',
            'rcm.id_consulta="'.$consulta['id_consulta'].'"',null,null);
        $medicamentos = $db->obtenerResultado();
        //var_dump($medicamentos);
        $consulta['medicamentos'] = $medicamentos;
        $consulta['title'] = $consulta['nombre'].' '.$consulta['paterno'].' '.$consulta['materno'];
        $consulta['start'] = $consulta['fecha_inicio'];
        $consulta['end'] = $consulta['fecha_fin'];
    }
    print json_encode($consultas);
}
?>