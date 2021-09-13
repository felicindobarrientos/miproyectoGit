<?php
session_start(); /*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_usuario = $_REQUEST["id_usuario"];

$smarty = new Smarty;

//$db-> debug = true;

/*LAS CONSULTAS SE TIENEN QUE HACER CON TODAS LAS TABLAS EN LAS QUE id_persona ESTA COMO HERENCIA*/
$sql = $db->Prepare("SELECT *
					  FROM 	_usuarios_roles
					  WHERE id_usuario = ?
					  AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($__id_usuario));

if (!$rs) {
	$reg = array();
	$reg["estado"] = '0';
	$reg["_id_usuario"] = $_SESSION["sesion_id_usuario"];
	$rs1 = $db->AutoExecute("_usuarios", $reg, "UPDATE", "id_usuario='".$__id_usuario."'");
	header("Location: usuarios.php");
	exit();

}else{
	$smarty->assign("mensaje","ERROR: Los datos no se eliminaron!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("usuario_eliminar.tpl");
}
?>