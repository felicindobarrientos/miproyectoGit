<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

//$db-> debug = true;
if ((isset($_POST["accion"])) and ($_POST["accion"]=="Ingresar")) {
	$nick = $_POST["nick"];
	$password = $_POST["password"];

	$sql1 = $db->Prepare("SELECT u.clave
						FROM _usuarios u
						WHERE u.usuario1 = ?
						AND u.estado <> '0'
		");
	$rs1 = $db->GetAll($sql1, array($nick));
	if($rs1)
		$clave_bd = $rs1[0]["clave"];
	else
		$clave_bd = 0;

	/*if (password_verify($password, $clave_bd)) {
		$sql = $db->Prepare("SELECT u.*, ur.id_rol, r.rol
			FROM _usuarios u, _usuarios_roles ur, _roles r
			WHERE u.usuario1 = ?
			AND u.id_usuario = ur.id_usuario
			AND ur.id_rol = r.id_rol
			AND u.estado <> '0'
			AND ur.estado <> '0'
			AND r.estado <> '0'
			");
		$rs = $db->GetAll($sql, array($nick));*/

		if (password_verify($password, $clave_bd)) {
		$sql = $db->Prepare("SELECT u.*, ur.id_rol, r.rol
							FROM _usuarios u
							INNER JOIN _usuarios_roles ur ON u.id_usuario = ur.id_usuario
							INNER JOIN _roles r ON ur.id_rol = r.id_rol
							WHERE u.usuario1 = ?
							AND u.estado <> '0'
							AND ur.estado <> '0'
							AND r.estado <> '0'
							");
		$rs = $db->GetAll($sql, array($nick));

	if($rs){
		foreach ($rs as $k => $linea) { 
			$_SESSION["sesion_id_usuario"] = $linea["id_usuario"]; 
			$_SESSION["sesion_usuario"] = $linea["usuario1"];
			$_SESSION["sesion_id_rol"] = $linea["id_rol"];
			$_SESSION["sesion_rol"] = $linea["rol"];
			$_SESSION["sesion_id_usuario"];
		}	
		$mensage = "DATOS CORRECTOS";
		$mensage1 = "BIEN VENIDOS AL SISTEMA..........!!!";
	}else{
		$mensage = "DATOS INCORRECTOS!!!";
		$mensage1 = "POR FAVOR INTENTE NUEVAMENTE";
	}
	}else{
		$mensage = "DATOS INCORRECTOS!!!";
		$mensage1 = "POR FAVOR INTENTE NUEVAMENTE";
	}
	}else{ 
		//echo "id_usuario".$_SESSION["id_usuario"];
		$mensage = "CERRANDO LA SESION!!!!!!!!!!";
		$mensage1 = "SE ESTA SALIENDO DEL SISTEMA...................";
		//session_unset($_SESSION["sesion_id_usuario"]);
		session_destroy();
}
$smarty = new Smarty;

$smarty->assign("mensage", $mensage);
$smarty->assign("mensage1", $mensage1);
$smarty->assign("direc_css", $direc_css);
$smarty->display("index.tpl");
?>