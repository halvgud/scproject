
	function peticionAjax (archivo,datos){
		$.ajax({
        type: "POST",
        url: archivo,
        data: JSON.stringify(datos),
        headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'}
		})
		.done(function(data) {
			alert("success "+data);
			result = JSON.parse(data);
			console.log(result);
		})
		.fail(function(jqXHR, textStatus) {
			alert("error"+textStatus);
			result = JSON.parse({"error":textStatus});
			console.log(result);
		});
	}
	function login(){

	}
