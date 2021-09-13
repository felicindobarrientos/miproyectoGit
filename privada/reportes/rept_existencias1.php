<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					 FROM existencias ex
					 INNER JOIN  productos pr ON pr.id_producto = ex.id_producto
					 INNER JOIN  detalles_compras dc ON dc.id_detalle_compra = ex.id_detalle_compra
					 INNER JOIN  detalles_ventas dv ON dv.id_detalle_venta = ex.id_detalle_venta
					 WHERE ex.estado <> '0'
					 AND pr.estado <> '0'
					 AND dc.estado <> '0'
					 AND dv.estado <> '0'
					 ORDER BY (ex.id_producto) DESC
					");
$rs = $db->GetAll($sql);



$sql1 = $db->Prepare("SELECT*
					 FROM empresa
					 WHERE id_empresa = 1
					 AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo_empresa = $rs1[0]["logo_empresa"];

$fecha = date("Y-m-d H:i:s");

$smarty->assign("rept_existencias", $rs);
$smarty->assign("logo_empresa", $logo_empresa);
$smarty->assign("fecha", $fecha);


$smarty->assign("direc_css", $direc_css);
$smarty->display ("rept_existencias1.tpl");
?>