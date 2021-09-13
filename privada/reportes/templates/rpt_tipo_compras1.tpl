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
				<h1>TIPO DE COMRPAS</h1>
			</td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<th>NRO</th><th>PROVEEDOR</th><th>MONTO</th><th>FECHA DE COMPRA</th><th>TIPO DE COMPRA</th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$tipo_compras1}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.nombre}</td>
				<td align="right">{$r.monto_total}</td>
				<td align="center"><i>{$r.fecha_compra}</i></td>
				<td align="center">{if $r.tipo_compra=='CREDITO'}CREDITO{else}CONTADO{/if}</td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>
		</table>
		<br><br>
	</center>
	<b>FECHA: </b> {$fecha}
</body>
</html>