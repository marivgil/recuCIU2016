package ar.edu.unq.ciu.controlGastos.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.Month

@Accessors
class Detalle {
	int anio
	Month mes
	Integer monto
	Integer aumento
	
	new(){
		monto = 0
		aumento = 0
	}
}