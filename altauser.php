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
        <p id="estilo">Alta Usuario</p>
     </div>
        <div id="general1">
       <div id="contenido7">
        <div id="cabezera">
            <p id="ingresardatos">Ingresar Datos</p>
        </div>
        <div id="formulario">
            <form name="altauser" action="" method="post">
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
                       <td class="letraemp"><b>ID</b></td>
                        <td><input type="text"name=textoID" maxlength="5" size="5"/></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name=textoNombre"/></td>
                    </tr>
                     <tr>
                        <td>Password</td>
                        <td><input type="text" name=textopass"/></td>
                    </tr>

                    <tr>
                        <td>Tipo</td>
                        <td><input type="text" name=textotipo" maxlength="1" size="1"/></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="image" src="imagenes/down.png" width="40" height="40" name="botonagvisita" value="Agregar">&nbsp&nbsp&nbsp&nbsp
                            &nbsp&nbsp
                     </table>
                </div>
            </form>
        </div>
     </div>
 </div>
</html>
        