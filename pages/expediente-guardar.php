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
                <h1>Expediente Nuevo</h1>
            </div>
            <button type="button" id="revisarCitas" class="btn btn-outline btn-success"><i class="fa fa-calendar fa-fw"></i> Revisar Citas</button>
            <input type="hidden" id="id_consulta" name="id_consulta">
            <form id="guardarExpediente">
                <table class="table">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="id_empleado">No. Empleado:</label>
                                    <input type="text" class="form-control" id="id_empleado" name="id_empleado" readonly required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" readonly>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="turno">Turno</label>
                                    <input type="text" class="form-control" id="turno" name="turno" maxlength="1" size = "1" readonly>
                                </div>
                            </td>
                            <td >
                                <div class="form-group">
                                    <label for="departamento">Departamento</label>
                                    <input type="text" class="form-control" id="departamento" name="departamento" readonly>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="area">Area</label>
                                    <input type="text" class="form-control" id="area" name="area" readonly>
                                </div>
                            </td>         
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div class="form-group">
                                    <label for="interrogatorio">Interrogatorio</label>
                                    <textarea name="interrogatorio" id="interrogatorio" class="form-control" maxlength="1000" rows="2" required="required"></textarea>
                                </div>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="peso">Peso (Kg)</label>
                                    <input type="number" class="form-control"  step="any" name="peso" id="peso" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="talla">Talla</label>
                                    <input type="number" class="form-control"  step="any" name="talla" id="talla" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="altura">Altura</label>
                                    <input type="number" class="form-control"  step="any" name="altura" id="altura" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="imc">IMC</label>
                                    <input type="number" class="form-control"  step="any" name="imc" id="imc" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="temperatura">Temperatura</label>
                                    <input type="number" class="form-control"  step="any" name="temperatura" id="temperatura" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="frecuencia_cardiaca">Frec. Cardiaca</label>
                                    <input type="number" class="form-control"  step="1" name="frecuencia_cardiaca" id="frecuencia_cardiaca" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="frecuencia_respiratoria">Frec. Respiratoria</label>
                                    <input type="number" class="form-control"  step="1" name="frecuencia_respiratoria" id="frecuencia_respiratoria" required>
                                </div>
                            </td> 
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="exploracion_fisica">Exploración Fisica</label>
                                    <textarea name="exploracion_fisica" id="exploracion_fisica" class="form-control" maxlength="1000" rows="3" required="required"></textarea>
                                </div>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="diagnostico">Diagnostico</label>
                                    <select name="diagnostico" id ="diagnostico" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="id_ramo_seguro">Ramo de Seguro</label>
                                    <select name="id_ramo_seguro" id ="id_ramo_seguro" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
                                </div>
                            </td>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="tratamiento">Tratamiento</label>
                                    <textarea name="tratamiento" id="tratamiento" class="form-control" maxlength="1000" rows="3" required="required"></textarea>
                                </div>
                            </td> 
                                 
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="id_otras_indicaciones">Otras indicaciones</label>
                                    <select name="id_otras_indicaciones" id ="id_otras_indicaciones" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="id_pase_imss">Pase al IMSS</label>
                                    <select name="id_pase_imss" id ="id_pase_imss" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
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

    <script type="text/javascript" >
        //El siguietne codigo sirve para enviar los datos a el php que realiza los inserts
        $("#guardarExpediente").submit(function(e){
            e.preventDefault();
            var form1 = $("#guardarExpediente").find("select, input, textarea").serializeArray();
            var datosTabla1 = {};
            form1.forEach(function(input) {
                datosTabla1[input.name] = input.value;
            });
            datosTabla1['fecha'] = moment().format("YYYY/MM/DD HH:mm:ss");
            var datosTabla2 = {};
            datosTabla2['id_consulta'] = $("#id_consulta").val();
            var datosUnion = {};
            datosUnion['tipo_transaccion'] = 5;
            datosUnion['expediente'] = datosTabla1;
            datosUnion['consulta']=datosTabla2;
            console.log(datosUnion);
            if($("#nombre").val() === ''){
                notificacionError('No ha seleccionado un empleado para guardar su expediente.');
            }
            else{
                exitoso = function(datos){
                    if(datos.success)
                        notificacionSuccess(datos.success);
                    $("#guardarExpediente")[0].reset();
                    $("#id_consulta").val('N');
                };
                fallo = function(datos){
                    if(datos.error)
                        notificacionError(datos.error);
                    console.error(datos);
                };
                peticionAjax('data/testinsert.php',datosUnion,exitoso,fallo);
            }
            return false;
        });
        ////////////////////////////////////////////////
        $(document).ready(function() {
            $("#revisarCitas").click(function(){
                var datos = {};
                 datos.fecha_inicio = moment().format('YYYY/MM/DD')+' 00:00:00';
                 datos.fecha_fin = moment().format('YYYY/MM/DD')+' 23:59:59';
                 datos.idTransaccion = 13;
                 exitoso = function(datos){
                     console.log(datos);
                     if(datos.success)
                        notificacionSuccess(datos.success);
                     BootstrapDialog.show({
                         title: 'Consultas para el dia '+moment().format('DD/MM/YYYY'),
                         //message:'asdasd',
                         message:function(dialog) {
                             var $tabla = $("<table></table>",{class:"table table-bordered able-striped table-condensed"});
                             var tr = $("<tr></tr>");
                             agregarTHaTR(tr,'Empleado');
                             agregarTHaTR(tr,'Fecha Inicio');
                             agregarTHaTR(tr,'Fecha Fin');
                             agregarTHaTR(tr,'Seleccionar');
                             $tabla.append(tr);

                             datos.forEach(function(element, index) {
                                 var tr = $("<tr></tr>");
                                 agregarTDaTR(tr,element.title);
                                 agregarTDaTR(tr,element.fecha_inicio);
                                 agregarTDaTR(tr,element.fecha_fin);
                                 var $btn = $("<button></button>",{class:'btn btn-success'});
                                 var icono_check = $("<i></i>",{class:'fa fa-check-square-o'});
                                 $btn.append(icono_check);
                                 $btn.click(function(){
                                     $("#id_empleado").val(element.id_empleado);
                                     $("#id_consulta").val(element.id_consulta);
                                     cargatDatosEmpleado();
                                     dialog.close();
                                 });
                                 agregarTDaTR(tr,$btn,'text-center');
                                 $tabla.append(tr);
                             });
                            return $tabla;
                          },
                         type: BootstrapDialog.TYPE_INFO,
                         size: BootstrapDialog.SIZE_WIDE,
                         buttons: [{
                             id: 'btn-1',
                             label: 'Cancelar',
                             cssClass: 'btn-primary',
                             action: function(dialog) {
                                 dialog.close();
                             }
                         }]
                     });
                 };
                 fallo = function(datos){
                     if(datos.error)
                        notificacionError(datos.error);
                 };
                 peticionAjax('data/testselect.php',datos,exitoso,fallo);
            });
        });
        function agregarTDaTR (tr,element,cssClass){
            if(cssClass)
                var td = $("<td></td>",{class:cssClass});
            else
                var td = $("<td></td>",{class:cssClass});
            $(td).append(element);
            $(tr).append(td);
        }
        function agregarTHaTR (tr,element){
            var th = $("<th></th>");
            $(th).append(element);
            $(tr).append(th);
        }
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
        $(function() {
            $("#id_empleado").focusout(function(){
                cargatDatosEmpleado();
            });
            $("#id_empleado").enterKey(function(e){
                e.preventDefault();
                cargatDatosEmpleado();
            });

            $("#fecha_visita").datetimepicker();
            cargarDropDownListDescripcion(('#diagnostico'),'diagnostico');
            cargarDropDownListDescripcion(('#id_ramo_seguro'),'expediente_ramo_seguro');
            cargarDropDownListDescripcion(('#id_otras_indicaciones'),'expediente_otras_indicaciones');
            cargarDropDownListDescripcion(('#id_pase_imss'),'expediente_pase_imss');
            cargarDropDownList(('#clklst'),'id_medicamento','descripcion',2);
        });
    </script>
</body>

</html>
<?php } ?>