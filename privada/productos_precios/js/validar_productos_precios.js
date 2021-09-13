"use strict"

function validar() {
	var id_producto = document.formu.id_producto.value;
	var fecha_prec_compra = document.formu.fecha_prec_compra.value;
	var precio_compra = document.formu.precio_compra.value;
	var precio_venta = document.formu.precio_venta.value;
	var fecha_prec_venta = document.formu.fecha_prec_venta.value;

if (id_producto == "") {
		alert("Por favor seleccione un producto");
		return;
	}

if (fecha_prec_compra == "") {
		alert("El campo de fecha precio compra esta vacia");
		document.formu.fecha_prec_compra.focus();
		return;
	}

if (( !v22.test(precio_compra)) || (precio_compra == "")) {
		alert("El precio de compra es incorrecto o el campo esta vacio");
		document.formu.precio_compra.focus();
		return;
	}

if (( !v22.test(precio_venta)) || (precio_venta == "")) {
		alert("El precio de venta es incorrecto o el campo esta vacio");
		document.formu.precio_venta.focus();
		return;
	}

if (fecha_prec_venta == "") {
		alert("El campo de fecha precio venta esta vacia");
		document.formu.fecha_prec_venta.focus();
		return;
	}
	/*alert("DATOS CORRECTOS");*/
	document.formu.submit();
}