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
                <h1>Guardar Memo</h1>
            </div>
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
                            <td>
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
                                    <label for="entrega">Solicita</label>
                                    <select name="entrega" id ="entrega" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                        <option value="1">Enfermeria</option>
                                        <option value="2">Relaciones Laborales</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="dias">Semana</label>
                                    <input type="number" step="1" class="form-control" id="dias" placeholder="Dias Autorizados">
                                </div>
                            </td>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="respetar">Respetar</label>
                                    <input type="text" class="form-control" id="respetar" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="motivo">Motivo</label>
                                    <input type="text" class="form-control" id="motivo" required>
                                </div>
                            </td>
                            <td colspan="2">
                                <div class="form-group">
                                    <label for="supervisor">Sup. de Produccion</label>
                                    <input type="text" class="form-control" id="supervisor" required>
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
            