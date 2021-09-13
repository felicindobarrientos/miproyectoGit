<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript">
			var ventanaCalendario=false
			function imprimir() {
				ventanaCalendario = window.open("productos_pre1.php", "calendario", "width=600, height=570,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
		</script>
	</head>
<body>
	<table width="100%" border="0">
		<tr>
			<td align="center"><h1>PRODUCTOS_PRECIOS</h1></td>
		</tr>
	</table>
	<br>

	<center>
		<table class="listado">
			<tr>
				<th>NRO</th><th>PRODUCTOS</th><th>FECHA COMPRA</th><th>PRECIO COMPRA</th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$productos_pre}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.descripcion} {$r.modelo} {$r.marca}</td>
				<td align="center">{$r.fecha_prec_compra}</td>
				<td align="center">{$r.precio_compra}</td>
				{assign var="b" value="`$b+1`"}
			</tr>
			{/foreach}
		</table>
		<br><br>
		<h2>
			<input type="radio" name="seleccionar" onclick="javascript:imprimir()">Imprimir</td>
		</h2>
	</center>
</body>
</html>