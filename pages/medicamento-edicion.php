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
            <h1>Edicion de Medicamento</h1>
            <hr>
                <form id="buscarMedicamento">
                  <div class="form-group col-sm-3 col-md-3 col-lg-3">
                    <label for="clave">Clave:</label>
                    <input type="text" class="form-control" id="clave" placeholder="clave">
                  </div>
                  <div class="form-group col-sm-3 col-md-3 col-lg-3">
                    <label for="descripcion">Descripcion</label>
                    <input type="text" class="form-control" id="descripcion" placeholder="descripcion">
                  </div>
                  <button type="submit" class="btn btn-lg btn-outline btn-success"><i class="fa fa-search"></i> Buscar</button>
                </form>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?>
    <script type="text/javascript">
        $(function() {
            $("#descripcion").enterKey(function(){
                e.preventDefault();
                buscar();
            });
            $("#clave").enterKey(function(e){
                e.preventDefault();
                buscar();
            });
            $("#buscarMedicamento").submit(function(e){
                e.preventDefault();
                buscar();
            });
            function cargatDatosEmpleado(){
                var form1 = $("#tabl1_visita").find('input[data-empleado]').serializeArray();
                var clave = $("#clave").val();
                var descripcion = $("#descripcion").val();
                var datosTabla1 = {};
                if(clave && clave !== '' && descripcion && descripcion !== ''){
                    datosTable1['clave'] = clave;
                    datosTable1['descripcion'] = descripcion;
                    console.warn(datosTabla1);
                    cargarInputs(datosTabla1,5,$("#id_empleado").val());
                }
            }
        });
    </script>
</body>

</html>
<?php } ?>
            