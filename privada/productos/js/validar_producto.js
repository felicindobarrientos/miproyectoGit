"use strict"

function validar() {
	var id_proveedor = document.formu.id_proveedor.value;
	var descripcion = document.formu.descripcion.value;
	var modelo = document.formu.modelo.value;
	var marca = document.formu.marca.value;
	var industria_origen = document.formu.industria_origen.value;
	/*var prov = document.formu1.id_proveedor.selectedIndex;*/

	if (id_proveedor == "") {
		alert("Por favor seleccione un proveedor");
		document.formu.id_proveedor.focus();
		return;
	}
	if (descripcion == "") {
		alert("La descripcion esta vacia");
		document.formu.descripcion.focus();
		return;
	}
	if (modelo == "") {
		alert("El campo modelo esta vacio");
		document.formu.modelo.focus();
		return;
	}
	if (marca == "") {
		alert("El campo Marca esta vacia");
		document.formu.marca.focus();
		return;
	}
	if (industria_origen == "") {
		alert("La industria esta vacia");
		document.formu.industria_origen.focus();
		return;
	}
	/*if (prov == "") {
		alert("El Id de proveedor no fue seleccionado");
		return;
	}*/
	document.formu.submit();
}