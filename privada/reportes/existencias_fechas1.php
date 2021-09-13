<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$fecha1 = $_REQUEST["fecha1"];
$fecha2 = $_REQUEST["fecha2"];
$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					 FROM existencias ex 
					 INNER JOIN productos pr ON ex.id_producto = pr.id_producto
					 INNER JOIN detalles_ventas dv ON ex.id_detalle_venta = dv.id_detalle_venta
					 INNER JOIN detalles_compras dc ON ex.id_detalle_compra = dc.id_detalle_compra
					 WHERE ex.fec_insercion BETWEEN ? AND ?
					 AND ex.estado <> '0'
					 AND pr.estado <> '0'
					 AND dv.estado <> '0'
					 AND dc.estado <> '0'
					");
$rs = $db->GetAll($sql, array($fecha1, $fecha2));

$sql1 = $db->Prepare("SELECT*
					 FROM empresa
					 WHERE id_empresa = 1
					 AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo_empresa = $rs1[0]["logo_empresa"];

$smarty->assign("existencias_fechas1", $rs);
$smarty->assign("logo_empresa", $logo_empresa);
$smarty->assign("fecha1", $fecha1);
$smarty->assign("fecha2", $fecha2);

$smarty->assign("direc_css", $direc_css);
$smarty->display ("existencias_fechas1.tpl");
?>