
	function peticionAjax (archivo,datos,successCallBack,errorCallBack){
		$.ajax({
        type: "POST",
        url: archivo,
        data: JSON.stringify(datos),
        dataType: 'json',
        // headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'}
		})
		.done(function(resultado) {
			// alert("success "+resultado);
			notificacionSuccess("success "+resultado);
			// result = JSON.parse(resultado);
			console.log(resultado);
			if(successCallBack){
				successCallBack(resultado);
			}
			return resultado;
		})
		.fail(function(jqXHR, textStatus,errorThrown) {
			// alert(textStatus+" "+jqXHR.responseText);
			resultado = JSON.parse(jqXHR.responseText);
			console.log(resultado);
			notificacionError(resultado.error);
			if(errorCallBack){
				errorCallBack(resultado);
			}
			return resultado;
		});
	}
	function login(){

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

