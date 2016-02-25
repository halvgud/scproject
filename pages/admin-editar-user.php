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
            <h1>Edicion de Usuario</h1>
            <hr>
            <div class="row">
                <form id="buscarUsuario">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <label for="usuario">Clave:</label>
                        <input type="text" class="form-control" id="usuario" placeholder="usuario" autofocus>
                    </div>
                    <button type="submit" class="btn btn-lg btn-outline btn-success"><i class="fa fa-search"></i> Buscar</button>
                </form>
            </div>
            <table id="resultados" class="table table-condensed" style="display:none;">
                <thead>
                <tr>
                    <th class="text-center">USUARIO</th>
                    <th class="text-center">PASSWORD</th>
                    <th class="text-center">ROL</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <?php require_once('footer-comun.html'); ?>
    <script type="text/javascript">
        $(function() {
            $("#descripcion").enterKey(function(){
                e.preventDefault();
                buscar();
            });
            $("#clave").enterKey(function(e){
                e.preventDefault();
                buscar();
            });
            $("#buscarUsuario").submit(function(e){
                e.preventDefault();
                buscar();
            });
            function buscar(){
                var usuario = $("#usuario").val();
                var datosTabla1 = {};
                if(usuario && usuario !== ''){
                    datosTabla1['usuario'] = usuario;
                    console.warn(datosTabla1);
                    cargarTabla(datosTabla1,10);
                }
            }
            //funcion engargada de cargar informacion en los lugares donde se mete informacion del empleado
            function cargarTabla(arregloConInputs,idTransaccion) {
                arregloConInputs['idTransaccion']=idTransaccion;
                $("#resultados").hide();
                var tbody = $("#resultados tbody").empty();
                exitoso = function(result){
                    console.log(result);
                    var find = false;
                    result.forEach( function(element, index) {
                        find = true;
                        var tr = $("<tr></tr>");

                        var id_usuario = element['id_usuario'];
                        var usuario = element['usuario'];
                        var password = element['password'];
                        var descripcionRol = element['descripcion'];

                        var editar = $("<button></button>",{class:'btn btn-primary'});
                        var icono_editar = $("<i></i>",{class:'fa fa-pencil-square-o'});
                        editar.append(icono_editar);
                        editar.append(" Editar");
                        $(editar).click(function(){
                            editarUsuario(element,tr);
                        })
                        var eliminar = $("<button></button>",{class:'btn btn-danger'});
                        var icono_eliminar = $("<i></i>",{class:'fa fa-trash-o'});
                        eliminar.append(icono_eliminar);
                        eliminar.append(" Eliminar");
                        $(eliminar).click(function(){
                            eliminarUsuario(element,tr);
                        })

                        agregarTDaTR(tr,usuario);
                        agregarTDaTR(tr,password);
                        agregarTDaTR(tr,descripcionRol);
                        agregarTDaTR(tr,editar);
                        agregarTDaTR(tr,eliminar);
                        $(tbody).append(tr);
                    });
                    console.log(find);
                    if(find)
                        $('#resultados').show();
                };
                fallo = function(datos){
                    console.log(datos);
                };
                peticionAjax('data/testselect.php',arregloConInputs,exitoso,fallo);
            }
            function agregarTDaTR (tr,element){
                var td = $("<td></td>");
                $(td).append(element);
                $(tr).append(td);
            }
            function eliminarUsuario(element,tr){
                BootstrapDialog.show({
                    title: 'Peligro',
                    message:'Realmente desea eliminar a '+element.usuario,
                    type: BootstrapDialog.TYPE_DANGER,
                    buttons: [{
                        id: 'btn-1',
                        label: 'Cancelar',
                        cssClass: 'btn-primary',
                        action: function(dialog) {
                            dialog.close();
                        }
                    },{
                        id: 'btn-2',
                        label: 'Aceptar',
                        cssClass: 'btn-danger',
                        action: function(dialog) {
                            var datos = {};
                            datos.id_usuario = element.id_usuario;
                            datos.idTransaccion = 4;
                            exitoso = function(datos){
                                notificacionSuccess(datos.success);
                                $(tr).remove();
                                buscar();
                                dialog.close();
                            };
                            fallo = function(datos){
                                notificacionError(datos.error);
                            };
                            peticionAjax('data/test-actualizar.php',datos,exitoso,fallo);
                        }
                    }]
                });
            }
            function editarUsuario(element,tr){
                var $contenido = $("<div></div>");
                var $form_group = $("<div></div>",{class:'form-group'});
                var label = $("<label></label>",{for:'usuario',text:'Usuario'});
                var usuario = $("<input>",{name:'usuario',value:element['usuario'],type:'text',class:'form-control'});
                $form_group.append(label);
                $form_group.append(usuario);
                $contenido.append($form_group);
                var $form_group = $("<div></div>",{class:'form-group'});
                var label = $("<label></label>",{for:'password',text:'Password'});
                var password = $("<input>",{name:'password',value:element['password'],type:'password',class:'form-control'});
                $form_group.append(label);
                $form_group.append(password);
                $contenido.append($form_group);
                var $form_group = $("<div></div>",{class:'form-group'});
                var label = $("<label></label>",{for:'rol',text:'Rol'});
                //var rol = $("<input>",{name:'rol',value:element['rol'],type:'number',class:'form-control'});
                var option = $("<option></option>",{name:'empty',text:'Seleccione un Rol',value:''});
                var rol = $("<select></select>",{name:'rol',class:'form-control'});
                $(rol).append(option);
                $(rol).val('');
                $form_group.append(label);
                $form_group.append(rol);
                $contenido.append($form_group);
                cargarDropDownList((rol),'id_rol','descripcion',12);

                BootstrapDialog.show({
                    title: 'Esta a punto de modificat los siguientes datos',
                    message:function(dialog) {
                        return $contenido;
                    },
                    type: BootstrapDialog.TYPE_WARNING,
                    onshown:function(){
                        console.log($(rol).val());
                        $(rol).val(element['rol']);
                        //$(rol).val(2);
                        //$(rol).find('option[value='+element['rol']+']').attr('selected','selected');
                        console.log(element['rol'],rol);
                        console.log($(rol).val());
                    },
                    buttons: [{
                        id: 'btn-1',
                        label: 'Cancelar',
                        cssClass: 'btn-primary',
                        action: function(dialog) {
                            dialog.close();
                        }
                    },{
                        id: 'btn-2',
                        label: 'Aceptar',
                        cssClass: 'btn-danger',
                        action: function(dialog) {
                            var datos = {};
                            datos.id_usuario = element.id_usuario;
                            datos.usuario = $(usuario).val();
                            datos.password = $(password).val();
                            datos.rol = $(rol).val();
                            datos.idTransaccion = 5;
                            exitoso = function(datos){
                                notificacionSuccess(datos.success);
                                $(tr).remove();
                                buscar();
                                dialog.close();
                            };
                            fallo = function(datos){
                                notificacionError(datos.error);
                            };
                            peticionAjax('data/test-actualizar.php',datos,exitoso,fallo);
                        }
                    }]
                });
            }
        });
    </script>
    </body>

    </html>
<?php } ?>
