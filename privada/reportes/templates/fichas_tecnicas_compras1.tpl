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
				<h1>FICHA TÉCNICA DE COMPRA</h1>
			</td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					<table border="0">
						{foreach item=r from=$compra}
						<tr>
							<th align="right">Nombre de Proveedor</th><th>:</th>
							<td><input type="text" name="nombre" value="{$r.nombre}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Nro de compra</th><th>:</th>
							<td><input type="text" name="nro_compra" value="{$r.nro_compra}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Tipo de compra</th><th>:</th>
							<td><input type="text" name="tipo_compra" value="{$r.tipo_compra}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Tipo de Moneda</th><th>:</th>
							<td><input type="text" name="tipo_de_moneda" value="{$r.tipo_de_moneda}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Fecha de Compra</th><th>:</th>
							<td><input type="text" name="fecha_compra" value="{$r.fecha_compra}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Importe total</th><th>:</th>
							<td><input type="text" name="monto_total" value="{$r.monto_total}" disabled="" size="30"></td>
						</tr>
						{/foreach}
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>