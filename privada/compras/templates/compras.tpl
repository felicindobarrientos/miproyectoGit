<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="titulo_listado">
		<h1>COMPRAS</h1>
	</div>
	<div class="titulo_nuevo">
				<form name="formNuevo" method="post" action="compra_nuevo.php">
					<a href="javascript:document.formNuevo.submit();">Nuevo>>></a>
				</form>
			</div>

	<center>
		<table class="listado">
			<tr>
			<th>NRO</th><th>PROVEEDOR</th><th>NRO COMPRA</th><th>TIPO COMPRA</th><th>TIPO MONEDA</th><th>FECHA COMPRA</th><th>TOTAL</th>
				<th><img src="../../img/modificar.png"></th><th><img src="../../img/borrar.png"></th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$compras}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.nombre}</td>
				<td align="center">{$r.nro_compra}</td>
				<td align="center">{$r.tipo_compra}</td>
				<td align="center">{$r.tipo_de_moneda}</td>
				<td align="center">{$r.fecha_compra}</td>
				<td align="center">{$r.monto_total}</td>
				<td align="center">
					<form name="formModif{$r.id_compra}" method="post" action="compra_modificar.php">
						<input type="hidden" name="id_compra" value="{$r.id_compra}">
					    <input type="hidden" name="id_proveedor" value="{$r.id_proveedor}">
						<a href="javascript:document.formModif{$r.id_compra}.submit();" title="Ver Detalle Compra">
							Modificar>> 
						</a>
					</form>
				</td>
				<td align="center">
					<form name="formElimi{$r.id_compra}" method="post" action="compras_eliminar.php">
						<input type="hidden" name="id_compra" value="{$r.id_compra}">
						<a href="javascript:document.formElimi{$r.id_compra}.submit();" title="Eliminar Compra" onclick='        javascript:return(confirm(" Desea realmente Eliminar la Compra:::{$r.nro_compra}?"));'>  
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