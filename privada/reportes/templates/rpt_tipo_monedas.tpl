<!DOCTYPE html>
<html lang="esp">
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<meta charset="utf-8">
		{literal}
		<script type="text/javascript">
			function validar() {
			tipo_de_moneda = document.formu.tipo_de_moneda.value;
			if (document.formu.tipo_de_moneda.value == "") {
				alert("Seleccione el tipo de moneda");
				document.formu.tipo_de_moneda.focus();
				return;
			}
				ventanaCalendario = window.open("rpt_tipo_monedas1.php?tipo_de_moneda=" + tipo_de_moneda, "calendario", "width=600, height=550,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
		</script>
		{/literal}
	</head>
<body>
	<div class="formu_ingreso_datos">
		<h2>RPT DE COMPRAS POR TIPO DE MONEDA</h2>
		<form method="post" name="formu">
			<p>
				<b>*Seleccione el tipo de moneda de la compra</b>
				<select name="tipo_de_moneda">
					<option value="">--Seleccione--</option>
					<option value="T">Todos</option>
					<option value="BOLIVIANOS">Bolivianos</option>
					<option value="DOLARES">Dolares</option>
				</select>
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton">
			</p>
		</form>
	</div>
</body>
</html>
