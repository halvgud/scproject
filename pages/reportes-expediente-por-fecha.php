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
            <h1>Reporte Expedientes Agendados</h1>
            <hr>
            <div class="row">
            <div class="col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4">
                <form id="reporteExpediente">
                    <input type="hidden" name="idTransaccion"  value="24">
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
        </div>
            <div class="row">
                <div class="table-responsive">
            <table id="example" class="table table-condensed table-bordered table-striped" cellspacing="0" width="100%" style="display:none;">
                <thead>
                <tr>
                    <th>ID EMPLEADO</th>
                    <th>EMPLEADO</th>
                    <th>PESO</th>
                    <th>TALLA</th>
                    <th>ALTURA</th>
                    <th>FRECUENCIA RESPIRATORIA</th>
                    <th>FRECUENCIA CARDIACA</th>
                    <th>TEMPERATURA</th>
                    <th>IMC</th>
                    <th>INTERROGATORIO</th>
                    <th>EXPLORACION FISICA</th>
                    <th>TRATAMIENTO</th>
                    <th>DIAGNOSTICO</th>
                    <th>RAMO SEGURO</th>
                    <th>OTRAS INDICACIONES</th>
                    <th>PASE IMSS</th>
                    <th>PROCESO</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>ID EMPLEADO</th>
                    <th>EMPLEADO</th>
                    <th>PESO</th>
                    <th>TALLA</th>
                    <th>ALTURA</th>
                    <th>FRECUENCIA RESPIRATORIA</th>
                    <th>FRECUENCIA CARDIACA</th>
                    <th>TEMPERATURA</th>
                    <th>IMC</th>
                    <th>INTERROGATORIO</th>
                    <th>EXPLORACION FISICA</th>
                    <th>TRATAMIENTO</th>
                    <th>DIAGNOSTICO</th>
                    <th>RAMO SEGURO</th>
                    <th>OTRAS INDICACIONES</th>
                    <th>PASE IMSS</th>
                    <th>PROCESO</th>
                </tr>
                </tfoot>
            </table>
                </div>
            </div>
            <form id="abrirPdf" action="pdf_expedientes_rango_fecha.php" method="post" target="_blank">
                <input id="fecha_inicio" name="fecha_inicio" type="hidden" value="">
                <input id="fecha_fin" name="fecha_fin" type="hidden" value="">
                <input id="fecha_inicio_mostrar" name="fecha_inicio_mostrar" type="hidden" value="">
                <input id="fecha_fin_mostrar" name="fecha_fin_mostrar" type="hidden" value="">
            </form>
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
        $("#reporteExpediente").submit(function(e){
            e.preventDefault();
            var form1 = $("#reporteExpediente").find("input").serializeArray();
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
                                    $("#abrirPdf").submit();
                                }
                            }
                        ],
                        columns: [
                            { "data": "id_empleado"},
                            { "data": "nombre_completo"},
                            { "data": "peso"},
                            { "data": "talla"},
                            { "data": "altura"},
                            { "data": "frecuencia_respiratoria"},
                            { "data": "frecuencia_cardiaca"},
                            { "data": "temperatura"},
                            { "data": "imc"},
                            { "data": "interrogatorio"},
                            { "data": "exploracion_fisica"},
                            { "data": "tratamiento"},
                            { "data": "diagnostico"},
                            { "data": "ramo_seguro"},
                            { "data": "otras_indicaciones"},
                            { "data": "pase_imss"},
                            { "data": "proceso"}
                        ]
                    } );
                    $('#example').show();

                    if(datos.success)
                        notificacionSuccess(datos.success);
                    $("#abrirPdf #fecha_inicio").val($("#reporteExpediente #fecha_inicio").val());
                    $("#abrirPdf #fecha_fin").val($("#reporteExpediente #fecha_fin").val());
                    moment.locale('es');
                    var inicio = moment($("#reporteExpediente #fecha_inicio").val(),'YYYY/MM/DD');
                    var fin = moment($("#reporteExpediente #fecha_fin").val(),'YYYY/MM/DD');
                    $("#abrirPdf #fecha_inicio_mostrar").val(moment(inicio).format('LL'));
                    $("#abrirPdf #fecha_fin_mostrar").val(moment(fin).format('LL'));
                    //$("#reporteExpediente")[0].reset();
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
            