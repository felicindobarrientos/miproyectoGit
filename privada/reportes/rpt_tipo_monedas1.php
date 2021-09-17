<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$tipo_de_moneda = $_REQUEST["tipo_de_moneda"];

$smarty = new Smarty;

//$db->debug=true;

if ($tipo_de_moneda == "T") {
	$sql = $db->Prepare("SELECT*
					 FROM compras co
					 INNER JOIN proveedores pr ON co.id_proveedor = pr.id_proveedor
					 WHERE co.estado <> '0'
					 AND pr.estado <> '0'
					");
	$rs = $db->GetAll($sql);
} else {
	$sql = $db->Prepare("SELECT*
					 FROM compras co
					 INNER JOIN proveedores pr ON co.id_proveedor = pr.id_proveedor
					 WHERE co.tipo_de_moneda = ?
					 AND co.estado <> '0'
					 AND pr.estado <> '0'
					");
	$rs = $db->GetAll($sql, array($tipo_de_moneda));
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
$smarty->assign("tipo_monedas1", $rs);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("rpt_tipo_monedas1.tpl");
?>