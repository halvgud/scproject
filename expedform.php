<?php ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<html>
    <head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scalable=1, maximun-scalable=1, minimun-scalable=1">
    <link href="imagenes/syscoo.png" rel="shortcut icon" type="image/png">
     <title>Sysco</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scalable=1, maximun-scalable=1, minimun-scalable=1">
        <link href="Css/menuu.css" type="text/css" rel="stylesheet"/>
        <link href="Css/style.css" type="text/css" rel="stylesheet"/>
        <link href="Css/estiloreg.css" type="text/css" rel="stylesheet"/>
         <link href="Css/formularios.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <img alt="" src="imagenes/ladrillo.png" id="full-screen-background-image" />
        <img src="imagenes/oficial.png" style="margin-left: 227px; margin-top: 0; "></img>
        <ul class="mi-menu">
        <li><a href="inicioo.php" title="">
       &nbsp&nbsp&nbsp&nbsp&nbsp
       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
       Inicio</a></li>
<li><a href="" >Administrador</a>
   <ul>
     <li><a href="altauser.php"> Alta </a></li>
      <li><a href="#"> Modificar</a></li>
      <li><a href="#">Eliminar</a></li>
</ul>
</li>
<li><a href="" >Control Medicamento</a>
<ul>
    <li><a href="consultasC.php"> Consultas </a></li>
      <li><a href="pasesalida.php"> Pase de Salida </a></li>
      <li><a href="medicamento.php"> Medicamento </a></li>
</ul>
</li>
<li><a href="" >Expediente Medico</a>
<ul>
    <li><a href="#"> Consultas </a></li>
      <li><a href="#"> Expediente </a></li>
      <li><a href="pasesalida.php"> Pase de Salida </a></li>
     </ul>
</li>
<li><a href="" >Incapacidades</a>
<ul>
    <li><a href="incapacidades.php"> Incapacidad</a></li>
      <li><a href="memo.php"> Memo </a></li>
      </ul>
</li>
<li><a href="#" >Reportes</a></li>
<li><a href="#" >Salir</a></li>
        </ul>
        <div id="barra">
        <p id="estilo">Agregar Expediente</p>
     </div>
        <div id="general1">
       <div id="contenido5">
        <div id="cabezera">
            <p id="ingresardatos">Ingresar Datos</p>
        </div>
        <div id="datos">
            <form name="registroconsulta" action="procesar.php" method="post">  
                <table border="0" class="" id="datos" aling>
                    <tr>
                        <td class="letraemp"><b>No.Empleado</b></td>
                         <td><input type="text"name=textoNo.Empleado" maxlength="5" size="5"/></td>
                    </tr>
                    
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name=textoNombre"/></td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno</td>
                        <td><input type="text" name=textoApellP"/></td>
                    </tr>
                    <tr>
                        <td>Apellido Materno</td>
                        <td><input type="text" name=textoApellM"/></td>
                    </tr>
                    <tr>
                        <td>Turno</td>
                        <td><input type="text" name=textoTurno" maxlength="1" size="1"/></td>
                    </tr>
                    <tr>
                        <td>Departamento</td>
                        <td><input type="text" name=textoDepto"/></td>
                    </tr>
                    <tr>
                        <td>Area</td>
                        <td><input type="text" name=textoArea"/></td>
                    </tr>
                     <tr>
                        <td>Interrogatorio</td>
                        <td><textarea name="interrogatorio" rows="5" cols="50"></textarea></td>
                    </tr>
                     <tr>
                        <td>Peso</td>
                        <td><input type="text" name=textoArea" /></td>
                    </tr>
                     <tr>
                        <td>talla</td>
                        <td><input type="text" name=textoArea" /></td>
                    </tr>
                     <tr>
                        <td>IMC</td>
                        <td><input type="text" name=textoArea" /></td>
                    </tr>
                     <tr>
                        <td>Frec. Cardiaca</td>
                        <td><input type="text" name=textoArea" /></td>
                    </tr>
                     <tr>
                        <td>Temperatura</td>
                        <td><input type="text" name=textoArea" /></td>
                    </tr>
                     <tr>
                        <td>Frec. Respiratoria</td>
                        <td><input type="text" name=textoArea" /></td>
                    </tr>
                     <tr>
                        <td>Exploracion Fisica</td>
                        <td><textarea name="interrogatorio" rows="5" cols="50"></textarea></td>
                    </tr>
                     <tr>
                        <td>Diagnostico</td>
                        <td><input type="text" name=textoArea" /></td>
                    </tr>
                    <tr>
                        <td>Ramo de Seguro</td>
                        <td>
                            <select name="medic">
                            <option value=""></option>
                                <option value="">Enfermedad General</option>
                                <option value="">Enfermedad Profesional</option>
                                <option value="">Accidente de Trabajo</option>
                                <option value="">Incidente</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Tratamiento</td>
                        <td><textarea name="interrogatorio" rows="5" cols="50"></textarea></td>
                    </tr>
                     <tr>
                        <td>Otras Indicaciones</td>
                        <td>
                            <select name="canti">
                            <option value=""></option>
                                <option value="">Laboratorio</option>
                                <option value="">Fisoterapia</option>
                                <option value="">Cambio de Proceso(TEMPORAL)</option>
                                <option value="">Cambio de Area(TEMPORAL)</option>
                                <option value="">Cambio de Area(DEFINITIVO)</option>
                            </select>
                        </td>
                    </tr>
                     <tr>
                        <td>Pase al Imss</td>
                        <td>
                            <select name="medic2">
                            <option value=""></option>
                                <option value="">SI</option>
                                <option value="">NO</option>
                                </select>
                        </td>
                     </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="image" src="imagenes/down.png" width="40" height="40" name="botonagvisita" value="Agregar">&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                            <input  type="image" src="imagenes/can.png" width="40" height="40" name="btncanclarvisita" value="Cancelar">&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                            <input  type="image" src="imagenes/dow.png" width="40" height="40" name="btnregrevisita" value="Regresar">
                           
                        </td>
                </table>
            </form>
        </div>
        </div>
     </div>
         </body>
     
</html>