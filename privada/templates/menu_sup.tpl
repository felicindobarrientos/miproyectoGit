<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="{$direc_css}" type="text/css">
</head>
<body>


	<div class="cabecera">
		<img src="empresa/img/{$logo_empresa}" width="6%">
		<div class="titulo">
			EMPRESA "{$nombre}"
		</div>
		<div class="usuario">
			Usuario:<b>{$sesion.usuario}</b>
			Rol:<b>{$sesion.rol}</b>
	</div>
</body>
</html>