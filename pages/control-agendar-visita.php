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
                <h1>Agendar Visita</h1>
            <hr>
            <form id="agendarVisitaForm">
                <table class="table" id="tabl1_visitas">
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
                                    <label for="fecha">Fecha</label>
                                    <input type="text" class="form-control" id="fecha" readonly>
                                </div>
                            </td> 
                            <td>
                                <div class="form-group">
                                    <label for="agregar_medicamento">Agregar Medicamento</label>
                                    <button type="button" id="agregar_medicamento" class="btn btn-outline btn-primary"><i class="fa fa-plus-square"></i> Agregar Medicamento</button>
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
    <script type="text/javascript">
        $(function () {
            $('#fecha').datetimepicker({
                step:10
            });
            var contador = 0;
            var array_medicamentos = []
            $("#agregar_medicamento").click(function(){
                contador++;
                var medicamento_hash = {id:contador,descripcion:'',cantidad:''};
                array_medicamentos.push(medicamento_hash);
                console.log(array_medicamentos);
                var row = $("<tr></tr>");
                var medicamento = $("<select>",{id:"select"+contador,class:'form-control'});
                var td = $("<td></td>");
                td.append(medicamento);
                row.append(td);
                var cantidad = $("<input>",{id:"cantidad"+contador,type:'number',class:'form-control'});
                td = $("<td></td>");
                td.append(cantidad);
                row.append(td);
                var icono = $("<i></i>",{class:'fa fa-minus-square'});
                var remover = $("<button></button>",{id:"cantidad"+contador,type:'button',class:'btn btn-outline btn-danger'});
                $(remover).click(function(){
                    $(row).remove();
                    array_medicamentos[contador].pull();
                    contador--;    
                });
                remover.append(icono);
                // remover.append(' Remover');
                var td = $("<td></td>");
                td.append(remover);
                console.log(contador)
                row.append(td);
                console.log(row);
                $("#tabl1_visitas tbody").append(row);
            });
        });

    </script>
</body>

</html>
<?php } ?>