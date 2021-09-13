<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$nro_compra = strip_tags(stripslashes($_POST["nro_compra"]));
$tipo_compra = strip_tags(stripslashes($_POST["tipo_compra"]));
$tipo_de_moneda = strip_tags(stripslashes($_POST["tipo_de_moneda"]));

//$db->debug=true;
if ($nombre or $tipo_compra or $tipo_de_moneda or $nro_compra) {
	$sql3 = $db->Prepare("SELECT *
						FROM compras co
						INNER JOIN proveedores prov ON prov.id_proveedor = co.id_proveedor
						WHERE prov.nombre LIKE ?
						AND co.nro_compra LIKE ?
						AND co.tipo_compra LIKE ?
						AND co.tipo_de_moneda LIKE ?
						AND co.estado <> 'X'
						AND prov.estado <> 'X'
					");
	$rs3 = $db->GetAll($sql3, array($nombre."%", $nro_compra."%", $tipo_compra."%", $tipo_de_moneda."%"));
	if ($rs3) {
		echo "<center>
		<table class='listado'>
		<tr>
			<th>NOMBRE PROVEEDOR</th><th>NRO COMPRA</th><th>TIPO COMPRA</th><th>TIPO DE MONEDA</th><th>SELECCIONE</th>
		</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombre"];
			$str1 = $fila["nro_compra"];
			$str2 = $fila["tipo_compra"];
			$str3 = $fila["tipo_de_moneda"];
		echo "<tr>
				<td>".resaltar($nombre, $str)."</td>
				<td>".resaltar($nro_compra, $str1)."</td>
				<td>".resaltar($tipo_compra, $str2)."</td>
				<td>".resaltar($tipo_de_moneda, $str3)."</td>
				<td align='center'>
					<input type='radio' name='seleccione' value='".$fila['id_compra']."' onclick='mostrar(".$fila["id_compra"].")'>
				</td>
			</tr>";
		}
		echo "</table> 
		</center>";
	}else{
		echo "<center><b>LA COMPRA NO EXISTE...!!!</b></center>";
	}
}
?>