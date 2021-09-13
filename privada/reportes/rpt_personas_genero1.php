<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$genero = $_REQUEST["genero"];

$smarty = new Smarty;

//$db->debug=true;

if ($genero == "T") {
	$sql = $db->Prepare("SELECT*
					 FROM _personas
					 WHERE estado <> '0'
					");
	$rs = $db->GetAll($sql);
} else {
	$sql = $db->Prepare("SELECT*
					 FROM _personas
					 WHERE genero = ?
					 AND estado <> '0'
					");
	$rs = $db->GetAll($sql, array($genero));
}

//logo autogestionable
$sql1 = $db->Prepare("SELECT*
					 FROM empresa
					 WHERE id_empresa = 1
					 AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo_empresa = $rs1[0]["logo_empresa"];
$smarty->assign("logo_empresa", $logo_empresa);

$fecha = date("Y-m-d H:i:s");
$smarty->assign("personas_genero1", $rs);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display ("rpt_personas_genero1.tpl");
?>