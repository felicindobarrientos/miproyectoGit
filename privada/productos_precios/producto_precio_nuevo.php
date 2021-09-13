<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					 FROM productos pr 
					 WHERE pr.estado <> '0'
					 ORDER BY pr.id_producto DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("productos", $rs);

$smarty->assign("direc_css", $direc_css);
$smarty->display ("producto_precio_nuevo.tpl");
?>