<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cliente = $_POST["id_cliente"];
$__nro_venta = $_POST["nro_venta"];
$__tipo_venta = $_POST["tipo_venta"];
$__fecha_venta = $_POST["fecha_venta"];
$__monto_final = $_POST["monto_final"];

//$db->debug=true;

$smarty = new Smarty;

	$reg = array();
	$reg["id_cliente"] = $__id_cliente;
	$reg["nro_venta"] = $__nro_venta;
	$reg["tipo_venta"] = $__tipo_venta;
	$reg["fecha_venta"] = $__fecha_venta;
	$reg["monto_final"] = $__monto_final;
	$reg["fec_insercion"] = date("Y-m-d H:i:s");
	$reg["estado"] = '1';
	$reg["usuario"] = $_SESSION["sesion_id_usuario"];
	$rs1 = $db->AutoExecute("ventas", $reg, "INSERT");

if ($rs1) {
	header("Location: ventas.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se insertaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("venta_nuevo1.tpl");
}

?>