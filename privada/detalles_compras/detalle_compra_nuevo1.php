<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_compra = $_POST["id_compra"];
$__id_producto_precio = $_POST["id_producto_precio"];
$__cantidad_c = $_POST["cantidad_c"];
$__descuento = $_POST["descuento"];
$__monto_parcial = $_POST["monto_parcial"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_compra"] = $__id_compra;
$reg["id_producto_precio"] = $__id_producto_precio;
$reg["cantidad_c"] = $__cantidad_;
$reg["descuento"] = $__descuento;
$reg["monto_parcial"] = $__monto_parcial;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("detalles_compras", $reg, "INSERT");

if ($rs1) {
	header("Location: detalles_compras.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se insertaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("detalle_compra_nuevo1.tpl");
}

?>