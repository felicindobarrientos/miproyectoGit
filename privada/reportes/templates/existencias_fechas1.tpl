<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			var ventanaCalendario=false
			function imprimir() {
				if(confirm('Desea Imprimir ?')){
					window.print();
				}
			}
		</script>
	</head>
	<body style='cursor:pointer;cursor:hand' onclick='imprimir();'>
 	<table width="100%" border="0">
		<tr>
			<td> 
				<img src="../empresa/img/{$logo_empresa}" width="70%"> 
			</td>
			<td align="center" width="80%">
				<h1>EXISTENCIAS CON FECHAS DE INSERCION</h1>
			</td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<th>NRO</th><th>PRODUCTO</th><th>COMPRAS</th><th>VENTAS</th><th>CANTIDAD</th><th>FECHA INSERCION</th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$existencias_fechas1}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.descripcion} {$r.modelo} {$r.marca}</td>
				<td align="center">{$r.cantidad_c}</td>
				<td align="center">{$r.cantidad_v}</td>
				<td align="center">{$r.cantidad}</td>
				<td align="center"><i>{$r.fec_insercion}</i></td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>
		</table>
		<br><br>
	</center>
	<b>DEL:</b> {$fecha1} <b>A</b> {$fecha2}
</body>
</html>