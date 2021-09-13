<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_compra = $_REQUEST["id_compra"];
$__id_producto_precio = $_REQUEST["id_producto_precio"];
$__id_detalle_compra = $_REQUEST["id_detalle_compra"];
$__cantidad_c = $_POST["cantidad_c"];
$__descuento = $_POST["descuento"];
$__monto_parcial = $_POST["monto_parcial"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_compra"] = $__id_compra;
$reg["id_producto_precio"] = $__id_producto_precio;
$reg["cantidad_c"] = $__cantidad_c;
$reg["descuento"] = $__descuento;
$reg["monto_parcial"] = $__monto_parcial;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("detalles_compras", $reg, "UPDATE", "id_detalle_compra='".$__id_detalle_compra."'");

if ($rs1) {
	header("Location: detalles_compras.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se modificaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_detalle_compra", $__id_usuario);
	$smarty->display("detalle_compra_modificar1.tpl");
}
?>