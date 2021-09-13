<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

//$db->debug=true;
$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					 FROM productos 
					 WHERE estado <> '0'
					 ORDER BY id_producto DESC
					");
$rs = $db->GetAll($sql);


$sql1 = $db->Prepare("SELECT*
					 FROM clientes
					 WHERE estado <> '0'
					 ORDER BY id_cliente DESC
					");
$rs1 = $db->GetAll($sql1);

$smarty->assign("productos", $rs);
$smarty->assign("clientes", $rs1);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("venta_nuevo.tpl");
?>