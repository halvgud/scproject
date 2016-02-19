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
            <h1>Nuevo Medicamento</h1>
            <hr>
            <form id='medicinanuevoForm' name="medicinanuevoForm">
                <input type="hidden" name="tabla" id="tabla" value="medicamento">
                <input type="hidden" name="estado"  value="A">
                <input type="hidden" name="id_usuario"  value="N">
                <input type="hidden" name="tipo_transaccion"  value="4">
                <table class="table">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="clave">Clave:</label>
                                    <input type="text" class="form-control" name="clave" placeholder="Clave del medicamento" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" name="descripcion" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="id_presentacion_entrada">Presentacion de Compra:</label>
                                    <select name="id_presentacion_entrada" id ="id_presentacion_entrada" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="id_presentacion_salida">Presentacion de Salida:</label>
                                    <select name="id_presentacion_salida" id ="id_presentacion_salida" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <!--<td>
                                <div class="form-group">
                                    <label for="costo_unitario">Costo Unitario</label>
                                    <input type="text" class="form-control" name="costo_unitario">
                                </div> ps si no las vendemos jaja
                            </td>-->
                            <td>
                                <div class="form-group">
                                    <label for="fecha_ingresp">Fecha Ingreso:</label>
                                    <input type="text" class="form-control" name="fecha_alta" id="fecha_alta" placeholder="Fecha de ingreso" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="fecha_caducidad">Fecha Caducidad:</label>
                                    <input type="text" class="form-control" name="fecha_baja" id="fecha_baja" placeholder="Fecha de caducidad" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="costo_total">Precio :</label>
                                    <input type="text" class="form-control" name="precio" placeholder="Precio Total" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="cantidad">Cantidad:</label>
                                    <input type="number" min="0" class="form-control" name="cantidad" placeholder="Cantidad inicial de entrada" required>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
              <button type="submit" class="btn btn-outline btn-success" name="agregarMedicamento" name="agregarMedicamento"><i class="fa fa-floppy-o"></i> Guardar</button>
            </form>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?>
    <script>
        $(function() {
            cargarDropDownList(('#id_presentacion_entrada'),'id_presentacion','descripcion',4);
            cargarDropDownList(('#id_presentacion_salida'),'id_presentacion','descripcion',4);
            $.datetimepicker.setLocale('es');
            $("#fecha_alta").datetimepicker({
                timepicker:false,
                format:'Y/m/d'
            });
            $("#fecha_baja").datetimepicker({
                timepicker:false,
                format:'Y/m/d'
            });
        });
        exitoso = function(datos){
            notificacionSuccess(datos.success);
            $("#medicinanuevoForm")[0].reset();
        };
        fallo = function(datos){
            notificacionError(datos.error);
        };
        $("#medicinanuevoForm").submit(function(){
            var form = $("#medicinanuevoForm").serializeArray();
            var datos = {};
            form.forEach(function(input) {
                datos[input.name] = input.value;
            });
            console.log(datos);
            peticionAjax('data/testinsert.php',datos,exitoso,fallo);
            return false;
        });


    </script>
</body>

</html>
<?php } ?>
            