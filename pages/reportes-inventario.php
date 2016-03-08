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
            <h1>Reporte de Inventario de Medicamento</h1>
            <hr>
            <div class="col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4">
                <form id="reporteMedicamentosRank">
                    <input type="hidden" name="idTransaccion"  value="28">
                    <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Generar Reporte</button>
                </form>
            </div>
            <div id="resultados"></div>
            <table id="example" class="table table-condensed table-bordered table-striped" cellspacing="0" width="100%" style="display:none;">
                <thead>
                <tr>
                    <TH>CLAVE</TH>
                    <TH>DESCRIPCION</TH>
                    <TH>PRECIO</TH>
                    <TH>CANTIDAD</TH>
                    <TH>PRESENTACION</TH>
                    <TH>CANTIDAD ENTRADA</TH>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <TH>CLAVE</TH>
                    <TH>DESCRIPCION</TH>
                    <TH>PRECIO</TH>
                    <TH>CANTIDAD</TH>
                    <TH>PRESENTACION</TH>
                    <TH>CANTIDAD ENTRADA</TH>
                </tr>
                </tfoot>
            </table>
            <form id="abrirPdf" action="pdf_ran_medicamento_rango_fecha.php" method="post" target="_blank">
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

        $("#reporteMedicamentosRank").submit(function(e){
            e.preventDefault();
            var form1 = $("#reporteMedicamentosRank").find("input").serializeArray();
            var datosTabla1 = {};
            form1.forEach(function(input) {
                datosTabla1[input.name] = input.value;
            });
                exitoso = function(datos){
                    console.log(datos);
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
                                    var columnas = [
                                        {title:"clave",dataKey:"clave"},
                                        {title:"descripcion",dataKey:"descripcion"},
                                        {title:"precio",dataKey:"precio"},
                                        {title:"cantidad",dataKey:"cantidad"},
                                        {title:"descripcion presentacion",dataKey:"presentacion"},
                                        {title:"cantidad cantidad_entrada",dataKey:"cantidad_entrada"}
                                    ];
                                    var nombre = 'Inventario_de_Medicamentos';
                                    var header1 = 'Inventario de Medicamentos';
                                    var header2 = 'Reporte de Medicamentos';
                                    generarPDF(columnas,datos,nombre,header1,header2,'p' );
                                }
                            }
                        ],
                        "order": [[ 1, "desc" ]],
                        columns: [
                            {data:"clave"},
                            {data:"descripcion"},
                            {data:"precio"},
                            {data:"cantidad"},
                            {data:"presentacion"},
                            {data:"cantidad_entrada"}
                        ]
                    } );
                    $('#example').show();
                    if(datos.success)
                        notificacionSuccess(datos.success);
                    $("#abrirPdf #fecha_inicio").val($("#reporteMedicamentosRank #fecha_inicio").val());
                    $("#abrirPdf #fecha_fin").val($("#reporteMedicamentosRank #fecha_fin").val());
                    moment.locale('es');
                    var inicio = moment($("#reporteMedicamentosRank #fecha_inicio").val(),'YYYY/MM/DD');
                    var fin = moment($("#reporteMedicamentosRank #fecha_fin").val(),'YYYY/MM/DD');
                    $("#abrirPdf #fecha_inicio_mostrar").val(moment(inicio).format('LL'));
                    $("#abrirPdf #fecha_fin_mostrar").val(moment(fin).format('LL'));
                };
                fallo = function(datos){
                    if(datos.error)
                        notificacionError(datos.error);
                    console.error(datos);
                };
                peticionAjax('data/testselect.php',datosTabla1,exitoso,fallo);
            return false;
        });
    </script>
    </body>

    </html>
<?php } ?>
            