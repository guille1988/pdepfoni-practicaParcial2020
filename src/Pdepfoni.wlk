class Linea{
	const property fechaDeHoy = new Date()
	
	const numeroDeTelefono 
	
	const consumos = []
	
	const packsDeLaLinea =[]
	
	method agregarPack(pack) {
		packsDeLaLinea.add(pack)
	}
	
	method agregarConsumo(consumo) = consumos.add(consumo)
}

class Pack{
	const property fechaVencimiento = new Date(day = 23, month = 11, year = 2020)
	
	method estaVencidoElPackDeLa(linea) = self.fechaVencimiento() > linea.fechaDeHoy()
	
	
}

class PackDeCreditoDisponible inherits Pack{
	var credito = 500
	
}

class PackDeMBdisponibles inherits Pack{
	var megasDisponible = 1000
}

class PackLlamadasGratis inherits Pack{
	var llamadasGratis = true
}

class PackInternetGratisLosFinde inherits Pack{
	
	var hayInternetGratis = false
	
	method internetGratis(linea) {
		if (linea.fechaDeHoy().equals(sunday) or linea.fechaDeHoy().equals(saturday)){
			hayInternetGratis = true
		}
	}
	
}

class Consumo{
	
var property fechaConsumo = new Date()	

}

class ConsumoMB inherits Consumo{
	
	const precioPorMega
	
	var property megasConsumidos
	
	method costoConsumo() = megasConsumidos * precioPorMega
}

class ConsumoDeLlamadas inherits Consumo{
	
	const precioFijo
	
	const precioPorSegundo
	
	var property tiempoDeLlamada
	
	method costoConsumo() = precioFijo + (tiempoDeLlamada - 30) * precioPorSegundo
	
}









