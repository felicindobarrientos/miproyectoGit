<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_proveedor = $_REQUEST["id_proveedor"];
$__id_compra = $_REQUEST["id_compra"];
$__nro_compra = $_POST["nro_compra"];
$__tipo_compra = $_POST["tipo_compra"];
$__tipo_de_moneda = $_POST["tipo_de_moneda"];
$__fecha_compra = $_POST["fecha_compra"];
$__monto_total = $_POST["monto_total"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_proveedor"] = $__id_proveedor;
$reg["nro_compra"] = $__nro_compra;
$reg["tipo_compra"] = $__tipo_compra;
$reg["tipo_de_moneda"] = $__tipo_de_moneda;
$reg["fecha_compra"] = $__fecha_compra;
$reg["monto_total"] = $__monto_total;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("compras", $reg, "UPDATE", "id_compra='".$__id_compra."'");

if ($rs1) {
	header("Location: compras.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se modificaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_compra", $__id_compra);
	$smarty->display("compra_modificar1.tpl");
}
?>