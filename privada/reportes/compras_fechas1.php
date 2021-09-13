<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$fecha1 = $_REQUEST["fecha1"];
$fecha2 = $_REQUEST["fecha2"];
$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					 FROM compras c
					 INNER JOIN proveedores p ON c.id_proveedor = p.id_proveedor
					 WHERE c.fecha_compra BETWEEN ? AND ?
					 AND c.estado <> '0'
					 AND p.estado <> '0'

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

$smarty->assign("compras_fechas", $rs);
$smarty->assign("logo_empresa", $logo_empresa);
$smarty->assign("fecha1", $fecha1);
$smarty->assign("fecha2", $fecha2);

$smarty->assign("direc_css", $direc_css);
$smarty->display ("compras_fechas1.tpl");
?>