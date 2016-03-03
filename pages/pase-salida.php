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
            <div class="page-header">
                <h1>Pase de Salida</h1>
            </div>
            <form name="pase_salida" id="pase_salida">
                <table class="table" name="tabl_pasesalida" id="tabl_pasesalida">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="id_empleado">No. Empleado:</label>
                                    <input type="text" class="form-control" id="id_empleado" name="id_empleado" placeholder="No. Empleado" required >
                                </div>
                            </td>
                            <td colspan = "2">
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" readonly data-empleado="">
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="turno">Turno</label>
                                    <input type="text" class="form-control" id="turno" maxlength="1" size = "1" readonly data-empleado="">
                                </div>
                            </td>
                            <td >
                                <div class="form-group">
                                    <label for="departamento">Departamento</label>
                                    <input type="text" class="form-control" id="departamento" readonly data-empleado="">
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="area">Area</label>
                                    <input type="text" class="form-control" id="area" readonly data-empleado="">
                                </div>
                            </td>         
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="motivo">Motivo:</label>
                                    <textarea  rows="4" columns="15" class="form-control" id="motivo" placeholder="Motivo" name="motivo" maxlength="99" required></textarea>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="id_autorizacion">Autoriza:</label>
                                    <select id ="id_autorizacion" name="id_autorizacion" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
                                </div>
                            </td>  
                            </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
                <button type="button" class="btn btn-outline btn-info" name="reimprimir" id="reimprimir"><i class="fa fa-print"></i> Re Imprimir último</button>
            </form>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <input id="btnShow" type="button" value="Show PDF" />
    <div id="dialog"  name="dialog" style="display: none">
    </div>
    <?php require_once('footer-comun.html'); ?>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
          rel="stylesheet" type="text/css" />
    <script>
        $(function() {
            $("#reimprimir").click(function(){
                mostrarMensaje(null);
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
                var datosTabla1 = {};
                $.each($("#tabl_pasesalida").find('input[data-empleado]').serializeArray(), function() {
                    datosTabla1[this.name] = this.value;
                });
                console.warn(datosTabla1);
                cargarInputs(datosTabla1,5,$("#id_empleado").val())
            }
            cargarDropDownListDescripcion(('#id_autorizacion'), 'pase_autorizacion');
        });

            $("#pase_salida").submit(function(){
                var datosTabla1 = {};
                $.each($("#pase_salida").find('select,input,textarea').serializeArray(), function() {
                    datosTabla1[this.name] = this.value;
                });
                datosTabla1['fecha_creacion'] = moment().format("YYYY/MM/DD HH:mm:ss");
                var datosUnion = {};
                datosUnion['tipo_transaccion'] = 6;
                datosUnion['pase_salida'] = datosTabla1;
                if($("#nombre").val() === ''){
                    notificacionError('El usuario no existe por favor introdusca un id valido');
                }
                else{
                    exitoso = function(datos){
                            mostrarMensaje(datos);
                           $("#pase_salida")[0].reset();
                        contador = 0;

                    };
                    fallo = function(datos){
                        notificacionError(datos.error);
                    };
                    peticionAjax('data/testinsert.php',datosUnion,exitoso,fallo);
                }
                return false;
            });

    function mostrarMensaje(datos){
        var $textAndPic = $('<div></div>');
        $textAndPic.append('<iframe width="580" height="370" src="pdf_pase_salida.php"></iframe>');
        if(datos!=null){
            notificacionSuccess(datos.success);
        }
        BootstrapDialog.show({
            title: 'Imprimir Pase',
            message: $textAndPic,
            type: BootstrapDialog.TYPE_DEFAULT,
            buttons: [{
                id: 'btn-1',
                label: 'Cancelar',
                cssClass: 'btn-primary',
                action: function(dialog) {
                    dialog.close();
                }
            }]
    })};
    </script>
</body>

</html>
<?php } ?>
            