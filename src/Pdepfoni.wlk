class Linea{
	const property fechaDeHoy = new Date()
	
	const numeroDeTelefono 
	
	const property consumos = []
	
	const packsDeLaLinea =[]
	
	method agregarPack(pack) {
		packsDeLaLinea.add(pack)
	}
	
	method agregarConsumo(consumo) = consumos.add(consumo)
	
	method consumosEntre(fechaInicial,fechaFinal) = consumos.filter({consumo => consumo.fechaConsumo().between(fechaInicial,fechaFinal)})
	
	method costoTotalConsumo(fechaInicial,fechaFinal) = self.consumosEntre(fechaInicial,fechaFinal).sum({consumo => consumo.costoConsumo()}) 
	
	method conocerPromedioConsumos(fechaInicial,fechaFinal) = self.costoTotalConsumo(fechaInicial,fechaFinal) / self.consumosEntre(fechaInicial,fechaFinal).size()
	
	method ultimos30dias(fecha) = fecha.minusDays(30)
	
	method costoTotalUltimos30dias() = self.costoTotalConsumo(self.ultimos30dias(fechaDeHoy),fechaDeHoy) 
}

class Pack{
	
	var  property esPackDeInternet = true
	
	var  property esPackDeLlamadas = true
	
	var property esPackMixto = true
	
	const property fechaVencimiento = new Date(day = 23, month = 11, year = 2020)
	
	method estaVencidoElPackDeLa(linea) = self.fechaVencimiento() > linea.fechaDeHoy()
	
	
}

class PackDeCreditoDisponible inherits Pack{
	
	var property credito = 500
}

class PackDeMBdisponibles inherits Pack{
	
	var property hayInternetGratis = false
	
	var property megasDisponible = 1000	
	
	override method esPackDeLlamadas() = false
	
	override method  esPackMixto() = false
	
}

class PackLlamadasGratis inherits Pack{
	var property llamadasGratis = true	
	
	override method esPackDeInternet() = false
	
	override method  esPackMixto() = false
}

class PackInternetGratisLosFinde inherits PackDeMBdisponibles{
	
	method internetGratis(linea) {
		if (linea.fechaDeHoy().equals(sunday) or linea.fechaDeHoy().equals(saturday)){
			hayInternetGratis = true
			self.megasDisponible(9999999999999999999999999999999999)
		}
		else(
			self.megasDisponible(0)
		)
	}
}
	
class Consumo{
		
	var property fechaConsumo 
	
	method costoConsumo()
	
	method creditoMayorAconsumo(pack) = pack.credito() > self.costoConsumo()

	method puedeSatisfacerConsumo(pack)
	
	method esPackMixtoYcreditoMayorAconsumo(pack) = pack.esPackMixto() and self.creditoMayorAconsumo(pack)
}

class ConsumoMB inherits Consumo{
	
	const precioPorMega
	
	var property megasConsumidos
	
	override method costoConsumo() = megasConsumidos * precioPorMega
	
	method megasPackMayorAconsumo(pack) = pack.megasDisponible() > self.megasConsumidos()

	override method puedeSatisfacerConsumo(pack) = self.esPackMixtoYcreditoMayorAconsumo(pack) or pack.hayInternetGratis() or (pack.esPackDeInternet() and self.megasPackMayorAconsumo(pack))
	
}

class ConsumoDeLlamadas inherits Consumo{
	
	const precioFijo
	
	const precioPorSegundo
	
	var property tiempoDeLlamada
	
	override method costoConsumo() = precioFijo + (tiempoDeLlamada - 30) * precioPorSegundo
	
	override method puedeSatisfacerConsumo(pack) = self.esPackMixtoYcreditoMayorAconsumo(pack) or (pack.esPackDeLlamadas() and self.creditoMayorAconsumo(pack))
	
}










