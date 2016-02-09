
	function peticionAjax (archivo,datos){
		$.ajax({
        type: "POST",
        url: archivo,
        data: JSON.stringify(datos),
        dataType: 'json',
        // headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'}
		})
		.done(function(data) {
			// alert("success "+data);
			notificacionSuccess("success "+data);
			// result = JSON.parse(data);
			console.log(data);
		})
		.fail(function(jqXHR, textStatus,errorThrown) {
			// alert(textStatus+" "+jqXHR.responseText);
			result = JSON.parse(jqXHR.responseText);
			console.log(result);
			notificacionError(result.error);
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

