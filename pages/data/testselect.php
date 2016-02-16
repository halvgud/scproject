<?php
include('lib/adodb5/adodb.inc.php'); //include del adodb
include('core.php');


$data = json_decode(file_get_contents('php://input'));
if($data->idTransaccion=='1'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('medicamento','id_medicamento,descripcion',null,null,'id_medicamento asc',null);
     print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='2'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('presentacion_medicamento','id_presentacion,presentacion_medicamento.descripcion',"medicamento md on (md.id_presentacion_salida=presentacion_medicamento.id_presentacion)","md.id_medicamento='".$data->idBusqueda."'",'id_presentacion asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='3'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('empleado','id_empleado,nombre,id_turno,id_departamento,id_area',null,'id_empleado='.$data->idBusqueda,'id_empleado asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='4'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('diagnostico','id_diagnostico,descripcion',null,'estado="A"','id_diagnostico asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='4'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('diagnostico','id_diagnostico,descripcion',null,'estado="A"','id_diagnostico asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='5'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('empleado','e.id_empleado,concat(e.nombre," ",e.paterno," ",e.materno) nombre,t.descripcion turno, a.descripcion area, d.descripcion departamento'
        ,'e inner join turno t on e.id_turno = t.id_turno inner join area a on e.id_area = a.id_area inner join departamento d on e.id_departamento = d.id_departamento'
        ,'e.id_empleado="'.$data->idBusqueda.'"','e.id_empleado asc',null);
    print json_encode($db->obtenerResultado());
}
else if($data->idTransaccion=='6'){
    $db = new Conexion();
    $db->abrirConexion();
    $db->seleccion('consulta','id_consulta,id_empleado,id_empleado,peso,talla,altura,frecuencia_respiratoria,frecuencia_cardiaca,temperatura,asistencia,fecha_inicio,fecha_fin'
        ,null,'fecha_inicio>="'.$data->fecha_inicio.'" and fecha_fin<="'.$data->fecha_fin.'"','fecha_inicio asc',null);
    ///print $db->obtenerSQL();
    $consultas = $db->obtenerResultado();
    print json_encode($consultas);
}

?>