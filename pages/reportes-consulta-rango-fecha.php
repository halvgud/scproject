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
            <h1>Reporte Visitas Guardadas</h1>
            <hr>
            <div class="col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4">
            <form id="reporteVisitas">
                <input type="hidden" name="tabla" id="tabla" value="visita">
                <input type="hidden" name="idTransaccion"  value="14">
                <table class="table">
                    <tbody>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="fecha_inicio">Fecha Inicio:</label>
                                <input type="text" class="form-control" id="fecha_inicio" name="fecha_inicio" readonly required>
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="fecha_fin">Fecha Fin:</label>
                                <input type="text" class="form-control" id="fecha_fin" name="fecha_fin" readonly required>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Buscar</button>
            </form>
            </div>
            <div id="resultados"></div>
            <table id="example" class="table table-condensed table-bordered table-striped" cellspacing="0" width="100%" style="display:none;">
                <thead>
                <tr>
                    <th>ID EMPLEADO</th>
                    <th>EMPLEADO</th>
                    <th>TURNO</th>
                    <th>AREA</th>
                    <th>DEPARTAMENTO</th>
                    <th>MEDICAMENTO(S)</th>
                    <th>FECHA</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>ID EMPLEADO</th>
                    <th>EMPLEADO</th>
                    <th>TURNO</th>
                    <th>AREA</th>
                    <th>DEPARTAMENTO</th>
                    <th>MEDICAMENTO(S)</th>
                    <th>FECHA</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?> 
    <script>
        $(function(){
            $('#fecha_inicio').datetimepicker({
                format:'Y/m/d',
                onShow:function( ct ){
                    this.setOptions({
                        maxDate:$('#fecha_fin').val()?$('#fecha_fin').val():false
                    })
                },
                timepicker:false
            });
            $('#fecha_fin').datetimepicker({
                format:'Y/m/d',
                onShow:function( ct ){
                    this.setOptions({
                        minDate:$('#fecha_inicio').val()?$('#fecha_inicio').val():false
                    })
                },
                timepicker:false
            });
        });
        $("#reporteVisitas").submit(function(e){
            e.preventDefault();
            var form1 = $("#reporteVisitas").find("input").serializeArray();
            var datosTabla1 = {};
            form1.forEach(function(input) {
                datosTabla1[input.name] = input.value;
            });

            if($("#fecha_inicio").val() === '' || $("#fecha_fin").val()  === ''){
                notificacionError('Es necesario que introduzca un rango de fechas.');
            }
            else{
                exitoso = function(datos){
                    $('#example').DataTable( {
                        destroy: true,
                        data: datos,
                        dom: 'Bfrtip',
                        buttons: [
                            {
                                text: '<i class="fa fa-file-pdf-o"></i> PDF',
                                titleAttr: 'Genera un archivo PDF',
                                className:'btn btn-danger',
                                action: function ( e, dt, node, config ) {
                                    alert( 'Button activated' );
                                }
                            }
                        ],
                        columns: [
                            { "data": "id_empleado" },
                            { "data": "nombre" },
                            { "data": "turno" },
                            { "data": "area" },
                            { "data": "departamento" },
                            { "data": "medicamentos[<br>].descripcion" },
                            { "data": "fecha" }
                        ]
                    } );
                    $('#example').show();
                    /*
                    console.log(datos);
                    var tabla = $("<table></table>",{class:"table table-bordered table-striped table-condensed"});
                    var tr = $("<tr></tr>");
                    agregarTHaTR(tr,'ID EMPLEADO');
                    agregarTHaTR(tr,'EMPLEADO');
                    agregarTHaTR(tr,'TURNO');
                    agregarTHaTR(tr,'AREA');
                    agregarTHaTR(tr,'DEPARTAMENTO');
                    agregarTHaTR(tr,'MEDICAMENTO(S)');
                    agregarTHaTR(tr,'FECHA');
                    $(tabla).append(tr);

                    datos.forEach(function(element, index) {
                        var tr = $("<tr></tr>");
                        agregarTDaTR(tr,element.id_empleado);
                        agregarTDaTR(tr,element.nombre);
                        agregarTDaTR(tr,element.turno);
                        agregarTDaTR(tr,element.area);
                        agregarTDaTR(tr,element.departamento);
                        var medicamentos = '';
                        element.medicamentos.forEach(function(element,index){
                            medicamentos += element.descripcion+'<br>'
                        });
                        agregarTDaTR(tr,medicamentos);
                        agregarTDaTR(tr,element.fecha);
                        $(tabla).append(tr);
                    });
                    $("#resultados").append(tabla);
                    //$("#resultados table").DataTable();*/
                    if(datos.success)
                        notificacionSuccess(datos.success);
                    $("#reporteVisitas")[0].reset();
                };
                fallo = function(datos){
                    if(datos.error)
                        notificacionError(datos.error);
                    console.error(datos);
                };
                peticionAjax('data/testselect.php',datosTabla1,exitoso,fallo);
            }
            return false;
        });
    </script>
</body>

</html>
<?php } ?>
            