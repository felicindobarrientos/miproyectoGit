<?php
session_start(); /*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_producto_precio = $_REQUEST["id_producto_precio"];

$smarty = new Smarty;

//$db-> debug = true;

/*LAS CONSULTAS SE TIENEN QUE HACER CON TODAS LAS TABLAS EN LAS QUE id_producto_precio ESTA COMO HERENCIA*/
$sql = $db->Prepare("SELECT *
					  FROM 	detalles_compras
					  WHERE id_producto_precio = ?
					  AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($__id_producto_precio));

$sql2 = $db->Prepare("SELECT *
					  FROM 	detalles_ventas
					  WHERE id_producto_precio = ?
					  AND estado <> '0'
					");
$rs2 = $db->GetAll($sql2, array($__id_producto_precio));

if (!$rs and !$rs2) {
	$reg = array();
	$reg["estado"] = '0';
	$reg["_id_usuario"] = $_SESSION["sesion_id_usuario"];
	$rs1 = $db->AutoExecute("productos_precios", $reg, "UPDATE", "id_producto_precio='".$__id_producto_precio."'");
	header("Location: productos_precios.php");
	exit();

}else{
	$smarty->assign("mensaje","ERROR: Los datos no se eliminaron!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("producto_precio_eliminar.tpl");
}
?>