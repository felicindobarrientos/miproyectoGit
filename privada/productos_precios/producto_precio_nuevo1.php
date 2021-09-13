<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_producto = $_POST["id_producto"];
$__fecha_prec_compra = $_POST["fecha_prec_compra"];
$__precio_compra = $_POST["precio_compra"];
$__precio_venta = $_POST["precio_venta"];
$__fecha_prec_venta = $_POST["fecha_prec_venta"];

//$hash=password_hash($__clave, PASSWORD_DEFAULT);
//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_producto"] = $__id_producto;
$reg["fecha_prec_compra"] = $__fecha_prec_compra;
$reg["precio_compra"] = $__precio_compra;
$reg["precio_venta"] = $__precio_venta;
$reg["fecha_prec_venta"] = $__fecha_prec_venta;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("productos_precios", $reg, "INSERT");

if ($rs1) {
	header("Location: productos_precios.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se insertaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("producto_precio_nuevo1.tpl");
}

?>