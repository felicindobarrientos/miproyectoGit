"use strict"

function validar() {
	var fecha_venta = document.formu.fecha_venta.value;
	var nro_venta = document.formu.nro_venta.value;
	var id_cliente = document.formu.id_cliente.value;
	var con = document.formu.tipo_venta[0].checked;
	var cre = document.formu.tipo_venta[1].checked;
	

	var monto_final = document.formu.monto_final.value;

	if (fecha_venta == "") {
			alert("El campo de fecha venta esta vacia");
			document.formu.fecha_venta.focus();
			return;
		}
	if (nro_venta == "") {
			alert("El campo Nro de compra esta vacio");
			document.formu.nro_venta.focus();
			return;
		}
	if (id_cliente == "") {
			alert("El cliente no fue seleccionado");
			return;
		}
	
	if((con == "") && (cre == "")){
			alert("El campo Tipo de venta esta vacio");
			return;
		}
		

	if (( !v22.test(monto_final)) || (monto_final == "")) {
			alert("El Monto Total es incorrecto o el campo esta vacio");
			document.formu.monto_final.focus();
			return;
		}
	document.formu.submit();
}