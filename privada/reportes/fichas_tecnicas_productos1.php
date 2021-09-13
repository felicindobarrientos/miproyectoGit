<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_producto = $_REQUEST["id_producto"];

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT *
					 FROM productos pr
					 INNER JOIN proveedores prov ON prov.id_proveedor = pr.id_proveedor
					 INNER JOIN productos_precios pp ON pp.id_producto = pr.id_producto
					 WHERE pr.id_producto = ?
					 AND pr.estado <> '0'
					 AND prov.estado <> '0'
					 AND pp.estado <> '0'
					");
$rs = $db->GetAll($sql, array($id_producto));
$sql1 = $db->Prepare("SELECT*
					 FROM empresa
					 WHERE id_empresa = 1
					 AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo_empresa = $rs1[0]["logo_empresa"];
$smarty->assign("logo_empresa", $logo_empresa);

$smarty->assign("producto", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("fichas_tecnicas_productos1.tpl");
?>