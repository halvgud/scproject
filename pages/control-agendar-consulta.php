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
                <h1>Agendar Consulta</h1>
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
                            <td>
                                <div class="form-group">
                                    <label for="peso">Peso (Kg)</label>
                                    <input type="number" class="form-control"  step="any" id="peso" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="talla">Talla</label>
                                    <input type="number" class="form-control"  step="any" id="talla" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="temperatura">Temperatura</label>
                                    <input type="number" class="form-control"  step="any" id="temperatura" required>
                                </div>
                            </td>   
                            <td>
                                <div class="form-group">
                                    <label for="frecuencia_cardiaca">Frec. Cardiaca</label>
                                    <input type="number" class="form-control"  step="1" id="frecuencia_cardiaca" required>
                                </div>
                            </td>  
                            <td>
                                <div class="form-group">
                                    <label for="frecuencia_respiratoria">Frec. Respiratoria</label>
                                    <input type="number" class="form-control"  step="1" id="frecuencia_respiratoria" required>
                                </div>
                            </td>    
                        </tr>
                    </tbody>
                </table>
                <table class="table" name="listaMedicamento" id="listaMedicamento">

                </table>
                <p>
                    <input type="hidden" value="" name="id">
                    <input type="input" value="1" name="cantidad" id="cantidad">
                    <select name='clklst' id='clklst' size='1'></select>
                    <select name='unidad' id='unidad' size='1'></select>

                    <input type="button" value="Agregar a Receta">
                </p>
              <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
            </form>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?> 
    <script>
        var contador = 0;
        $('#listaMedicamento').on('click', 'input[type="button"]', function () {
            $(this).closest('tr').remove();
        })
        $('p input[type="button"]').click(function () {
           contador++;
            $('#listaMedicamento').append("" +
                "<tr><td><input type='hidden' value='"+$('#clklst').val()+"' name='id_medicamento"+contador+"'>" +
                "<input type='text' class='fname' value='"+$('#cantidad').val()+"' name='cantidad"+contador+"'/>" +
                "<input type='text' class='fname' value='"+$('#clklst option:selected').text()+"'/>" +
                "<input type='button' value='Remover de la lista' /></td></tr>")
        });
        $(function() {
            cargarDropDownList(('#clklst'),'id_medicamento','descripcion',1,$('#clklst').val());

        });
        $('#clklst').on('change', function() {
            cargarDropDownList(('#unidad'),'id_presentacion_medicamento','descripcion',2,$('#clklst').val());
        });
    </script>
</body>

</html>
<?php } ?>