<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_producto = $_REQUEST["id_producto"];
$__id_producto_precio = $_REQUEST["id_producto_precio"];
$__fecha_prec_compra = $_POST["fecha_prec_compra"];
$__precio_compra = $_POST["precio_compra"];
$__precio_venta = $_POST["precio_venta"];
$__fecha_prec_venta = $_POST["fecha_prec_venta"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_producto"] = $__id_producto;
$reg["fecha_prec_compra"] = $__fecha_prec_compra;
$reg["precio_compra"] = $__precio_compra;
$reg["precio_venta"] = $__precio_venta;
$reg["fecha_prec_venta"] = $__fecha_prec_venta;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("productos_precios", $reg, "UPDATE", "id_producto_precio='".$__id_producto_precio."'");

if ($rs1) {
	header("Location: productos_precios.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se modificaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_producto_precio", $__id_usuario);
	$smarty->display("producto_precio_modificar1.tpl");
}
?>