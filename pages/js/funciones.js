
	function peticionAjax (archivo,datos,successCallBack,errorCallBack){
		//console.log(datos);
        $.ajax({
        type: "POST",
        url: archivo,
        data: JSON.stringify(datos),
        dataType: 'json'
		})
		.done(function(resultado) {
			//console.log(resultado);
			if(successCallBack){
				successCallBack(resultado);
			}
		})
		.fail(function(jqXHR, status, thrownError) {
			//resulta = $.parseJSON(jqXHR.responseText);
			resulta = jqXHR.responseJSON;
            console.log(resulta);
			notificacionError(resulta['error']);
			if(errorCallBack){
				errorCallBack(resulta);
			}
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
	z_index: 2000,
	delay: 5000,
	timer: 4500,
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
	z_index: 2000,
	delay: 5000,
	timer: 4500,
	animate: {
		enter: 'animated fadeInDown',
		exit: 'animated fadeOutUp'
	}
});

}

	function cargarDropDownListDescripcion(nameattr,tipo) {
		cargarDropDownList(nameattr,'id_descripcion','descripcion',1,tipo);
	}

	function cargarDropDownList(nameattr,id,value,transaccion,tipo) {
		arreglo={};
		arreglo['tipo']=tipo;
		arreglo['idTransaccion']=transaccion;
		exitoso = function(result){
			var options = '';
			for (var i = 0; i < result.length; i++) {
				$(nameattr).append($("<option></option>",{value:result[i][id],text:result[i][value]}));
			}
		};
		fallo = function(datos){
			resulta = datos;
		};
		peticionAjax('data/testselect.php',arreglo,exitoso,fallo);
	}
    $.fn.enterKey = function (fnc) {
        return this.each(function () {
            $(this).keypress(function (ev) {
                var keycode = (ev.keyCode ? ev.keyCode : ev.which);
                if (keycode == '13') {
                    fnc.call(this, ev);
                }
            });
        });
    };
	//funcion engargada de cargar informacion en los lugares donde se mete informacion del empleado
	function cargarInputs(arregloConInputs,idTransaccion,idBusqueda) {
		arregloConInputs['idBusqueda']=idBusqueda;
		arregloConInputs['idTransaccion']=idTransaccion;
		exitoso = function(result){
			try{
			result.forEach( function(element) {
				Object.keys(element).forEach(function (key) {
					var value = element[key];
					try {
						$("#"+key).val(value);
					} catch(e) {
						throw e;
					}
				});
			});
			}
			catch(e){
				console.error(e);
			}
		};
		fallo = function(datos){
			console.log(datos);
		};

		peticionAjax('data/testselect.php',arregloConInputs,exitoso,fallo);
	}

	function cargarEventos(id_calendario,fecha_inicio,fecha_fin)
	{
		datos= {};
		datos.idTransaccion=6;
		datos.fecha_inicio=fecha_inicio;
		datos.fecha_fin=fecha_fin;
		exitoso = function(datos){
			$('#'+id_calendario).fullCalendar( 'removeEvents');
			$('#'+id_calendario).fullCalendar('addEventSource', datos, true); // stick? = true
		};
		fallo = function(datos){
			resulta = (datos.responseText);
		};
		peticionAjax('data/testselect.php',datos,exitoso,fallo);
	}
	function generarPDF(){

	}


	function agregarTDaTR (tr,element,cssClass){
		if(cssClass)
			var td = $("<td></td>",{class:cssClass});
		else
			var td = $("<td></td>");
		$(td).append(element);
		$(tr).append(td);
	}
	function agregarTHaTR (tr,element,cssClass){
		if(cssClass)
			var th = $("<th></th>",{class:cssClass});
		else
			var th = $("<th></th>");
		$(th).append(element);
		$(tr).append(th);
	}