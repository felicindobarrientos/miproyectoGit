<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug = true;

$sql = $db->Prepare("SELECT *
					FROM proveedores p 
					WHERE id_proveedor
					AND p.estado <> '0'
					ORDER BY p.id_proveedor DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("proveedores", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("proveedores.tpl");
?>