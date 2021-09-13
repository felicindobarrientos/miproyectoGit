<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="titulo_listado">
		<h1>DETALLES COMPRAS</h1>
	</div>
	<div class="titulo_nuevo">
				<form name="formNuevo" method="post" action="detalle_compra_nuevo.php">
					<a href="javascript:document.formNuevo.submit();">Nuevo>>></a>
				</form>
			</div>

	<center>
		<table class="listado">
			<tr>
				<th>NRO</th><th>COMPRA</th><th>PRECIO PRODUCTO</th><th>CANTIDAD</th><th>DESCUENTO %</th><th>MONTO PARCIAL</th>
				<th><img src="../../img/modificar.png"></th><th><img src="../../img/borrar.png"></th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$detalles_compras}
			<tr>
				<td align="center">{$b}</td>
				<td align="center">{$r.nro_compra}</td>
				<td align="center">{$r.precio_compra}</td>
				<td align="center">{$r.cantidad_c}</td>
				<td align="center">{$r.descuento}</td>
				<td align="center">{$r.monto_parcial}</td>
				<td align="center">
					<form name="formModif{$r.id_detalle_compra}" method="post" action="detalle_compra_modificar.php">
						<input type="hidden" name="id_detalle_compra" value="{$r.id_detalle_compra}">
						<input type="hidden" name="id_compra" value="{$r.id_compra}">
						<input type="hidden" name="id_producto_precio" value="{$r.id_producto_precio}">
						<a href="javascript:document.formModif{$r.id_detalle_compra}.submit();" title="Modificar Detalle compra">
							Modificar>> 
						</a>
					</form>
				</td>
				<td align="center">
					<form name="formElimi{$r.id_detalle_compra}" method="post" action="detalle_compra_eliminar.php">
						<input type="hidden" name="id_detalle_compra" value="{$r.id_detalle_compra}">
						<a href="javascript:document.formElimi{$r.id_detalle_compra}.submit();" title="Eliminar detalle compra" onclick='        javascript:return(confirm(" Desea realmente Eliminar al detalle_compra:::{$r.id_detalle_compra}?"));'>  
							Eliminar>>
						</a>
					</form>
				</td>
			{assign var="b" value="`$b+1`"}
			{/foreach}	
			</tr>
		</table>

	</center>
</body>
</html>