<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
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
				<h1>FICHA TÉCNICA DE VENTA</h1>
			</td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					<table border="0">
						{foreach item=r from=$venta}
						<tr>
							<th align="right">Nombre de Cliente</th><th>:</th>
							<td><input type="text" name="nombres" value="{$r.nombres}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Apellidos</th><th>:</th>
							<td><input type="text" name="apellidos" value="{$r.apellidos}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">C.I:</th><th>:</th>
							<td><input type="text" name="ci" value="{$r.ci}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Tipo de Venta</th><th>:</th>
							<td><input type="text" name="tipo_venta" value="{$r.tipo_venta}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Fecha de Venta</th><th>:</th>
							<td><input type="text" name="fecha_venta" value="{$r.fecha_venta}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Importe total</th><th>:</th>
							<td><input type="text" name="monto_final" value="{$r.monto_final}" disabled="" size="30"></td>
						</tr>
						{/foreach}
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>