<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_detalle_compra = $_REQUEST["id_detalle_compra"];
$__id_compra = $_REQUEST["id_compra"];
$__id_producto_precio = $_REQUEST["id_producto_precio"];

$smarty = new Smarty;

//$db-> debug = true;

$sql = $db->Prepare("SELECT *
					 FROM detalles_compras 
					 WHERE id_detalle_compra = ?
					");
$rs = $db->GetAll($sql, array($__id_detalle_compra));

$sql2 = $db->Prepare("SELECT *
					 FROM compras
					 WHERE id_compra = ?
					 AND estado <> '0'
					");
$rs2 = $db->GetAll($sql2, array($__id_compra));

$sql3 = $db->Prepare("SELECT *
					 FROM compras
					 WHERE id_compra <> ?
					 AND estado <> '0'
					");
$rs3 = $db->GetAll($sql3, array($__id_compra));

$sql4 = $db->Prepare("SELECT *
					 FROM productos_precios
					 WHERE id_producto_precio = ?
					 AND estado <> '0'
					");
$rs4 = $db->GetAll($sql4, array($__id_producto_precio));

$sql5 = $db->Prepare("SELECT *
					 FROM productos_precios
					 WHERE id_producto_precio <> ?
					 AND estado <> '0'
					");
$rs5 = $db->GetAll($sql5, array($__id_producto_precio));

$smarty->assign("detalle_compra", $rs);
$smarty->assign("compra", $rs2);
$smarty->assign("compras", $rs3);
$smarty->assign("producto_precio", $rs4);
$smarty->assign("productos_precios", $rs5);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("detalle_compra_modificar.tpl");
?>