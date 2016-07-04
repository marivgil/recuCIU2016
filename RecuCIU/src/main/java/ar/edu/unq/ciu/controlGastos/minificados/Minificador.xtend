package ar.edu.unq.ciu.controlGastos.minificados

import ar.edu.unq.ciu.controlGastos.dominio.Usuario
import ar.edu.unq.ciu.controlGastos.dominio.Gasto
import java.util.ArrayList

class Minificador {
	
	def minificaGasto(Usuario user) {
		val gastoMini = new GastoMinificado
		gastoMini.gastos = user.gastos
		gastoMini.totalGastado = user.totalGastado
		gastoMini
	}
	
	def minificarGastoLista(Gasto gasto) {
		val listaMini = new ArrayList<GastoListaMini>
		gasto.detallesMensuales.forEach[ detalle |
			val mini = new GastoListaMini
			mini.descripcion = gasto.concepto
			mini.monto = detalle.monto
			mini.mes = detalle.mes
			listaMini.add(mini)
		]
		listaMini
	}
	
	def minicarIndiceInflacionario(Gasto gasto) {
		val indice = new IndiceMinificado
		indice.indiceInflacion = gasto.indiceInflacion
		indice.detalles.addAll(gasto.detallesMensuales) 
		
	}
	
}