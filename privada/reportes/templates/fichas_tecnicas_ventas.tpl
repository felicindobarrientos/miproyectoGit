<!DOCTYPE html>
<html lang="esp">
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<meta charset="utf-8">
		<script type="text/javascript" src="../../ajax.js"></script>
		<script type="text/javascript">
			function buscar() {
				var d1, d2, d3, d4, contenedor, ajax, url, param;
				contenedor = document.getElementById('ventas1');
				d1 = document.formu.nombres.value;
				d2 = document.formu.apellidos.value;
				d3 = document.formu.ci.value;
				d4 = document.formu.tipo_venta.value;
				ajax = nuevoAjax();
				url = "ajax_buscar_venta.php"
				param = "nombres="+d1+"&apellidos="+d2+"&ci="+d3+"&tipo_venta="+d4;
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

			function mostrar(id_venta) {
				var d1, ventanaCalendario;
				d1 = id_venta;
				//alert(id_venta);
				ventanaCalendario = window.open("fichas_tecnicas_ventas1.php?id_venta=" + d1, "calendario", "width=600, height=550,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
		</script>
	</head>
<body>
	<!----BUSCADOR---->
	<center>
		<h1>FICHAS TECNICAS DE VENTAS</h1>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Nombre de Cliente</b>
						<input type="text" name="nombres" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Apellidos</b>
						<input type="text" name="apellidos" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>C.I.</b>
						<input type="text" name="ci" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Tipo de Venta</b>
						<input type="text" name="tipo_venta" value="" size="10" onKeyUp="buscar()">
					</th>
				</tr>
			</table>
		</form>
	</center>
	<!----BUSCADOR---->
	<center>
	<div id="ventas1">
	</div>
	
</body>
</html>