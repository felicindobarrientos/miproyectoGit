<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<script type="text/javascript" src="js/validar_producto.js"></script>
	</head>
<body>

	<div class="formu_ingreso_datos">
		<form action="producto_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR PRODUCTO</h2>
				<b>Proveedor (*)</b><br>
				<select name="id_proveedor">
					<option value=""> -----seleccione----- </option>
					{foreach item=r from=$proveedores}
					<option value="{$r.id_proveedor}">{$r.nombre}</option>
					{/foreach}
				</select>
			<p>
				<!--<input type="text" name="descripcion" size="45" placeholder="Descripcion producto">(*)-->
				<textarea name="descripcion" rows="4" cols="30" maxlength="60" placeholder="Descripcion producto"></textarea>(*)
			</p>
			<p>
				<input type="text" name="modelo" size="20" placeholder="Modelo" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				<input type="text" name="marca" size="20" placeholder="Marca" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				<input type="text" name="industria_origen" size="20" placeholder="Industria u Origen" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='productos.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>