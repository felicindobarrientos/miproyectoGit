<?php
session_start(); /*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_proveedor = $_REQUEST["id_proveedor"];

$smarty = new Smarty;

//$db-> debug = true;

/*LAS CONSULTAS SE TIENEN QUE HACER CON TODAS LAS TABLAS EN LAS QUE id_proveedor ESTA COMO HERENCIA*/
$sql = $db->Prepare("SELECT *
					  FROM 	productos
					  WHERE id_proveedor = ?
					  AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($__id_proveedor));

$sql2 = $db->Prepare("SELECT *
					  FROM 	compras
					  WHERE id_proveedor = ?
					  AND estado <> '0'
					");
$rs2 = $db->GetAll($sql2, array($__id_proveedor));

if (!$rs and !$rs2) {
	$reg = array();
	$reg["estado"] = '0';
	$reg["id_usuario"] = $_SESSION["sesion_id_usuario"];
	$rs1 = $db->AutoExecute("proveedores", $reg, "UPDATE", "id_proveedor='".$__id_proveedor."'");
	header("Location: proveedores.php");
	exit();

}else{
	$smarty->assign("mensaje","ERROR: Los datos no se eliminaron!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("proveedor_eliminar.tpl");
}
?>