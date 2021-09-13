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
				<h1>FICHA TÉCNICA DEL PRODUCTO</h1>
			</td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					<table border="0">
						{foreach item=r from=$producto}
						<tr>
							<th align="right">Descripción</th><th>:</th>
							<td><input type="text" name="descripcion" value="{$r.descripcion}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Modelo</th><th>:</th>
							<td><input type="text" name="modelo" value="{$r.modelo}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Marca</th><th>:</th>
							<td><input type="text" name="marca" value="{$r.marca}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Industria</th><th>:</th>
							<td><input type="text" name="industria_origen" value="{$r.industria_origen}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Proveedor</th><th>:</th>
							<td><input type="text" name="nombre" value="{$r.nombre}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Fecha de Compra</th><th>:</th>
							<td><input type="text" name="fecha_prec_compra" value="{$r.fecha_prec_compra}" disabled="" size="30"></td>
						</tr>
						<tr>
							<th align="right">Precio Venta</th><th>:</th>
							<td><input type="text" name="precio_venta" value="{$r.precio_venta}" disabled="" size="30"></td>
						</tr>
						{/foreach}
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>