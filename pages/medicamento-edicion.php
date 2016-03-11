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
            <h1>Edicion de Medicamento</h1>
            <hr>
            <div class="row">
                <form id="buscarMedicamento">
                  <div class="form-group col-sm-3 col-md-3 col-lg-3">
                    <label for="clave">Clave:</label>
                    <input type="text" class="form-control" id="clave" placeholder="clave" autofocus>
                  </div>
                  <div class="form-group col-sm-3 col-md-3 col-lg-3">
                    <label for="descripcion">Descripcion</label>
                    <input type="text" class="form-control" id="descripcion" placeholder="descripcion">
                  </div>
                  <button type="submit" class="btn btn-lg btn-outline btn-success"><i class="fa fa-search"></i> Buscar</button>
                </form>
            </div>
                <table id="resultados" class="table table-condensed" style="display:none;">
                    <thead>
                        <tr>
                            <th class="text-center">CLAVE</th>
                            <th class="text-center">DESCRIPCION</th>
                            <th class="text-center">PRECIO</th>
                            <th class="text-center">CANTIDAD</th>
                            <th class="text-center" colspan="2">AGREAGAR CANTIDAD</th>
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
            $("#descripcion").enterKey(function(e){
                e.preventDefault();
                buscar();
            });
            $("#clave").enterKey(function(e){
                e.preventDefault();
                buscar();
            });
            $("#buscarMedicamento").submit(function(e){
                e.preventDefault();
                buscar();
            });
            function buscar(){
                var form1 = $("#tabl1_visita").find('input[data-empleado]').serializeArray();
                var clave = $("#clave").val();
                var descripcion = $("#descripcion").val();
                var datosTabla1 = {};
                if(clave && clave !== '' && descripcion && descripcion !== ''){
                    datosTabla1['clave'] = clave;
                    datosTabla1['descripcion'] = descripcion;
                    cargarTabla(datosTabla1,7);
                }
                else if(clave && clave !== ''){
                    datosTabla1['clave'] = clave;
                    cargarTabla(datosTabla1,8);
                }
                else if(descripcion && descripcion !== ''){
                    datosTabla1['descripcion'] = descripcion;
                    cargarTabla(datosTabla1,9);
                }

            }
            //funcion engargada de cargar informacion en los lugares donde se mete informacion del empleado
            function cargarTabla(arregloConInputs,idTransaccion) {
                arregloConInputs['idTransaccion']=idTransaccion;
                $("#resultados").hide();
                var tbody = $("#resultados tbody").empty();
                exitoso = function(result){
                    var find = false;
                    result.forEach( function(element, index) {
                        find = true;
                        var tr = $("<tr></tr>");
                        var id_medicamento = element['id_medicamento'];
                        var clave = element['clave'];
                        var descripcion = element['descripcion'];
                        var precio = element['precio'];
                        var cantidadActual = element['cantidad'];
                        var cantidad_entrada = element['cantidad_entrada'];
                        var input_agregar = $("<input>",{class:'form-control',type:'number',min:'0'});

                        var agregar = $("<button></button>",{class:'btn btn-success'});
                        var icono_agregar = $("<i></i>",{class:'fa fa-plus'});
                        agregar.append(icono_agregar);
                        agregar.append(" Agregar");
                        $(agregar).click(function(){
                            agregarCantidad(id_medicamento,input_agregar,cantidad_entrada);
                        })
                        var editar = $("<button></button>",{class:'btn btn-primary'});
                        var icono_editar = $("<i></i>",{class:'fa fa-pencil-square-o'});
                        editar.append(icono_editar);
                        editar.append(" Editar");
                        $(editar).click(function(){
                            editarMedicamento(element,tr);
                        })
                        var eliminar = $("<button></button>",{class:'btn btn-danger'});
                        var icono_eliminar = $("<i></i>",{class:'fa fa-trash-o'});
                        eliminar.append(icono_eliminar);
                        eliminar.append(" Eliminar");
                        $(eliminar).click(function(){
                            eliminarMedicamento(element,tr);
                        })

                        agregarTDaTR(tr,clave);
                        agregarTDaTR(tr,descripcion);
                        agregarTDaTR(tr,precio);
                        agregarTDaTR(tr,cantidadActual);
                        agregarTDaTR(tr,input_agregar);
                        agregarTDaTR(tr,agregar);
                        agregarTDaTR(tr,editar);
                        agregarTDaTR(tr,eliminar);
                        $(tbody).append(tr);
                    });
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
            function agregarCantidad(id_medicamento,input_cantidad,cantidad_entrada){
                var datos = {};
                datos.id_medicamento = id_medicamento;
                datos.cantidad = $(input_cantidad).val();
                datos.cantidad = datos.cantidad*cantidad_entrada;
                datos.idTransaccion = 1;
                exitoso = function(datos){
                    notificacionSuccess(datos.success);
                    $(input_cantidad).val('');
                };
                fallo = function(datos){
                    notificacionError(datos.error);
                };
                peticionAjax('data/test-actualizar.php',datos,exitoso,fallo);
            }



            function eliminarMedicamento(element,tr){
                BootstrapDialog.show({
                    title: 'Peligro',
                    message:'Realmente desea eliminar '+element.descripcion,
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
                            datos.id_medicamento = element.id_medicamento;
                            datos.idTransaccion = 2;
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
            function editarMedicamento(element,tr){
                var $contenido = $("<div></div>");
                var $form_group = $("<div></div>",{class:'form-group'});
                var label = $("<label></label>",{for:'clave',text:'Clave'});
                var clave = $("<input>",{name:'clave',value:element['clave'],type:'text',class:'form-control'});
                $form_group.append(label);
                $form_group.append(clave);
                $contenido.append($form_group);
                var $form_group = $("<div></div>",{class:'form-group'});
                var label = $("<label></label>",{for:'descripcion',text:'Descripcion'});
                var descripcion = $("<input>",{name:'descripcion',value:element['descripcion'],type:'text',class:'form-control'});
                $form_group.append(label);
                $form_group.append(descripcion);
                $contenido.append($form_group);
                var $form_group = $("<div></div>",{class:'form-group'});
                var label = $("<label></label>",{for:'precio',text:'Precio'});
                var precio = $("<input>",{name:'precio',value:element['precio'],type:'number',class:'form-control'});
                $form_group.append(label);
                $form_group.append(precio);
                $contenido.append($form_group);
                
    
                BootstrapDialog.show({
                    title: 'Esta a punto de modificat los siguientes datos',
                    message:function(dialog) {
                        return $contenido;
                    },
                    type: BootstrapDialog.TYPE_WARNING,
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
                            datos.id_medicamento = element.id_medicamento;
                            datos.clave = $(clave).val();
                            datos.descripcion = $(descripcion).val();
                            datos.precio = $(precio).val();
                            datos.idTransaccion = 3;
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
            