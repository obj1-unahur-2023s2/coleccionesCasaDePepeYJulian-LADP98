object heladera {
	method precio() {return 200000}
	method esComida() {return false}
	method esElectrodomestico() {return true}
}

object cama {
	method precio() {return 80000}
	method esComida() {return false}
	method esElectrodomestico() {return false}	
}

object tiraDeAsado {
	method precio() {return 3500}
	method esComida() {return true}
	method esElectrodomestico() {return false}	
}

object paqueteDeFideos {
	method precio() {return 500}
	method esComida() {return true}
	method esElectrodomestico() {return false}	
}

object plancha {
	method precio() {return 12000}
	method esComida() {return false}
	method esElectrodomestico() {return true}	
}

object milanesaRebozada {
	var peso = 1 //En kilos
	
	method precio() {return 2600 * peso}
	method esComida() {return true}
	method esElectrodomestico() {return false}	
	
	method peso(cantidad){
		peso = cantidad
	}
}

object botellaDeSalsaDeTomate {
	method precio() {return 900}
	method esComida() {return true}
	method esElectrodomestico() {return false}
}

object microondas {
	method precio() {return 42000}
	method esComida() {return false}
	method esElectrodomestico() {return true}
}

object cebolla {
	var peso = 1 //En kilos
	
	method precio() {return 250 * peso}
	method esComida() {return true}
	method esElectrodomestico() {return false}
	
	method peso(cantidad){
		peso = cantidad
	}
}

object compu {
	method precio() {return 500 * dolar.precioDeVenta()}
	method esComida() {return false}
	method esElectrodomestico() {return true}	
}

object dolar {
	method precioDeVenta() = 730
	method precioDeCompra() = 725
}

object packDeComida {
	var platoDeComida = null
	var aderezo = null
	
	method platoDeComida() = platoDeComida
	method aderezo() = aderezo
	method precio() {return platoDeComida.precio() + aderezo.precio()}
	method esComida() {return true}
	method esElectrodomestico() {return false}
	
	method platoDeComida(unaComida){
		const platosDeComidaPosibles = [tiraDeAsado,paqueteDeFideos,milanesaRebozada]
		if(platosDeComidaPosibles.contains(unaComida)){
			platoDeComida = unaComida
		}
	}
	method aderezo(unAderezo){
		const aderezosPosibles = [botellaDeSalsaDeTomate,cebolla]
		if(aderezosPosibles.contains(unAderezo)){
			aderezo = unAderezo
		}
	}
}






