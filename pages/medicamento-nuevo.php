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
                <h1>Nuevo Medicamento</h1>
            </div>
            <form>
                <table class="table">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="clave">Clave:</label>
                                    <input type="text" class="form-control" id="clave" placeholder="Clave del medicamento" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre">
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="presentacion">Presentacion:</label>
                                    <input type="text" class="form-control" id="presentacion" placeholder="Presentacion" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="cantidad">Cantidad:</label>
                                    <input type="text" class="form-control" id="cantidad" placeholder="cantidad" required>
                                </div>
                            </td>        
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="costo_total">Costo Total:</label>
                                    <input type="text" class="form-control" id="costo_total" placeholder="Costo Total" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="costo_unitario">Costo Unitario</label>
                                    <input type="text" class="form-control" id="costo_unitario">
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="fecha_ingresp">Fecha Ingreso:</label>
                                    <input type="date" class="form-control" id="fecha_ingresp" placeholder="Fecha de ingreso" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="fecha_caducidad">Fecha Caducidad:</label>
                                    <input type="date" class="form-control" id="fecha_caducidad" placeholder="Fecha de caducidad" required>
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

</body>

</html>
<?php } ?>
            