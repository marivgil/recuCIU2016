package ar.edu.unq.ciu.controlGastos.excepciones

import org.uqbar.commons.model.UserException

class ErrorContraseniaCaracterNumerico extends UserException {
	new(){
		super('La contrasenia debe contener por lo menos un caracter numerico')
	}
}