<?php ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="img/syscoo.png" rel="shortcut icon" type="image/png">
    <title>SysCo</title>

    <!-- Bootstrap Core CSS -->
    <link href="tools/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="tools/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="tools/sb-admin/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="tools/sb-admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="tools/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="tools/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->

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

    <!-- jQuery -->
    <script src="tools/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="tools/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="tools/metisMenu/dist/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="tools/sb-admin/js/sb-admin-2.js"></script>

</body>

</html>

            