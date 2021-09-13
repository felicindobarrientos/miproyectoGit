<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					 FROM existencias ex
					 INNER JOIN  productos pr ON pr.id_producto = ex.id_producto
					 INNER JOIN  detalles_compras dc ON dc.id_detalle_compra = ex.id_detalle_compra
					 INNER JOIN  detalles_ventas dv ON dv.id_detalle_venta = ex.id_detalle_venta
					 WHERE ex.estado <> '0'
					 AND pr.estado <> '0'
					 AND dc.estado <> '0'
					 AND dv.estado <> '0'
					 ORDER BY (pr.id_producto) DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("rept_existencias", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("rept_existencias.tpl");
?>