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
            <form id="abrirPdf" action="pdf_visita_rango_fecha.php" method="post" target="_blank">
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
                                    $("#abrirPdf").submit();
                                }
                            },
                            {
                                text: '<i class="fa fa-file-pdf-o"></i> jsPDF ',
                                titleAttr: 'Genera un archivo PDF con JavaScript',
                                className:'btn btn-danger',
                                action: function ( e, dt, node, config ) {
                                    datos.forEach(function(element, index) {
                                        var medicamentos = '';
                                        element.medicamentos.forEach(function(element,index){
                                            medicamentos += element.descripcion+'\n'
                                        });
                                        element.medicamentos2 = medicamentos;
                                    });
                                    var columnas = [
                                        {title:"ID EMPLEADO",dataKey:"id_empleado"},
                                        {title:"NOMBRE",dataKey:"nombre"},
                                        {title:"TURNO",dataKey:"turno"},
                                        {title:"AREA",dataKey:"area"},
                                        {title:"DEPARTAMENTO",dataKey:"departamento"},
                                        {title:"MEDICAMENTOS",dataKey:"medicamentos2"},
                                        {title:"FECHA",dataKey:"fecha"}
                                    ];
                                    var nombre = 'Visitas_'+$('#fecha_inicio').val()+'_'+$('#fecha_inicio').val();
                                    var header1 = 'VISITAS DE '+$("#abrirPdf #fecha_inicio_mostrar").val()+' A '+$("#abrirPdf #fecha_fin_mostrar").val();
                                    var header2 = 'Reporte de Visitas';
                                    generarPDF(columnas,datos,nombre,header1,header2,'l' );
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
                    $("#abrirPdf #fecha_inicio").val($("#reporteVisitas #fecha_inicio").val());
                    $("#abrirPdf #fecha_fin").val($("#reporteVisitas #fecha_fin").val());
                    moment.locale('es');
                    var inicio = moment($("#reporteVisitas #fecha_inicio").val(),'YYYY/MM/DD');
                    var fin = moment($("#reporteVisitas #fecha_fin").val(),'YYYY/MM/DD');
                    $("#abrirPdf #fecha_inicio_mostrar").val(moment(inicio).format('LL'));
                    $("#abrirPdf #fecha_fin_mostrar").val(moment(fin).format('LL'));
                    //$("#reporteVisitas")[0].reset();
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
            