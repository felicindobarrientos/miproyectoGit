<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_usuario = $_REQUEST["id_usuario"];
$__id_persona = $_REQUEST["id_persona"];

$smarty = new Smarty;

//$db-> debug = true;

$sql = $db->Prepare("SELECT *
					 FROM _usuarios 
					 WHERE id_usuario = ?
					");
$rs = $db->GetAll($sql, array($__id_usuario));

$sql2 = $db->Prepare("SELECT *
					 FROM _personas
					 WHERE id_persona = ?
					 AND estado <> '0'
					");
$rs2 = $db->GetAll($sql2, array($__id_persona));

$sql3 = $db->Prepare("SELECT *
					 FROM _personas
					 WHERE id_persona <> ?
					 AND estado <> '0'
					");
$rs3 = $db->GetAll($sql3, array($__id_persona));

$smarty->assign("usuario", $rs);
$smarty->assign("persona", $rs2);
$smarty->assign("personas", $rs3);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("usuario_modificar.tpl");
?>