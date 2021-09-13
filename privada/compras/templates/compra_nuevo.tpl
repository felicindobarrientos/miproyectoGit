<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript" src="../calendario/tcal.js"></script>
		<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
		<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<script type="text/javascript" src="js/validar_compra.js"></script>
	</head>
<body>

	<div class="formu_detalle_datos">
		<form action="compra_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR COMPRA</h2>
				<b>Proveedor (*)</b><br>
				<select name="id_proveedor">
					<option value=""> -----seleccione----- </option>
					{foreach item=r from=$proveedores}
					<option value="{$r.id_proveedor}">{$r.nombre}</option>
					{/foreach}
				</select>
			<p>
				<input type="text" name="nro_compra" size="15" placeholder="Nro de compra" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				(*)<b>Tipo de compra</b> <input type="radio" name="tipo_compra" value="CONTADO">Contado<input type="radio" name="tipo_compra" value="CREDITO">Credito
			</p>
			<p>
				(*)<b>Tipo de moneda</b> <input type="radio" name="tipo_de_moneda" value="BOLIVIANOS">Bs.<input type="radio" name="tipo_de_moneda" value="DOLARES">$us.
			</p>
			<p>
				<input type="text" name="fecha_compra" size="15" class="tcal" placeholder="Fecha de Compra">(*)
			</p>
			<p>
				<input type="text" name="monto_total" size="15" placeholder="Monto Total">(*)
			</p>
			<p>
			<fieldset>
				<legend>Detelle compra</legend>
					<table class="listado">
					<tr>
						<th>NRO</th><th>PRODUCTO</th><th>PRECIO</th><th>CANTIDAD</th><th>DESC %</th><th>MONTO PARCIAL</th>
					</tr>
					<!--{assign var="b" value="1"}
					{foreach item=r from=$detalles_compras}
					<tr>
						<td align="center">{$b}</td>
						<td>{$r.descripcion}--{$r.modelo}--{$r.marca}</td>
						<td align="center">{$r.precio_compra}</td>
						<td align="center">{$r.cantidad}</td>
						<td align="center">{$r.descuento}</td>
						<td align="center">{$r.monto_parcial}</td>
						<td align="center">
					</tr>
					{assign var="b" value="`$b+1`"}
					{/foreach}-->
				</table>
			</fieldset>
			</p>
			<p>
				<input type="hidden" name="accion" value="" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='compras.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>