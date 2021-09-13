<?php
session_start(); /*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../paginacion.inc.php");

$smarty = new Smarty;

//$db-> debug = true;

contarRegistros($db, "productos_precios");

paginacion("productos_precios.php?", $smarty);

$sql3 = $db->Prepare("SELECT *
					FROM productos_precios pp, productos pr
					WHERE pr.id_producto = pp.id_producto
					AND pp.estado <> '0'
					AND pr.estado <> '0'
					ORDER BY id_producto_precio DESC
					LIMIT ? OFFSET ?;
					");
$smarty->assign("productos_precios", $db->GetAll($sql3, array($nElem, $regIni)));


$smarty->assign("direc_css", $direc_css);
$smarty->display("productos_precios.tpl");
?>