$(function () {
	function peticionAjax (datos){
		$.ajax({
				url: '../core.php',
				type: 'post',
				data: datos,
				success: function (data) {
					
				},
				error:function(data){

				}
			});
	}
});