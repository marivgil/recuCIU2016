package ar.edu.unq.ciu.controlGastos.minificados

import java.util.ArrayList
import ar.edu.unq.ciu.controlGastos.dominio.Gasto
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class GastoMinificado {
	
	Integer totalGastado
	ArrayList<Gasto> gastos
	
	new(){
		gastos = new ArrayList<Gasto>()
		totalGastado = 0
	}
}