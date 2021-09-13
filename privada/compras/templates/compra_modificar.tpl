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
		<form action="compra_modificar1.php" method="post" name="formu">
			<h2>COMPRA</h2>
				<b>Proveedor (*)</b><br>
				<select name="id_proveedor">
					{foreach item=r from=$proveedor}
					<option value="{$r.id_proveedor}">{$r.nombre}</option>
					{/foreach}
					{foreach item=r from=$proveedores}
					<option value="{$r.id_proveedor}">{$r.nombre}</option>
					{/foreach}
				</select>
			{foreach item=r from=$compra}
			<p>
				<input type="text" name="nro_compra" size="15" placeholder="Nro de compra" value="{$r.nro_compra}" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				(*)<b>Tipo de compra</b> 
				<input type="radio" name="tipo_compra" value="CONTADO" {if $r.tipo_compra == 'CONTADO'} checked {/if}>Contado
				<input type="radio" name="tipo_compra" value="CREDITO" {if $r.tipo_compra == 'CREDITO'} checked {/if}>Credito &nbsp;&nbsp;&nbsp;
			</p>
			<p>
				(*)<b>Tipo de moneda</b> 
				<input type="radio" name="tipo_de_moneda" value="BOLIVIANOS" {if $r.tipo_de_moneda == 'BOLIVIANOS'} checked {/if}>Bolivianos
				<input type="radio" name="tipo_de_moneda" value="DOLARES" {if $r.tipo_de_moneda == 'DOLARES'} checked {/if}>Dolares &nbsp;&nbsp;&nbsp;
			</p>
			<p>
				<input type="text" name="fecha_compra" size="20" class="tcal" placeholder="Fecha de Compra" value="{$r.fecha_compra}">(*)
			</p>
			<p>
				<input type="text" name="monto_total" size="15" placeholder="Monto Total" value="{$r.monto_total}">(*)
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
				<input type="hidden" name="id_compra" value="{$r.id_compra}" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='compras.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>