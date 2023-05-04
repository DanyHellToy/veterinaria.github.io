function actualizarCosto() {
  const tipoMembresia = document.getElementById('tipo_membresia').value;
  const costo = document.getElementById('Costo');
  
  switch(tipoMembresia) {
    case 'Plata':
      costo.value = '500';
      break;
    case 'Oro':
      costo.value = '1000';
      break;
    case 'Platino':
      costo.value = '1500';
      break;
    default:
      costo.value = '500';
  }
}

actualizarCosto();

function validar() {
  var nombre = document.getElementsByName("fnombre")[0].value;
  var correo = document.getElementsByName("fcorreo")[0].value;
  var telefono = document.getElementsByName("ftelefono")[0].value;
  var direccion = document.getElementsByName("fdireccion")[0].value;
  var date = document.getElementsByName("fdate")[0].value;

  var nombre_mascota = document.getElementsByName("fnombre_mascota")[0].value;
  var date_mascota = document.getElementsByName("fnacimiento_mascota")[0].value;
  var especie_mascota = document.getElementsByName("fespecie_mascota")[0].value;
  var raza_mascota = document.getElementsByName("fraza_mascota")[0].value;
  var sexo_mascota = document.getElementsByName("fsexo_mascota")[0].value;
  var imagen = document.getElementsByName("file")[0].value;

  var membresia = document.getElementById("tipo_membresia").value;
  var date_inicio = document.getElementsByName("fdate_inicio")[0].value;
  var date_vencimiento = document.getElementsByName("fdate_vencimiento")[0].value;
  var costo = document.getElementsByName("fcosto")[0].value;
  
  
  
  // Valida que todos los campos estén llenos
  if (nombre === "" || correo === "" || telefono === "" || direccion === "" || date === "" || nombre_mascota === "" || date_mascota === "" || especie_mascota === "" || raza_mascota === "" || sexo_mascota === ""  || imagen === "" || membresia === "" || date_inicio === "" || date_vencimiento === "" || costo === "") {
    alert("Todos los campos son requeridos");
    return false;
  } 
}