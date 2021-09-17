<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<script type="text/javascript" src="js/validar_producto.js"></script>
		<script type="text/javascript" src="../../ajax.js"></script>
		<script type="text/javascript">
		function buscar(){
			var d1, contenedor, url;
			contenedor = document.getElementById('proveedores');
			contenedor2 = document.getElementById('proveedor_seleccionado');
			contenedor3 = document.getElementById('proveedor_insertada');
			d1 = document.formu.ci.value;
			d2 = document.formu.nombre.value;
			d3 = document.formu.telefono.value;
			ajax = nuevoAjax();
			url = "ajax_buscar_proveedor.php"
			param = "ci="+d1+"&nombre="+d2+"&telefono="+d3;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function(){
				if(ajax.readyState == 4){
					contenedor.innerHTML = ajax.responseText;
					contenedor2.innerHTML = "";
					contenedor3.innerHTML = "";
				}
			}
			ajax.send(param);
		}
		function buscar_proveedor(id_proveedor){
			var d1, contenedor, url;
			contenedor = document.getElementById('proveedor_seleccionado');
			contenedor2 = document.getElementById('proveedores');
			document.formu.id_proveedor.value = id_proveedor;

			d1 = id_proveedor;

			ajax = nuevoAjax();
			url = "ajax_buscar_proveedor1.php";
			param = "id_proveedor="+d1;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function(){
				if(ajax.readyState == 4){
					contenedor.innerHTML = ajax.responseText;
					contenedor2.innerHTML = "";
				}
			}
			ajax.send(param);
		}

		function insertar_proveedor(){
			var d1, contenedor, url;
			contenedor = document.getElementById('proveedor_seleccionado');
			contenedor2 = document.getElementById('proveedores');
			contenedor3 = document.getElementById('proveedor_insertada');
			d1 = document.formu.ci1.value;
			d2 = document.formu.nombre1.value;
			d3 = document.formu.direccion1.value;
			d4 = document.formu.telefono1.value;

			if(d1 == ""){
				alert("El CI es incorrecto o el campo esta vacío");
				document.formu.ci1.focus();
				return;
			}
			if(d2 == ""){
				alert("El nombre es incorrecto o el campo esta vacío");
				document.formu.nombre1.focus();
				return;
			}
			if(d3 == ""){
				alert("La direccion es incorrecta o el campo esta vacío");
				document.formu.direccion1.focus();
				return;
			}
			if(d4 == ""){
				alert("El telefono es incorrecto o el campo esta vacío");
				document.formu.telefono1.focus();
				return;
			}
			ajax = nuevoAjax();
			url = "ajax_inserta_proveedor.php";
			param = "ci1="+d1+"&nombre1="+d2+"&direccion1="+d3+"&telefono1="+d4;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function(){
				if(ajax.readyState == 4){
					contenedor.innerHTML = "";
					contenedor2.innerHTML = "";
					contenedor3.innerHTML = ajax.responseText;
				}
			}
			ajax.send(param);
		}
		</script>
	</head>
<body>
	<center>
	<h2>REGISTRAR PRODUCTO</h2>
		<form action="producto_nuevo1.php" method="post" name="formu">
			<table border="1">
				<tr>
					<th align="right">Seleccione Proveedor (*)</th>
					<th>:</th>
					<td>
						<table>
							<tr>
								<td>
									<b>Nombre</b><br />
									<input type="text" name="nombre" value="" size="10" onKeyUp="buscar()">
								</td>
								<td>
									<b>C.I.</b><br />
									<input type="text" name="ci" value="" size="10" onKeyUp="buscar()">
								</td>
								<td>
									<b>Telefono</b><br />
									<input type="text" name="telefono" value="" size="10" onKeyUp="buscar()">
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
									<div id="proveedores"></div>
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
									<div id="proveedor_seleccionado"></div>
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
									<input type="hidden" name="id_proveedor">
									<div id="proveedor_insertada"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th align="right">Descripcion (*)</th>
					<th>:</th>
					<td><input type="text" name="descripcion"></td>
				</tr>
				<tr>
					<th align="right">Modelo (*)</th>
					<th>:</th>
					<td><input type="text" name="modelo"></td>
				</tr>
				<tr>
					<th align="right">Marca (*)</th>
					<th>:</th>
					<td><input type="text" name="marca"></td>
				</tr>
				<tr>
					<th align="right">Industria/Origen (*)</th>
					<th>:</th>
					<td><input type="text" name="industria_origen"></td>
				</tr>
				<tr>
					<td align="right" colspan="3">
						<input type="hidden" name="accion" value="" >
						<input type="button" value="Aceptar" onclick="validar();">
						<input type="button" value="Cancelar" onclick="javascript:location.href='productos.php';">
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="3" align="center"><b>(*)Campos Obligatorios</b></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>