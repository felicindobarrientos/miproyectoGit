<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$ci = strip_tags(stripslashes($_POST["ci"]));
$nombre = strip_tags(stripslashes($_POST["nombre"]));
$telefono = strip_tags(stripslashes($_POST["telefono"]));

//$db->debug=true;

if ($ci or $nombre or $telefono) {
	$sql3 = $db->Prepare("SELECT *
						FROM proveedores
						WHERE ci LIKE ?
						AND nombre LIKE ?
						AND telefono LIKE ?
						AND estado <> '0'
					");
	$rs3 = $db->GetAll($sql3, array($ci."%", $nombre."%", $telefono."%"));
    
	if ($rs3) {
		echo "<center>
		<table width='60%' border='1'>
		<tr>
			<th>C.I.</th><th>NOMBRE</th><th>TELEFONO</th><th>?</th>
		</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["ci"];
			$str1 = $fila["nombre"];
			$str2 = $fila["telefono"];
		echo "<tr>
				<td align='center'>".resaltar($ci, $str)."</td>
				<td>".resaltar($nombre, $str1)."</td>
				<td>".resaltar($telefono, $str2)."</td>
				<td align='center'>
					<input type='radio' name='opcion' value='' onclick='buscar_proveedor(".$fila["id_proveedor"].")'>
				</td>
			</tr>";
		}
		echo "</table> 
		</center>";
	}else{
		echo "<center><b>EL PROVEEDOR NO EXISTE...!!!</b></center></br>";
        echo "<center> 
            <table class='listado'>
                <tr>
                    <td><b>C.I.</b></td>
                    <td><input type='text' name='ci1' size='10'></td>
                </tr>
                <tr>
                    <td><b>(*)Nombre</b></td>
                    <td><input type='text' name='nombre1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
                </tr>
                <tr>
                    <td><b>Dirección</b></td>
                    <td><input type='text' name='direccion1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
                </tr>
                <tr>
                    <td><b>Teléfono</b></td>
                    <td><input type='text' name='telefono1' size='10'></td>
                </tr>
                <tr>
                    <td align='center' colspan='2'>
                    <input type='button' value='ADICIONAR PROVEEDOR' class='boton2' onClick='insertar_proveedor()'>
                    </td>
                </tr>
            </table>
		</center>
        ";
	}
}
?>