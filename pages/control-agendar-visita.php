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
                <h1>Agendar Visita</h1>
            </div>
            <div class="col-md-8 col-md-offset-2" id='calendario'></div>
            <form>
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
        $(document).ready(function() {
            $('#calendario').fullCalendar({
                    header: {
                        left: 'prev,next prevYear,nextYear today',
                        center: 'title',
                        // right: 'month,agendaWeek,agendaDay'
                        right: 'month,agendaDay'
                    },
                    lang: 'es',
                    selectable: true,
                    selectHelper: true,
                    select: function(start, end) {
                        console.log(moment(start).format("LLLL")+'    '+moment(end).format("LLLL"));
                        var view = $('#calendario').fullCalendar('getView');
                        if (view.type !=='agendaDay'){
                            $("#calendario").fullCalendar( 'gotoDate', start );
                            $("#calendario").fullCalendar( 'changeView', 'agendaDay' )    
                        }
                        else{
                            var title = prompt('Event Title:');
                            var eventData;
                            if (title) {
                                eventData = {
                                    title: title,
                                    start: start,
                                    end: end
                                };
                                $('#calendario').fullCalendar('renderEvent', eventData, true); // stick? = true
                                $("#calendario").fullCalendar( 'gotoDate', start );
                            }
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