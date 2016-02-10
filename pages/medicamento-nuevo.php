<?php ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <?php require_once('header-comun.php'); ?> 

</head>

<body>

    <div id="wrapper">
    <?php require_once('menu.php'); ?> 
        <div id="page-wrapper">
            <div class="page-header">
                <h1>Nuevo Medicamento</h1>
            </div>
            <form id='medicinanuevoForm' name="medicinanuevoForm">
                <input type="hidden" name="tabla" id="tabla" value="medicamento">
                <input type="hidden" name="estado"  value="A">
                <input type="hidden" name="id_usuario"  value="1">
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
                                    <input type="text" class="form-control" name="descripcion">
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="presentacion">Presentacion de Compra:</label>
                                    <input type="text" class="form-control" name="id_presentacion_entrada" placeholder="Presentacion" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="presentacion">Presentacion de Salida:</label>
                                    <input type="text" class="form-control" name="id_presentacion_salida" placeholder="Presentacion" required>
                                </div>
                            </td>
                            <!--<td>
                                <div class="form-group">
                                    <label for="cantidad">Cantidad:</label>
                                    <input type="text" class="form-control" name="cantidad" placeholder="cantidad" required>
                                </div>
                            </td>  -->

                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="costo_total">Precio :</label>
                                    <input type="text" class="form-control" name="precio" placeholder="Precio Total" required>
                                </div>
                            </td>
                            <!--<td>
                                <div class="form-group">
                                    <label for="costo_unitario">Costo Unitario</label>
                                    <input type="text" class="form-control" name="costo_unitario">
                                </div> ps si no las vendemos jaja
                            </td>-->
                            <td>
                                <div class="form-group">
                                    <label for="fecha_ingresp">Fecha Ingreso:</label>
                                    <input type="date" class="form-control" name="fecha_alta" placeholder="Fecha de ingreso" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="fecha_caducidad">Fecha Caducidad:</label>
                                    <input type="date" class="form-control" name="fecha_baja" placeholder="Fecha de caducidad" required>
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

    <?php require_once('footer-comun.php'); ?>
    <script>
        exitoso = function(datos){
            window.location.reload();
        };
        fallo = function(datos){

        };
        $("#medicinanuevoForm").submit(function(){
            var form = $("#medicinanuevoForm").serializeArray();
            var datos = {};
            form.forEach(function(input) {
                datos[input.name] = input.value;
            });
            peticionAjax('data/testinsert.php',datos,exitoso,fallo);
            return false;
        });

    </script>
</body>

</html>

            