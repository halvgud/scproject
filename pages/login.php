<!DOCTYPE html>
<html lang="en">

<head>

    <?php require_once('header-comun.html'); ?> 

</head>

<body>

    <div class="fluid-container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <p><img src="img/login.png" class="img-responsive" alt="Responsive image"></p>
                        <h3><i class="fa fa-user-md"></i> Por Favor Inicie Sesion</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id='loginForm'>
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Usiario" name="usuario" id="usuario" type="usuario" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" id="password" type="password" value="">
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

    <?php require_once('footer-comun.html'); ?> 

    <script type="text/javascript">
        exitoso = function(datos){
            window.location.reload();
        };
        fallo = function(datos){

        };
        $("#loginForm").submit(function(){
            var form = $("#loginForm").serializeArray();
            var datos = {};
            form.forEach(function(input) {
                datos[input.name] = input.value;
            });
            peticionAjax('data/login.php',datos,exitoso,fallo);
            return false;
        });
    </script>

</body>

</html>
<?php  ?>

