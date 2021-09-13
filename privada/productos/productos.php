<?php
session_start(); /*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../paginacion.inc.php");

$smarty = new Smarty;

//$db-> debug = true;

contarRegistros($db, "productos");

paginacion("productos.php?", $smarty);

/*$sql3 = $db->Prepare("SELECT *
					FROM productos pr, proveedores pv
					WHERE pr.estado <> '0'
					AND pv.estado <> '0'
					AND pr.id_proveedor = pv.id_proveedor
					ORDER BY id_producto DESC
					LIMIT ? OFFSET ?;
					");*/
$sql3 = $db->Prepare("SELECT *
					FROM productos pr
					INNER JOIN proveedores pv ON pr.id_proveedor = pv.id_proveedor
					WHERE pr.estado <> '0'
					AND pv.estado <> '0' 
					ORDER BY id_producto DESC
					LIMIT ? OFFSET ?;
					");
$smarty->assign("productos", $db->GetAll($sql3, array($nElem, $regIni)));


$smarty->assign("direc_css", $direc_css);
$smarty->display("productos.tpl");
?>