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
                <h1>Eliminar Usuario</h1>
            </div>
            <div class="col-md-6 col-md-offset-3">
                
                <form>
                    <h3>Buscar Usuario</h3>
                  <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" class="form-control" id="id" placeholder="Id">
                  </div>
                  <button type="submit" class="btn btn-outline btn-primary"><i class="fa fa-search"></i> Buscar</button>
                </form>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?> 

</body>

</html>
<?php } ?>