<!DOCTYPE html>
<html lang="esp">
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<meta charset="utf-8">
		<script type="text/javascript" src="../../ajax.js"></script>
		<script type="text/javascript">
			function buscar() {
				var d1, d2, d3, d4, contenedor, ajax, url, param;
				contenedor = document.getElementById('productos1');
				d1 = document.formu.descripcion.value;
				d2 = document.formu.modelo.value;
				d3 = document.formu.marca.value;
				d4 = document.formu.industria.value;
				ajax = nuevoAjax();
				url = "ajax_buscar_producto.php"
				param = "descripcion="+d1+"&modelo="+d2+"&marca="+d3+"&industria="+d4;
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

			function mostrar(id_producto) {
				var d1, ventanaCalendario;
				d1 = id_producto;
				//alert(id_producto);
				ventanaCalendario = window.open("fichas_tecnicas_productos1.php?id_producto=" + d1, "calendario", "width=600, height=550,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
		</script>
	</head>
<body>
	<!----BUSCADOR---->
	<center>
		<h1>FICHAS TECNICAS DE PRODUCTOS</h1>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Descripción</b>
						<input type="text" name="descripcion" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Modelo</b>
						<input type="text" name="modelo" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Marca</b>
						<input type="text" name="marca" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Industria</b>
						<input type="text" name="industria" value="" size="10" onKeyUp="buscar()">
					</th>
				</tr>
			</table>
		</form>
	</center>
	<!----BUSCADOR---->
	<center>
	<div id="productos1">
	</div>
	
</body>
</html>