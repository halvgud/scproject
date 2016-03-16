
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
	title: '<strong>Error</strong><br>',
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
	delay: 0,
	timer: 1000,
	animate: {
		enter: 'animated fadeInDown',
		exit: 'animated fadeOutUp'
	}
});

}

	function notificacionWarning(mensaje){
		$.notify({
			// options
			icon: 'fa fa-exclamation-triangle',
			title: '<strong>Advertencia</strong><br>',
			message: mensaje,
		},{
			// settings
			element: 'body',
			position: null,
			type: "warning",
			allow_dismiss: true,
			newest_on_top: true,
			showProgressbar: false,
			placement: {
				from: "top",
				align: "right"
			},
			z_index: 2000,
			delay: 8000,
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
	title: '<strong>Correcto</strong><br>',
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
	timer: 1000,
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

	function generarPDF(columnas,datos,nombre,header1,header2,orientacion){
		var headerImgData ='data:image/png;base64,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';
		if(orientacion)
			var doc = new jsPDF(orientacion, 'pt');
		else
			var doc = new jsPDF('p', 'pt');
		var header = function (data) {
			doc.setFontSize(20);
			doc.setTextColor(0);
			doc.setLineWidth(1);
			doc.setDrawColor(0,0,0); // draw red lines
			doc.setFont('helvetica','italic');
			doc.addImage(headerImgData, 'PNG', doc.internal.pageSize.width - 140,10, 89, 30);
			doc.text("Cirpro de Delicias", data.settings.margin.left, 30);
			doc.line(data.settings.margin.left, 50, doc.internal.pageSize.width-data.settings.margin.right, 50);
			doc.setFontSize(12);
			doc.setFont('times','bold');
			doc.text(header1, data.settings.margin.left, 63);
			doc.line(data.settings.margin.left, 67, doc.internal.pageSize.width-data.settings.margin.right,67);
			doc.setTextColor(159,43,30);
			doc.setFont('helvetica','bold');
			doc.setFont('zapfdingbats','bold');
			doc.text(header2, data.settings.margin.left, 85);
		};

		var totalPagesExp = "{total_pages_count_string}";
		var footer = function (data) {
			var str = "Pagina " + data.pageCount;
			// Total page number plugin only available in jspdf v1.0+
			if (typeof doc.putTotalPages === 'function') {
				str = str + " de " + totalPagesExp;
			}
			doc.setFontSize(10);
			doc.text(str, data.settings.margin.left, doc.internal.pageSize.height - 30);
		};

		var options = {
			beforePageContent: header,
			afterPageContent: footer,
			margin: {top: 100},
			theme: 'grid',
			styles: {
				cellPadding: 2,
				fontSize: 10,
				font: "helvetica", // helvetica, times, courier
				//lineColor: 200,
				//lineWidth: 0.1,
				//fontStyle: 'normal', // normal, bold, italic, bolditalic
				overflow: 'linebreak', // visible, hidden, ellipsize or linebreak
				//fillColor: [255, 255, 255],
				textColor: 20,
				halign: 'left', // left, center, right
				valign: 'middle', // top, middle, bottom
				//fillStyle: 'F', // 'S', 'F' or 'DF' (stroke, fill or fill then stroke)
				rowHeight: 16,
				columnWidth: 'auto' // 'auto', 'wrap' or a number
			},
			headerStyles: {
				fontSize: 12, halign: 'center', // left, center, right
				valign: 'middle', // top, middle, bottom},
				font: "times", fillColor: 0,textColor: 255,
				fontStyle: 'bold',rowHeight: 18,

			},
			bodyStyles: {rowHeight: 17,overflow: 'linebreak',fontSize: 11},
			alternateRowStyles: { fillColor: 230 }
		};

		doc.autoTable(columnas, datos, options);

		// Total page number plugin only available in jspdf v1.0+
		if (typeof doc.putTotalPages === 'function') {
			doc.putTotalPages(totalPagesExp);
		}
		if(nombre)
			doc.save(nombre+'.pdf');
		else
			doc.save('Reporte.pdf');
	}


	function generarPDFMemo(columnas,datos,nombre,header1,header2,orientacion){
		var headerImgData ='data:image/png;base64,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';
		if(orientacion)
			var doc = new jsPDF(orientacion, 'pt');
		else
			var doc = new jsPDF('p', 'pt');
		var header = function (data) {
			doc.setFontSize(20);
			doc.setTextColor(0);
			doc.setLineWidth(1);
			doc.setDrawColor(0,0,0); // draw red lines
			doc.setFont('helvetica','italic');
			doc.addImage(headerImgData, 'PNG', doc.internal.pageSize.width - 140,10, 89, 30);
			doc.text("Cirpro de Delicias", data.settings.margin.left, 30);
			doc.line(data.settings.margin.left, 50, doc.internal.pageSize.width-data.settings.margin.right, 50);
			doc.setFontSize(12);
			doc.setFont('times','bold');
			doc.text(header1, data.settings.margin.left, 63);
			doc.line(data.settings.margin.left, 67, doc.internal.pageSize.width-data.settings.margin.right,67);
			doc.setFont('zapfdingbats','bold');
			doc.text('AT¨N DEPARTAMENTO DE NOMINAS', data.settings.margin.left, 85);
			doc.setFont('zapfdingbats','normal');
			doc.text('Por medio de la presente se le solicita, que a las siguientes personas les sea respetado lo que a continuación se menciona:', data.settings.margin.left, 105);
			doc.text('BONOS DE PUNTUALIDAD Y ASISTENCIA', doc.internal.pageSize.width-300, 120);
		};

		var totalPagesExp = "{total_pages_count_string}";
		var footer = function (data) {
			var str = "Pagina " + data.pageCount;
			// Total page number plugin only available in jspdf v1.0+
			if (typeof doc.putTotalPages === 'function') {
				str = str + " de " + totalPagesExp;
			}
			doc.setFontSize(10);
			doc.text(str, data.settings.margin.left, doc.internal.pageSize.height - 30);
			doc.text(str, data.settings.margin.left, doc.internal.pageSize.height - 30);
			doc.text(str, data.settings.margin.left, doc.internal.pageSize.height - 30);
		};

		var options = {
			beforePageContent: header,
			afterPageContent: footer,
			margin: {top: 125},
			theme: 'grid',
			styles: {
				cellPadding: 2,
				fontSize: 10,
				font: "helvetica", // helvetica, times, courier
				//lineColor: 200,
				//lineWidth: 0.1,
				//fontStyle: 'normal', // normal, bold, italic, bolditalic
				overflow: 'linebreak', // visible, hidden, ellipsize or linebreak
				//fillColor: [255, 255, 255],
				textColor: 20,
				halign: 'left', // left, center, right
				valign: 'middle', // top, middle, bottom
				//fillStyle: 'F', // 'S', 'F' or 'DF' (stroke, fill or fill then stroke)
				rowHeight: 16,
				columnWidth: 'auto' // 'auto', 'wrap' or a number
			},
			headerStyles: {
				fontSize: 12, halign: 'center', // left, center, right
				valign: 'middle', // top, middle, bottom},
				font: "times", fillColor: 0,textColor: 255,
				fontStyle: 'bold',rowHeight: 18,

			},
			bodyStyles: {rowHeight: 17,overflow: 'linebreak',fontSize: 11},
			alternateRowStyles: { fillColor: 230 }
		};

		doc.autoTable(columnas, datos, options);

		// Total page number plugin only available in jspdf v1.0+
		if (typeof doc.putTotalPages === 'function') {
			doc.putTotalPages(totalPagesExp);
		}
		if(nombre)
			doc.save(nombre+'.pdf');
		else
			doc.save('Reporte.pdf');
	}