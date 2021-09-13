<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug = true;

$sql = $db->Prepare("SELECT *
					FROM detalles_compras dc, compras c, productos_precios pp
					WHERE dc.id_compra = c.id_compra
					AND dc.id_producto_precio = pp.id_producto_precio
					AND dc.estado <> '0'
					AND c.estado <> '0'
					AND pp.estado <> '0'
					ORDER BY dc.id_detalle_compra DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("detalles_compras", $rs);//investigar detalles_compras
$smarty->assign("direc_css", $direc_css);
$smarty->display("detalles_compras.tpl");
?>