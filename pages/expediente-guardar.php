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
                <h1>Expediente Nuevo</h1>
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
                            <td colspan="5">
                                <div class="form-group">
                                    <label for="interrogatorio">Interrogatorio</label>
                                    <textarea name="" id="interrogatorio" class="form-control" maxlength="1000" rows="2" required="required"></textarea>
                                </div>
                            </td> 
                        </tr>
                        <tr>
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
                                    <label for="imc">IMC</label>
                                    <input type="number" class="form-control"  step="any" id="imc" required>
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
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="frecuencia_respiratoria">Frec. Respiratoria</label>
                                    <input type="number" class="form-control"  step="1" id="frecuencia_respiratoria" required>
                                </div>
                            </td> 
                            <td colspan="4">
                                <div class="form-group">
                                    <label for="exploracion_fisica">Exploración Fisica</label>
                                    <textarea name="" id="exploracion_fisica" class="form-control" maxlength="1000" rows="3" required="required"></textarea>
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
                                    <label for="diagnostico">Ramo de Seguro</label>
                                    <select name="diagnostico" id ="diagnostico" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                        <option value="1">Enfermedad General</option>
                                        <option value="2">Enfermedad Profesional</option>
                                        <option value="3">Accidente de Trabajo</option>
                                        <option value="4">Incidente</option>
                                    </select>
                                </div>
                            </td>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="tratamiento">Tratamiento</label>
                                    <textarea name="" id="tratamiento" class="form-control" maxlength="1000" rows="3" required="required"></textarea>
                                </div>
                            </td> 
                                 
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="diagnostico">Otras indicaciones</label>
                                    <select name="diagnostico" id ="diagnostico" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                        <option value="1">Laboratorio</option>
                                        <option value="2">Fisoterapia</option>
                                        <option value="3">Cambio de Proceso(TEMPORAL)</option>
                                        <option value="4">Cambio de Area(TEMPORAL)</option>
                                        <option value="5">Cambio de Area(DEFINITIVO)</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="diagnostico">Pase al IMSS</label>
                                    <select name="diagnostico" id ="diagnostico" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                        <option value="1">SI</option>
                                        <option value="2">NO</option>
                                    </select>
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

    <?php require_once('footer-comun.php'); ?> 

</body>

</html>

            