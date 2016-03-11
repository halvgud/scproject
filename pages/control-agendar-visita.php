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
            <h1>Agendar Visita</h1>
            <hr>
            <form id="agendarVisitaForm">
                <table class="table" name="tabl1_visita" id="tabl1_visita">
                    <tbody>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="id_empleado">No. Empleado:</label>
                                <input type="text" class="form-control" id="id_empleado" name="id_empleado" placeholder="No. Empleado" required>
                            </div>
                        </td>
                        <td colspan = "2">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" readonly required data-empleado="">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="turno">Turno</label>
                                <input type="text" class="form-control" name="turno"  id="turno" maxlength="1" size = "1" readonly data-empleado="">
                            </div>
                        </td>
                        <td >
                            <div class="form-group">
                                <label for="departamento">Departamento</label>
                                <input type="text" class="form-control" id="departamento" name="departamento" readonly data-empleado="">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="area">Area</label>
                                <input type="text" class="form-control" id="area" name="area" readonly data-empleado="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="fecha">Fecha de Visita</label>
                                <input type="text" class="form-control" id="fecha" name="fecha" required>
                            </div>
                        </td>
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
                                <label for="proceso">Proceso</label>
                                <select name="proceso" id ="proceso" class="form-control" required>
                                    <option value="">Seleccione un valor</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table name="tabl2_visita" id="tabl2_visita">
                    <tbody>

                    </tbody>
                </table>
                <div class="form-group">
                    <label for="agregar_medicamento">Agregar Medicamento</label>
                    <select class='form-control' name='clklst' id='clklst' size='1'></select>
                    <button type="button" id="agregar_medicamento" class="btn btn-outline btn-primary"><i class="fa fa-plus-square"></i> Agregar Medicamento</button>
                </div>
                <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
            </form>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?>
    <script type="text/javascript">
        // $("#id_empleado").enterKey(function () {
        //     var arreglo={};
        //     var form1 = $("#tabl1_visita").find('input[data-empleado]').serializeArray();
        //     form1.forEach(function(input) {
        //         arreglo[input.name] = input.value;
        //     });
        //    // cargarInputs(arreglo,3);
        // })
        var contador = 0;
        $("#agendarVisitaForm").submit(function(){
            var form1 = $("#tabl1_visita").find("select, input").serializeArray();
            var form2 = $('#tabl2_visita').find("input").serializeArray();
            var datosTabla1 = {};
            var datosTabla2 = {};
            form1.forEach(function(input) {
                datosTabla1[input.name] = input.value;
            });
            form2.forEach(function(input) {
                datosTabla2[input.name] = input.value;
            });
            var datosUnion = {};
            console.warn(datosTabla1);
            datosUnion['contador'] = contador;
            datosUnion['tipo_transaccion'] = 2;
            datosUnion['visita'] = datosTabla1;
            datosUnion['relacion_visita_medicamento']=datosTabla2;
            //console.log(datosUnion);
            if($("#nombre").val() === ''){
                notificacionError('el usuario no existe por favor introdusca un id valido');
            }
            else{
                exitoso = function(datos){
                    if(datos.success)
                        notificacionSuccess(datos.success);
                    else if(datos.warning)
                        notificacionWarning(datos.warning);
                    $("#agendarVisitaForm")[0].reset();
                    $("#tabl2_visita tbody").empty();
                    contador = 0;
                };
                fallo = function(datos){
                    notificacionError(datos.error);
                };
                peticionAjax('data/testinsert.php',datosUnion,exitoso,fallo);
            }
            return false;
        });

        $("#agregar_medicamento").click(function(){
            contador++;
            var row = $("<tr></tr>");
            var td = $("<td></td>");
            var medicamento = $("<input>",{name:"descripcion"+contador,id:"descripcion"+contador,class:'form-control',value:$("#clklst option:selected").text() });
            td.append(medicamento);
            row.append(td);
            var idmedicamento = $("<input>",{type:'hidden',id:"id_medicamento"+contador,name:"id_medicamento"+contador,class:'form-control',value:$('#clklst').val()});
            td.append(idmedicamento);
            row.append(td);
            var cantidad = $("<input>",{id:"cantidad"+contador,name:"cantidad"+contador,type:'number',class:'form-control', value:'1',required:'required',min:'1'});
            td = $("<td></td>");
            td.append(cantidad);
            row.append(td);
            var icono = $("<i></i>",{class:'fa fa-minus-square'});
            var remover = $("<button></button>",{id:"cantidad"+contador,name:"cantidad"+contador,type:'button',class:'btn btn-outline btn-danger'});
            $(remover).click(function(){
                $(row).remove();
                contador--;
            });
            remover.append(icono);
            var td = $("<td></td>");
            td.append(remover);
            row.append(td);
            $("#tabl2_visita tbody").append(row);
        });
        $(function() {
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
            $.datetimepicker.setLocale('es');
            $("#fecha").datetimepicker();
            cargarDropDownListDescripcion(('#diagnostico'),'diagnostico');
            cargarDropDownListDescripcion(('#proceso'),'proceso');
            cargarDropDownList(('#clklst'),'id_medicamento','descripcion',2);

        });
    </script>
    </body>

    </html>
<?php } ?>