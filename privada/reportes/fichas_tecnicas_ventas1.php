<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_venta = $_REQUEST["id_venta"];

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT *
					 FROM ventas ve
					 INNER JOIN clientes cl ON cl.id_cliente = ve.id_cliente
					 WHERE ve.id_venta = ?
					 AND ve.estado <> '0'
					 AND cl.estado <> '0'
					");
$rs = $db->GetAll($sql, array($id_venta));
$sql1 = $db->Prepare("SELECT*
					 FROM empresa
					 WHERE id_empresa = 1
					 AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo_empresa = $rs1[0]["logo_empresa"];
$smarty->assign("logo_empresa", $logo_empresa);

$smarty->assign("venta", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("fichas_tecnicas_ventas1.tpl");
?>