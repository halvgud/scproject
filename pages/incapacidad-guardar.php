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
                <h1>Guardar Incapacidad</h1>
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
                                    <label for="nss">NSS</label>
                                    <input type="text" class="form-control" id="nss" readonly>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="folio">Folio</label>
                                    <input type="text" class="form-control" id="folio" placeholder="Folio">
                                </div>
                            </td>  
                            <td>
                                <div class="form-group">
                                    <label for="entrega">Entrega</label>
                                    <select name="entrega" id ="entrega" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                        <option value="1">Atrasada</option>
                                        <option value="2">Normal</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="dias">Dias autorizados</label>
                                    <input type="number" step="1" class="form-control" id="dias" placeholder="Dias Autorizados">
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="inicio">Inicia:</label>
                                    <input type="date" class="form-control" id="inicio" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="finaliza">Finaliza:</label>
                                    <input type="date" class="form-control" id="finaliza" required>
                                </div>
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="clasificacion">Clasificacion</label>
                                    <select name="clasificacion" id ="clasificacion" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                        <option value="1">Inicial</option>
                                        <option value="2">Subsecuente</option>
                                        <option value="3">Recaida</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="clasificacion">Ramo de Seguro</label>
                                    <select name="clasificacion" id ="clasificacion" class="form-control" required>
                                        <option value="">Seleccione un valor</option>
                                        <option value="1">Riesgo de Trabajo</option>
                                        <option value="2">Enfermedad</option>
                                        <option value="3">Maternidad Prenatal</option>
                                        <option value="4">Maternidad Posnatal</option>
                                        <option value="5">Maternidad Enlace</option>
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

            