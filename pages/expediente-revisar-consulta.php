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
                <h1>Revisar Consulta</h1>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div  id='calendario'></div>
                </div>
            </div>
            <div class="modal fade" id="agregarConsultasModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Agregar Visita</h4>
                        </div>
                        <div class="modal-body">
                            <form name="agendarConsultaForm" id="agendarConsultaForm" >
                                <table class="table" id="tabl1_consulta">

                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <input type="hidden" name="id_empleado" value="1">
                                                <label for="id_empleado">No. Empleado:</label>
                                                <input type="text" class="form-control" name="id_empleado" id="id_empleado" placeholder="No. Empleado" required>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="nombre">Nombre</label>
                                                <input type="text" class="form-control" id="nombre" readonly tabindex="-1">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="turno">Turno</label>
                                                <input type="text" class="form-control"  id="turno" maxlength="1" size = "1" readonly tabindex="-1">
                                            </div>
                                        </td>
                                        <td >
                                            <div class="form-group">
                                                <label for="departamento">Departamento</label>
                                                <input type="text" class="form-control"  id="departamento" readonly tabindex="-1">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="area">Area</label>
                                                <input type="text" class="form-control"  id="area" readonly tabindex="-1">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label for="diagnostico">Diagnostico</label>
                                                <textarea name="diagnostico" id="diagnostico" class="form-control" maxlength="1000" rows="3" required="required"></textarea>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="peso">Peso (Kg)</label>
                                                <input type="number" class="form-control"  step="any" id="peso" name="peso" required>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="talla">Talla</label>
                                                <input type="number" class="form-control"  step="any" id="talla" name="talla" required>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="altura">Talla</label>
                                                <input type="number" class="form-control"  step="any" id="altura" name="altura" required>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="temperatura">Temperatura</label>
                                                <input type="number" class="form-control"  step="any" id="temperatura" name="temperatura" required>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label for="frecuencia_cardiaca">Frec. Cardiaca</label>
                                                <input type="number" class="form-control"  step="1" id="frecuencia_cardiaca" name="frecuencia_cardiaca" required>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="frecuencia_respiratoria">Frec. Respiratoria</label>
                                                <input type="number" class="form-control"  step="1" id="frecuencia_respiratoria" name="frecuencia_respiratoria" required>
                                            </div>
                                        </td>
                                        <td >
                                            <div class="form-group">
                                                <label for="fecha_consulta">Fecha</label>
                                                <input type="text" class="form-control" id="fecha_consulta" readonly name="fecha_consulta"/>
                                            </div>
                                        </td>
                                        <td >
                                            <div class="form-group">
                                                <label for="hora_inicio">Hora Inicio</label>
                                                <input type="text" class="form-control" id="hora_inicio" name="hora_inicio" readonly/>
                                            </div>
                                        </td>
                                        <td >
                                            <div class="form-group">
                                                <label for="hora_fin">Hora Fin</label>
                                                <input type="text" class="form-control" id="hora_fin"  name="hora_fin" readonly/>
                                            </div>
                                            <input type="hidden" id="fecha"  name="fecha"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table name="tabl2_consulta" id="tabl2_consulta">
                                    <tbody>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label for="agregar_medicamento">Agregar Medicamento</label>
                                                <select class='form-control' name='clklst' id='clklst' size='1'></select>
                                            </div>
                                        </td>
                                        <td>
                                            <button type="button" id="agregar_medicamento" class="btn btn-outline btn-primary"><i class="fa fa-plus-square"></i> Agregar Medicamento</button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                                <!-- <p>
                                     <input type="hidden" value="" name="id">
                                     <input type="input" value="1" name="cantidad" id="cantidad">
                                     <select name='clklst' id='clklst' size='1'></select>
                                     <select name='unidad' id='unidad' size='1'></select>

                                     <input type="button" value="Agregar a Receta">
                                 </p>-->
                                <!--    <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>-->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline btn-danger" data-dismiss="modal"><i class="fa fa-ban"></i> Cancelar</button>
                            <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
                        </div>
                        </form><!--se cambia el tamaño del form-->
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?>

    <script type="text/javascript" >
        var contador = 0;
        var eventData = {};
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

            var cantidad = $("<input>",{id:"cantidad"+contador,name:"cantidad"+contador,type:'number',class:'form-control', value:'1'});
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
            // remover.append(' Remover');
            var td = $("<td></td>");
            td.append(remover);
            //console.log(contador)
            row.append(td);
            // console.log(row);
            $("#tabl2_consulta tbody").append(row);
        });
        //El siguietne codigo sirve para enviar los datos a el php que realiza los inserts
        $("#agendarConsultaForm").submit(function(e){
            e.preventDefault();
            var form1 = $("#tabl1_consulta").find("select, input,textarea").serializeArray();
            var form2 = $('#tabl2_consulta').find("input").serializeArray();

            var datosTabla1 = {};
            var datosTabla2 = {};
            form1.forEach(function(input) {
                datosTabla1[input.name] = input.value;
            });
            form2.forEach(function(input) {
                datosTabla2[input.name] = input.value;
            });
            var datosUnion = {};
            datosUnion['contador'] = contador;
            datosUnion['tipo_transaccion'] = 3;
            datosUnion['consulta'] = datosTabla1;
            datosUnion['relacion_consulta_medicamento']=datosTabla2;
            console.log(datosUnion);
            if($("#nombre").val() === ''){
                notificacionError('el usuario no existe por favor introdusca un id valido');
            }
            else{
                eventData.title = $("#id_empleado").val()+' - '+$("#nombre").val();
                exitoso = function(datos){
                    notificacionSuccess(datos.success);
                    $("#agendarConsultaForm")[0].reset();
                    $("#tabl2_consulta tbody").empty();
                    $('#agregarConsultasModal').modal('toggle');
                    $('#calendario').fullCalendar('renderEvent', eventData, true); // stick? = true
                    contador = 0;
                };
                fallo = function(datos){

                };
                peticionAjax('data/testinsert.php',datosUnion,exitoso,fallo);
            }
            return false;
        });
        ////////////////////////////////////////////////
        $(document).ready(function() {
            $.datetimepicker.setLocale('es');
            /*
             $('#hora_inicio').datetimepicker({
             datepicker:false,
             format:'H:i',
             step:10
             });
             $('#hora_fin').datetimepicker({
             datepicker:false,
             format:'H:i',
             step:10
             });
             */
            $('#calendario').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    // right: 'month,agendaWeek,agendaDay'
                    right: 'month,agendaDay'
                },
                lang: 'es',
                allDaySlot:false,
                slotDuration:moment.duration(5, 'minutes'),
                slotLabelInterval:moment.duration(15, 'minutes'),
                // snapDuration:moment.    duration(10, 'minutes'),
                // selectOverlap:false,
                selectable: true,
                selectHelper: true,
                fixedWeekCount:false,
                eventOverlap :false,
                slotEventOverlap:false,
                scrollTime:moment().format("HH:mm:ss"),
                eventClick:function(calEvent, jsEvent, view) {
                    if (view.type ==='agendaDay'){
                        //console.log('Event: ' + calEvent.title);
                        // console.log('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                        // console.log('View: ' + view.name);
                    }
                },
                // weekNumberTitle:'Semana ',
                select: function(start, end) {
                    ////console.log(moment(start).format("LLLL")+'    '+moment(end).format("LLLL"));
                    // console.log(moment(start).format("l")+'    '+moment(end).format("l"));
                    var view = $('#calendario').fullCalendar('getView');
                    if (view.type !=='agendaDay'){
                        $("#calendario").fullCalendar( 'gotoDate', start );
                        $("#calendario").fullCalendar( 'changeView', 'agendaDay' )
                    }
                    else{
                        $("#fecha").val(moment().format("YYYY/MM/DD HH:mm:ss"));
                        $("#fecha_consulta").val(moment(start).format("YYYY/MM/DD"));
                        $("#hora_inicio").val(moment(start).format("HH:mm:ss"));
                        $("#hora_fin").val(moment(end).format("HH:mm:ss"));
                        $("#agregarConsultasModal").modal();
                        eventData = {
                            start: start,
                            end: end
                        };
                        //     $("#calendario").fullCalendar( 'gotoDate', start );
                    }
                },
                viewRender:function(view,element){
                    cargarEventos('calendario',moment(view.start).subtract(1,'months').format("YYYY/MM/DD"),moment(view.end).add(1,'months').format("YYYY/MM/DD"));
                },
                // weekNumbers: true,
                editable: true,
                eventLimit: true // allow "more" link when too many events
            });
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
            $("#fecha_visita").datetimepicker();
            //cargarDropDownListDescripcion(('#diagnostico'),'diagnostico');
            cargarDropDownList(('#clklst'),'id_medicamento','descripcion',2);
        });
    </script>

    </body>

    </html>
<?php } ?>