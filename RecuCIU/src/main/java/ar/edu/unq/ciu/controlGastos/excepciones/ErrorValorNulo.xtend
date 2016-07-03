package ar.edu.unq.ciu.controlGastos.excepciones

import org.uqbar.commons.model.UserException

class ErrorValorNulo extends UserException {
	new(String mensaje){
		super(mensaje + ' no puede ser vacio')
	}
}