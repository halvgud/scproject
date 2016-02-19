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
            <h1>Guardar Memo</h1>
            <hr>
            <form id="guardarMemo">
                <input type="hidden" name="tabla" id="tabla" value="memo">
                <input type="hidden" name="id_usuario"  value="N">
                <input type="hidden" name="tipo_transaccion"  value="1">
                <table class="table">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="id_empleado">No. Empleado:</label>
                                    <input type="text" class="form-control" name="id_empleado" id="id_empleado" placeholder="No. Empleado" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" readonly>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="turno">Turno</label>
                                    <input type="text" class="form-control" id="turno" maxlength="1" size = "1" readonly>
                                </div>
                            </td>
                            <td >
                                <div class="form-group">
                                    <label for="departamento">Departamento</label>
                                    <input type="text" class="form-control" id="departamento" readonly>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="area">Area</label>
                                    <input type="text" class="form-control" id="area" readonly>
                                </div>
                            </td>         
                        </tr>
                        <tr> 
                            <td>
                                <div class="form-group">
                                    <label for="id_solicita">Solicita</label>
                                    <select name="id_solicita" id ="id_solicita" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="semana">Semana</label>
                                    <input type="number" step="1" class="form-control" id="semana" name="semana" placeholder="Semana">
                                </div>
                            </td>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="respetar">Respetar</label>
                                    <input type="text" class="form-control" id="respetar" name="respetar" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="motivo">Motivo</label>
                                    <input type="text" class="form-control" name="motivo" id="motivo" required>
                                </div>
                            </td>
                            <td colspan="2">
                                <div class="form-group">
                                    <label for="supervisor">Sup. de Produccion</label>
                                    <input type="text" class="form-control" name="supervisor" id="supervisor" required>
                                </div>
                            </td>  
                        </tr>
                    </tbody>
                </table>
              <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
            </form>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?>


    <script type="text/javascript">
        var contador = 0;
        $("#guardarMemo").submit(function(){
            var form1 = $("#guardarMemo").find("select,input").serializeArray();
            var datosTabla1 = {};
            form1.forEach(function(input) {
                datosTabla1[input.name] = input.value;
            });
            datosTabla1['fecha_creacion'] = moment().format("YYYY/MM/DD HH:mm:ss");
            if($("#nombre").val() === ''){
                notificacionError('El usuario no existe por favor introdusca un id valido');
            }
            else if($("#inicio").val() === ''){
                notificacionError('Por favor selecciona la fecha de inicio');
            }
            else if($("#fin").val() === ''){
                notificacionError('Por favor seleccione la fecha de fin');
            }
            else{
                exitoso = function(datos){
                    notificacionSuccess(datos.success);
                    $("#guardarMemo")[0].reset();
                    contador = 0;
                };
                fallo = function(datos){
                    notificacionError(datos.error);
                };
                peticionAjax('data/testinsert.php',datosTabla1,exitoso,fallo);
            }
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
            $("#fecha").datetimepicker();
            cargarDropDownListDescripcion(('#id_solicita'),'memo_solicita');
        });
    </script>
</body>

</html>
<?php } ?>
            