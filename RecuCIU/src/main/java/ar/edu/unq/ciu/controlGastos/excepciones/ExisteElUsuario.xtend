package ar.edu.unq.ciu.controlGastos.excepciones

import org.uqbar.commons.model.UserException

class ExisteElUsuario extends UserException {
	new(){
		super('El usuario ya existe, intente con uno distinto')
	}
}