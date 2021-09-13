"use strict"

function validar() {
	var ci = document.formu.ci.value;
	var nombres = document.formu.nombres.value;
	var telefono = document.formu.telefono.value;

	if (( !v2.test(ci)) || (ci == "")) {
		alert("El CI es incorrecto o el campo esta vacio");
		document.formu.ci.focus();
		return;
	}

	if (nombres == "") {
		alert("El nombre de cliente esta vacio");
		document.formu.nombres.focus();
		return;
	}

	if (telefono = "") {
		alert("El campo telefono esta vacio");
		document.formu.telefono.focus();
		return;
	}

	document.formu.submit();
}