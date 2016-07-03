package ar.edu.unq.ciu.controlGastos.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Detalle {
	Long aniofecha
	Integer monto
	Integer aumento
	
	new(){
		aniofecha = new Long(0)
		monto = 0
		aumento = 0
	}
}