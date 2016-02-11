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
            <div class="col-md-8 col-md-offset-2" id='calendario'></div>
            <div class="modal fade" id="agregarVisitasModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Agregar Visita</h4>
                            </div>
                        <div class="modal-body">
                            <form id="agendarVisitaForm">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <label for="id_empleado">No. Empleado:</label>
                                                    <input type="text" class="form-control" id="id_empleado" placeholder="No. Empleado" required>
                                                </div>
                                            </td>
                                            <td colspan = "2">
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
                                                    <label for="diagnostico">Diagnostico</label>
                                                    <select name="diagnostico" id ="diagnostico" class="form-control" required>
                                                        <option value="">Seleccione un valor</option>
                                                        <option value="1">Dolor de Cabeza</option>
                                                        <option value="2">Gripa</option>
                                                        <option value="3">Infeccion</option>
                                                        <option value="4">Espalda</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td colspan="2">
                                                <div class="form-group">
                                                    <label for="horaInicio">Horario</label>
                                                    <input type="text" class="form-control" id="horaInicio" />
                                                </div>
                                            </td>     
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline btn-danger" data-dismiss="modal"><i class="fa fa-ban"></i> Cancelar</button>
                            <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?> 

    <script type="text/javascript" >
        $(document).ready(function() {
            $.datetimepicker.setLocale('es');
            $('#horaInicio').datetimepicker();
            $('#calendario').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        // right: 'month,agendaWeek,agendaDay'
                        right: 'month,agendaDay'
                    },
                    lang: 'es',
                    selectable: true,
                    selectHelper: true,
                    select: function(start, end) {
                        console.log(moment(start).format("LLLL")+'    '+moment(end).format("LLLL"));
                        console.log(moment(start).format("l")+'    '+moment(end).format("l"));
                        var view = $('#calendario').fullCalendar('getView');
                        if (view.type !=='agendaDay'){
                            $("#calendario").fullCalendar( 'gotoDate', start );
                            $("#calendario").fullCalendar( 'changeView', 'agendaDay' )    
                        }
                        else{
                           
                            $("#agregarVisitasModal").modal();
                            // var title = prompt('Event Title:');
                            // var eventData;
                            // if (title) {
                            //     eventData = {
                            //         title: title,
                            //         start: start,
                            //         end: end
                            //     };
                            //     $('#calendario').fullCalendar('renderEvent', eventData, true); // stick? = true
                            //     $("#calendario").fullCalendar( 'gotoDate', start );
                            // }
                        }
                        // $('#calendario').fullCalendar('unselect');
                    },
                    weekNumbers: true,
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: [
                        {
                            title: 'All Day Event',
                            start: '2016-02-09'
                        }
                    ]
            });
        });
    </script>
</body>

</html>
<?php } ?>