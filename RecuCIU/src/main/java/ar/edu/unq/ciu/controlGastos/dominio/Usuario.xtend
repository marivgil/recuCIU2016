package ar.edu.unq.ciu.controlGastos.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Usuario {
	
	String nombre;
	String pass;
	Integer totalGastado
	ArrayList<Gasto> gastos
	
	new(){
		gastos = new ArrayList<Gasto>
		totalGastado = 0
	}
	
	def agregarGasto(Gasto gasto) {
		gastos.add(gasto)
		val totalParcial = calcularMontoDelGasto(gasto)
		actualizarTotalGastado(totalParcial)
	}
	
	def calcularMontoDelGasto(Gasto gasto){
		var i=0
		var montoParcial=0
    	for(i=0; i < gasto.detallesMensuales.length(); i++) {
    		montoParcial = montoParcial+gasto.detallesMensuales.get(i).monto
        	}
		montoParcial
	}
	def actualizarTotalGastado(Integer monto){
		totalGastado = totalGastado+monto
	}
	
}