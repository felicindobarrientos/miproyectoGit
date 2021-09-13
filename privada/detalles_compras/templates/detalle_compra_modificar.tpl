<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<script type="text/javascript" src="js/validar_detalle_compra.js"></script>
	</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="detalle_compra_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR DETALLE COMPRA</h2>
				<b>Compra (*)</b><br>
				<select name="id_compra">
					{foreach item=r from=$compra}
					<option value="{$r.id_compra}">{$r.nro_compra}</option>
					{/foreach}
					{foreach item=r from=$compras}
					<option value="{$r.id_compra}">{$r.nro_compra}</option>
					{/foreach}
				</select>
				<p>
				<b>Producto precio (*)</b><br>
				<select name="id_producto_precio">
					{foreach item=r from=$producto_precio}
					<option value="{$r.id_producto_precio}">{$r.precio_compra}</option>
					{/foreach}
					{foreach item=r from=$productos_precios}
					<option value="{$r.id_producto_precio}">{$r.precio_compra}</option>
					{/foreach}
				</select>
				</p>
			{foreach item=r from=$detalle_compra}
			<p>
				<input type="text" name="cantidad_c" size="15" placeholder="Cantidad" value="{$r.cantidad_c}">(*)
			</p>
			<p>
				<input type="text" name="descuento" size="15" placeholder="Descuento" value="{$r.descuento}">(*)
			</p>
			<p>
				<input type="text" name="monto_parcial" size="15" placeholder="Monto Parcial" value="{$r.monto_parcial}">(*)
			</p>
			<p>
			<input type="hidden" name="accion" value="" >
				<input type="hidden" name="id_detalle_compra" value="{$r.id_detalle_compra}" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='detalles_compras.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>