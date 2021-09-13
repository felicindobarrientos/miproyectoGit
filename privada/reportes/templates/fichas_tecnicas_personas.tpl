<!DOCTYPE html>
<html lang="esp">
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<meta charset="utf-8">
		<script type="text/javascript" src="../../ajax.js"></script>
		<script type="text/javascript">
			function buscar() {
				var d1, d2, d3, d4, contenedor, ajax, url, param;
				contenedor = document.getElementById('personas1');
				d1 = document.formu.paterno.value;
				d2 = document.formu.materno.value;
				d3 = document.formu.nombres.value;
				d4 = document.formu.ci.value;
				ajax = nuevoAjax();
				url = "ajax_buscar_persona.php"
				param = "paterno="+d1+"&materno="+d2+"&nombres="+d3+"&ci="+d4;
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

			function mostrar(id_persona) {
				var d1, ventanaCalendario;
				d1 = id_persona;
				//alert(id_persona);
				ventanaCalendario = window.open("fichas_tecnicas_personas1.php?id_persona=" + d1, "calendario", "width=600, height=550,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
		</script>
	</head>
<body>
	<!----BUSCADOR---->
	<center>
		<h1>FICHAS TECNICAS DE PERSONAS</h1>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Paterno</b>
						<input type="text" name="paterno" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Materno</b>
						<input type="text" name="materno" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>Nombres</b>
						<input type="text" name="nombres" value="" size="10" onKeyUp="buscar()">
					</th>
					<th>
						<b>C.I.</b>
						<input type="text" name="ci" value="" size="10" onKeyUp="buscar()">
					</th>
				</tr>
			</table>
		</form>
	</center>
	<!----BUSCADOR---->
	<center>
	<div id="personas1">
	</div>
	
</body>
</html>