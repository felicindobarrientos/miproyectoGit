<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_persona = $_POST["id_persona"];
$__ci = $_POST["ci"];

$__nombres = $_POST["nombres"];
$__ap = $_POST["ap"];
$__am = $_POST["am"];
$__direccion = $_POST["direccion"];
$__telefono = $_POST["telefono"];
$__genero = $_POST["genero"];

//$db->debug=true;
$smarty = new Smarty;

$reg = array();
$reg["ci"] = $__ci;
$reg["nombres"] = $__nombres;
$reg["ap"] = $__ap;
$reg["am"] = $__am;
$reg["direccion"] = $__direccion;
$reg["telefono"] = $__telefono;
$reg["genero"] = $__genero;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("_personas", $reg, "UPDATE", "id_persona='".$__id_persona."'");

if ($rs1) {
	header("Location: personas.php");
	exit();
}else{
	$smarty->assign("mensaje","ERROR: Los datos no se modificaron!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_persona", $__id_persona);
	$smarty->display("persona_modificar1.tpl");
}

?>