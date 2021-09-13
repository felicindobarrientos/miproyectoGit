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
		<form action="producto_precio_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR PRODUCTO PRECIO</h2>
				<b>Producto (*)</b>
				<select name="id_producto">
					<option value=""> ---seleccione--- </option>
					{foreach item=r from=$productos}
					<option value="{$r.id_producto}">{$r.descripcion} {$r.modelo} {$r.marca}</option>
					{/foreach}
				</select>
			<p>
				<input type="text" name="fecha_prec_compra" size="15" class="tcal" placeholder="fecha prec comp">(*)
			</p>
			<p>
				<input type="text" name="precio_compra" size="15" placeholder="precio compra">(*)
			</p>
			<p>
				<input type="text" name="precio_venta" size="15" placeholder="precio venta">(*)
			</p>
			<p>
				<input type="text" name="fecha_prec_venta" size="15" class="tcal" placeholder="fecha prec vent">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='productos_precios.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>