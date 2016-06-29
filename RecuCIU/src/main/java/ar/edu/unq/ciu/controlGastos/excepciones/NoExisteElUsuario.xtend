package ar.edu.unq.ciu.controlGastos.excepciones

import org.uqbar.commons.model.UserException

class NoExisteElUsuario extends UserException{
    new(){
        super('No existe el usuario, por favor dar de alta uno para ingresar al sistema')
    }	
}