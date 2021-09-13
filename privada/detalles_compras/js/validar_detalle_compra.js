"use strict"

function validar() {
	var id_compra = document.formu.id_compra.value;
	var id_producto_precio = document.formu.id_producto_precio.value;
	var cantidad = document.formu.cantidad.value;
	var descuento = document.formu.descuento.value;
	var monto_parcial = document.formu.monto_parcial.value;

if (id_compra == "") {
		alert("La compra no fue seleccionada");
		return;
	}

if (id_producto_precio == "") {
		alert("El precio producto no fue seleccionado");
		return;
	}

if (( !v2.test(cantidad)) || (cantidad == "")) {
		alert("La cantida es incorrecta o el campo esta vacio");
		document.formu.cantidad.focus();
		return;
	}
if ((!v22.test(descuento)) ||(descuento == "")) {
		alert("El descuento es incorrecto o el campo esta vacio");
		document.formu.descuento.focus();
		return;
	}

if (( !v22.test(monto_parcial)) || (monto_parcial == "")) {
		alert("El Monto Parcial es incorrecto o el campo esta vacio");
		document.formu.monto_parcial.focus();
		return;
	}
	document.formu.submit();
}