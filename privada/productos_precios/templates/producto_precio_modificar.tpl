<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript" src="../calendario/tcal.js"></script>
		<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
		<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<script type="text/javascript" src="js/validar_productos_precios.js"></script>
	</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="producto_precio_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR PRODUCTO PRECIO</h2>
				<b>Persona (*)</b>
				<select name="id_producto">
					{foreach item=r from=$producto}
					<option value="{$r.id_producto}">{$r.descripcion} {$r.modelo} {$r.marca}</option>
					{/foreach}
					{foreach item=r from=$productos}
					<option value="{$r.id_producto}">{$r.descripcion} {$r.modelo} {$r.marca}</option>
					{/foreach}
				</select>
			{foreach item=r from=$producto_precio}
			<p>
				<input type="text" name="fecha_prec_compra" size="15" class="tcal" placeholder="fecha prec comp" value="{$r.fecha_prec_compra}">(*)
			</p>
			<p>
				<input type="text" name="precio_compra" size="15" placeholder="precio compra" value="{$r.precio_compra}">(*)
			</p>
			<p>
				<input type="text" name="precio_venta" size="15" placeholder="precio venta" value="{$r.precio_venta}">(*)
			</p>
			<p>
				<input type="text" name="fecha_prec_venta" size="15" class="tcal" placeholder="fecha prec vent" value="{$r.fecha_prec_venta}">(*)
			</p>
			<p>
			<input type="hidden" name="accion" value="" >
				<input type="hidden" name="id_producto_precio" value="{$r.id_producto_precio}" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='productos_precios.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>