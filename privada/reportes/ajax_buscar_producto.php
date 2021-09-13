<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$descripcion = strip_tags(stripslashes($_POST["descripcion"]));
$modelo = strip_tags(stripslashes($_POST["modelo"]));
$marca = strip_tags(stripslashes($_POST["marca"]));
$industria = strip_tags(stripslashes($_POST["industria"]));

//$db->debug=true;
if ($descripcion or $marca or $industria or $modelo) {
	$sql3 = $db->Prepare("SELECT *
						FROM productos
						WHERE descripcion LIKE ?
						AND modelo LIKE ?
						AND marca LIKE ?
						AND industria_origen LIKE ?
						AND estado <> 'X'
					");
	$rs3 = $db->GetAll($sql3, array($descripcion."%", $modelo."%", $marca."%", $industria."%"));
	if ($rs3) {
		echo "<center>
		<table class='listado'>
		<tr>
			<th>DESCRIPCIÓN</th><th>MODLEO</th><th>MARCA</th><th>INDUSTRIA</th><th>SELECCIONE</th>
		</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["descripcion"];
			$str1 = $fila["modelo"];
			$str2 = $fila["marca"];
			$str3 = $fila["industria_origen"];
		echo "<tr>
				<td>".resaltar($descripcion, $str)."</td>
				<td>".resaltar($modelo, $str1)."</td>
				<td>".resaltar($marca, $str2)."</td>
				<td>".resaltar($industria, $str3)."</td>
				<td align='center'>
					<input type='radio' name='seleccione' value='".$fila['id_producto']."' onclick='mostrar(".$fila["id_producto"].")'>
				</td>
			</tr>";
		}
		echo "</table> 
		</center>";
	}else{
		echo "<center><b>EL PRODUCTO NO EXISTE...!!!</b></center>";
	}
}
?>