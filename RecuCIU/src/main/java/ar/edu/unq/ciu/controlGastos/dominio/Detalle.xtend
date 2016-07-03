package ar.edu.unq.ciu.controlGastos.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date

@Accessors
class Detalle {
	Date fecha
	Integer monto
	Integer aumento
	
	new(){
		fecha = new Date() //crea un date con la fecha actual
		monto = 0
		aumento = 0
	}
}