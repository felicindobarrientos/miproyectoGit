<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<script type="text/javascript" src="js/validar_detalle_compra.js"></script>
	</head>
<body>

	<div class="formu_ingreso_datos">
		<form action="detalle_compra_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR DETALLE COMPRA</h2>
				<b>Compra (*)</b><br>
				<select name="id_compra">
					<option value=""> -----seleccione----- </option>
					{foreach item=r from=$compras}
					<option value="{$r.id_compra}">{$r.nro_compra}</option>
					{/foreach}
				</select><p></p>
				<b>Producto Precio (*)</b><br>
				<select name="id_producto_precio">
					<option value=""> -----seleccione----- </option>
					{foreach item=r from=$productos_precios}
					<option value="{$r.id_producto_precio}">{$r.precio_compra}</option>
					{/foreach}
				</select>
			<p>
				<input type="text" name="cantidad_c" size="15" placeholder="Cantidad">(*)
			</p>
			<p>
				<input type="text" name="descuento" size="15" placeholder="Descuento">(*)
			</p>
			<p>
				<input type="text" name="monto_parcial" size="15" placeholder="Monto Parcial">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='detalles_compras.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>