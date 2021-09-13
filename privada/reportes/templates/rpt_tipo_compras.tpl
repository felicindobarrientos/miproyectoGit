<!DOCTYPE html>
<html lang="esp">
	<head>
		<link rel="stylesheet" href="../{$direc_css}" type="text/css">
		<meta charset="utf-8">
		{literal}
		<script type="text/javascript">
			function validar() {
			tipo_compra = document.formu.tipo_compra.value;
			if (document.formu.tipo_compra.value == "") {
				alert("Seleccione el tipo de compra");
				document.formu.tipo_compra.focus();
				return;
			}
				ventanaCalendario = window.open("rpt_tipo_compras1.php?tipo_compra=" + tipo_compra, "calendario", "width=600, height=550,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
		</script>
		{/literal}
	</head>
<body>
	<div class="formu_ingreso_datos">
		<h2>RPT POR TIPO DE COMPRAS</h2>
		<form method="post" name="formu">
			<p>
				<b>*Seleccione el tipo de compra</b>
				<select name="tipo_compra">
					<option value="">--Seleccione--</option>
					<option value="T">Todos</option>
					<option value="CREDITO">Credito</option>
					<option value="CONTADO">Contado</option>
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
