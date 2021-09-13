"use strict"

function validar() {
	var id_proveedor = document.formu.id_proveedor.value;
	var nro_compra = document.formu.nro_compra.value;
	var con = document.formu.tipo_compra[0].checked;
	var cre = document.formu.tipo_compra[1].checked;
	var bol = document.formu.tipo_de_moneda[0].checked;
	var dol = document.formu.tipo_de_moneda[1].checked;
	var fecha_compra = document.formu.fecha_compra.value;
	var monto_total = document.formu.monto_total.value;


	if (id_proveedor == "") {
			alert("El Proveedor no fue seleccionado");
			return;
		}
	if (nro_compra == "") {
			alert("El campo Nro de compra esta vacio");
			document.formu.nro_compra.focus();
			return;
		}
	if((con == "") && (cre == "")){
			alert("El campo Tipo de Compra esta vacio");
			return;
		}
	if((bol == "") && (dol == "")){
			alert("El campo Tipo de Moneda esta vacio");
			return;
		}
	if (fecha_compra == "") {
			alert("El campo de fecha Compra esta vacia");
			document.formu.fecha_compra.focus();
			return;
		}
	if (( !v22.test(monto_total)) || (monto_total == "")) {
			alert("El Monto Total es incorrecto o el campo esta vacio");
			document.formu.monto_total.focus();
			return;
		}
	document.formu.submit();
}