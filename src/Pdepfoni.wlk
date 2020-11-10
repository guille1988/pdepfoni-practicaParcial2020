class Linea{
	var numeroDeTelefono 
	
	const packsDeLaLinea =[]
	
	method agregarPack(pack) {
		packsDeLaLinea.add(pack)
	}
}

class Pack{
	const property hoy = new Date()
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
	
	method hayInternetGratisHoy() = hoy.dayOfWeek() == sunday or hoy.dayOfWeek() == saturday
	
}







