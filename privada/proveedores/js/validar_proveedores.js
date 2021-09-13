"use strict"
function validar(){
	var nombre = document.formu.nombre.value;
	var direccion = document.formu.direccion.value;
	var telefono = document.formu.telefono.value;

	if (nombre == "") {
		alert("El nombre es incorrecto o el campo esta vacio");
		document.formu.nombre.focus();
		return;
	}

	if (direccion == "") {
		alert("La direccion esta vacia");
		document.formu.direccion.focus();
		return;
	}

	if (telefono == "") {
		alert("El campo telefono esta vacio");
		document.formu.telefono.focus();
		return;
	}
	document.formu.submit();
}
