<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					 FROM productos p, productos_precios pp
					 WHERE p.id_producto = pp.id_producto
					 AND p.estado <> '0'
					 AND pp.estado <> '0'
					 ORDER BY (pp.id_producto) DESC
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

$smarty->assign("productos_pre", $rs);
$smarty->assign("logo_empresa", $logo_empresa);
$smarty->assign("fecha", $fecha);


$smarty->assign("direc_css", $direc_css);
$smarty->display ("productos_pre1.tpl");
?>