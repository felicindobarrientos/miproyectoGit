<?php
require_once("adodb/adodb.inc.php");

$direc_css = "../css/colores1.css";

$conServidor = "localhost";
$conUsuario = "root";
$conClave = "";
$conBasededatos = "bd_comprasventas";

$db = ADONewConnection("mysqli");
//$db-> debug = true;
$conex = $db->Connect($conServidor, $conUsuario, $conClave, $conBasededatos);
$db->Execute("SET NAMES 'utf8'");
?>