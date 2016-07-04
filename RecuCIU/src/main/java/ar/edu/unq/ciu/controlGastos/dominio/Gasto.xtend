package ar.edu.unq.ciu.controlGastos.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Gasto {
	String concepto
	ArrayList<Detalle> detallesMensuales
	Integer indiceInflacion
	
	
	new(){
		detallesMensuales = new ArrayList<Detalle>
		indiceInflacion = 0
	}
	
	def agregarDetalle(Detalle d){
		if(!detallesMensuales.empty){
			val aumentoParcial = 
				d.calcularAumentoParcial((detallesMensuales.get(detallesMensuales.length-1)).monto)
			actualizarIndiceInflacionario(aumentoParcial)
		}
		detallesMensuales.add(d)
	}
	
	def actualizarIndiceInflacionario(Integer aumento){
		indiceInflacion = indiceInflacion+aumento
	}
	
}