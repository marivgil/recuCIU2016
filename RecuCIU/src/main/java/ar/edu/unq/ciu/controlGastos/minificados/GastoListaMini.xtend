package ar.edu.unq.ciu.controlGastos.minificados

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.Month

@Accessors
class GastoListaMini {
	Month mes
	String descripcion
	Integer monto
	
	new(){}
}