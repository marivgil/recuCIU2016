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
	
	def agregarGasto(Gasto gasto, Integer monto) {
		gastos.add(gasto)
		actualizarTotalGastado(monto)
	}

	def actualizarTotalGastado(Integer monto){
		totalGastado = totalGastado+monto
	}
	
}