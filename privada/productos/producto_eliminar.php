<?php
session_start(); /*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_producto = $_REQUEST["id_producto"];

$smarty = new Smarty;

//$db-> debug = true;

/*LAS CONSULTAS SE TIENEN QUE HACER CON TODAS LAS TABLAS EN LAS QUE id_producto ESTA COMO HERENCIA*/
$sql = $db->Prepare("SELECT *
					  FROM 	productos_precios
					  WHERE id_producto = ?
					  AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($__id_producto));

$sql2 = $db->Prepare("SELECT *
					  FROM 	existencias
					  WHERE id_producto = ?
					  AND estado <> '0'
					");
$rs2 = $db->GetAll($sql2, array($__id_producto));

if (!$rs and !$rs2) {
	$reg = array();
	$reg["estado"] = '0';
	$reg["_id_usuario"] = $_SESSION["sesion_id_usuario"];
	$rs1 = $db->AutoExecute("productos", $reg, "UPDATE", "id_producto='".$__id_producto."'");
	header("Location: productos.php");
	exit();

}else{
	$smarty->assign("mensaje","ERROR: Los datos no se eliminaron!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("producto_eliminar.tpl");
}
?>