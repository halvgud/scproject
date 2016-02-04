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
                <h1>Alta Usuario <small>Subtext for header</small></h1>
            </div>
            <div class="col-md-6 col-md-offset-3">
                
                <form>
                  <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" class="form-control" id="id" placeholder="Id">
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <label for="tipo">Tipo</label>
                    <input type="text" class="form-control" id="tipo" maxlength="1" size = "1">
                  </div>
                  <button type="submit" class="btn btn-outline btn-success"><i class="fa fa-floppy-o"></i> Agregar</button>
                </form>
            </div>
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

            