<!DOCTYPE html>
<html lang="en">

<head>

    <?php require_once('header-comun.php'); ?> 

</head>

<body>

    <div class="fluid-container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <p><img src="img/oficial.png" class="img-responsive" alt="Responsive image"></p>
                        <h3><i class="fa fa-user-md"></i> Por Favor Inicie Sesion</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id='loginForm'>
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Usiario" name="usuario" type="usuario" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block"><i class="fa fa-sign-in"></i> Iniciar sesion</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php require_once('footer-comun.php'); ?> 
    
    <script type="text/javascript">
        $("#loginForm").submit(function(){
            var datos = $("#loginForm").serializeArray();
            console.log(datos);
            peticionAjax('data/login.php',datos);
            return false;
        });
    </script>

</body>

</html>
