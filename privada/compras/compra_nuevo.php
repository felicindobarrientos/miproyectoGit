<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					 FROM productos 
					 WHERE estado <> '0'
					 ORDER BY id_producto DESC
					");
$rs = $db->GetAll($sql);

$sql1 = $db->Prepare("SELECT*
					 FROM proveedores 
					 WHERE estado <> '0'
					 ORDER BY id_proveedor DESC
					");
$rs1 = $db->GetAll($sql1);

$smarty->assign("productos", $rs);
$smarty->assign("proveedores", $rs1);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("compra_nuevo.tpl");
?>