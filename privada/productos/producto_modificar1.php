<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_proveedor = $_REQUEST["id_proveedor"];
$__id_producto = $_REQUEST["id_producto"];
$__descripcion = $_POST["descripcion"];
$__modelo = $_POST["modelo"];
$__marca = $_POST["marca"];
$__industria_origen = $_POST["industria_origen"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_proveedor"] = $__id_proveedor;
$reg["descripcion"] = $__descripcion;
$reg["modelo"] = $__modelo;
$reg["marca"] = $__marca;
$reg["industria_origen"] = $__industria_origen;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("productos", $reg, "UPDATE", "id_producto='".$__id_producto."'");

if ($rs1) {
	header("Location: productos.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se modificaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_producto", $__id_producto);
	$smarty->display("producto_modificar1.tpl");
}
?>