<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_compra = $_REQUEST["id_compra"];

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT *
					 FROM compras co
					 INNER JOIN proveedores prov ON prov.id_proveedor = co.id_proveedor
					 WHERE co.id_compra = ?
					 AND co.estado <> '0'
					 AND prov.estado <> '0'
					");
$rs = $db->GetAll($sql, array($id_compra));
$sql1 = $db->Prepare("SELECT*
					 FROM empresa
					 WHERE id_empresa = 1
					 AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo_empresa = $rs1[0]["logo_empresa"];
$smarty->assign("logo_empresa", $logo_empresa);

$smarty->assign("compra", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("fichas_tecnicas_compras1.tpl");
?>