<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					 FROM productos p, productos_precios pp
					 WHERE p.id_producto = pp.id_producto
					 AND p.estado <> '0'
					 AND pp.estado <> '0'
					 ORDER BY (p.id_producto) DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("productos_pre", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("productos_pre.tpl");
?>