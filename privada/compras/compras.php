<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug = true;

/*$sql = $db->Prepare("SELECT *
					FROM compras co, proveedores pro
					WHERE co.id_proveedor = pro.id_proveedor
					AND co.estado <> '0'
					AND pro.estado <> '0'
					ORDER BY co.id_compra DESC
					");*/
$sql = $db->Prepare("SELECT *
					FROM compras co
					INNER JOIN proveedores pro ON co.id_proveedor = pro.id_proveedor
					WHERE co.estado <> '0'
					AND pro.estado <> '0'
					ORDER BY co.id_compra DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("compras", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("compras.tpl");
?>