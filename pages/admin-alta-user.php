<?php session_start(); 
if(!isset($_SESSION['id_usuario'])){
   require_once('login.php');  
}
else
{
  ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <?php require_once('header-comun.html'); ?> 

</head>

<body>

    <div id="wrapper">
    <?php require_once('menu.php'); ?> 
        <div id="page-wrapper">
            <br/>
            <h1>Alta Usuario</h1>
            <hr>
            <div class="col-md-6 col-md-offset-3">
                
                <form id="guardarUsuario">
                    <input type="hidden" name="tabla" id="tabla" value="usuario">
                    <input type="hidden" name="id_usuario_creacion"  value="N">
                    <input type="hidden" name="estado"  value="A">
                    <input type="hidden" name="tipo_transaccion"  value="1">
                  <div class="form-group">
                    <label for="usuario">Nombre de Usuario:</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Id" required autocomplete="off">
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required autocomplete="off">
                  </div>
                  <div class="form-group">
                    <label for="rol">Rol</label>
                    <select class="form-control" id="rol" name="rol" required>
                        <option value="">Seleccione un Rol</option>
                    </select>
                  </div>
                  <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
                </form>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?>
    <script type="text/javascript">
        var contador = 0;
        $("#guardarUsuario").submit(function(){
            var form1 = $("#guardarUsuario").find("select,input").serializeArray();
            var datosTabla1 = {};
            form1.forEach(function(input) {
                datosTabla1[input.name] = input.value;
            });
            datosTabla1['fecha_alta'] = moment().format("YYYY/MM/DD HH:mm:ss");
            exitoso = function(datos){
                notificacionSuccess(datos.success);
                $("#guardarUsuario")[0].reset();
                contador = 0;
            };
            fallo = function(datos){
                notificacionError(datos.error);
            };
            peticionAjax('data/testinsert.php',datosTabla1,exitoso,fallo);

            return false;
        });

        $(function() {
            $.datetimepicker.setLocale('es');
            $("#inicio").datetimepicker({
                timepicker:false,
                format:'Y/m/d'
            });
            $("#fin").datetimepicker({
                timepicker:false,
                format:'Y/m/d'
            });
            $("#id_empleado").focusout(function(){
                cargatDatosEmpleado();
            });
            $("#id_empleado").enterKey(function(e){
                e.preventDefault();
                cargatDatosEmpleado();
            });
            function cargatDatosEmpleado(){
                $('input[data-empleado]').val('');
                var form1 = $("#tabl1_visita").find('input[data-empleado]').serializeArray();
                var datosTabla1 = {};
                form1.forEach(function(input) {
                    datosTabla1[input.name] = input.value;
                });
                console.warn(datosTabla1);
                cargarInputs(datosTabla1,5,$("#id_empleado").val())
            }
            cargarDropDownList(("#rol"),'id_rol','descripcion',12);
        });
    </script>
</body>

</html>
<?php } ?>