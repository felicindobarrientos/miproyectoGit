<?php
session_start(); /*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_compra = $_REQUEST["id_compra"];

$smarty = new Smarty;

//$db-> debug = true;

/*LAS CONSULTAS SE TIENEN QUE HACER CON TODAS LAS TABLAS EN LAS QUE id_compra ESTA COMO HERENCIA*/
$sql = $db->Prepare("SELECT *
					  FROM 	detalles_compras
					  WHERE id_compra = ?
					  AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($__id_compra));

if (!$rs) {
	$reg = array();
	$reg["estado"] = '0';
	$reg["_id_usuario"] = $_SESSION["sesion_id_usuario"];
	$rs1 = $db->AutoExecute("compras", $reg, "UPDATE", "id_compra='".$__id_compra."'");
	header("Location: compras.php");
	exit();

}else{
	$smarty->assign("mensaje","ERROR: Los datos no se eliminaron!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("compra_eliminar.tpl");
}
?>