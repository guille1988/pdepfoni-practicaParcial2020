class Linea{
	var numeroDeTelefono
	
	const consumo 
	
	const packsDeLaLinea =[]
	
	method agregarPack(pack) {
		packsDeLaLinea.add(pack)
	}
}

class Pack{
	var fechaDeVencimiento = new Date()	
	
	
}

class LlamadasGratis inherits Pack{
	var property llamadasGratis = true
}

class InternetIlimitado inherits Pack{
	var property internetIlimitado = true
}

class PackDeCredito inherits LlamadasGratis{
	var precioPorSegundo = 0.05
	var precioFijo = 1
	var property creditoDisponible
	override method llamadasGratis() {
		self.llamadasGratis(false)
	}
}

class NavegarInternet inherits InternetIlimitado{
	var cantidadDeMegas = 5
	var precioPorMegas = 0.10
	var property megasParaNavegar
	override method internetIlimitado() {
		self.internetIlimitado(false)
	}
}







