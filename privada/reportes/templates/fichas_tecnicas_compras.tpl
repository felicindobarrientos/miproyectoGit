<!DOCTYPE html>
<html lang="esp">
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<meta charset="utf-8">
		<script type="text/javascript" src="../../ajax.js"></script>
		<script type="text/javascript">
			function buscar() {
				var d1, d2, d3, d4, contenedor, ajax, url, param;
				contenedor = document.getElementById('compras1');
				d1 = document.formu.nombre.value;
				d2 = document.formu.nro_compra.value;
				d3 = document.formu.tipo_compra.value;
				d4 = document.formu.tipo_de_moneda.value;
				ajax = nuevoAjax();
				url = "ajax_buscar_compra.php"
				param = "nombre="+d1+"&nro_compra="+d2+"&tipo_compra="+d3+"&tipo_de_moneda="+d4;
				//alert(param);
				ajax.open("POST", url, true);
				ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				ajax.onreadystatechange = function(){
					if (ajax.readyState == 4) {
						contenedor.innerHTML = ajax.responseText;
					}
				}
				ajax.send(param);
			}

			function mostrar(id_compra) {
				var d1, ventanaCalendario;
				d1 = id_compra;
				//alert(id_compra);
				ventanaCalendario = window.open("fichas_tecnicas_compras1.php?id_compra=" + d1, "calendario", "width=600, height=550,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
		</script>
	</head>
<body>
	<!----BUSCADOR---->
	<center>
		<h1>FICHAS TECNICAS DE COMPRAS</h1>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Nombre de Proveedor</b>
						<input type="text" name="nombre" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Nro de compra</b>
						<input type="text" name="nro_compra" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Tipo de comra</b>
						<input type="text" name="tipo_compra" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Tipo de Moneda</b>
						<input type="text" name="tipo_de_moneda" value="" size="10" onKeyUp="buscar()">
					</th>
				</tr>
			</table>
		</form>
	</center>
	<!----BUSCADOR---->
	<center>
	<div id="compras1">
	</div>
	
</body>
</html>