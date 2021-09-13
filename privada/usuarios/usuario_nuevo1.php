<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_persona = $_POST["id_persona"];
$__usuario1 = $_POST["usuario1"];
$__clave = $_POST["clave"];

$hash=password_hash($__clave, PASSWORD_DEFAULT);
//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_persona"] = $__id_persona;
$reg["usuario1"] = $__usuario1;
$reg["clave"] = $hash;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("_usuarios", $reg, "INSERT");

if ($rs1) {
	header("Location: usuarios.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se insertaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("usuario_nuevo1.tpl");
}

?>