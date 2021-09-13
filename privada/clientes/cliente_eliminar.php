<?php
session_start(); /*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cliente = $_REQUEST["id_cliente"];

$smarty = new Smarty;

//$db-> debug = true;

/*LAS CONSULTAS SE TIENEN QUE HACER CON TODAS LAS TABLAS EN LAS QUE id_cliente ESTA COMO HERENCIA*/
$sql = $db->Prepare("SELECT *
					  FROM 	ventas
					  WHERE id_cliente = ?
					  AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($__id_cliente));

if (!$rs) {
	$reg = array();
	$reg["estado"] = '0';
	$reg["id_usuario"] = $_SESSION["sesion_id_usuario"];
	$rs1 = $db->AutoExecute("clientes", $reg, "UPDATE", "id_cliente='".$__id_cliente."'");
	header("Location: clientes.php");
	exit();

}else{
	$smarty->assign("mensaje","ERROR: Los datos no se eliminaron!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("cliente_eliminar.tpl");
}
?>