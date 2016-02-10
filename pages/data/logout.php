<?php
session_start();
session_destroy();
	$resArray['success'] = 'Ha cerrado la sesion';
	print json_encode($resArray);
?>
