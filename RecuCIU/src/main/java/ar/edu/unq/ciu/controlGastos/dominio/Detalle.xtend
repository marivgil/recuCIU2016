package ar.edu.unq.ciu.controlGastos.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.Month

@Accessors
class Detalle {
	int anio
	Month mes
	Integer monto
	Integer aumentoParcial
	
	new(){
		monto = 0
		aumentoParcial = 0
	}
	
	def calcularAumentoParcial(Integer valorAnterior){
		aumentoParcial = ((monto-valorAnterior)/valorAnterior)*100
		aumentoParcial
	}
}