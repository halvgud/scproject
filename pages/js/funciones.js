
	function peticionAjax (archivo,datos,successCallBack,errorCallBack){
		$.ajax({
        type: "POST",
        url: archivo,
        data: JSON.stringify(datos),
        dataType: 'json'
      	})
		.done(function(resultado) {
			notificacionSuccess(resultado['success']);
			console.log(resultado);
			if(successCallBack){
				successCallBack(resultado);
			}
			return resultado;
		})
		.fail(function(jqXHR) {
			resulta = jQuery.parseJSON(jqXHR.responseText);
            console.log(resulta);
			notificacionError(resulta['error']);
			if(errorCallBack){
				errorCallBack(resulta['error']);
			}
			return resulta;
		});
	}
	function logout(){
		exitoso = function(datos){
            window.location.reload();
        };
        fallo = function(datos){

        };
        
        peticionAjax('data/logout.php','',exitoso,fallo);
	}

function notificacionError(mensaje){
	$.notify({
	// options
	icon: 'fa fa-exclamation-circle',
	title: 'Error',
	message: mensaje,
},{
	// settings
	element: 'body',
	position: null,
	type: "danger",
	allow_dismiss: true,
	newest_on_top: true,
	showProgressbar: false,
	placement: {
		from: "top",
		align: "right"
	},
	z_index: 1031,
	delay: 5000,
	timer: 1000,
	animate: {
		enter: 'animated fadeInDown',
		exit: 'animated fadeOutUp'
	}
});

}

function notificacionSuccess(mensaje){
	$.notify({
	// options
	icon: 'fa fa-thumbs-o-up',
	title: 'Correcto',
	message: mensaje,
},{
	// settings
	element: 'body',
	position: null,
	type: "success",
	allow_dismiss: true,
	newest_on_top: true,
	showProgressbar: false,
	placement: {
		from: "top",
		align: "right"
	},
	z_index: 1031,
	delay: 5000,
	timer: 1000,
	animate: {
		enter: 'animated fadeInDown',
		exit: 'animated fadeOutUp'
	}
});

}



function cargarDropDownList(nameattr,id,value,transaccion,otro)
{
    arreglo={};
    arreglo['idBusqueda']=otro;
    arreglo['idTransaccion']=transaccion;
    console.log(arreglo);
    $.ajax({
            type: "POST",
            url: 'data/testselect.php',
            data: JSON.stringify(arreglo),
            dataType: 'text'
        })
        .done(function(result){
            console.log(result);
            var obj1 = $.parseJSON(result);
            var options = '';
            console.log(result);
            for (var i = 0; i < obj1.length; i++) {
                options += '<option value="' + obj1[i][id] + '">' + obj1[i][value] + '</option>';
            }
            $(nameattr).html(options);
        })
.fail(function(jqXHR) {
        resulta = (jqXHR.responseText);
        console.log(resulta);
    })   ;
}