<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombres = strip_tags(stripslashes($_POST["nombres"]));
$apellidos = strip_tags(stripslashes($_POST["apellidos"]));
$ci = strip_tags(stripslashes($_POST["ci"]));
$tipo_venta = strip_tags(stripslashes($_POST["tipo_venta"]));

//$db->debug=true;
if ($nombres or $apellidos or $ci or $tipo_venta) {
	$sql3 = $db->Prepare("SELECT *
						FROM ventas ve
						INNER JOIN clientes cl ON cl.id_cliente = ve.id_cliente
						WHERE cl.nombres LIKE ?
						AND cl.apellidos LIKE ?
						AND cl.ci LIKE ?
						AND ve.tipo_venta LIKE ?
						AND ve.estado <> '0'
						AND cl.estado <> '0'
					");
	$rs3 = $db->GetAll($sql3, array($nombres."%", $apellidos."%", $ci."%", $tipo_venta."%"));
	if ($rs3) {
		echo "<center>
		<table class='listado'>
		<tr>
			<th>NOMBRE CLIENTE</th><th>APELLIDOS</th><th>C.I.</th><th>TIPO DE VENTA</th><th>SELECCIONE</th>
		</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombres"];
			$str1 = $fila["apellidos"];
			$str2 = $fila["ci"];
			$str3 = $fila["tipo_venta"];
		echo "<tr>
				<td>".resaltar($nombres, $str)."</td>
				<td>".resaltar($apellidos, $str1)."</td>
				<td>".resaltar($ci, $str2)."</td>
				<td>".resaltar($tipo_venta, $str3)."</td>
				<td align='center'>
					<input type='radio' name='seleccione' value='".$fila['id_venta']."' onclick='mostrar(".$fila["id_venta"].")'>
				</td>
			</tr>";
		}
		echo "</table> 
		</center>";
	}else{
		echo "<center><b>LA VENTA NO EXISTE...!!!</b></center>";
	}
}
?>