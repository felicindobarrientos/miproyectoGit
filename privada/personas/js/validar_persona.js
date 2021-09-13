"use strict"
function validar(){
		var ci = document.formu.ci.value;
		var nombres = document.formu.nombres.value;
		var ap = document.formu.ap.value;
		var am = document.formu.am.value;
		var f = document.formu.genero[0].checked;
		var m = document.formu.genero[1].checked;

	if (ci= "") {
		alert("Por favor ingrese el numero de ci");
		document.formu.ci.focus();
		return;
	}

	if ((!v1.test(nombres)) || (nombres == "")) {
		alert("Los nombres son incorrectos o el campo esta vacio");
		document.formu.nombres.focus();
		return;
	}

	if ((ap=="") && (am=="")) {
		alert("Por favor introduzca un Apellido");
		document.formu.ap.focus();
		return;

	}

	if ((f=="") && (m=="")) {
		alert("El campo de genero esta vacio");
		return;
	}
	document.formu.submit();

}