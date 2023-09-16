object cuentaCorriente {
	var saldo = 0
	
	method saldo() = saldo
	method depositar(unMonto) {saldo += unMonto}
	method extraer(unMonto){
		if(saldo < unMonto){
			self.error("No hay saldo suficiente")
		}
		saldo -= unMonto
	}
}

object cuentaConGastos {
	var saldo = 0
	
	method saldo() = saldo
	method depositar(unMonto) {saldo += 0.max(unMonto - 200)}
	method extraer(unMonto){
		if(saldo < unMonto) {self.error("No hay saldo suficiente")} 
		else if(unMonto <= 10000) {saldo -= unMonto + 200}
		else {saldo += unMonto * 0.02}
	}
}

object cuentaCombinada {
	var cuentaPrimaria = 30000
	var cuentaSecundaria = 2000000
	
	method saldo() = cuentaPrimaria + cuentaSecundaria
	method depositar(unMonto) {cuentaPrimaria += unMonto}
	method extraer(unMonto){
		if(unMonto > cuentaPrimaria){
			cuentaSecundaria -= (cuentaPrimaria - unMonto).abs()
			cuentaPrimaria = 0
		}
		cuentaPrimaria -= unMonto
	}
}