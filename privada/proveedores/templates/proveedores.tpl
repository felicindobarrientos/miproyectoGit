<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="titulo_listado">
		<h1>PROVEEDORES</h1>
	</div>
	<div class="titulo_nuevo">
				<form name="formNuevo" method="post" action="proveedor_nuevo.php">
					<a href="javascript:document.formNuevo.submit();">Nuevo>>></a><br>
				</form>
			</div>

	<center>
		<table class="listado">
			<tr>
				<th>NRO</th><th>NOMBRE</th><th>DIRECCIÓN</th><th>TELÉFONO</th>
				<th><img src="../../img/modificar.png"></th><th><img src="../../img/borrar.png"></th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$proveedores}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.nombre}</td>
				<td>{$r.direccion}</td>
				<td>{$r.telefono}</td>
				
				<td align="center">
					<form name="formModif{$r.id_proveedor}" method="post" action="proveedor_modificar.php">
						<input type="hidden" name="id_proveedor" value="{$r.id_proveedor}">
						<a href="javascript:document.formModif{$r.id_proveedor}.submit();" title="Modificar Proveedor">
							Modificar>> 
						</a>
					</form>
				</td>
				<td align="center">
					<form name="formElimi{$r.id_proveedor}" method="post" action="proveedor_eliminar.php">
						<input type="hidden" name="id_proveedor" value="{$r.id_proveedor}">
						<a href="javascript:document.formElimi{$r.id_proveedor}.submit();" title="Eliminar proveedor" onclick='        javascript:return(confirm(" Desea realmente Eliminar al proveedor:::{$r.nombre}?"));'>  
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