package ar.edu.unq.ciu.controlGastos.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Gasto {
	String concepto
	ArrayList<Detalle> detallesMensuales
	Integer indiceInflacion
	Integer totalParcial
	
	new(){
		detallesMensuales = new ArrayList<Detalle>
		indiceInflacion = 0
		totalParcial = 0
	}
	
	def agregarDetalle(Detalle d){
		detallesMensuales.add(d)
		totalParcial=totalParcial+d.monto
	}
}