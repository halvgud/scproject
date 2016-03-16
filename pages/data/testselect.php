<?php
require_once 'core.php';
require_once "Roles.php";
require_once "PrivilegiosUsuario.php";

$data = json_decode(file_get_contents('php://input'));
if(isset($data) && isset($data->idTransaccion)){
    $resultado = Array();
    $resultado = obtenerSelect($data);
    print json_encode($resultado );
}
function obtenerSelect($data)
{
    if ($data->idTransaccion == '1') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('descripcion', 'id_descripcion,descripcion', null, 'estado="A"  and tipo="' . $data->tipo . '" ', 'id_descripcion asc', null);
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '2') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('medicamento', 'id_medicamento,descripcion', null, 'estado="A"', 'id_medicamento asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '3') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('presentacion_medicamento', 'id_presentacion,presentacion_medicamento.descripcion', "medicamento md on (md.id_presentacion_salida=presentacion_medicamento.id_presentacion)", "md.estado='A' and md.id_medicamento='" . $data->idBusqueda . "'", 'id_presentacion asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '4') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('presentacion_medicamento', 'id_presentacion,descripcion', null, 'estado="A"', 'id_presentacion asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '5') {//Select de los datos del empleado
            $db = new Conexion();
            $db->abrirConexion();
            $db->seleccion('empleado', 'e.id_empleado,concat(e.nombre," ",e.paterno," ",e.materno) nombre,t.descripcion turno, a.descripcion area, d.descripcion departamento, e.nss'
                , 'e inner join descripcion t on e.id_turno = t.id_descripcion inner join descripcion a on e.id_area = a.id_descripcion inner join descripcion d on e.id_departamento = d.id_descripcion'
                , 'e.id_empleado="' . $data->idBusqueda . '" and e.estado="A"', 'e.id_empleado asc', null);
            return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '6') {//select de los datos de la consulta para generar los eventos del calendario
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('consulta', 'c.id_consulta,c.id_empleado,e.nombre,e.paterno,e.materno,c.peso,c.talla,c.altura,c.frecuencia_respiratoria,c.frecuencia_cardiaca,c.temperatura,c.asistencia,c.fecha_inicio,c.fecha_fin'
            , 'c inner join empleado e on c.id_empleado = e.id_empleado', 'c.fecha_inicio>="' . $data->fecha_inicio . '" and c.fecha_fin<="' . $data->fecha_fin . '"', 'c.fecha_inicio asc', null);
        ///print $db->obtenerSQL();
        $consultas = $db->obtenerResultado();
        foreach ($consultas as &$consulta) {
            $db->seleccion('medicamento', 'm.id_medicamento,m.descripcion'
                , 'm inner join relacion_medicamento_tablas rmt on m.id_medicamento = rmt.id_medicamento',
                'rmt.id_tabla="' . $consulta['id_consulta'] . '" and rmt.descripcion_tabla = "consulta"', null, null);
            $medicamentos = $db->obtenerResultado();
            //var_dump($medicamentos);
            $consulta['medicamentos'] = $medicamentos;
            $consulta['title'] = $consulta['nombre'] . ' ' . $consulta['paterno'] . ' ' . $consulta['materno'];
            $consulta['start'] = $consulta['fecha_inicio'];
            $consulta['end'] = $consulta['fecha_fin'];
        }
        return ($consultas);
    } else if ($data->idTransaccion == '7') {//Select de los datos del empleado
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('medicamento', 'm.id_medicamento,m.clave,m.descripcion,m.precio,m.cantidad,m.cantidad_minima,pm.descripcion presentacion,pm.cantidad cantidad_entrada'
            , 'm inner join presentacion_medicamento pm on m.id_presentacion_entrada = pm.id_presentacion', 'm.estado="A" and m.clave like "%' . $data->clave . '%" and m.descripcion like "%' . $data->descripcion . '%"', 'm.id_medicamento asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '8') {//Select de los datos del empleado
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('medicamento', 'm.id_medicamento,m.clave,m.descripcion,m.precio,m.cantidad,m.cantidad_minima,pm.descripcion presentacion,pm.cantidad cantidad_entrada'
            , 'm inner join presentacion_medicamento pm on m.id_presentacion_entrada = pm.id_presentacion', 'm.estado="A" and m.clave like "%' . $data->clave . '%"', 'm.id_medicamento asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '9') {//Select de los datos del empleado
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('medicamento', 'm.id_medicamento,m.clave,m.descripcion,m.precio,m.cantidad,m.cantidad_minima,pm.descripcion presentacion,pm.cantidad cantidad_entrada'
            , 'm inner join presentacion_medicamento pm on m.id_presentacion_entrada = pm.id_presentacion', 'm.estado="A" and m.descripcion like "%' . $data->descripcion . '%"', 'id_medicamento asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '10') {//Select de los datos del empleado
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('usuario', 'u.id_usuario,u.usuario,u.password,u.rol,r.descripcion'
            , 'u inner join roles r on u.rol=r.id_rol', 'estado="A" and usuario like "%' . $data->usuario . '%"', 'id_usuario asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '11') {//Select de los datos del empleado
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('roles', 'id_rol,descripcion', null, null, 'id_rol asc', null);
        $roles = $db->obtenerResultado();
        foreach ($roles as &$rol) {
            $permisoDelRol = Roles::obtenerPermisosDelRol($rol["id_rol"]);
            $db->seleccion('permisos', 'id_permiso,descripcion', null, null, 'id_permiso asc', null);
            $permisos = $db->obtenerResultado();
            foreach ($permisos as &$permiso) {
                if ($permisoDelRol->tienePermiso($permiso['descripcion'])) {
                    $permiso['activo'] = true;
                } else {
                    $permiso['activo'] = false;
                }
            }
            $rol['permisos'] = $permisos;
        }
        return ($roles);
    } else if ($data->idTransaccion == '12') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('roles', 'id_rol,descripcion', null, null, 'id_rol asc', null);
        return ($db->obtenerResultado());
    } else if ($data->idTransaccion == '13') {//select de los datos de la consulta para generar los eventos del calendario
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('consulta', 'c.id_consulta,c.id_empleado,e.nombre,e.paterno,e.materno,c.peso,c.talla,c.altura,c.frecuencia_respiratoria,c.frecuencia_cardiaca,c.temperatura,c.asistencia,c.fecha_inicio,c.fecha_fin'
            , 'c inner join empleado e on c.id_empleado = e.id_empleado', 'c.fecha_inicio>="' . $data->fecha_inicio . '" and c.fecha_fin<="' . $data->fecha_fin . '" and c.asistencia = "N"', 'c.fecha_inicio asc', null);
        ///print $db->obtenerSQL();
        $consultas = $db->obtenerResultado();
        foreach ($consultas as &$consulta) {
            $db->seleccion('medicamento', 'm.id_medicamento,m.descripcion'
                , 'm inner join relacion_medicamento_tablas rmt on m.id_medicamento = rmt.id_medicamento',
                'rmt.id_tabla="' . $consulta['id_consulta'] . '" and rmt.descripcion_tabla = "consulta"', null, null);
            $medicamentos = $db->obtenerResultado();
            //var_dump($medicamentos);
            $consulta['medicamentos'] = $medicamentos;
            $consulta['title'] = $consulta['nombre'] . ' ' . $consulta['paterno'] . ' ' . $consulta['materno'];
            $consulta['start'] = $consulta['fecha_inicio'];
            $consulta['end'] = $consulta['fecha_fin'];
        }
        return ($consultas);
    } else if ($data->idTransaccion == '14') {//Select para traerse las visitas en un rango de fechas
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('visita', 'v.id_visita,v.fecha, v.id_empleado, v.id_usuario_creacion, v.id_diagnostico,' .
            'upper(d.descripcion),upper(concat(e.nombre," ",e.paterno," ",e.materno)) nombre,' .
            't.descripcion turno,dep.descripcion departamento, a.descripcion area,p.descripcion proceso '
            , 'v inner join descripcion d on v.id_diagnostico = d.id_descripcion ' .
            'inner join empleado e on e.id_empleado = v.id_empleado ' .
            'inner join descripcion t on e.id_turno = t.id_descripcion ' .
            'inner join descripcion dep on e.id_departamento = dep.id_descripcion ' .
            'inner join descripcion a on e.id_area = a.id_descripcion '.
            'left join descripcion p on v.id_proceso = p.id_descripcion ',
            'v.fecha>="' . $data->fecha_inicio . '" and v.fecha<="' . $data->fecha_fin . '"', 'v.fecha asc', null);
        ///print $db->obtenerSQL();
        $visitas = $db->obtenerResultado();
        foreach ($visitas as &$visita) {
            $db->seleccion('medicamento', 'm.id_medicamento,m.descripcion'
                , 'm inner join relacion_medicamento_tablas rmt on m.id_medicamento = rmt.id_medicamento',
                'rmt.id_tabla="' . $visita['id_visita'] . '" and rmt.descripcion_tabla = "visita"', null, null);
            $medicamentos = $db->obtenerResultado();
            //var_dump($medicamentos);
            $visita['medicamentos'] = $medicamentos;
            /*$visita['title'] = $visita['nombre'].' '.$consulta['paterno'].' '.$consulta['materno'];
            $visita['start'] = $visita['fecha_inicio'];
            $visita['end'] = $visita['fecha_fin'];*/
        }
        return ($visitas);
    }else if ($data->idTransaccion == '15') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('pase_salida', "ps.fecha_creacion as fecha,concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,e.id_empleado,de.descripcion as turno,de2.descripcion as departamento,ps.motivo as motivo","ps inner join empleado e on (e.id_empleado = ps.id_empleado) inner join descripcion de on (de.tipo = 'turno' and e.id_turno = de.id_descripcion) inner join descripcion de2 on (de2.tipo='depatrtamento' and de2.id_descripcion=e.id_departamento)", null, 'id_pase desc', '1');
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '17') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('pase_salida', "ps.fecha_creacion as fecha,concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,
        e.id_empleado,de.descripcion as turno,de2.descripcion as departamento,de3.descripcion as area,ps.motivo as motivo",
            "ps inner join empleado e on (e.id_empleado = ps.id_empleado)
            left join descripcion de on (de.tipo = 'turno' and e.id_turno = de.id_descripcion)
            left join descripcion de2 on (de2.tipo='depatrtamento' and de2.id_descripcion=e.id_departamento)
            left join descripcion de3 on (de3.tipo='area' and de3.id_descripcion=e.id_area)", null, 'ps.fecha_creacion desc', null);
        return ($db->obtenerResultado());
    }else if ($data->idTransaccion == '16') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('relacion_medicamento_tablas', "m.descripcion,sum(rmt.cantidad) total",
        "rmt inner join medicamento m on rmt.id_medicamento = m.id_medicamento", ' rmt.fecha >= "'.$data->fecha_inicio.'" and rmt.fecha <= "'.$data->fecha_fin.'" group by m.descripcion'
            , null, null);
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '18') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('empleado', "e.id_empleado,concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,count(*) total",
            "e inner join consulta c on e.id_empleado = c.id_empleado",
            ' c.fecha >= "'.$data->fecha_inicio.'" and c.fecha <= "'.$data->fecha_fin.'" group by nombre_completo,e.id_empleado'
            , null, null);
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '19') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('empleado', "e.id_empleado,concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,count(*) total",
            "e inner join visita v on e.id_empleado = v.id_empleado",
            ' v.fecha >= "'.$data->fecha_inicio.'" and v.fecha <= "'.$data->fecha_fin.'" group by nombre_completo,e.id_empleado'
            , null, null);
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '20') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('empleado', "concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,e.id_empleado,d.descripcion solicita,m.semana,m.respetar,m.motivo,m.supervisor,m.fecha_creacion fecha",
            "e inner join memo m on e.id_empleado = m.id_empleado inner join descripcion d on d.id_descripcion = m.id_solicita",
            ' m.fecha_creacion >= "'.$data->fecha_inicio.' 00:00:00" and m.fecha_creacion <= "'.$data->fecha_fin.' 23:59:59"'
            , null, null);
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '22') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->SQLLibre(''.
            " select 'CONSULTA' AS LUGAR,d.descripcion AS DESCRIPCION ,count(*) AS CANTIDAD from consulta c".
            " inner join descripcion d on (d.id_descripcion = c.id_descripcion)".
            " where".
            " c.fecha>= '".$data->fecha_inicio."' and c.fecha<='".$data->fecha_fin."'".
            " group by d.id_descripcion".
            " union all".
            " select 'EXPEDIENTE',d.descripcion,count(*) from expediente e".
            " inner join descripcion d on (d.id_descripcion = e.diagnostico)".
            " where".
            " e.fecha>= '".$data->fecha_inicio."' and e.fecha<='".$data->fecha_fin."'".
            " group by d.id_descripcion ");

        return ($db->obtenerResultado());
    }else if ($data->idTransaccion == '23') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('empleado', "e.id_empleado,concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,count(*) total",
            "e left join pase_salida c on e.id_empleado = c.id_empleado",
            ' c.fecha_creacion >= "'.$data->fecha_inicio.'" and c.fecha_creacion <= "'.$data->fecha_fin.'" group by nombre_completo,e.id_empleado'
            , null, null);
        return ($db->obtenerResultado());
    }else if ($data->idTransaccion == '24') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('empleado', "m.id_empleado,concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,fecha,peso,talla,altura,frecuencia_respiratoria,
        frecuencia_cardiaca,temperatura,imc,interrogatorio,exploracion_fisica,tratamiento,m.diagnostico,d1.descripcion as ramo_seguro,
        d2.descripcion as otras_indicaciones, d3.descripcion as pase_imss,p.descripcion as proceso",
            "e inner join expediente m on (e.id_empleado = m.id_empleado)
             inner join descripcion d1 on (m.id_ramo_seguro=d1.id_descripcion) inner join descripcion d2 on (m.id_otras_indicaciones = d2.id_descripcion)
             inner join descripcion d3 on (m.id_pase_imss=d3.id_descripcion) ".
             'left join descripcion p on m.id_proceso = p.id_descripcion '
            ,
            ' m.fecha >= "'.$data->fecha_inicio.'" and m.fecha <= "'.$data->fecha_fin.'"'
            , null, null);
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '25') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('empleado', "m.id_empleado,concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,fecha,peso,talla,altura,frecuencia_respiratoria,
        frecuencia_cardiaca,temperatura,imc,interrogatorio,exploracion_fisica,tratamiento,d.descripcion as diagnostico,d1.descripcion as ramo_seguro,
        d2.descripcion as otras_indicaciones, d3.descripcion as pase_imss",
            "e inner join expediente m on (e.id_empleado = m.id_empleado) inner join descripcion d on (d.id_descripcion= m.diagnostico)
             inner join descripcion d1 on (m.id_ramo_seguro=d1.id_descripcion) inner join descripcion d2 on (m.id_otras_indicaciones = d2.id_descripcion)
             inner join descripcion d3 on (m.id_pase_imss=d3.id_descripcion) ",
            ' m.fecha >= "'.$data->fecha_inicio.'" and m.fecha <= "'.$data->fecha_fin.'"'
            , null, null);
        return ($db->obtenerResultado());
    }else if ($data->idTransaccion == '26') {//Select para traerse las visitas en un rango de fechas
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('consulta', 'c.id_consulta,c.fecha,c.id_empleado, c.id_usuario_creacion, c.id_diagnostico,' .
            'upper(d.descripcion),upper(concat(e.nombre," ",e.paterno," ",e.materno)) nombre,' .
            't.descripcion turno,dep.descripcion departamento, a.descripcion area, p.descripcion proceso'
            , 'c inner join descripcion d on c.id_diagnostico = d.id_descripcion ' .
            'inner join empleado e on e.id_empleado = c.id_empleado ' .
            'left join descripcion t on e.id_turno = t.id_descripcion ' .
            'left join descripcion dep on e.id_departamento = dep.id_descripcion ' .
            'left join descripcion a on e.id_area = a.id_descripcion '.
            'left join descripcion p on c.id_proceso = p.id_descripcion ',
            'c.fecha>="' . $data->fecha_inicio . '" and c.fecha<="' . $data->fecha_fin . '"', 'c.fecha asc', null);
        $consultas = $db->obtenerResultado();
        foreach ($consultas as &$consulta) {
            $db->seleccion('medicamento', 'm.id_medicamento,m.descripcion'
                , 'm inner join relacion_medicamento_tablas rmt on m.id_medicamento = rmt.id_medicamento',
                'rmt.id_tabla="' . $consulta['id_consulta'] . '" and rmt.descripcion_tabla = "consulta"', null, null);
            $medicamentos = $db->obtenerResultado();
            $consulta['medicamentos'] = $medicamentos;
        }
        return ($consultas);
    } else if ($data->idTransaccion == '27') {
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('empleado', "concat(e.nombre,' ',materno,' ',paterno) as nombre_completo,e.id_empleado,d.descripcion entrega,
        d2.descripcion clasificacion,d3.descripcion ramo_seguro,i.folio,i.inicio,i.fin,i.fecha_creacion fecha",
            "e inner join incapacidad i on e.id_empleado = i.id_empleado
            inner join descripcion d on d.id_descripcion = i.id_entrega
            inner join descripcion d2 on d2.id_descripcion = i.id_clasificacion
            inner join descripcion d3 on d3.id_descripcion = i.id_ramo_seguro",
            ' i.fecha_creacion >= "'.$data->fecha_inicio.'" and i.fecha_creacion <= "'.$data->fecha_fin.'"'
            , null, null);
        return ($db->obtenerResultado());
    }
    else if ($data->idTransaccion == '28') {//Select de los datos del empleado
        $db = new Conexion();
        $db->abrirConexion();
        $db->seleccion('medicamento', 'm.id_medicamento,m.clave,m.descripcion,m.precio,m.cantidad,pm.descripcion presentacion,pm.cantidad cantidad_entrada,cantidad_minima '
            , 'm inner join presentacion_medicamento pm on m.id_presentacion_entrada = pm.id_presentacion', 'm.estado="A"', 'm.id_medicamento asc', null);
        return ($db->obtenerResultado());
    }



}//function
?>