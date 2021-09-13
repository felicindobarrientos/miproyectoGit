<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_producto_precio = $_REQUEST["id_producto_precio"];
$__id_producto = $_REQUEST["id_producto"];

$smarty = new Smarty;

//$db-> debug = true;

$sql = $db->Prepare("SELECT *
					 FROM productos_precios 
					 WHERE id_producto_precio = ?
					");
$rs = $db->GetAll($sql, array($__id_producto_precio));

$sql2 = $db->Prepare("SELECT *
					 FROM productos
					 WHERE id_producto = ?
					 AND estado <> '0'
					");
$rs2 = $db->GetAll($sql2, array($__id_producto));

$sql3 = $db->Prepare("SELECT *
					 FROM productos
					 WHERE id_producto <> ?
					 AND estado <> '0'
					");
$rs3 = $db->GetAll($sql3, array($__id_producto));

$smarty->assign("producto_precio", $rs);
$smarty->assign("producto", $rs2);
$smarty->assign("productos", $rs3);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("producto_precio_modificar.tpl");
?>