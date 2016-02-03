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
     <li><a href="#"> Alta </a></li>
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
      <li><a href="expepdmenu.php"> Expediente </a></li>
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
        <p id="estilo">Nuevo Medicamento</p>
     </div>
        <div id="general1">
       <div id="contenido">
        <div id="cabezera">
            <p id="ingresardatos">Ingresar Datos</p>
        </div>
        <div id="formulario">
            <form name="registmed" action="" method="post">
                 <div id="">
                <table border="0" id="dat">
                    <div id="">
                    <tr>
                        <td></td>
                    </tr>
                    </div>
                </table>
                <div id="datos">
                <table border="0" class="" id="datos">
                     <tr>
                        <td>Clave</td>
                        <td><input type="text" name=textoNombre"/></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name=textoNombre"/></td>
                    </tr>
                     <tr>
                        <td>Presentacion</td>
                        <td><input type="text" name=textopresent"/></td>
                    </tr>

                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name=textocantidad"/></td>
                    </tr>
                    <tr>
                        <td>Costo Total</td>
                        <td><input type="text" name=textocostoT" maxlength="7" size="7"/></td>
                    </tr>
                    <tr>
                        <td>Costo Unitario</td>
                        <td><input type="text" name=textocostoU" maxlength="7" size="7"/></td>
                    </tr>
                    <tr>
                        <td>Fecha de Ingreso</td>
                        <td><input type="date" name=textofechI"/></td>
                    </tr>
                    <tr>
                        <td>Fecha de Caducidad</td>
                        <td><input type="date" name=textofechC"/></td>
                    </tr>
                    </br>
                    </br>
                    <tr>
                        <td colspan="5">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="image" src="imagenes/down.png" width="40" height="40" name="botonagvisita" value="Agregar">&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                            <input  type="image" src="imagenes/can.png" width="40" height="40" name="btncanclarvisita" value="Cancelar">&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                            <input  type="image" src="imagenes/dow.png" width="40" height="40" name="btnregrevisita" value="Regresar">
                           
                        </td>
                    
                </table>
                </div>
            </form>
        </div>
        </div>
        </div>
</html>
        