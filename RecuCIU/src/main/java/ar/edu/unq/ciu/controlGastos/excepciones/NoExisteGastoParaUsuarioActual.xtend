package ar.edu.unq.ciu.controlGastos.excepciones

import org.uqbar.commons.model.UserException

class NoExisteGastoParaUsuarioActual extends UserException {
	new(String nom){
		super('No existe ese gasto para '+nom)
	}
}