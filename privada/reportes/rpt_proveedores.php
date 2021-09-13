<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					 FROM proveedores
					 WHERE estado <> '0'
					 ORDER BY (id_proveedor) DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("rpt_proveedores", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("rpt_proveedores.tpl");
?>