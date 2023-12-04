function validarPago(numTarjeta, fecha, numSeguridad){
    if(!(/^[0-9]{16}$/.test(numTarjeta))){
        alert("Formato de tarjeta invalido");
    }
}