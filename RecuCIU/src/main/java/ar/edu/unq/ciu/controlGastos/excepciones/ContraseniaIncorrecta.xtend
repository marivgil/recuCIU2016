package ar.edu.unq.ciu.controlGastos.excepciones

import org.uqbar.commons.model.UserException

class ContraseniaIncorrecta extends UserException {
	new(){
        super('Contrasenia Incorrecta')
    }	
}