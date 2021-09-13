<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript" src="../calendario/tcal.js"></script>
		<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
		<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<script type="text/javascript" src="js/validar_venta.js"></script>
	</head>
<body>

	<div class="formu_detalle_datos">
		<form action="venta_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR VENTA</h2>
			<table border="1">
				<tr>
					<th align="right">Fecha venta(*):</TH>
						
						<td><input type="text" name="fecha_venta" class="tcal" readonly=""></td>
						<th >Nro.Venta</th><th><input type="tex" name="nro_venta" size="4"></th>
						<th align="right">Monto Total(*):</th>
						<td><input type="text" name="monto_final" size="7" readonly=""></td>
				</tr>
				<tr>
					<th align="right">Cliente (*):</th>
					<td>
						<table>
							<tr>
								<!--<td>
									<b>C.I.</b><br />
									<input type="text" name="ci" value="" size="10" onkeyup="buscar()">
								</td>
								<td>
									<b>Nombres</b><br />
									<input type="text" name="nombres" value="" size="10" onkeyup="buscar()">
								</td>
								<td>
									<b>Apellidos</b><br />
									<input type="text" name="apellidos" value="" size="10" onkeyup="buscar()">
								</td>-->
								<td>
									<input type="hidden" name="clientes" value="0">
										<select name="id_cliente" onchange="">
											<option value="0">-Seleccione-</option>
											{foreach item=r from=$clientes}
											<option value="{$r.id_cliente}">{$r.nombres} {$r.apellidos}</option>
											{/foreach}
										</select>
								</td>

							</tr>
						</table>
					</td>
					<th align="right">Tipo Venta (*):</th>
					<td>
						<input type="radio" name="tipo_venta" value="CONTADO">Contado<br>
						<input type="radio" name="tipo_venta" value="CREDITO">Credito
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table width="100%">
							<tr>
								<td colspan="3">
									<div id="clientes"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table width="100%">
							<tr>
								<td colspan="3">
									<input type="hidden" name="id_cliente">
									<div id="cliente_insertado"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<br>
						<fieldset>
							<legend align="center">Detalle Venta</legend>
							<table border="1">
								<tr>
									<td align="center"> <b>Producto</b> </td>
									<td> <b>Precio</b> </td>
									<td> <b>Cantidad</b> </td>
									<td> <b>Desc%</b> </td>
									<td> <b>Monto Parcial</b> </td>
								</tr>
								<tr>
									<td>
										<input type="hidden" name="" value="0">
										<select name="id_producto1" onchange="mostrar_precio1()">
											<option value="0">-Seleccione-</option>
											{foreach item=r from=$productos}
											<!--<option value="{$r.id_producto}">{$r.id_producto}</option>-->
											<option value="{$r.id_producto}">{$r.descripcion} {$r.modelo} {$r.marca}</option>
											{/foreach}
										</select>
									</td>
									<td><div id="precio1"></div></td>
									<td><input type="number" name="cantidad1" size="6" onkeyup="calcular_monto1()"></input></td>
									<td><input type="text" name="descuento" size="5"></input></td>
									<td align="center"><div id="habilita1"></div></td>
								</tr>
								<tr>
									<td>
									<select name="id_producto2" onchange="mostrar_precio2()">
											<option value="0">-Seleccione-</option>
											{foreach item=r from=$productos}
											<!--<option value="{$r.id_producto}">{$r.id_producto}</option>-->
											<option value="{$r.id_producto}">{$r.descripcion} {$r.modelo} {$r.marca}</option>
											{/foreach}
									</select>
									</td>
									<td><div id="precio2"></div></td>
									<td><input type="number" name="cantidad2" size="6" onkeyup="calcular_monto2()"></input></td>
									<td><input type="text" name="descuento" size="5"></input></td>
									<td align="center"><div id="habilita2"></div></td>
								</tr>
								<tr>
									<td>
									<select name="id_producto3" onchange="mostrar_precio3()">
											<option value="0">-Seleccione-</option>
											{foreach item=r from=$productos}
											<!--<option value="{$r.id_producto}">{$r.id_producto}</option>-->
											<option value="{$r.id_producto}">{$r.descripcion} {$r.modelo} {$r.marca}</option>
											{/foreach}
									</select>
									</td>
									<td><div id="precio3"></div></td>
									<td><input type="number" name="cantidad3" size="6" onkeyup="calcular_monto2()"></input></td>
									<td><input type="text" name="descuento" size="5"></input></td>
									<td align="center"><div id="habilita3"></div></td>
								</tr>
							</table>
						</fieldset>
					</td>
				</tr>
			</table>
			<p>
				<input type="hidden" name="accion" value="" >
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='ventas.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>