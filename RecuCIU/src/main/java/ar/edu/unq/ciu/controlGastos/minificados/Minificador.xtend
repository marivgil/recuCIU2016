package ar.edu.unq.ciu.controlGastos.minificados

import ar.edu.unq.ciu.controlGastos.dominio.Usuario

class Minificador {
	
	def minificaGasto(Usuario user) {
		val gastoMini = new GastoMinificado
		gastoMini.gastos = user.gastos
		gastoMini.totalGastado = user.totalGastado
		gastoMini
	}
	
}