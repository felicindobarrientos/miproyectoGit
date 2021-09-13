<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cliente = $_POST["id_cliente"];
$__ci = $_POST["ci"];

$__nombres = $_POST["nombres"];
$__apellidos = $_POST["apellidos"];
$__telefono = $_POST["telefono"];

//$db->debug=true;
$smarty = new Smarty;

$reg = array();
$reg["ci"] = $__ci;
$reg["nombres"] = $__nombres;
$reg["apellidos"] = $__apellidos;
$reg["telefono"] = $__telefono;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("clientes", $reg, "UPDATE", "id_cliente='".$__id_cliente."'");

if ($rs1) {
	header("Location: clientes.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se modificaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_cliente", $__id_cliente);
	$smarty->display("cliente_modificar1.tpl");
}

?>