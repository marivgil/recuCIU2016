package ar.edu.unq.ciu.controlGastos.excepciones

import org.uqbar.commons.model.UserException

class ErrorEnLongitudContrasenia extends UserException {
	new(){
        super('La contrasenia debe tener 5 o mas caracteres')
    }	
}