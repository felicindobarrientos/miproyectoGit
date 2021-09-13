<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$tipo_venta = $_REQUEST["tipo_venta"];

$smarty = new Smarty;

//$db->debug=true;

if ($tipo_venta == "T") {
	$sql = $db->Prepare("SELECT*
					 FROM ventas ve
					 INNER JOIN clientes cli ON ve.id_cliente = cli.id_cliente
					 WHERE ve.estado <> '0'
					 AND cli.estado <> '0'
					");
	$rs = $db->GetAll($sql);
} else {
	$sql = $db->Prepare("SELECT*
					 FROM ventas ve
					 INNER JOIN clientes cli ON ve.id_cliente = cli.id_cliente
					 WHERE ve.tipo_venta = ?
					 AND ve.estado <> '0'
					 AND cli.estado <> '0'
					");
	$rs = $db->GetAll($sql, array($tipo_venta));
}

//logo autogestionable
$sql1 = $db->Prepare("SELECT*
					 FROM empresa
					 WHERE id_empresa = 1
					 AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo_empresa = $rs1[0]["logo_empresa"];
$smarty->assign("logo_empresa", $logo_empresa);

$fecha = date("Y-m-d H:i:s");
$smarty->assign("tipo_ventas1", $rs);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("rpt_tipo_ventas1.tpl");
?>